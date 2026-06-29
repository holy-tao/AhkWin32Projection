#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpLexicon.ahk" { ISpLexicon }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpContainerLexicon extends ISpLexicon {
    /**
     * The interface identifier for ISpContainerLexicon
     * @type {Guid}
     */
    static IID := Guid("{8565572f-c094-41cc-b56e-10bd9c3ff044}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpContainerLexicon interfaces
    */
    struct Vtbl extends ISpLexicon.Vtbl {
        AddLexicon : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpContainerLexicon.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ISpLexicon} pAddLexicon 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    AddLexicon(pAddLexicon, dwFlags) {
        result := ComCall(9, this, "ptr", pAddLexicon, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpContainerLexicon.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddLexicon := CallbackCreate(GetMethod(implObj, "AddLexicon"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddLexicon)
    }
}
