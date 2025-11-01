#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusProperties extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusProperties
     * @type {Guid}
     */
    static IID => Guid("{f2e60700-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "Refresh", "get_Item", "CreateItem", "UseDefaultValue", "SaveChanges", "get_ReadOnly", "get_Private", "get_Common", "get_Modified"]

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
     * @param {Pointer<ISClusProperty>} ppClusProperty 
     * @returns {HRESULT} 
     */
    get_Item(varIndex, ppClusProperty) {
        result := ComCall(10, this, "ptr", varIndex, "ptr*", ppClusProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {VARIANT} varValue 
     * @param {Pointer<ISClusProperty>} pProperty 
     * @returns {HRESULT} 
     */
    CreateItem(bstrName, varValue, pProperty) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(11, this, "ptr", bstrName, "ptr", varValue, "ptr*", pProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {HRESULT} 
     */
    UseDefaultValue(varIndex) {
        result := ComCall(12, this, "ptr", varIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarStatusCode 
     * @returns {HRESULT} 
     */
    SaveChanges(pvarStatusCode) {
        result := ComCall(13, this, "ptr", pvarStatusCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarReadOnly 
     * @returns {HRESULT} 
     */
    get_ReadOnly(pvarReadOnly) {
        result := ComCall(14, this, "ptr", pvarReadOnly, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarPrivate 
     * @returns {HRESULT} 
     */
    get_Private(pvarPrivate) {
        result := ComCall(15, this, "ptr", pvarPrivate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarCommon 
     * @returns {HRESULT} 
     */
    get_Common(pvarCommon) {
        result := ComCall(16, this, "ptr", pvarCommon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarModified 
     * @returns {HRESULT} 
     */
    get_Modified(pvarModified) {
        result := ComCall(17, this, "ptr", pvarModified, "HRESULT")
        return result
    }
}
