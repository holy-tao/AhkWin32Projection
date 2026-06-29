#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFMediaEngine.ahk" { IMFMediaEngine }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DEVICE_INFO.ahk" { DEVICE_INFO }

/**
 * Enables media sharing.
 * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nn-mfsharingengine-imfmediasharingengine
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaSharingEngine extends IMFMediaEngine {
    /**
     * The interface identifier for IMFMediaSharingEngine
     * @type {Guid}
     */
    static IID := Guid("{8d3ce1bf-2367-40e0-9eee-40d377cc1b46}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaSharingEngine interfaces
    */
    struct Vtbl extends IMFMediaEngine.Vtbl {
        GetDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaSharingEngine.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets information about the media sharing device.
     * @remarks
     * The method allocates memory for the <b>BSTR</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/mfsharingengine/ns-mfsharingengine-device_info">DEVICE_INFO</a> structure. The caller must free the memory for each <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @returns {DEVICE_INFO} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mfsharingengine/ns-mfsharingengine-device_info">DEVICE_INFO</a> structure. The method fills in this structure with the device information.
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-imfmediasharingengine-getdevice
     */
    GetDevice() {
        pDevice := DEVICE_INFO()
        result := ComCall(45, this, DEVICE_INFO.Ptr, pDevice, "HRESULT")
        return pDevice
    }

    Query(iid) {
        if (IMFMediaSharingEngine.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDevice := CallbackCreate(GetMethod(implObj, "GetDevice"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDevice)
    }
}
