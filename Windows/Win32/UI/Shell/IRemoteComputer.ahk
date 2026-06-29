#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that enumerates or initializes a namespace extension when it is invoked on a remote object. This interface is used, for example, to initialize the remote printers virtual folder.
 * @remarks
 * Implement <b>IRemoteComputer</b> when your namespace extension may be invoked on a remote computer.
 * 
 * You do not call this interface directly. <b>IRemoteComputer</b> is used by the operating system only when it has confirmed that your application is aware of this interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iremotecomputer
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IRemoteComputer extends IUnknown {
    /**
     * The interface identifier for IRemoteComputer
     * @type {Guid}
     */
    static IID := Guid("{000214fe-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRemoteComputer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRemoteComputer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Used by Windows Explorer or Windows Internet Explorer when it is initializing or enumerating a namespace extension invoked on a remote computer.
     * @remarks
     * If failure is returned, the extension won't appear for the specified computer. Otherwise, the extension will appear and target the remote computer.
     * @param {PWSTR} pszMachine Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the machine name of the remote computer.
     * @param {BOOL} bEnumerating Type: <b>BOOL</b>
     * 
     * A value that is set to <b>TRUE</b> if Windows Explorer is enumerating the namespace extension, or <b>FALSE</b> if it is initializing it.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or standard OLE error values otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iremotecomputer-initialize
     */
    Initialize(pszMachine, bEnumerating) {
        pszMachine := pszMachine is String ? StrPtr(pszMachine) : pszMachine

        result := ComCall(3, this, "ptr", pszMachine, BOOL, bEnumerating, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRemoteComputer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}
