*** Settings ***
Library    OpenCVLibrary
Library    numpy

*** Variables ***
${img1}    ${CURDIR}/1.png
${img2}    ${CURDIR}/2.png

*** Test Cases ***
Image Similarity Test
    ${img1_processed}=    cv2 Convert To HSV    ${img1}
    ${img1_processed}=    cv2 Convert To Gray Scale    ${img1_processed}
    ${img1_processed}=    cv2 Threshold    ${img1_processed}    100    255    THRESH_BINARY
    ${img1_processed}=    cv2 Resize    ${img1_processed}    28    28
    
    ${img2_processed}=    cv2 Convert To HSV    ${img2}
    ${img2_processed}=    cv2 Convert To Gray Scale    ${img2_processed}
    ${img2_processed}=    cv2 Threshold    ${img2_processed}    100    255    THRESH_BINARY
    ${img2_processed}=    cv2 Resize    ${img2_processed}    28    28
    
    ${errorL2}=    cv2 Norm    ${img1_processed}    ${img2_processed}    L2
    ${similarity}=    numpy.subtract(1, numpy.divide(${errorL2}, (28*28)))
    Log    Similarity = ${similarity}
