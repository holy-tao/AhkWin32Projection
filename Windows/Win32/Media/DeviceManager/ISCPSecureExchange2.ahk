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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TransferContainerData2"]

    /**
     * 
     * @param {Pointer<Integer>} pData 
     * @param {Integer} dwSize 
     * @param {IWMDMProgress3} pProgressCallback 
     * @param {Pointer<Integer>} pfuReadyFlags 
     * @param {Pointer<Integer>} abMac 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecureexchange2-transfercontainerdata2
     */
    TransferContainerData2(pData, dwSize, pProgressCallback, pfuReadyFlags, abMac) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pfuReadyFlagsMarshal := pfuReadyFlags is VarRef ? "uint*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, pDataMarshal, pData, "uint", dwSize, "ptr", pProgressCallback, pfuReadyFlagsMarshal, pfuReadyFlags, abMacMarshal, abMac, "HRESULT")
        return result
    }
}
