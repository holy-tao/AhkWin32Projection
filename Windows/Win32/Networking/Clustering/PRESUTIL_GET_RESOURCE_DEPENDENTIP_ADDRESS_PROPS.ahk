#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PRESUTIL_GET_RESOURCE_DEPENDENTIP_ADDRESS_PROPS extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HRESOURCE} hResource_ 
     * @param {PWSTR} pszAddress 
     * @param {Pointer<Integer>} pcchAddress 
     * @param {PWSTR} pszSubnetMask 
     * @param {Pointer<Integer>} pcchSubnetMask 
     * @param {PWSTR} pszNetwork 
     * @param {Pointer<Integer>} pcchNetwork 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hResource_, pszAddress, pcchAddress, pszSubnetMask, pcchSubnetMask, pszNetwork, pcchNetwork) {
        hResource_ := hResource_ is Win32Handle ? NumGet(hResource_, "ptr") : hResource_
        pszAddress := pszAddress is String ? StrPtr(pszAddress) : pszAddress
        pszSubnetMask := pszSubnetMask is String ? StrPtr(pszSubnetMask) : pszSubnetMask
        pszNetwork := pszNetwork is String ? StrPtr(pszNetwork) : pszNetwork

        pcchAddressMarshal := pcchAddress is VarRef ? "uint*" : "ptr"
        pcchSubnetMaskMarshal := pcchSubnetMask is VarRef ? "uint*" : "ptr"
        pcchNetworkMarshal := pcchNetwork is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hResource_, "ptr", pszAddress, pcchAddressMarshal, pcchAddress, "ptr", pszSubnetMask, pcchSubnetMaskMarshal, pcchSubnetMask, "ptr", pszNetwork, pcchNetworkMarshal, pcchNetwork, "uint")
        return result
    }
}
