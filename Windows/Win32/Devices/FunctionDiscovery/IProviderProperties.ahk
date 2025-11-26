#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Is optionally implemented by discovery providers to directly create and manage their own property store.
 * @remarks
 * 
 * Implementing this interface enables a provider to provide access to the most current property values. Otherwise, the client uses the values in the cache created by Function Discovery when the function instance is created or the property store is opened.
 * 
 * If a provider does not implement this interface, then the provider must provide a property store
 * at the time the instance is created or when the client calls <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancepropertystoreopen">InstancePropertyStoreOpen</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nn-functiondiscoveryprovider-iproviderproperties
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IProviderProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProviderProperties
     * @type {Guid}
     */
    static IID => Guid("{cf986ea6-3b5f-4c5f-b88a-2f8b20ceef17}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "GetValue", "SetValue"]

    /**
     * Gets the number of properties in the property store.
     * @param {IFunctionInstance} pIFunctionInstance An <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface pointer.
     * @param {Pointer} iProviderInstanceContext The context associated with the specific function instance.
     * @returns {Integer} The number of properties in the property store.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderproperties-getcount
     */
    GetCount(pIFunctionInstance, iProviderInstanceContext) {
        result := ComCall(3, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Gets the property key at the specified index.
     * @param {IFunctionInstance} pIFunctionInstance A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface.
     * @param {Pointer} iProviderInstanceContext The context associated with the specific function instance.
     * @param {Integer} dwIndex The index of the property key.
     * @returns {PROPERTYKEY} The property key.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderproperties-getat
     */
    GetAt(pIFunctionInstance, iProviderInstanceContext, dwIndex) {
        pKey := PROPERTYKEY()
        result := ComCall(4, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "uint", dwIndex, "ptr", pKey, "HRESULT")
        return pKey
    }

    /**
     * Gets the value of the specified property key.
     * @param {IFunctionInstance} pIFunctionInstance An <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface pointer.
     * @param {Pointer} iProviderInstanceContext The context associated with the specific function instance.
     * @param {Pointer<PROPERTYKEY>} Key The property key reference.
     * @returns {PROPVARIANT} The value of the property key specified by <i>Key</i>. The <b>PROPVARIANT</b> type is VT_EMPTY if the key is not found in the property store.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderproperties-getvalue
     */
    GetValue(pIFunctionInstance, iProviderInstanceContext, Key) {
        ppropVar := PROPVARIANT()
        result := ComCall(5, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "ptr", Key, "ptr", ppropVar, "HRESULT")
        return ppropVar
    }

    /**
     * Sets the value of the specified property key.
     * @param {IFunctionInstance} pIFunctionInstance An <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface.
     * @param {Pointer} iProviderInstanceContext The context associated with the specific function instance.
     * @param {Pointer<PROPERTYKEY>} Key The property key for the property to be set.
     * @param {Pointer<PROPVARIANT>} ppropVar The property data. To remove the property from the store, specify a <b>PROPVARIANT</b> with the type VT_EMPTY.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pIFunctionInstance</i>, <i>pvProviderInstanceContext</i>, or <i>ppropVar</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderproperties-setvalue
     */
    SetValue(pIFunctionInstance, iProviderInstanceContext, Key, ppropVar) {
        result := ComCall(6, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "ptr", Key, "ptr", ppropVar, "HRESULT")
        return result
    }
}
