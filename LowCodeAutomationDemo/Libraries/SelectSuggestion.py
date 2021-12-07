from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword
from selenium.webdriver.common.by import By

ROBOT_AUTO_KEYWORDS = False


def current_driver():
    return BuiltIn().get_library_instance('SeleniumLibrary').driver


@keyword
def select_item(elem):
    driver = current_driver()
    driver.find_element(By.XPATH, elem).click()


