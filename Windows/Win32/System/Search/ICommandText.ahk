#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ICommand.ahk" { ICommand }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ICommandText extends ICommand {
    /**
     * The interface identifier for ICommandText
     * @type {Guid}
     */
    static IID := Guid("{0c733a27-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICommandText interfaces
    */
    struct Vtbl extends ICommand.Vtbl {
        GetCommandText : IntPtr
        SetCommandText : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICommandText.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidDialect 
     * @returns {PWSTR} 
     */
    GetCommandText(pguidDialect) {
        result := ComCall(6, this, Guid.Ptr, pguidDialect, PWSTR.Ptr, &ppwszCommand := 0, "HRESULT")
        return ppwszCommand
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidDialect 
     * @param {PWSTR} pwszCommand 
     * @returns {HRESULT} 
     */
    SetCommandText(rguidDialect, pwszCommand) {
        pwszCommand := pwszCommand is String ? StrPtr(pwszCommand) : pwszCommand

        result := ComCall(7, this, Guid.Ptr, rguidDialect, "ptr", pwszCommand, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICommandText.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCommandText := CallbackCreate(GetMethod(implObj, "GetCommandText"), flags, 3)
        this.vtbl.SetCommandText := CallbackCreate(GetMethod(implObj, "SetCommandText"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCommandText)
        CallbackFree(this.vtbl.SetCommandText)
    }
}
