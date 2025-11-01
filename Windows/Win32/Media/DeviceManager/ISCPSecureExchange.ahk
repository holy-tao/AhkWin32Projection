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
     * @param {Pointer<Integer>} pfuReadyFlags 
     * @param {Pointer<Integer>} abMac 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecureexchange-transfercontainerdata
     */
    TransferContainerData(pData, dwSize, pfuReadyFlags, abMac) {
        result := ComCall(3, this, "char*", pData, "uint", dwSize, "uint*", pfuReadyFlags, "char*", abMac, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pData 
     * @param {Pointer<Integer>} pdwSize 
     * @param {Pointer<Integer>} abMac 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecureexchange-objectdata
     */
    ObjectData(pData, pdwSize, abMac) {
        result := ComCall(4, this, "char*", pData, "uint*", pdwSize, "char*", abMac, "HRESULT")
        return result
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
