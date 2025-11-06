#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ISCPSecureExchange interface is used to exchange secured content and rights associated with content. The secure content provider implements this interface and secure Windows Media Device Manager implementations call its methods.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iscpsecureexchange
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class ISCPSecureExchange extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISCPSecureExchange
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a0e-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TransferContainerData", "ObjectData", "TransferComplete"]

    /**
     * 
     * @param {Pointer<Integer>} pData 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} abMac 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecureexchange-transfercontainerdata
     */
    TransferContainerData(pData, dwSize, abMac) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pDataMarshal, pData, "uint", dwSize, "uint*", &pfuReadyFlags := 0, abMacMarshal, abMac, "HRESULT")
        return pfuReadyFlags
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwSize 
     * @param {Pointer<Integer>} abMac 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecureexchange-objectdata
     */
    ObjectData(pdwSize, abMac) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "char*", &pData := 0, pdwSizeMarshal, pdwSize, abMacMarshal, abMac, "HRESULT")
        return pData
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecureexchange-transfercomplete
     */
    TransferComplete() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
