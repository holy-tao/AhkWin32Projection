#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DEVICE_INFO.ahk" { DEVICE_INFO }

/**
 * Enables image sharing.
 * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nn-mfsharingengine-imfimagesharingengine
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFImageSharingEngine extends IUnknown {
    /**
     * The interface identifier for IMFImageSharingEngine
     * @type {Guid}
     */
    static IID := Guid("{cfa0ae8e-7e1c-44d2-ae68-fc4c148a6354}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFImageSharingEngine interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetSource : IntPtr
        GetDevice : IntPtr
        Shutdown  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFImageSharingEngine.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the source stream.
     * @param {IUnknown} pStream The source stream.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-imfimagesharingengine-setsource
     */
    SetSource(pStream) {
        result := ComCall(3, this, "ptr", pStream, "HRESULT")
        return result
    }

    /**
     * Gets information about the image sharing device.
     * @remarks
     * The method allocates memory for the <b>BSTR</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/mfsharingengine/ns-mfsharingengine-device_info">DEVICE_INFO</a> structure. The caller must free the memory for each <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @returns {DEVICE_INFO} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mfsharingengine/ns-mfsharingengine-device_info">DEVICE_INFO</a> structure. The method fills in this structure with the device information.
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-imfimagesharingengine-getdevice
     */
    GetDevice() {
        pDevice := DEVICE_INFO()
        result := ComCall(4, this, DEVICE_INFO.Ptr, pDevice, "HRESULT")
        return pDevice
    }

    /**
     * Shuts down the image sharing engine.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-imfimagesharingengine-shutdown
     */
    Shutdown() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFImageSharingEngine.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSource := CallbackCreate(GetMethod(implObj, "SetSource"), flags, 2)
        this.vtbl.GetDevice := CallbackCreate(GetMethod(implObj, "GetDevice"), flags, 2)
        this.vtbl.Shutdown := CallbackCreate(GetMethod(implObj, "Shutdown"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSource)
        CallbackFree(this.vtbl.GetDevice)
        CallbackFree(this.vtbl.Shutdown)
    }
}
