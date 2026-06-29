#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISAXLexicalHandler extends IUnknown {
    /**
     * The interface identifier for ISAXLexicalHandler
     * @type {Guid}
     */
    static IID := Guid("{7f85d5f5-47a8-4497-bda5-84ba04819ea6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISAXLexicalHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        startDTD    : IntPtr
        endDTD      : IntPtr
        startEntity : IntPtr
        endEntity   : IntPtr
        startCDATA  : IntPtr
        endCDATA    : IntPtr
        comment     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISAXLexicalHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwchName 
     * @param {Integer} cchName 
     * @param {PWSTR} pwchPublicId 
     * @param {Integer} cchPublicId 
     * @param {PWSTR} pwchSystemId 
     * @param {Integer} cchSystemId 
     * @returns {HRESULT} 
     */
    startDTD(pwchName, cchName, pwchPublicId, cchPublicId, pwchSystemId, cchSystemId) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName
        pwchPublicId := pwchPublicId is String ? StrPtr(pwchPublicId) : pwchPublicId
        pwchSystemId := pwchSystemId is String ? StrPtr(pwchSystemId) : pwchSystemId

        result := ComCall(3, this, "ptr", pwchName, "int", cchName, "ptr", pwchPublicId, "int", cchPublicId, "ptr", pwchSystemId, "int", cchSystemId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    endDTD() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchName 
     * @param {Integer} cchName 
     * @returns {HRESULT} 
     */
    startEntity(pwchName, cchName) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName

        result := ComCall(5, this, "ptr", pwchName, "int", cchName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchName 
     * @param {Integer} cchName 
     * @returns {HRESULT} 
     */
    endEntity(pwchName, cchName) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName

        result := ComCall(6, this, "ptr", pwchName, "int", cchName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    startCDATA() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    endCDATA() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchChars 
     * @param {Integer} cchChars 
     * @returns {HRESULT} 
     */
    comment(pwchChars, cchChars) {
        pwchChars := pwchChars is String ? StrPtr(pwchChars) : pwchChars

        result := ComCall(9, this, "ptr", pwchChars, "int", cchChars, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISAXLexicalHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.startDTD := CallbackCreate(GetMethod(implObj, "startDTD"), flags, 7)
        this.vtbl.endDTD := CallbackCreate(GetMethod(implObj, "endDTD"), flags, 1)
        this.vtbl.startEntity := CallbackCreate(GetMethod(implObj, "startEntity"), flags, 3)
        this.vtbl.endEntity := CallbackCreate(GetMethod(implObj, "endEntity"), flags, 3)
        this.vtbl.startCDATA := CallbackCreate(GetMethod(implObj, "startCDATA"), flags, 1)
        this.vtbl.endCDATA := CallbackCreate(GetMethod(implObj, "endCDATA"), flags, 1)
        this.vtbl.comment := CallbackCreate(GetMethod(implObj, "comment"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.startDTD)
        CallbackFree(this.vtbl.endDTD)
        CallbackFree(this.vtbl.startEntity)
        CallbackFree(this.vtbl.endEntity)
        CallbackFree(this.vtbl.startCDATA)
        CallbackFree(this.vtbl.endCDATA)
        CallbackFree(this.vtbl.comment)
    }
}
