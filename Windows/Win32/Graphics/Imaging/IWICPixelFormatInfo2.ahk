#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICPixelFormatInfo.ahk

/**
 * Extends IWICPixelFormatInfo by providing additional information about a pixel format.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicpixelformatinfo2
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICPixelFormatInfo2 extends IWICPixelFormatInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICPixelFormatInfo2
     * @type {Guid}
     */
    static IID => Guid("{a9db33a2-af5f-43c7-b679-74f5984b5aa4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SupportsTransparency", "GetNumericRepresentation"]

    /**
     * Returns whether the format supports transparent pixels.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Returns <b>TRUE</b> if the pixel format supports transparency; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicpixelformatinfo2-supportstransparency
     */
    SupportsTransparency() {
        result := ComCall(16, this, "int*", &pfSupportsTransparency := 0, "HRESULT")
        return pfSupportsTransparency
    }

    /**
     * TBD
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpixelformatnumericrepresentation">WICPixelFormatNumericRepresentation</a>*</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpixelformatnumericrepresentation">WICPixelFormatNumericRepresentation</a> variable that you've defined. On successful completion, the function sets your variable to the **WICPixelFormatNumericRepresentation** of the pixel format.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicpixelformatinfo2-getnumericrepresentation
     */
    GetNumericRepresentation() {
        result := ComCall(17, this, "int*", &pNumericRepresentation := 0, "HRESULT")
        return pNumericRepresentation
    }
}
