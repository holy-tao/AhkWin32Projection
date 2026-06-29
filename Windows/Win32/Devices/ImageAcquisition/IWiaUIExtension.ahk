#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\UI\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DEVICEDIALOGDATA.ahk" { DEVICEDIALOGDATA }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

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
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiauiextension
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct IWiaUIExtension extends IUnknown {
    /**
     * The interface identifier for IWiaUIExtension
     * @type {Guid}
     */
    static IID := Guid("{da319113-50ee-4c80-b460-57d005d44a2c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWiaUIExtension interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DeviceDialog        : IntPtr
        GetDeviceIcon       : IntPtr
        GetDeviceBitmapLogo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWiaUIExtension.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiauiextension-devicedialog
     */
    DeviceDialog(pDeviceDialogData) {
        result := ComCall(3, this, DEVICEDIALOGDATA.Ptr, pDeviceDialogData, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiauiextension-getdeviceicon
     */
    GetDeviceIcon(bstrDeviceId, nSize) {
        bstrDeviceId := bstrDeviceId is String ? BSTR.Alloc(bstrDeviceId).Value : bstrDeviceId

        phIcon := HICON.Owned()
        result := ComCall(4, this, BSTR, bstrDeviceId, HICON.Ptr, phIcon, "uint", nSize, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiauiextension-getdevicebitmaplogo
     */
    GetDeviceBitmapLogo(bstrDeviceId, nMaxWidth, nMaxHeight) {
        bstrDeviceId := bstrDeviceId is String ? BSTR.Alloc(bstrDeviceId).Value : bstrDeviceId

        phBitmap := HBITMAP.Owned()
        result := ComCall(5, this, BSTR, bstrDeviceId, HBITMAP.Ptr, phBitmap, "uint", nMaxWidth, "uint", nMaxHeight, "HRESULT")
        return phBitmap
    }

    Query(iid) {
        if (IWiaUIExtension.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DeviceDialog := CallbackCreate(GetMethod(implObj, "DeviceDialog"), flags, 2)
        this.vtbl.GetDeviceIcon := CallbackCreate(GetMethod(implObj, "GetDeviceIcon"), flags, 4)
        this.vtbl.GetDeviceBitmapLogo := CallbackCreate(GetMethod(implObj, "GetDeviceBitmapLogo"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DeviceDialog)
        CallbackFree(this.vtbl.GetDeviceIcon)
        CallbackFree(this.vtbl.GetDeviceBitmapLogo)
    }
}
