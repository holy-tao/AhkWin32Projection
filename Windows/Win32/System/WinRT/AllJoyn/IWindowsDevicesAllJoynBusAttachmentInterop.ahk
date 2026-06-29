#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IInspectable.ahk" { IInspectable }

/**
 * This interface allows for retrieval of the underlying alljoyn_busattachment object.
 * @see https://learn.microsoft.com/windows/win32/api/windows.devices.alljoyn.interop/nn-windows-devices-alljoyn-interop-iwindowsdevicesalljoynbusattachmentinterop
 * @namespace Windows.Win32.System.WinRT.AllJoyn
 */
export default struct IWindowsDevicesAllJoynBusAttachmentInterop extends IInspectable {
    /**
     * The interface identifier for IWindowsDevicesAllJoynBusAttachmentInterop
     * @type {Guid}
     */
    static IID := Guid("{fd89c65b-b50e-4a19-9d0c-b42b783281cd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWindowsDevicesAllJoynBusAttachmentInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        get_Win32Handle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWindowsDevicesAllJoynBusAttachmentInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Win32Handle {
        get => this.get_Win32Handle()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Win32Handle() {
        result := ComCall(6, this, "uint*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IWindowsDevicesAllJoynBusAttachmentInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Win32Handle := CallbackCreate(GetMethod(implObj, "get_Win32Handle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Win32Handle)
    }
}
