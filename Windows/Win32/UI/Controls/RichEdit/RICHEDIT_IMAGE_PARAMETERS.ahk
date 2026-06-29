#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Defines the attributes of an image to be inserted by the EM_INSERTIMAGE message.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-richedit_image_parameters
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct RICHEDIT_IMAGE_PARAMETERS {
    #StructPack 8

    /**
     * The width, in HIMETRIC units (0.01 mm), of the image.
     */
    xWidth : Int32

    yHeight : Int32

    /**
     * If <i>Type</i> is TA_BASELINE, this parameter is the distance, in HIMETRIC units, that the top of the image extends above the text baseline. If <i>Type</i> is TA_BASELINE and ascent is zero, the bottom of the image is placed at the text baseline.
     */
    Ascent : Int32

    Type : Int32

    /**
     * The alternate text for the image.
     */
    pwszAlternateText : PWSTR

    /**
     * The stream that contains the image data.
     */
    pIStream : IStream

}
