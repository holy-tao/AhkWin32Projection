#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\UI\WindowsAndMessaging\HICON.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWiaUIExtension interface provides methods that replace the default system user interface, provide a custom device bitmap logo, and provide a custom device icon.
 * @remarks
 * The **IWiaUIExtension** interface inherits from the [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface. **IWiaUIExtension** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * 
 * 
 * | IUnknown Methods                                        | Description                               |
 * |---------------------------------------------------------|-------------------------------------------|
 * | [IUnknown::QueryInterface](/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)) | Returns pointers to supported interfaces. |
 * | [IUnknown::AddRef](/windows/win32/api/unknwn/nf-unknwn-iunknown-addref)                 | Increments reference count.               |
 * | [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release)               | Decrements reference count.               |
 * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-iwiauiextension
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
     * IWiaUIExtension::DeviceDialog method - Provides a custom user interface that replaces the default system user interface.
     * @remarks
     * If you implement the [**IWiaUIExtension**](-wia-iwiauiextension.md) interface and do not want to replace the system user interface, this method must still be implemented, but it should do nothing more than return E\_NOTIMPL.
     * @param {Pointer<DEVICEDIALOGDATA>} pDeviceDialogData Type: **PDEVICEDIALOGDATA\***
     * 
     * Points to a [**DEVICEDIALOGDATA**](-wia-devicedialogdata.md) structure that contains all of the data needed to implement the device dialog.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If the method succeeds, it returns S\_OK. If the user cancels the dialog, the method returns S\_FALSE. If the method is not implemented, it returns E\_NOTIMPL. If the method fails, it returns a standard COM error code.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-iwiauiextension-devicedialog
     */
    DeviceDialog(pDeviceDialogData) {
        result := ComCall(3, this, "ptr", pDeviceDialogData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * IWiaUIExtension::GetDeviceIcon method - Gets a custom device icon.
     * @param {BSTR} bstrDeviceId Type: **BSTR**
     * 
     * Specifies the device ID of the WIA device for which the icon is to be obtained.
     * @param {Integer} nSize Type: **ULONG**
     * 
     * Specifies the desired icon size, in pixels. The icon is assumed to be square, and nSize specifies both the width and height of the requested icon.
     * @returns {HICON} Type: **HICON\***
     * 
     * Points to a memory location that will receive a handle for the icon for the device.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-iwiauiextension-getdeviceicon
     */
    GetDeviceIcon(bstrDeviceId, nSize) {
        if(bstrDeviceId is String) {
            pin := BSTR.Alloc(bstrDeviceId)
            bstrDeviceId := pin.Value
        }

        phIcon := HICON()
        result := ComCall(4, this, "ptr", bstrDeviceId, "ptr", phIcon, "uint", nSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phIcon
    }

    /**
     * Gets a custom bitmap logo for the device.
     * @param {BSTR} bstrDeviceId Type: **BSTR**
     * 
     * Specifies the device ID of the WIA device for which the icon is to be obtained.
     * @param {Integer} nMaxWidth Type: **ULONG**
     * 
     * Specifies the desired width of the bitmap.
     * @param {Integer} nMaxHeight Type: **ULONG**
     * 
     * Specifies the desired height of the bitmap.
     * @returns {HBITMAP} Type: **HBITMAP\***
     * 
     * Points to a memory location that will receive a handle for the bitmap logo for the device.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-iwiauiextension-getdevicebitmaplogo
     */
    GetDeviceBitmapLogo(bstrDeviceId, nMaxWidth, nMaxHeight) {
        if(bstrDeviceId is String) {
            pin := BSTR.Alloc(bstrDeviceId)
            bstrDeviceId := pin.Value
        }

        phBitmap := HBITMAP()
        result := ComCall(5, this, "ptr", bstrDeviceId, "ptr", phBitmap, "uint", nMaxWidth, "uint", nMaxHeight, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phBitmap
    }
}
