#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IBidiRequestContainer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBidiRequestContainer
     * @type {Guid}
     */
    static IID => Guid("{d752f6c0-94a8-4275-a77d-8f1d1a1121ae}")

    /**
     * The class identifier for BidiRequestContainer
     * @type {Guid}
     */
    static CLSID => Guid("{fc5b8a24-db05-4a01-8388-22edf6c2bbba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddRequest", "GetEnumObject", "GetRequestCount"]

    /**
     * 
     * @param {IBidiRequest} pRequest 
     * @returns {HRESULT} 
     */
    AddRequest(pRequest) {
        result := ComCall(3, this, "ptr", pRequest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumUnknown>} ppenum 
     * @returns {HRESULT} 
     */
    GetEnumObject(ppenum) {
        result := ComCall(4, this, "ptr*", ppenum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puCount 
     * @returns {HRESULT} 
     */
    GetRequestCount(puCount) {
        result := ComCall(5, this, "uint*", puCount, "HRESULT")
        return result
    }
}
