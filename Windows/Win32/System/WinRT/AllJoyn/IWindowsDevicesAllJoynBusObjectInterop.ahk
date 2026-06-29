#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IInspectable.ahk" { IInspectable }
#Import "..\HSTRING.ahk" { HSTRING }

/**
 * @namespace Windows.Win32.System.WinRT.AllJoyn
 */
export default struct IWindowsDevicesAllJoynBusObjectInterop extends IInspectable {
    /**
     * The interface identifier for IWindowsDevicesAllJoynBusObjectInterop
     * @type {Guid}
     */
    static IID := Guid("{d78aa3d5-5054-428f-99f2-ec3a5de3c3bc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWindowsDevicesAllJoynBusObjectInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        AddPropertyGetHandler : IntPtr
        AddPropertySetHandler : IntPtr
        get_Win32Handle       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWindowsDevicesAllJoynBusObjectInterop.Vtbl()
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
     * @param {Pointer<Void>} _context 
     * @param {HSTRING} interfaceName 
     * @param {Pointer} callback 
     * @returns {HRESULT} 
     */
    AddPropertyGetHandler(_context, interfaceName, callback) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, _contextMarshal, _context, HSTRING, interfaceName, "ptr", callback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} _context 
     * @param {HSTRING} interfaceName 
     * @param {Pointer} callback 
     * @returns {HRESULT} 
     */
    AddPropertySetHandler(_context, interfaceName, callback) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, _contextMarshal, _context, HSTRING, interfaceName, "ptr", callback, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Win32Handle() {
        result := ComCall(8, this, "uint*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IWindowsDevicesAllJoynBusObjectInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddPropertyGetHandler := CallbackCreate(GetMethod(implObj, "AddPropertyGetHandler"), flags, 4)
        this.vtbl.AddPropertySetHandler := CallbackCreate(GetMethod(implObj, "AddPropertySetHandler"), flags, 4)
        this.vtbl.get_Win32Handle := CallbackCreate(GetMethod(implObj, "get_Win32Handle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddPropertyGetHandler)
        CallbackFree(this.vtbl.AddPropertySetHandler)
        CallbackFree(this.vtbl.get_Win32Handle)
    }
}
