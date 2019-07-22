from core.ui.pages.element_search import ElementSearch

project_list = '//a[@class="project_name"][text()="$(project_name)"]'


class ProjectAll(ElementSearch):
    def __init__(self, driver):
        super().__init__(driver)
        search_elements = {
            "projects_list": lambda value: self.project_exists_in_list(value)
        }
        self.update_search_fields(**search_elements)

    def project_exists_in_list(self, name):
        return self.is_existing(project_list.replace('$(project_name)', name))