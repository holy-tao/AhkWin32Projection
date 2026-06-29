#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\INetConnection.ahk" { INetConnection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetConnectionConnectUi extends IUnknown {
    /**
     * The interface identifier for INetConnectionConnectUi
     * @type {Guid}
     */
    static IID := Guid("{c08956a3-1cd3-11d1-b1c5-00805fc1270e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetConnectionConnectUi interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetConnection : IntPtr
        Connect       : IntPtr
        Disconnect    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetConnectionConnectUi.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {INetConnection} pCon 
     * @returns {HRESULT} 
     */
    SetConnection(pCon) {
        result := ComCall(3, this, "ptr", pCon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Connect(hwndParent, dwFlags) {
        result := ComCall(4, this, HWND, hwndParent, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The Disconnect event is reserved for future use.
     * @remarks
     * This event is reserved for future use.
     * @param {HWND} hwndParent 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/axwmplib-axwindowsmediaplayer-disconnect
     */
    Disconnect(hwndParent, dwFlags) {
        result := ComCall(5, this, HWND, hwndParent, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetConnectionConnectUi.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetConnection := CallbackCreate(GetMethod(implObj, "SetConnection"), flags, 2)
        this.vtbl.Connect := CallbackCreate(GetMethod(implObj, "Connect"), flags, 3)
        this.vtbl.Disconnect := CallbackCreate(GetMethod(implObj, "Disconnect"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetConnection)
        CallbackFree(this.vtbl.Connect)
        CallbackFree(this.vtbl.Disconnect)
    }
}
