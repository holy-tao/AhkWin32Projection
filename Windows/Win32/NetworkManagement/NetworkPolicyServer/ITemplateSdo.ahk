#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISdo.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ITemplateSdo extends ISdo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITemplateSdo
     * @type {Guid}
     */
    static IID => Guid("{8aa85302-d2e2-4e20-8b1f-a571e437d6c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddToCollection", "AddToSdo", "AddToSdoAsProperty"]

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {IDispatch} pCollection 
     * @param {Pointer<IDispatch>} ppItem 
     * @returns {HRESULT} 
     */
    AddToCollection(bstrName, pCollection, ppItem) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(14, this, "ptr", bstrName, "ptr", pCollection, "ptr*", ppItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {IDispatch} pSdoTarget 
     * @param {Pointer<IDispatch>} ppItem 
     * @returns {HRESULT} 
     */
    AddToSdo(bstrName, pSdoTarget, ppItem) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(15, this, "ptr", bstrName, "ptr", pSdoTarget, "ptr*", ppItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pSdoTarget 
     * @param {Integer} id 
     * @returns {HRESULT} 
     */
    AddToSdoAsProperty(pSdoTarget, id) {
        result := ComCall(16, this, "ptr", pSdoTarget, "int", id, "HRESULT")
        return result
    }
}
