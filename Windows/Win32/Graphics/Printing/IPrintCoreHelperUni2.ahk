#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPrintCoreHelperUni.ahk" { IPrintCoreHelperUni }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintCoreHelperUni2 extends IPrintCoreHelperUni {
    /**
     * The interface identifier for IPrintCoreHelperUni2
     * @type {Guid}
     */
    static IID := Guid("{6c8afdfc-ead0-4d2d-8071-9bf0175a6c3a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintCoreHelperUni2 interfaces
    */
    struct Vtbl extends IPrintCoreHelperUni.Vtbl {
        GetNamedCommand : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintCoreHelperUni2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} pDevmode 
     * @param {Integer} cbSize 
     * @param {PWSTR} pszCommandName 
     * @param {Pointer<Pointer<Integer>>} ppCommandBytes 
     * @param {Pointer<Integer>} pcbCommandSize 
     * @returns {HRESULT} 
     */
    GetNamedCommand(pDevmode, cbSize, pszCommandName, ppCommandBytes, pcbCommandSize) {
        pszCommandName := pszCommandName is String ? StrPtr(pszCommandName) : pszCommandName

        ppCommandBytesMarshal := ppCommandBytes is VarRef ? "ptr*" : "ptr"
        pcbCommandSizeMarshal := pcbCommandSize is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", pDevmode, "uint", cbSize, "ptr", pszCommandName, ppCommandBytesMarshal, ppCommandBytes, pcbCommandSizeMarshal, pcbCommandSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintCoreHelperUni2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNamedCommand := CallbackCreate(GetMethod(implObj, "GetNamedCommand"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNamedCommand)
    }
}
