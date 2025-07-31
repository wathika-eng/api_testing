export const COLORS: Array<string> = [
  "black",
  "brown",
  "red",
  "orange",
  "yellow",
  "green",
  "blue",
  "violet",
  "grey",
  "white"
]

export const colorCode = (color: string): number  => {
  return COLORS.indexOf(color)
}

