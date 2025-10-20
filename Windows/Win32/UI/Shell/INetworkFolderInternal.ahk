#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INetworkFolderInternal extends IUnknown{
    /**
     * The interface identifier for INetworkFolderInternal
     * @type {Guid}
     */
    static IID => Guid("{ceb38218-c971-47bb-a703-f0bc99ccdb81}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} displayType 
     * @returns {HRESULT} 
     */
    GetResourceDisplayType(displayType) {
        result := ComCall(3, this, "uint*", displayType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} idList 
     * @returns {HRESULT} 
     */
    GetIDList(idList) {
        result := ComCall(4, this, "ptr", idList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} itemIdCount 
     * @param {Pointer<ITEMIDLIST>} itemIds 
     * @param {Integer} providerMaxLength 
     * @param {PWSTR} provider 
     * @returns {HRESULT} 
     */
    GetProvider(itemIdCount, itemIds, providerMaxLength, provider) {
        provider := provider is String ? StrPtr(provider) : provider

        result := ComCall(5, this, "uint", itemIdCount, "ptr", itemIds, "uint", providerMaxLength, "ptr", provider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
