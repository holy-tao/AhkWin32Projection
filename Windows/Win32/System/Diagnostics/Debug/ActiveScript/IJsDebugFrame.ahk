#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IJsDebugProperty.ahk" { IJsDebugProperty }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IJsDebugFrame extends IUnknown {
    /**
     * The interface identifier for IJsDebugFrame
     * @type {Guid}
     */
    static IID := Guid("{c9196637-ab9d-44b2-bad2-13b95b3f390e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IJsDebugFrame interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStackRange               : IntPtr
        GetName                     : IntPtr
        GetDocumentPositionWithId   : IntPtr
        GetDocumentPositionWithName : IntPtr
        GetDebugProperty            : IntPtr
        GetReturnAddress            : IntPtr
        Evaluate                    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IJsDebugFrame.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pStart 
     * @param {Pointer<Integer>} pEnd 
     * @returns {HRESULT} 
     */
    GetStackRange(pStart, pEnd) {
        pStartMarshal := pStart is VarRef ? "uint*" : "ptr"
        pEndMarshal := pEnd is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pStartMarshal, pStart, pEndMarshal, pEnd, "HRESULT")
        return result
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        pName := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pName, "HRESULT")
        return pName
    }

    /**
     * 
     * @param {Pointer<Integer>} pDocumentId 
     * @param {Pointer<Integer>} pCharacterOffset 
     * @param {Pointer<Integer>} pStatementCharCount 
     * @returns {HRESULT} 
     */
    GetDocumentPositionWithId(pDocumentId, pCharacterOffset, pStatementCharCount) {
        pDocumentIdMarshal := pDocumentId is VarRef ? "uint*" : "ptr"
        pCharacterOffsetMarshal := pCharacterOffset is VarRef ? "uint*" : "ptr"
        pStatementCharCountMarshal := pStatementCharCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pDocumentIdMarshal, pDocumentId, pCharacterOffsetMarshal, pCharacterOffset, pStatementCharCountMarshal, pStatementCharCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDocumentName 
     * @param {Pointer<Integer>} pLine 
     * @param {Pointer<Integer>} pColumn 
     * @returns {HRESULT} 
     */
    GetDocumentPositionWithName(pDocumentName, pLine, pColumn) {
        pLineMarshal := pLine is VarRef ? "uint*" : "ptr"
        pColumnMarshal := pColumn is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, BSTR.Ptr, pDocumentName, pLineMarshal, pLine, pColumnMarshal, pColumn, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IJsDebugProperty} 
     */
    GetDebugProperty() {
        result := ComCall(7, this, "ptr*", &ppDebugProperty := 0, "HRESULT")
        return IJsDebugProperty(ppDebugProperty)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetReturnAddress() {
        result := ComCall(8, this, "uint*", &pReturnAddress := 0, "HRESULT")
        return pReturnAddress
    }

    /**
     * 
     * @param {PWSTR} pExpressionText 
     * @param {Pointer<IJsDebugProperty>} ppDebugProperty 
     * @param {Pointer<BSTR>} pError 
     * @returns {HRESULT} 
     */
    Evaluate(pExpressionText, ppDebugProperty, pError) {
        pExpressionText := pExpressionText is String ? StrPtr(pExpressionText) : pExpressionText

        result := ComCall(9, this, "ptr", pExpressionText, IJsDebugProperty.Ptr, ppDebugProperty, BSTR.Ptr, pError, "HRESULT")
        return result
    }

    Query(iid) {
        if (IJsDebugFrame.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStackRange := CallbackCreate(GetMethod(implObj, "GetStackRange"), flags, 3)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetDocumentPositionWithId := CallbackCreate(GetMethod(implObj, "GetDocumentPositionWithId"), flags, 4)
        this.vtbl.GetDocumentPositionWithName := CallbackCreate(GetMethod(implObj, "GetDocumentPositionWithName"), flags, 4)
        this.vtbl.GetDebugProperty := CallbackCreate(GetMethod(implObj, "GetDebugProperty"), flags, 2)
        this.vtbl.GetReturnAddress := CallbackCreate(GetMethod(implObj, "GetReturnAddress"), flags, 2)
        this.vtbl.Evaluate := CallbackCreate(GetMethod(implObj, "Evaluate"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStackRange)
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetDocumentPositionWithId)
        CallbackFree(this.vtbl.GetDocumentPositionWithName)
        CallbackFree(this.vtbl.GetDebugProperty)
        CallbackFree(this.vtbl.GetReturnAddress)
        CallbackFree(this.vtbl.Evaluate)
    }
}
