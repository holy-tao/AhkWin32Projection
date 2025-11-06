#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INetworkFolderInternal extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResourceDisplayType", "GetIDList", "GetProvider"]

    /**
     * 
     * @returns {Integer} 
     */
    GetResourceDisplayType() {
        result := ComCall(3, this, "uint*", &displayType := 0, "HRESULT")
        return displayType
    }

    /**
     * 
     * @returns {Pointer<ITEMIDLIST>} 
     */
    GetIDList() {
        result := ComCall(4, this, "ptr*", &idList := 0, "HRESULT")
        return idList
    }

    /**
     * 
     * @param {Integer} itemIdCount 
     * @param {Pointer<Pointer<ITEMIDLIST>>} itemIds 
     * @param {Integer} providerMaxLength 
     * @param {PWSTR} provider 
     * @returns {HRESULT} 
     */
    GetProvider(itemIdCount, itemIds, providerMaxLength, provider) {
        provider := provider is String ? StrPtr(provider) : provider

        itemIdsMarshal := itemIds is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", itemIdCount, itemIdsMarshal, itemIds, "uint", providerMaxLength, "ptr", provider, "HRESULT")
        return result
    }
}
