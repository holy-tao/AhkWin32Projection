#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugApplicationNode100 extends IUnknown{
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
     * 
     * @param {Integer} dwCookie 
     * @param {Integer} filter 
     * @returns {HRESULT} 
     */
    SetFilterForEventSink(dwCookie, filter) {
        result := ComCall(3, this, "uint", dwCookie, "int", filter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} filter 
     * @param {Pointer<TEXT_DOCUMENT_ARRAY>} pDocuments 
     * @returns {HRESULT} 
     */
    GetExcludedDocuments(filter, pDocuments) {
        result := ComCall(4, this, "int", filter, "ptr", pDocuments, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugDocument>} pSearchKey 
     * @returns {HRESULT} 
     */
    QueryIsChildNode(pSearchKey) {
        result := ComCall(5, this, "ptr", pSearchKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
