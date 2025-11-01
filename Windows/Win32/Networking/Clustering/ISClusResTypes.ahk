#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusResTypes extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusResTypes
     * @type {Guid}
     */
    static IID => Guid("{f2e60712-2631-11d1-89f1-00a0c90d061e}")

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
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plCountMarshal, plCount, "HRESULT")
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
     * @param {Pointer<ISClusResType>} ppClusResType 
     * @returns {HRESULT} 
     */
    get_Item(varIndex, ppClusResType) {
        result := ComCall(10, this, "ptr", varIndex, "ptr*", ppClusResType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrResourceTypeName 
     * @param {BSTR} bstrDisplayName 
     * @param {BSTR} bstrResourceTypeDll 
     * @param {Integer} dwLooksAlivePollInterval 
     * @param {Integer} dwIsAlivePollInterval 
     * @param {Pointer<ISClusResType>} ppResourceType 
     * @returns {HRESULT} 
     */
    CreateItem(bstrResourceTypeName, bstrDisplayName, bstrResourceTypeDll, dwLooksAlivePollInterval, dwIsAlivePollInterval, ppResourceType) {
        bstrResourceTypeName := bstrResourceTypeName is String ? BSTR.Alloc(bstrResourceTypeName).Value : bstrResourceTypeName
        bstrDisplayName := bstrDisplayName is String ? BSTR.Alloc(bstrDisplayName).Value : bstrDisplayName
        bstrResourceTypeDll := bstrResourceTypeDll is String ? BSTR.Alloc(bstrResourceTypeDll).Value : bstrResourceTypeDll

        result := ComCall(11, this, "ptr", bstrResourceTypeName, "ptr", bstrDisplayName, "ptr", bstrResourceTypeDll, "int", dwLooksAlivePollInterval, "int", dwIsAlivePollInterval, "ptr*", ppResourceType, "HRESULT")
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
