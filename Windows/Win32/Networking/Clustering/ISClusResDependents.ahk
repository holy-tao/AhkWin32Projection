#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\ISClusResource.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusResDependents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusResDependents
     * @type {Guid}
     */
    static IID => Guid("{f2e6072e-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "Refresh", "get_Item", "CreateItem", "DeleteItem", "AddItem", "RemoveItem"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
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
     * @returns {ISClusResource} 
     */
    get_Item(varIndex) {
        result := ComCall(10, this, "ptr", varIndex, "ptr*", &ppClusResource := 0, "HRESULT")
        return ISClusResource(ppClusResource)
    }

    /**
     * 
     * @param {BSTR} bstrResourceName 
     * @param {BSTR} bstrResourceType 
     * @param {Integer} dwFlags 
     * @returns {ISClusResource} 
     */
    CreateItem(bstrResourceName, bstrResourceType, dwFlags) {
        bstrResourceName := bstrResourceName is String ? BSTR.Alloc(bstrResourceName).Value : bstrResourceName
        bstrResourceType := bstrResourceType is String ? BSTR.Alloc(bstrResourceType).Value : bstrResourceType

        result := ComCall(11, this, "ptr", bstrResourceName, "ptr", bstrResourceType, "int", dwFlags, "ptr*", &ppClusterResource := 0, "HRESULT")
        return ISClusResource(ppClusterResource)
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

    /**
     * 
     * @param {ISClusResource} pResource 
     * @returns {HRESULT} 
     */
    AddItem(pResource) {
        result := ComCall(13, this, "ptr", pResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {HRESULT} 
     */
    RemoveItem(varIndex) {
        result := ComCall(14, this, "ptr", varIndex, "HRESULT")
        return result
    }
}
