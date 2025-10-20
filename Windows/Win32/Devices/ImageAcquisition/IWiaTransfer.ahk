#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaTransfer extends IUnknown{
    /**
     * The interface identifier for IWiaTransfer
     * @type {Guid}
     */
    static IID => Guid("{c39d6942-2f4e-4d04-92fe-4ef4d3a1de5a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IWiaTransferCallback>} pIWiaTransferCallback 
     * @returns {HRESULT} 
     */
    Download(lFlags, pIWiaTransferCallback) {
        result := ComCall(3, this, "int", lFlags, "ptr", pIWiaTransferCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IStream>} pSource 
     * @param {Pointer<IWiaTransferCallback>} pIWiaTransferCallback 
     * @returns {HRESULT} 
     */
    Upload(lFlags, pSource, pIWiaTransferCallback) {
        result := ComCall(4, this, "int", lFlags, "ptr", pSource, "ptr", pIWiaTransferCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumWIA_FORMAT_INFO>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumWIA_FORMAT_INFO(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
