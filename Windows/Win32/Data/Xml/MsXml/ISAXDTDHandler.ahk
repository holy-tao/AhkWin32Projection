#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISAXDTDHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISAXDTDHandler
     * @type {Guid}
     */
    static IID => Guid("{e15c1baf-afb3-4d60-8c36-19a8c45defed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["notationDecl", "unparsedEntityDecl"]

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
}
