#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\NETCONMGR_ENUM_FLAGS.ahk" { NETCONMGR_ENUM_FLAGS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumNetConnection.ahk" { IEnumNetConnection }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetConnectionManager extends IUnknown {
    /**
     * The interface identifier for INetConnectionManager
     * @type {Guid}
     */
    static IID := Guid("{c08956a2-1cd3-11d1-b1c5-00805fc1270e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetConnectionManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnumConnections : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetConnectionManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {NETCONMGR_ENUM_FLAGS} Flags 
     * @returns {IEnumNetConnection} 
     */
    EnumConnections(Flags) {
        result := ComCall(3, this, NETCONMGR_ENUM_FLAGS, Flags, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumNetConnection(ppEnum)
    }

    Query(iid) {
        if (INetConnectionManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumConnections := CallbackCreate(GetMethod(implObj, "EnumConnections"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumConnections)
    }
}
