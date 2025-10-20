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
     * 
     * @param {Pointer<Int32>} plWidth 
     * @returns {HRESULT} 
     */
    get_Width(plWidth) {
        result := ComCall(7, this, "int*", plWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plHeight 
     * @returns {HRESULT} 
     */
    get_Height(plHeight) {
        result := ComCall(8, this, "int*", plHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plBpp 
     * @returns {HRESULT} 
     */
    get_Bpp(plBpp) {
        result := ComCall(9, this, "int*", plBpp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} Width 
     * @param {Integer} Heigth 
     * @param {Pointer<SAFEARRAY>} ppBits 
     * @returns {HRESULT} 
     */
    GetFrameBufferBits(x, y, Width, Heigth, ppBits) {
        result := ComCall(10, this, "int", x, "int", y, "int", Width, "int", Heigth, "ptr", ppBits, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
