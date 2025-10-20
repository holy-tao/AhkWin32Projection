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
     * 
     * @param {Pointer<Byte>} pData 
     * @param {Integer} dwSize 
     * @param {Pointer<UInt32>} pfuReadyFlags 
     * @param {Pointer<Byte>} abMac 
     * @returns {HRESULT} 
     */
    TransferContainerData(pData, dwSize, pfuReadyFlags, abMac) {
        result := ComCall(3, this, "char*", pData, "uint", dwSize, "uint*", pfuReadyFlags, "char*", abMac, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pData 
     * @param {Pointer<UInt32>} pdwSize 
     * @param {Pointer<Byte>} abMac 
     * @returns {HRESULT} 
     */
    ObjectData(pData, pdwSize, abMac) {
        result := ComCall(4, this, "char*", pData, "uint*", pdwSize, "char*", abMac, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    TransferComplete() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
