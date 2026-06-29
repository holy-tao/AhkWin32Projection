#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugDocumentContext.ahk" { IDebugDocumentContext }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDebugDocument.ahk" { IDebugDocument }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugDocumentText extends IDebugDocument {
    /**
     * The interface identifier for IDebugDocumentText
     * @type {Guid}
     */
    static IID := Guid("{51973c22-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugDocumentText interfaces
    */
    struct Vtbl extends IDebugDocument.Vtbl {
        GetDocumentAttributes : IntPtr
        GetSize               : IntPtr
        GetPositionOfLine     : IntPtr
        GetLineOfPosition     : IntPtr
        GetText               : IntPtr
        GetPositionOfContext  : IntPtr
        GetContextOfPosition  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugDocumentText.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDocumentAttributes() {
        result := ComCall(5, this, "uint*", &ptextdocattr := 0, "HRESULT")
        return ptextdocattr
    }

    /**
     * 
     * @param {Pointer<Integer>} pcNumLines 
     * @param {Pointer<Integer>} pcNumChars 
     * @returns {HRESULT} 
     */
    GetSize(pcNumLines, pcNumChars) {
        pcNumLinesMarshal := pcNumLines is VarRef ? "uint*" : "ptr"
        pcNumCharsMarshal := pcNumChars is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pcNumLinesMarshal, pcNumLines, pcNumCharsMarshal, pcNumChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cLineNumber 
     * @returns {Integer} 
     */
    GetPositionOfLine(cLineNumber) {
        result := ComCall(7, this, "uint", cLineNumber, "uint*", &pcCharacterPosition := 0, "HRESULT")
        return pcCharacterPosition
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Pointer<Integer>} pcLineNumber 
     * @param {Pointer<Integer>} pcCharacterOffsetInLine 
     * @returns {HRESULT} 
     */
    GetLineOfPosition(cCharacterPosition, pcLineNumber, pcCharacterOffsetInLine) {
        pcLineNumberMarshal := pcLineNumber is VarRef ? "uint*" : "ptr"
        pcCharacterOffsetInLineMarshal := pcCharacterOffsetInLine is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", cCharacterPosition, pcLineNumberMarshal, pcLineNumber, pcCharacterOffsetInLineMarshal, pcCharacterOffsetInLine, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {PWSTR} pcharText 
     * @param {Pointer<Integer>} pstaTextAttr 
     * @param {Pointer<Integer>} pcNumChars 
     * @param {Integer} cMaxChars 
     * @returns {HRESULT} 
     */
    GetText(cCharacterPosition, pcharText, pstaTextAttr, pcNumChars, cMaxChars) {
        pcharText := pcharText is String ? StrPtr(pcharText) : pcharText

        pstaTextAttrMarshal := pstaTextAttr is VarRef ? "ushort*" : "ptr"
        pcNumCharsMarshal := pcNumChars is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", cCharacterPosition, "ptr", pcharText, pstaTextAttrMarshal, pstaTextAttr, pcNumCharsMarshal, pcNumChars, "uint", cMaxChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugDocumentContext} psc 
     * @param {Pointer<Integer>} pcCharacterPosition 
     * @param {Pointer<Integer>} cNumChars 
     * @returns {HRESULT} 
     */
    GetPositionOfContext(psc, pcCharacterPosition, cNumChars) {
        pcCharacterPositionMarshal := pcCharacterPosition is VarRef ? "uint*" : "ptr"
        cNumCharsMarshal := cNumChars is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", psc, pcCharacterPositionMarshal, pcCharacterPosition, cNumCharsMarshal, cNumChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Integer} cNumChars 
     * @returns {IDebugDocumentContext} 
     */
    GetContextOfPosition(cCharacterPosition, cNumChars) {
        result := ComCall(11, this, "uint", cCharacterPosition, "uint", cNumChars, "ptr*", &ppsc := 0, "HRESULT")
        return IDebugDocumentContext(ppsc)
    }

    Query(iid) {
        if (IDebugDocumentText.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDocumentAttributes := CallbackCreate(GetMethod(implObj, "GetDocumentAttributes"), flags, 2)
        this.vtbl.GetSize := CallbackCreate(GetMethod(implObj, "GetSize"), flags, 3)
        this.vtbl.GetPositionOfLine := CallbackCreate(GetMethod(implObj, "GetPositionOfLine"), flags, 3)
        this.vtbl.GetLineOfPosition := CallbackCreate(GetMethod(implObj, "GetLineOfPosition"), flags, 4)
        this.vtbl.GetText := CallbackCreate(GetMethod(implObj, "GetText"), flags, 6)
        this.vtbl.GetPositionOfContext := CallbackCreate(GetMethod(implObj, "GetPositionOfContext"), flags, 4)
        this.vtbl.GetContextOfPosition := CallbackCreate(GetMethod(implObj, "GetContextOfPosition"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDocumentAttributes)
        CallbackFree(this.vtbl.GetSize)
        CallbackFree(this.vtbl.GetPositionOfLine)
        CallbackFree(this.vtbl.GetLineOfPosition)
        CallbackFree(this.vtbl.GetText)
        CallbackFree(this.vtbl.GetPositionOfContext)
        CallbackFree(this.vtbl.GetContextOfPosition)
    }
}
