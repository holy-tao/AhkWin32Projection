#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISAXDeclHandler extends IUnknown {
    /**
     * The interface identifier for ISAXDeclHandler
     * @type {Guid}
     */
    static IID := Guid("{862629ac-771a-47b2-8337-4e6843c1be90}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISAXDeclHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        elementDecl        : IntPtr
        attributeDecl      : IntPtr
        internalEntityDecl : IntPtr
        externalEntityDecl : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISAXDeclHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwchName 
     * @param {Integer} cchName 
     * @param {PWSTR} pwchModel 
     * @param {Integer} cchModel 
     * @returns {HRESULT} 
     */
    elementDecl(pwchName, cchName, pwchModel, cchModel) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName
        pwchModel := pwchModel is String ? StrPtr(pwchModel) : pwchModel

        result := ComCall(3, this, "ptr", pwchName, "int", cchName, "ptr", pwchModel, "int", cchModel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchElementName 
     * @param {Integer} cchElementName 
     * @param {PWSTR} pwchAttributeName 
     * @param {Integer} cchAttributeName 
     * @param {PWSTR} pwchType 
     * @param {Integer} cchType 
     * @param {PWSTR} pwchValueDefault 
     * @param {Integer} cchValueDefault 
     * @param {PWSTR} pwchValue 
     * @param {Integer} cchValue 
     * @returns {HRESULT} 
     */
    attributeDecl(pwchElementName, cchElementName, pwchAttributeName, cchAttributeName, pwchType, cchType, pwchValueDefault, cchValueDefault, pwchValue, cchValue) {
        pwchElementName := pwchElementName is String ? StrPtr(pwchElementName) : pwchElementName
        pwchAttributeName := pwchAttributeName is String ? StrPtr(pwchAttributeName) : pwchAttributeName
        pwchType := pwchType is String ? StrPtr(pwchType) : pwchType
        pwchValueDefault := pwchValueDefault is String ? StrPtr(pwchValueDefault) : pwchValueDefault
        pwchValue := pwchValue is String ? StrPtr(pwchValue) : pwchValue

        result := ComCall(4, this, "ptr", pwchElementName, "int", cchElementName, "ptr", pwchAttributeName, "int", cchAttributeName, "ptr", pwchType, "int", cchType, "ptr", pwchValueDefault, "int", cchValueDefault, "ptr", pwchValue, "int", cchValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchName 
     * @param {Integer} cchName 
     * @param {PWSTR} pwchValue 
     * @param {Integer} cchValue 
     * @returns {HRESULT} 
     */
    internalEntityDecl(pwchName, cchName, pwchValue, cchValue) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName
        pwchValue := pwchValue is String ? StrPtr(pwchValue) : pwchValue

        result := ComCall(5, this, "ptr", pwchName, "int", cchName, "ptr", pwchValue, "int", cchValue, "HRESULT")
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
     * @returns {HRESULT} 
     */
    externalEntityDecl(pwchName, cchName, pwchPublicId, cchPublicId, pwchSystemId, cchSystemId) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName
        pwchPublicId := pwchPublicId is String ? StrPtr(pwchPublicId) : pwchPublicId
        pwchSystemId := pwchSystemId is String ? StrPtr(pwchSystemId) : pwchSystemId

        result := ComCall(6, this, "ptr", pwchName, "int", cchName, "ptr", pwchPublicId, "int", cchPublicId, "ptr", pwchSystemId, "int", cchSystemId, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISAXDeclHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.elementDecl := CallbackCreate(GetMethod(implObj, "elementDecl"), flags, 5)
        this.vtbl.attributeDecl := CallbackCreate(GetMethod(implObj, "attributeDecl"), flags, 11)
        this.vtbl.internalEntityDecl := CallbackCreate(GetMethod(implObj, "internalEntityDecl"), flags, 5)
        this.vtbl.externalEntityDecl := CallbackCreate(GetMethod(implObj, "externalEntityDecl"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.elementDecl)
        CallbackFree(this.vtbl.attributeDecl)
        CallbackFree(this.vtbl.internalEntityDecl)
        CallbackFree(this.vtbl.externalEntityDecl)
    }
}
