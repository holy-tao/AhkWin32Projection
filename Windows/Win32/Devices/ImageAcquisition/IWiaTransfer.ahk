#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiatransfer
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaTransfer extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Download", "Upload", "Cancel", "EnumWIA_FORMAT_INFO"]

    /**
     * 
     * @param {Integer} lFlags 
     * @param {IWiaTransferCallback} pIWiaTransferCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiatransfer-download
     */
    Download(lFlags, pIWiaTransferCallback) {
        result := ComCall(3, this, "int", lFlags, "ptr", pIWiaTransferCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {IStream} pSource 
     * @param {IWiaTransferCallback} pIWiaTransferCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiatransfer-upload
     */
    Upload(lFlags, pSource, pIWiaTransferCallback) {
        result := ComCall(4, this, "int", lFlags, "ptr", pSource, "ptr", pIWiaTransferCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiatransfer-cancel
     */
    Cancel() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumWIA_FORMAT_INFO>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiatransfer-enumwia-format-info
     */
    EnumWIA_FORMAT_INFO(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
