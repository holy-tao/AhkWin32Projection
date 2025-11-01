#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISAXDeclHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISAXDeclHandler
     * @type {Guid}
     */
    static IID => Guid("{862629ac-771a-47b2-8337-4e6843c1be90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["elementDecl", "attributeDecl", "internalEntityDecl", "externalEntityDecl"]

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
}
