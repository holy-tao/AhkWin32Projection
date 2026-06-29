#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IInspectable.ahk" { IInspectable }

/**
 * This interface allows for the creation of alljoyn_busattachment without taking ownership of the reference.
 * @see https://learn.microsoft.com/windows/win32/api/windows.devices.alljoyn.interop/nn-windows-devices-alljoyn-interop-iwindowsdevicesalljoynbusattachmentfactoryinterop
 * @namespace Windows.Win32.System.WinRT.AllJoyn
 */
export default struct IWindowsDevicesAllJoynBusAttachmentFactoryInterop extends IInspectable {
    /**
     * The interface identifier for IWindowsDevicesAllJoynBusAttachmentFactoryInterop
     * @type {Guid}
     */
    static IID := Guid("{4b8f7505-b239-4e7b-88af-f6682575d861}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWindowsDevicesAllJoynBusAttachmentFactoryInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        CreateFromWin32Handle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWindowsDevicesAllJoynBusAttachmentFactoryInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} win32handle 
     * @param {Integer} enableAboutData 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateFromWin32Handle(win32handle, enableAboutData, riid) {
        result := ComCall(6, this, "uint", win32handle, "char", enableAboutData, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IWindowsDevicesAllJoynBusAttachmentFactoryInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateFromWin32Handle := CallbackCreate(GetMethod(implObj, "CreateFromWin32Handle"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateFromWin32Handle)
    }
}
