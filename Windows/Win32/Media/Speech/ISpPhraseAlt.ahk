#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpPhrase.ahk" { ISpPhrase }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpPhraseAlt extends ISpPhrase {
    /**
     * The interface identifier for ISpPhraseAlt
     * @type {Guid}
     */
    static IID := Guid("{8fcebc98-4e49-4067-9c6c-d86a0e092e3d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpPhraseAlt interfaces
    */
    struct Vtbl extends ISpPhrase.Vtbl {
        GetAltInfo : IntPtr
        Commit     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpPhraseAlt.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pulStartElementInParent 
     * @param {Pointer<Integer>} pcElementsInParent 
     * @param {Pointer<Integer>} pcElementsInAlt 
     * @returns {ISpPhrase} 
     */
    GetAltInfo(pulStartElementInParent, pcElementsInParent, pcElementsInAlt) {
        pulStartElementInParentMarshal := pulStartElementInParent is VarRef ? "uint*" : "ptr"
        pcElementsInParentMarshal := pcElementsInParent is VarRef ? "uint*" : "ptr"
        pcElementsInAltMarshal := pcElementsInAlt is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr*", &ppParent := 0, pulStartElementInParentMarshal, pulStartElementInParent, pcElementsInParentMarshal, pcElementsInParent, pcElementsInAltMarshal, pcElementsInAlt, "HRESULT")
        return ISpPhrase(ppParent)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpPhraseAlt.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAltInfo := CallbackCreate(GetMethod(implObj, "GetAltInfo"), flags, 5)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAltInfo)
        CallbackFree(this.vtbl.Commit)
    }
}
