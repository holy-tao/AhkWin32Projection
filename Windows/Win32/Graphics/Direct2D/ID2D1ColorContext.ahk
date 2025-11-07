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
     * The GetColorSpace function retrieves the handle to the input color space from a specified device context.
     * @returns {Integer} If the function succeeds, the return value is the current input color space handle.
     * 
     * If this function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcolorspace
     */
    GetColorSpace() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1colorcontext-getprofilesize
     */
    GetProfileSize() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} profileSize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1colorcontext-getprofile
     */
    GetProfile(profileSize) {
        result := ComCall(6, this, "char*", &profile := 0, "uint", profileSize, "HRESULT")
        return profile
    }
}
