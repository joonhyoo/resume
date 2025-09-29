#import "vantage-typst.typ": grad, styled-link, term, vantage
#let configuration = yaml("configuration.yaml")

#vantage(
  name: configuration.contacts.name,
  position: configuration.position,
  links: (
    (name: "email", link: "mailto:" + configuration.contacts.email),
    // (name: "website", link: configuration.contacts.website.url, display: configuration.contacts.website.displayText),
    (name: "github", link: configuration.contacts.github.url, display: configuration.contacts.github.displayText),
    (name: "linkedin", link: configuration.contacts.linkedin.url, display: configuration.contacts.linkedin.displayText),
    (name: "location", link: "", display: configuration.contacts.address),
  ),
  [

    == Projects

    #for project in configuration.projects [
      #show link: it => underline(stroke: (dash: "densely-dashed"), it)
      === #link(project.link)[#project.title] \
      // #project.description
      #for point in project.description [
        - #point
      ]
    ]

    == Work Experience

    #for job in configuration.jobs [
      === #job.position \
      #job.company.name - #job.type\
      #term[#job.from --- #job.to][#job.location]

      #for point in job.description [
        - #point
      ]
    ]

    == Volunteering

    #for vol in configuration.volunteer [
      === #vol.position \
      #vol.company.name \
      #term[#vol.from --- #vol.to][#vol.location]
      #if "description" in vol.keys() [
        #for point in vol.description [
          - #point
        ]
      ]
    ]

    == Education

    #for edu in configuration.education [
      === #if edu.place.link != "" [
        #link(edu.place.link)[#edu.place.name]\
      ] else [
        #edu.place.name\
      ]
      #edu.degree #h(1fr) #edu.location\
      #if "complete" in edu.keys() [
        #grad[#edu.complete]
      ]

    ]

    == Skills/Exposure

    #for skill in configuration.skills [
      • #skill
    ]

    == Other
    #for other in configuration.other [
      === #other.name
      \
      #for item in other.items [
        - #item
      ]
    ]
  ],
)
