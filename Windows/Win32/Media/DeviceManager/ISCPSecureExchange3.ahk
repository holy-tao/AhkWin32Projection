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
     * 
     * @param {Pointer<IMDSPDevice>} pDevice 
     * @param {Pointer<Byte>} pData 
     * @param {Integer} dwSize 
     * @param {Pointer<IWMDMProgress3>} pProgressCallback 
     * @param {Pointer<UInt32>} pfuReadyFlags 
     * @returns {HRESULT} 
     */
    TransferContainerDataOnClearChannel(pDevice, pData, dwSize, pProgressCallback, pfuReadyFlags) {
        result := ComCall(7, this, "ptr", pDevice, "char*", pData, "uint", dwSize, "ptr", pProgressCallback, "uint*", pfuReadyFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMDSPDevice>} pDevice 
     * @param {Pointer<Byte>} pData 
     * @param {Pointer<UInt32>} pdwSize 
     * @returns {HRESULT} 
     */
    GetObjectDataOnClearChannel(pDevice, pData, pdwSize) {
        result := ComCall(8, this, "ptr", pDevice, "char*", pData, "uint*", pdwSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMDSPDevice>} pDevice 
     * @returns {HRESULT} 
     */
    TransferCompleteForDevice(pDevice) {
        result := ComCall(9, this, "ptr", pDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
