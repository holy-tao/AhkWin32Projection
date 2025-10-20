#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IFunctionInstance>} pIFunctionInstance 
     * @param {Pointer} iProviderInstanceContext 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    GetCount(pIFunctionInstance, iProviderInstanceContext, pdwCount) {
        result := ComCall(3, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFunctionInstance>} pIFunctionInstance 
     * @param {Pointer} iProviderInstanceContext 
     * @param {Integer} dwIndex 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @returns {HRESULT} 
     */
    GetAt(pIFunctionInstance, iProviderInstanceContext, dwIndex, pKey) {
        result := ComCall(4, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "uint", dwIndex, "ptr", pKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFunctionInstance>} pIFunctionInstance 
     * @param {Pointer} iProviderInstanceContext 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @param {Pointer<PROPVARIANT>} ppropVar 
     * @returns {HRESULT} 
     */
    GetValue(pIFunctionInstance, iProviderInstanceContext, Key, ppropVar) {
        result := ComCall(5, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "ptr", Key, "ptr", ppropVar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFunctionInstance>} pIFunctionInstance 
     * @param {Pointer} iProviderInstanceContext 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @param {Pointer<PROPVARIANT>} ppropVar 
     * @returns {HRESULT} 
     */
    SetValue(pIFunctionInstance, iProviderInstanceContext, Key, ppropVar) {
        result := ComCall(6, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "ptr", Key, "ptr", ppropVar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
