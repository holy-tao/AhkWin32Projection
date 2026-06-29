#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugDocumentTextEvents extends IUnknown {
    /**
     * The interface identifier for IDebugDocumentTextEvents
     * @type {Guid}
     */
    static IID := Guid("{51973c23-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugDocumentTextEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        onDestroy                  : IntPtr
        onInsertText               : IntPtr
        onRemoveText               : IntPtr
        onReplaceText              : IntPtr
        onUpdateTextAttributes     : IntPtr
        onUpdateDocumentAttributes : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugDocumentTextEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    onDestroy() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Integer} cNumToInsert 
     * @returns {HRESULT} 
     */
    onInsertText(cCharacterPosition, cNumToInsert) {
        result := ComCall(4, this, "uint", cCharacterPosition, "uint", cNumToInsert, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Integer} cNumToRemove 
     * @returns {HRESULT} 
     */
    onRemoveText(cCharacterPosition, cNumToRemove) {
        result := ComCall(5, this, "uint", cCharacterPosition, "uint", cNumToRemove, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Integer} cNumToReplace 
     * @returns {HRESULT} 
     */
    onReplaceText(cCharacterPosition, cNumToReplace) {
        result := ComCall(6, this, "uint", cCharacterPosition, "uint", cNumToReplace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Integer} cNumToUpdate 
     * @returns {HRESULT} 
     */
    onUpdateTextAttributes(cCharacterPosition, cNumToUpdate) {
        result := ComCall(7, this, "uint", cCharacterPosition, "uint", cNumToUpdate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} textdocattr 
     * @returns {HRESULT} 
     */
    onUpdateDocumentAttributes(textdocattr) {
        result := ComCall(8, this, "uint", textdocattr, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugDocumentTextEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.onDestroy := CallbackCreate(GetMethod(implObj, "onDestroy"), flags, 1)
        this.vtbl.onInsertText := CallbackCreate(GetMethod(implObj, "onInsertText"), flags, 3)
        this.vtbl.onRemoveText := CallbackCreate(GetMethod(implObj, "onRemoveText"), flags, 3)
        this.vtbl.onReplaceText := CallbackCreate(GetMethod(implObj, "onReplaceText"), flags, 3)
        this.vtbl.onUpdateTextAttributes := CallbackCreate(GetMethod(implObj, "onUpdateTextAttributes"), flags, 3)
        this.vtbl.onUpdateDocumentAttributes := CallbackCreate(GetMethod(implObj, "onUpdateDocumentAttributes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.onDestroy)
        CallbackFree(this.vtbl.onInsertText)
        CallbackFree(this.vtbl.onRemoveText)
        CallbackFree(this.vtbl.onReplaceText)
        CallbackFree(this.vtbl.onUpdateTextAttributes)
        CallbackFree(this.vtbl.onUpdateDocumentAttributes)
    }
}
