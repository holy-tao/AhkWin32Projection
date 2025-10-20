#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISubscriptionItem extends IUnknown{
    /**
     * The interface identifier for ISubscriptionItem
     * @type {Guid}
     */
    static IID => Guid("{a97559f8-6c4a-11d1-a1e8-00c04fc2fbe1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pCookie 
     * @returns {HRESULT} 
     */
    GetCookie(pCookie) {
        result := ComCall(3, this, "ptr", pCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SUBSCRIPTIONITEMINFO>} pSubscriptionItemInfo 
     * @returns {HRESULT} 
     */
    GetSubscriptionItemInfo(pSubscriptionItemInfo) {
        result := ComCall(4, this, "ptr", pSubscriptionItemInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SUBSCRIPTIONITEMINFO>} pSubscriptionItemInfo 
     * @returns {HRESULT} 
     */
    SetSubscriptionItemInfo(pSubscriptionItemInfo) {
        result := ComCall(5, this, "ptr", pSubscriptionItemInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nCount 
     * @param {Pointer<PWSTR>} rgwszName 
     * @param {Pointer<VARIANT>} rgValue 
     * @returns {HRESULT} 
     */
    ReadProperties(nCount, rgwszName, rgValue) {
        result := ComCall(6, this, "uint", nCount, "ptr", rgwszName, "ptr", rgValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nCount 
     * @param {Pointer<PWSTR>} rgwszName 
     * @param {Pointer<VARIANT>} rgValue 
     * @returns {HRESULT} 
     */
    WriteProperties(nCount, rgwszName, rgValue) {
        result := ComCall(7, this, "uint", nCount, "ptr", rgwszName, "ptr", rgValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumItemProperties>} ppEnumItemProperties 
     * @returns {HRESULT} 
     */
    EnumProperties(ppEnumItemProperties) {
        result := ComCall(8, this, "ptr", ppEnumItemProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyChanged() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
