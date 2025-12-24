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
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * @type {Integer} 
     */
    Bpp {
        get => this.get_Bpp()
    }

    /**
     * Width, in pixels, of the frame buffer.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiframebuffer-get_width
     */
    get_Width() {
        result := ComCall(7, this, "int*", &plWidth := 0, "HRESULT")
        return plWidth
    }

    /**
     * Height, in pixels, of the frame buffer.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiframebuffer-get_height
     */
    get_Height() {
        result := ComCall(8, this, "int*", &plHeight := 0, "HRESULT")
        return plHeight
    }

    /**
     * The bits per pixel for the frame buffer.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiframebuffer-get_bpp
     */
    get_Bpp() {
        result := ComCall(9, this, "int*", &plBpp := 0, "HRESULT")
        return plBpp
    }

    /**
     * Gets the bits in a specified area of the frame.
     * @param {Integer} x The x coordinate of the requested area of the frame.
     * @param {Integer} y The y coordinate of the requested area of the frame.
     * @param {Integer} Width The width of the requested area of the frame.
     * @param {Integer} Heigth The height of the requested area of the frame.
     * @returns {Pointer<SAFEARRAY>} The contents of the frame buffer in the specified area.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiframebuffer-getframebufferbits
     */
    GetFrameBufferBits(x, y, Width, Heigth) {
        result := ComCall(10, this, "int", x, "int", y, "int", Width, "int", Heigth, "ptr*", &ppBits := 0, "HRESULT")
        return ppBits
    }
}
