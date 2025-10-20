#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IVBSAXLexicalHandler extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVBSAXLexicalHandler
     * @type {Guid}
     */
    static IID => Guid("{032aac35-8c0e-4d9d-979f-e3b702935576}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["startDTD", "endDTD", "startEntity", "endEntity", "startCDATA", "endCDATA", "comment"]

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @param {Pointer<BSTR>} strPublicId 
     * @param {Pointer<BSTR>} strSystemId 
     * @returns {HRESULT} 
     */
    startDTD(strName, strPublicId, strSystemId) {
        result := ComCall(7, this, "ptr", strName, "ptr", strPublicId, "ptr", strSystemId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    endDTD() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @returns {HRESULT} 
     */
    startEntity(strName) {
        result := ComCall(9, this, "ptr", strName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @returns {HRESULT} 
     */
    endEntity(strName) {
        result := ComCall(10, this, "ptr", strName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    startCDATA() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    endCDATA() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strChars 
     * @returns {HRESULT} 
     */
    comment(strChars) {
        result := ComCall(13, this, "ptr", strChars, "HRESULT")
        return result
    }
}
