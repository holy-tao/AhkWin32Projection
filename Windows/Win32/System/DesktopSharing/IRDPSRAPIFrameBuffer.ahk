#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides data about the frame buffer size and format and allows the contents to be retrieved.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiframebuffer
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIFrameBuffer extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIFrameBuffer
     * @type {Guid}
     */
    static IID => Guid("{3d67e7d2-b27b-448e-81b3-c6110ed8b4be}")

    /**
     * The class identifier for RDPSRAPIFrameBuffer
     * @type {Guid}
     */
    static CLSID => Guid("{a4f66bcc-538e-4101-951d-30847adb5101}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Width", "get_Height", "get_Bpp", "GetFrameBufferBits"]

    /**
     * 
     * @param {Pointer<Integer>} plWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiframebuffer-get_width
     */
    get_Width(plWidth) {
        plWidthMarshal := plWidth is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plWidthMarshal, plWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiframebuffer-get_height
     */
    get_Height(plHeight) {
        plHeightMarshal := plHeight is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plHeightMarshal, plHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plBpp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiframebuffer-get_bpp
     */
    get_Bpp(plBpp) {
        plBppMarshal := plBpp is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plBppMarshal, plBpp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} Width 
     * @param {Integer} Heigth 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppBits 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiframebuffer-getframebufferbits
     */
    GetFrameBufferBits(x, y, Width, Heigth, ppBits) {
        result := ComCall(10, this, "int", x, "int", y, "int", Width, "int", Heigth, "ptr*", ppBits, "HRESULT")
        return result
    }
}
