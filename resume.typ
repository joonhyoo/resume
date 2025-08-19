#import "vantage-typst.typ": styled-link, term, vantage
#let configuration = yaml("configuration.yaml")

#vantage(
  name: configuration.contacts.name,
  position: configuration.position,
  links: (
    (name: "email", link: "mailto:" + configuration.contacts.email),
    (name: "website", link: configuration.contacts.website.url, display: configuration.contacts.website.displayText),
    (name: "github", link: configuration.contacts.github.url, display: configuration.contacts.github.displayText),
    (name: "linkedin", link: configuration.contacts.linkedin.url, display: configuration.contacts.linkedin.displayText),
    (name: "location", link: "", display: configuration.contacts.address),
  ),
  [

    == Projects

    #for project in configuration.projects [
      === #link(project.link)[#project.title] \
      #for point in project.description [
        - #point
      ]
    ]

    == Experience

    #for job in configuration.jobs [
      === #job.position \
      #job.company.name - #job.type\
      #term[#job.from --- #job.to][#job.location]

      #for point in job.description [
        - #point
      ]
    ]

    == Education

    #for edu in configuration.education [
      === #if edu.place.link != "" [
        #link(edu.place.link)[#edu.place.name]\
      ] else [
        #edu.place.name\
      ]

      #edu.from - #edu.to #h(1fr) #edu.location

      #edu.degree in #edu.major

    ]

    == Skills/Exposure

    #for skill in configuration.skills [
      • #skill
    ]

    == Other

    #for achievement in configuration.achievements [
      === #achievement.name
      \
      #achievement.description
    ]
  ],
)
