#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISCPSecureExchange2.ahk

/**
 * The ISCPSecureExchange3 interface extends ISCPSecureExchange2 by providing improved data exchange performance, and a transfer-complete callback method.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iscpsecureexchange3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class ISCPSecureExchange3 extends ISCPSecureExchange2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISCPSecureExchange3
     * @type {Guid}
     */
    static IID => Guid("{ab4e77e4-8908-4b17-bd2a-b1dbe6dd69e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TransferContainerDataOnClearChannel", "GetObjectDataOnClearChannel", "TransferCompleteForDevice"]

    /**
     * 
     * @param {IMDSPDevice} pDevice 
     * @param {Pointer<Integer>} pData 
     * @param {Integer} dwSize 
     * @param {IWMDMProgress3} pProgressCallback 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecureexchange3-transfercontainerdataonclearchannel
     */
    TransferContainerDataOnClearChannel(pDevice, pData, dwSize, pProgressCallback) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "ptr", pDevice, pDataMarshal, pData, "uint", dwSize, "ptr", pProgressCallback, "uint*", &pfuReadyFlags := 0, "HRESULT")
        return pfuReadyFlags
    }

    /**
     * 
     * @param {IMDSPDevice} pDevice 
     * @param {Pointer<Integer>} pdwSize 
     * @returns {Integer} 
     */
    GetObjectDataOnClearChannel(pDevice, pdwSize) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pDevice, "char*", &pData := 0, pdwSizeMarshal, pdwSize, "HRESULT")
        return pData
    }

    /**
     * 
     * @param {IMDSPDevice} pDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecureexchange3-transfercompletefordevice
     */
    TransferCompleteForDevice(pDevice) {
        result := ComCall(9, this, "ptr", pDevice, "HRESULT")
        return result
    }
}
