#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaUIExtension2 extends IUnknown{
    /**
     * The interface identifier for IWiaUIExtension2
     * @type {Guid}
     */
    static IID => Guid("{305600d7-5088-46d7-9a15-b77b09cdba7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<DEVICEDIALOGDATA2>} pDeviceDialogData 
     * @returns {HRESULT} 
     */
    DeviceDialog(pDeviceDialogData) {
        result := ComCall(3, this, "ptr", pDeviceDialogData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDeviceId 
     * @param {Pointer<HICON>} phIcon 
     * @param {Integer} nSize 
     * @returns {HRESULT} 
     */
    GetDeviceIcon(bstrDeviceId, phIcon, nSize) {
        bstrDeviceId := bstrDeviceId is String ? BSTR.Alloc(bstrDeviceId).Value : bstrDeviceId

        result := ComCall(4, this, "ptr", bstrDeviceId, "ptr", phIcon, "uint", nSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
