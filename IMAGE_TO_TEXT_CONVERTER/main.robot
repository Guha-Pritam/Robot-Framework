*** Settings ***
Library  SeleniumLibrary
Library  pytesseract

*** Test Cases ***
Extract Text from Image
    # Read the image
    ${image}=  cv2.imread("C:\Users\Pritam Guha\Downloads\image.jpeg")

    # Pre-processing the image
    ${gray}=  cv2.cvtColor(${image}, cv2.COLOR_BGR2GRAY)
    ${thresh}=  cv2.threshold(${gray}, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)[1]

    # Extract text
    ${text}=  pytesseract.image_to_string(${thresh}, lang = 'eng', config='--psm 11')

    # Use the extracted text
    Log  ${text}
