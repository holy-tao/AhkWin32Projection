#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IInspectable.ahk" { IInspectable }

/**
 * @namespace Windows.Win32.System.WinRT.AllJoyn
 */
export default struct IWindowsDevicesAllJoynBusObjectFactoryInterop extends IInspectable {
    /**
     * The interface identifier for IWindowsDevicesAllJoynBusObjectFactoryInterop
     * @type {Guid}
     */
    static IID := Guid("{6174e506-8b95-4e36-95c0-b88fed34938c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWindowsDevicesAllJoynBusObjectFactoryInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        CreateFromWin32Handle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWindowsDevicesAllJoynBusObjectFactoryInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} win32handle 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateFromWin32Handle(win32handle, riid) {
        result := ComCall(6, this, "uint", win32handle, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IWindowsDevicesAllJoynBusObjectFactoryInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateFromWin32Handle := CallbackCreate(GetMethod(implObj, "CreateFromWin32Handle"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateFromWin32Handle)
    }
}
