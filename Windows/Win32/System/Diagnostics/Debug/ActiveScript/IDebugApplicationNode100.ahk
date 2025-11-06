#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\TEXT_DOCUMENT_ARRAY.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugApplicationNode100 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugApplicationNode100
     * @type {Guid}
     */
    static IID => Guid("{90a7734e-841b-4f77-9384-a2891e76e7e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFilterForEventSink", "GetExcludedDocuments", "QueryIsChildNode"]

    /**
     * 
     * @param {Integer} dwCookie 
     * @param {Integer} filter 
     * @returns {HRESULT} 
     */
    SetFilterForEventSink(dwCookie, filter) {
        result := ComCall(3, this, "uint", dwCookie, "int", filter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} filter 
     * @returns {TEXT_DOCUMENT_ARRAY} 
     */
    GetExcludedDocuments(filter) {
        pDocuments := TEXT_DOCUMENT_ARRAY()
        result := ComCall(4, this, "int", filter, "ptr", pDocuments, "HRESULT")
        return pDocuments
    }

    /**
     * 
     * @param {IDebugDocument} pSearchKey 
     * @returns {HRESULT} 
     */
    QueryIsChildNode(pSearchKey) {
        result := ComCall(5, this, "ptr", pSearchKey, "HRESULT")
        return result
    }
}
