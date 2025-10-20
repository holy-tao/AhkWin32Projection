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
     * 
     * @param {Pointer<BOOL>} pfSupportsTransparency 
     * @returns {HRESULT} 
     */
    SupportsTransparency(pfSupportsTransparency) {
        result := ComCall(16, this, "ptr", pfSupportsTransparency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pNumericRepresentation 
     * @returns {HRESULT} 
     */
    GetNumericRepresentation(pNumericRepresentation) {
        result := ComCall(17, this, "int*", pNumericRepresentation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
