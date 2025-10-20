#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISCPSecureExchange.ahk

/**
 * The ISCPSecureExchange2 interface extends ISCPSecureExchange by providing a new version of the TransferContainerData method.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iscpsecureexchange2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class ISCPSecureExchange2 extends ISCPSecureExchange{
    /**
     * The interface identifier for ISCPSecureExchange2
     * @type {Guid}
     */
    static IID => Guid("{6c62fc7b-2690-483f-9d44-0a20cb35577c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Pointer<Byte>} pData 
     * @param {Integer} dwSize 
     * @param {Pointer<IWMDMProgress3>} pProgressCallback 
     * @param {Pointer<UInt32>} pfuReadyFlags 
     * @param {Pointer<Byte>} abMac 
     * @returns {HRESULT} 
     */
    TransferContainerData2(pData, dwSize, pProgressCallback, pfuReadyFlags, abMac) {
        result := ComCall(6, this, "char*", pData, "uint", dwSize, "ptr", pProgressCallback, "uint*", pfuReadyFlags, "char*", abMac, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
