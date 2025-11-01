#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IVBSAXErrorHandler extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVBSAXErrorHandler
     * @type {Guid}
     */
    static IID => Guid("{d963d3fe-173c-4862-9095-b92f66995f52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["error", "fatalError", "ignorableWarning"]

    /**
     * 
     * @param {IVBSAXLocator} oLocator 
     * @param {Pointer<BSTR>} strErrorMessage 
     * @param {Integer} nErrorCode 
     * @returns {HRESULT} 
     */
    error(oLocator, strErrorMessage, nErrorCode) {
        result := ComCall(7, this, "ptr", oLocator, "ptr", strErrorMessage, "int", nErrorCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IVBSAXLocator} oLocator 
     * @param {Pointer<BSTR>} strErrorMessage 
     * @param {Integer} nErrorCode 
     * @returns {HRESULT} 
     */
    fatalError(oLocator, strErrorMessage, nErrorCode) {
        result := ComCall(8, this, "ptr", oLocator, "ptr", strErrorMessage, "int", nErrorCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IVBSAXLocator} oLocator 
     * @param {Pointer<BSTR>} strErrorMessage 
     * @param {Integer} nErrorCode 
     * @returns {HRESULT} 
     */
    ignorableWarning(oLocator, strErrorMessage, nErrorCode) {
        result := ComCall(9, this, "ptr", oLocator, "ptr", strErrorMessage, "int", nErrorCode, "HRESULT")
        return result
    }
}
