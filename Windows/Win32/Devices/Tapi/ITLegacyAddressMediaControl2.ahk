#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITLegacyAddressMediaControl.ahk

/**
 * The ITLegacyAddressMediaControl2 interface derives from the ITLegacyAddressMediaControl interface. ITLegacyAddressMediaControl2 provides additional methods that allow the configuration of parameters related to line devices.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itlegacyaddressmediacontrol2
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITLegacyAddressMediaControl2 extends ITLegacyAddressMediaControl{
    /**
     * The interface identifier for ITLegacyAddressMediaControl2
     * @type {Guid}
     */
    static IID => Guid("{b0ee512b-a531-409e-9dd9-4099fe86c738}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {HWND} hwndOwner 
     * @param {BSTR} pDeviceClass 
     * @returns {HRESULT} 
     */
    ConfigDialog(hwndOwner, pDeviceClass) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        result := ComCall(6, this, "ptr", hwndOwner, "ptr", pDeviceClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndOwner 
     * @param {BSTR} pDeviceClass 
     * @param {Integer} dwSizeIn 
     * @param {Pointer<Byte>} pDeviceConfigIn 
     * @param {Pointer<UInt32>} pdwSizeOut 
     * @param {Pointer<Byte>} ppDeviceConfigOut 
     * @returns {HRESULT} 
     */
    ConfigDialogEdit(hwndOwner, pDeviceClass, dwSizeIn, pDeviceConfigIn, pdwSizeOut, ppDeviceConfigOut) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        result := ComCall(7, this, "ptr", hwndOwner, "ptr", pDeviceClass, "uint", dwSizeIn, "char*", pDeviceConfigIn, "uint*", pdwSizeOut, "char*", ppDeviceConfigOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
