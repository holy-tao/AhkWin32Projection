#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\ISClusProperty.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * @type {VARIANT} 
     */
    ReadOnly {
        get => this.get_ReadOnly()
    }

    /**
     * @type {VARIANT} 
     */
    Private {
        get => this.get_Private()
    }

    /**
     * @type {VARIANT} 
     */
    Common {
        get => this.get_Common()
    }

    /**
     * @type {VARIANT} 
     */
    Modified {
        get => this.get_Modified()
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
     * @returns {ISClusProperty} 
     */
    get_Item(varIndex) {
        result := ComCall(10, this, "ptr", varIndex, "ptr*", &ppClusProperty := 0, "HRESULT")
        return ISClusProperty(ppClusProperty)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {VARIANT} varValue 
     * @returns {ISClusProperty} 
     */
    CreateItem(bstrName, varValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(11, this, "ptr", bstrName, "ptr", varValue, "ptr*", &pProperty := 0, "HRESULT")
        return ISClusProperty(pProperty)
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
     * @returns {VARIANT} 
     */
    SaveChanges() {
        pvarStatusCode := VARIANT()
        result := ComCall(13, this, "ptr", pvarStatusCode, "HRESULT")
        return pvarStatusCode
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ReadOnly() {
        pvarReadOnly := VARIANT()
        result := ComCall(14, this, "ptr", pvarReadOnly, "HRESULT")
        return pvarReadOnly
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Private() {
        pvarPrivate := VARIANT()
        result := ComCall(15, this, "ptr", pvarPrivate, "HRESULT")
        return pvarPrivate
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Common() {
        pvarCommon := VARIANT()
        result := ComCall(16, this, "ptr", pvarCommon, "HRESULT")
        return pvarCommon
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Modified() {
        pvarModified := VARIANT()
        result := ComCall(17, this, "ptr", pvarModified, "HRESULT")
        return pvarModified
    }
}
