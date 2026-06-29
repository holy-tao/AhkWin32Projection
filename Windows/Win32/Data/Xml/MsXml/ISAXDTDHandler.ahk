#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISAXDTDHandler extends IUnknown {
    /**
     * The interface identifier for ISAXDTDHandler
     * @type {Guid}
     */
    static IID := Guid("{e15c1baf-afb3-4d60-8c36-19a8c45defed}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISAXDTDHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        notationDecl       : IntPtr
        unparsedEntityDecl : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISAXDTDHandler.Vtbl()
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
    notationDecl(pwchName, cchName, pwchPublicId, cchPublicId, pwchSystemId, cchSystemId) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName
        pwchPublicId := pwchPublicId is String ? StrPtr(pwchPublicId) : pwchPublicId
        pwchSystemId := pwchSystemId is String ? StrPtr(pwchSystemId) : pwchSystemId

        result := ComCall(3, this, "ptr", pwchName, "int", cchName, "ptr", pwchPublicId, "int", cchPublicId, "ptr", pwchSystemId, "int", cchSystemId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchName 
     * @param {Integer} cchName 
     * @param {PWSTR} pwchPublicId 
     * @param {Integer} cchPublicId 
     * @param {PWSTR} pwchSystemId 
     * @param {Integer} cchSystemId 
     * @param {PWSTR} pwchNotationName 
     * @param {Integer} cchNotationName 
     * @returns {HRESULT} 
     */
    unparsedEntityDecl(pwchName, cchName, pwchPublicId, cchPublicId, pwchSystemId, cchSystemId, pwchNotationName, cchNotationName) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName
        pwchPublicId := pwchPublicId is String ? StrPtr(pwchPublicId) : pwchPublicId
        pwchSystemId := pwchSystemId is String ? StrPtr(pwchSystemId) : pwchSystemId
        pwchNotationName := pwchNotationName is String ? StrPtr(pwchNotationName) : pwchNotationName

        result := ComCall(4, this, "ptr", pwchName, "int", cchName, "ptr", pwchPublicId, "int", cchPublicId, "ptr", pwchSystemId, "int", cchSystemId, "ptr", pwchNotationName, "int", cchNotationName, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISAXDTDHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.notationDecl := CallbackCreate(GetMethod(implObj, "notationDecl"), flags, 7)
        this.vtbl.unparsedEntityDecl := CallbackCreate(GetMethod(implObj, "unparsedEntityDecl"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.notationDecl)
        CallbackFree(this.vtbl.unparsedEntityDecl)
    }
}
