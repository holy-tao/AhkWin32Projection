#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumSpeechCommands.ahk" { IEnumSpeechCommands }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ISpeechCommandProvider extends IUnknown {
    /**
     * The interface identifier for ISpeechCommandProvider
     * @type {Guid}
     */
    static IID := Guid("{38e09d4c-586d-435a-b592-c8a86691dec6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechCommandProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnumSpeechCommands : IntPtr
        ProcessCommand     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechCommandProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} langid 
     * @returns {IEnumSpeechCommands} 
     */
    EnumSpeechCommands(langid) {
        result := ComCall(3, this, "ushort", langid, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSpeechCommands(ppEnum)
    }

    /**
     * 
     * @param {PWSTR} pszCommand 
     * @param {Integer} cch 
     * @param {Integer} langid 
     * @returns {HRESULT} 
     */
    ProcessCommand(pszCommand, cch, langid) {
        pszCommand := pszCommand is String ? StrPtr(pszCommand) : pszCommand

        result := ComCall(4, this, "ptr", pszCommand, "uint", cch, "ushort", langid, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpeechCommandProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumSpeechCommands := CallbackCreate(GetMethod(implObj, "EnumSpeechCommands"), flags, 3)
        this.vtbl.ProcessCommand := CallbackCreate(GetMethod(implObj, "ProcessCommand"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumSpeechCommands)
        CallbackFree(this.vtbl.ProcessCommand)
    }
}
