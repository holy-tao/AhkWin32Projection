#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IConsole2.ahk" { IConsole2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IConsole3 interface supersedes the IConsole2 interface. The IConsole3 interface contains the IConsole3::RenameScopeItem method, which allows a scope node to programmatically be placed in rename mode.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iconsole3
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IConsole3 extends IConsole2 {
    /**
     * The interface identifier for IConsole3
     * @type {Guid}
     */
    static IID := Guid("{4f85efdb-d0e1-498c-8d4a-d010dfdd404f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IConsole3 interfaces
    */
    struct Vtbl extends IConsole2.Vtbl {
        RenameScopeItem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IConsole3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The RenameScopeItem method programmatically puts the specified scope item in rename mode. Subsequently, the user can manually enter the new name.
     * @remarks
     * For this method to succeed, the item put in rename mode must have the Rename verb enabled, and the scope pane must be not be invisible.
     * @param {Pointer} hScopeItem The scope item put in rename mode.
     * @returns {HRESULT} If successful, the return value is <b>S_OK</b>. If unsuccessful, the method returns <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole3-renamescopeitem
     */
    RenameScopeItem(hScopeItem) {
        result := ComCall(17, this, "ptr", hScopeItem, "HRESULT")
        return result
    }

    Query(iid) {
        if (IConsole3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RenameScopeItem := CallbackCreate(GetMethod(implObj, "RenameScopeItem"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RenameScopeItem)
    }
}
