#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Provides data about the frame buffer size and format and allows the contents to be retrieved.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapiframebuffer
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPIFrameBuffer extends IDispatch {
    /**
     * The interface identifier for IRDPSRAPIFrameBuffer
     * @type {Guid}
     */
    static IID := Guid("{3d67e7d2-b27b-448e-81b3-c6110ed8b4be}")

    /**
     * The class identifier for RDPSRAPIFrameBuffer
     * @type {Guid}
     */
    static CLSID := Guid("{a4f66bcc-538e-4101-951d-30847adb5101}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPIFrameBuffer interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Width          : IntPtr
        get_Height         : IntPtr
        get_Bpp            : IntPtr
        GetFrameBufferBits : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPIFrameBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiframebuffer-get_width
     */
    get_Width() {
        result := ComCall(7, this, "int*", &plWidth := 0, "HRESULT")
        return plWidth
    }

    /**
     * Height, in pixels, of the frame buffer.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiframebuffer-get_height
     */
    get_Height() {
        result := ComCall(8, this, "int*", &plHeight := 0, "HRESULT")
        return plHeight
    }

    /**
     * The bits per pixel for the frame buffer.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiframebuffer-get_bpp
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
     * @param {Integer} Heigth 
     * @returns {Pointer<SAFEARRAY>} The contents of the frame buffer in the specified area.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiframebuffer-getframebufferbits
     */
    GetFrameBufferBits(x, y, Width, Heigth) {
        result := ComCall(10, this, "int", x, "int", y, "int", Width, "int", Heigth, "ptr*", &ppBits := 0, "HRESULT")
        return ppBits
    }

    Query(iid) {
        if (IRDPSRAPIFrameBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Width := CallbackCreate(GetMethod(implObj, "get_Width"), flags, 2)
        this.vtbl.get_Height := CallbackCreate(GetMethod(implObj, "get_Height"), flags, 2)
        this.vtbl.get_Bpp := CallbackCreate(GetMethod(implObj, "get_Bpp"), flags, 2)
        this.vtbl.GetFrameBufferBits := CallbackCreate(GetMethod(implObj, "GetFrameBufferBits"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Width)
        CallbackFree(this.vtbl.get_Height)
        CallbackFree(this.vtbl.get_Bpp)
        CallbackFree(this.vtbl.GetFrameBufferBits)
    }
}
