#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * Represents a color context that can be used with an ID2D1Bitmap1 object.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1colorcontext
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1ColorContext extends ID2D1Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1ColorContext
     * @type {Guid}
     */
    static IID => Guid("{1c4820bb-5771-4518-a581-2fe4dd0ec657}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetColorSpace", "GetProfileSize", "GetProfile"]

    /**
     * Gets the color space of the color context.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE</a></b>
     * 
     * This method returns the color space of the contained ICC profile.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1colorcontext-getcolorspace
     */
    GetColorSpace() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * Gets the size of the color profile associated with the bitmap.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * This method returns the  size of the profile in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1colorcontext-getprofilesize
     */
    GetProfileSize() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * Gets the color profile bytes for an ID2D1ColorContext.
     * @param {Integer} profileSize Type: <b>UINT32</b>
     * 
     * The size of the <i>profile</i> buffer.
     * @returns {Integer} Type: <b>BYTE*</b>
     * 
     * When this method returns, contains the color profile.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1colorcontext-getprofile
     */
    GetProfile(profileSize) {
        result := ComCall(6, this, "char*", &profile := 0, "uint", profileSize, "HRESULT")
        return profile
    }
}
