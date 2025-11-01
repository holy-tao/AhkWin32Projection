#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISAXLexicalHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISAXLexicalHandler
     * @type {Guid}
     */
    static IID => Guid("{7f85d5f5-47a8-4497-bda5-84ba04819ea6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["startDTD", "endDTD", "startEntity", "endEntity", "startCDATA", "endCDATA", "comment"]

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
}
