#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDXGIDevice2.ahk" { IDXGIDevice2 }

/**
 * The IDXGIDevice3 interface implements a derived class for DXGI objects that produce image data. The interface exposes a method to trim graphics memory usage by the DXGI device.
 * @remarks
 * The <b>IDXGIDevice3</b> interface is designed for use by DXGI objects that need access to other DXGI objects. This interface is useful to
 *           applications that do not use Direct3D to communicate with DXGI.
 *         
 * 
 * The Direct3D create device functions return a Direct3D device object. This Direct3D device object implements the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. You can query this Direct3D device object for the device's
 *           corresponding <b>IDXGIDevice3</b> interface. To retrieve the <b>IDXGIDevice3</b>  interface of a Direct3D device, use the following code:
 *         
 * 
 * 
 * ```cpp
 * IDXGIDevice3 * pDXGIDevice;
 * hr = g_pd3dDevice->QueryInterface(__uuidof(IDXGIDevice3), (void **)&pDXGIDevice);
 * ```
 * 
 * 
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nn-dxgi1_3-idxgidevice3
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIDevice3 extends IDXGIDevice2 {
    /**
     * The interface identifier for IDXGIDevice3
     * @type {Guid}
     */
    static IID := Guid("{6007896c-3244-4afd-bf18-a6d3beda5023}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIDevice3 interfaces
    */
    struct Vtbl extends IDXGIDevice2.Vtbl {
        Trim : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIDevice3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Trims the graphics memory allocated by the IDXGIDevice3 DXGI device on the app's behalf.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgidevice3-trim
     */
    Trim() {
        ComCall(17, this)
    }

    Query(iid) {
        if (IDXGIDevice3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Trim := CallbackCreate(GetMethod(implObj, "Trim"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Trim)
    }
}
