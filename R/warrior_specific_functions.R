get_latest_warrior_data_file_names <- function(from_directory='~/Downloads/') {
  # Gets the latest downloaded warrior data and metadata data filenames
  #(in terms of date) from the provided from_directory, as well as the date
  # reflected in the filenames. If no arguments are provided, the directory
  # is assumed to be the '~/Downloads/' folder.
  #
  # Args:
  #   a directory where to find the latest data.
  # Returns:
  #   a list containing of three key-value paris: the latest warrior data filename, the latest
  #   dictionary data filename, and the date data was downloaded.
  #   To access them, you may use
  #   returned_list[['data']] to get the data file name and
  #   returned_list[['metadata']] to get the metadata file name
  #   returned_list[['date']] to get the date associated with the data.
  input <- c("data", "metadata", "date")
  pattern <- c("WARRIOR_DATA_20\\d\\d.*\\.csv", "WARRIOR_DataDictionary_20\\d\\d.*\\.csv")
  find_latest_data <- function(x, dir) head(sort(list.files(path = dir, pattern = x), decreasing=TRUE), n=1)
  file_names <- unlist(lapply(pattern , FUN=find_latest_data, dir=from_directory))
  date <- stringr::str_extract(file_names[1], "\\d{4}-\\d{2}-\\d{2}")
  file_names <- c(file_names, date)
  names(file_names) <- input

  return(file_names)
}
