#let primary_colour = rgb("#46bdfd")
#let link_colour = rgb("#12348e")

#let icon(name, shift: 1.5pt) = {
  box(
    baseline: shift,
    height: 10pt,
    image("icons/" + name + ".svg"),
  )
  h(3pt)
}

#let findMe(services) = {
  set text(8pt)
  let icon = icon.with(shift: 2.5pt)

  services
    .map(service => {
      icon(service.name)

      if "display" in service.keys() {
        link(service.link)[#{ service.display }]
      } else {
        link(service.link)
      }
    })
    .join(h(10pt))
  [

  ]
}

#let term(period, location) = {
  text(9pt)[#icon("calendar") #period #h(1fr) #icon("location") #location]
}

#let max_rating = 5

#let styled-link(dest, content) = emph(text(
  fill: link_colour,
  link(dest, content),
))

#let vantage(
  name: "",
  position: "",
  links: (),
  content,
) = {
  set document(
    title: name + "'s CV",
    author: name,
  )
  set text(9.8pt, font: "PT sans")
  set page(
    margin: (x: 1.2cm, y: 1.2cm),
  )

  show heading.where(level: 1): it => text(16pt, [#{ it.body } #v(1pt)])

  show heading.where(
    level: 2,
  ): it => text(
    fill: primary_colour,
    [
      #{ it.body }
      #v(-7pt)
      #line(length: 100%, stroke: 0.5pt + primary_colour)
    ],
  )

  show heading.where(
    level: 3,
  ): it => text(it.body)

  show heading.where(
    level: 4,
  ): it => text(
    fill: primary_colour,
    it.body,
  )

  [= #name]
  text(12pt, weight: "medium", [#position])

  v(10pt)
  findMe(links)
  content
}
