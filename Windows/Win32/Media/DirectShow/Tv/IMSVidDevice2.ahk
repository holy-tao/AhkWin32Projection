#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 or later. The IMSVidDevice2 interface is implemented by some Video Control device objects.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidDevice2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsviddevice2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidDevice2 extends IUnknown {
    /**
     * The interface identifier for IMSVidDevice2
     * @type {Guid}
     */
    static IID := Guid("{87bd2783-ebc0-478c-b4a0-e8e7f43ab78e}")

    /**
     * The class identifier for MSVidDevice2
     * @type {Guid}
     */
    static CLSID := Guid("{30997f7d-b3b5-4a1c-983a-1fe8098cb77d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidDevice2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_DevicePath : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidDevice2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    DevicePath {
        get => this.get_DevicePath()
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 or later.
     * @remarks
     * This property is not a human-readable string, but is guaranteed to be unique per device. You can use this property to distinguish between two or more instances of the same model of device.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the device path. The caller must free the returned string, using the <b>SysFreeString</b> function.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice2-get_devicepath
     */
    get_DevicePath() {
        DevPath := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, DevPath, "HRESULT")
        return DevPath
    }

    Query(iid) {
        if (IMSVidDevice2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DevicePath := CallbackCreate(GetMethod(implObj, "get_DevicePath"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DevicePath)
    }
}
