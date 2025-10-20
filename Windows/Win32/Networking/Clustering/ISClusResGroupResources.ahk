#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusResGroupResources extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusResGroupResources
     * @type {Guid}
     */
    static IID => Guid("{f2e606ea-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "Refresh", "get_Item", "CreateItem", "DeleteItem"]

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     */
    get_Count(plCount) {
        result := ComCall(7, this, "int*", plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     */
    get__NewEnum(retval) {
        result := ComCall(8, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @param {Pointer<ISClusResource>} ppClusResource 
     * @returns {HRESULT} 
     */
    get_Item(varIndex, ppClusResource) {
        result := ComCall(10, this, "ptr", varIndex, "ptr*", ppClusResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrResourceName 
     * @param {BSTR} bstrResourceType 
     * @param {Integer} dwFlags 
     * @param {Pointer<ISClusResource>} ppClusterResource 
     * @returns {HRESULT} 
     */
    CreateItem(bstrResourceName, bstrResourceType, dwFlags, ppClusterResource) {
        bstrResourceName := bstrResourceName is String ? BSTR.Alloc(bstrResourceName).Value : bstrResourceName
        bstrResourceType := bstrResourceType is String ? BSTR.Alloc(bstrResourceType).Value : bstrResourceType

        result := ComCall(11, this, "ptr", bstrResourceName, "ptr", bstrResourceType, "int", dwFlags, "ptr*", ppClusterResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {HRESULT} 
     */
    DeleteItem(varIndex) {
        result := ComCall(12, this, "ptr", varIndex, "HRESULT")
        return result
    }
}
