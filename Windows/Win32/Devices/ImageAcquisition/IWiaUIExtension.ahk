#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\UI\WindowsAndMessaging\HICON.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiauiextension
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaUIExtension extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaUIExtension
     * @type {Guid}
     */
    static IID => Guid("{da319113-50ee-4c80-b460-57d005d44a2c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeviceDialog", "GetDeviceIcon", "GetDeviceBitmapLogo"]

    /**
     * 
     * @param {Pointer<DEVICEDIALOGDATA>} pDeviceDialogData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiauiextension-devicedialog
     */
    DeviceDialog(pDeviceDialogData) {
        result := ComCall(3, this, "ptr", pDeviceDialogData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDeviceId 
     * @param {Integer} nSize 
     * @returns {HICON} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiauiextension-getdeviceicon
     */
    GetDeviceIcon(bstrDeviceId, nSize) {
        bstrDeviceId := bstrDeviceId is String ? BSTR.Alloc(bstrDeviceId).Value : bstrDeviceId

        phIcon := HICON()
        result := ComCall(4, this, "ptr", bstrDeviceId, "ptr", phIcon, "uint", nSize, "HRESULT")
        return phIcon
    }

    /**
     * 
     * @param {BSTR} bstrDeviceId 
     * @param {Integer} nMaxWidth 
     * @param {Integer} nMaxHeight 
     * @returns {HBITMAP} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiauiextension-getdevicebitmaplogo
     */
    GetDeviceBitmapLogo(bstrDeviceId, nMaxWidth, nMaxHeight) {
        bstrDeviceId := bstrDeviceId is String ? BSTR.Alloc(bstrDeviceId).Value : bstrDeviceId

        phBitmap := HBITMAP()
        result := ComCall(5, this, "ptr", bstrDeviceId, "ptr", phBitmap, "uint", nMaxWidth, "uint", nMaxHeight, "HRESULT")
        return phBitmap
    }
}
