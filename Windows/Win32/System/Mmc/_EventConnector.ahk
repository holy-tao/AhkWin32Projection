#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\_Application.ahk" { _Application }

/**
 * @namespace Windows.Win32.System.Mmc
 */
export default struct _EventConnector extends IDispatch {
    /**
     * The interface identifier for _EventConnector
     * @type {Guid}
     */
    static IID := Guid("{c0bccd30-de44-4528-8403-a05a6a1cc8ea}")

    /**
     * The class identifier for _EventConnector
     * @type {Guid}
     */
    static CLSID := Guid("{c0bccd30-de44-4528-8403-a05a6a1cc8ea}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for _EventConnector interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        ConnectTo  : IntPtr
        Disconnect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := _EventConnector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {_Application} _Application 
     * @returns {HRESULT} 
     */
    ConnectTo(_Application) {
        result := ComCall(7, this, "ptr", _Application, "HRESULT")
        return result
    }

    /**
     * The Disconnect event is reserved for future use.
     * @remarks
     * This event is reserved for future use.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/axwmplib-axwindowsmediaplayer-disconnect
     */
    Disconnect() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (_EventConnector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConnectTo := CallbackCreate(GetMethod(implObj, "ConnectTo"), flags, 2)
        this.vtbl.Disconnect := CallbackCreate(GetMethod(implObj, "Disconnect"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConnectTo)
        CallbackFree(this.vtbl.Disconnect)
    }
}
