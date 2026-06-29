#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\UI\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DEVICEDIALOGDATA2.ahk" { DEVICEDIALOGDATA2 }

/**
 * The IWiaUIExtension2 interface provides methods that replace the default, system-supplied user interface with a custom user interface, and that provide a custom device icon.
 * @remarks
 * The **IWiaUIExtension2** interface inherits from the [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface. **IWiaUIExtension2** also has these types of members:
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
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiauiextension2
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct IWiaUIExtension2 extends IUnknown {
    /**
     * The interface identifier for IWiaUIExtension2
     * @type {Guid}
     */
    static IID := Guid("{305600d7-5088-46d7-9a15-b77b09cdba7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWiaUIExtension2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DeviceDialog  : IntPtr
        GetDeviceIcon : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWiaUIExtension2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IWiaUIExtension2::DeviceDialog method - Provides a custom user interface that replaces the default system user interface.
     * @remarks
     * If you implement the [**IWiaUIExtension2**](-wia-iwiauiextension2.md) interface and do not want to replace the system user interface, this method must still be implemented, but it should do nothing more than return E\_NOTIMPL.
     * @param {Pointer<DEVICEDIALOGDATA2>} pDeviceDialogData Type: **PDEVICEDIALOGDATA2\***
     * 
     * Points to a [**DEVICEDIALOGDATA2**](-wia-devicedialogdata2.md) structure that contains all of the data needed to implement the device dialog.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If the method succeeds, it returns S\_OK. If the user cancels the dialog, the method returns S\_FALSE. If the method fails, it returns an appropriate error code. The following table shows some of the possible return status codes.
     * 
     * 
     * 
     * | Error code    | Description                              |
     * |---------------|------------------------------------------|
     * | E\_INVALIDARG | Parameter pDeviceDialogData is **NULL**. |
     * | E\_NOTIMPL    | The method is not implemented.           |
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiauiextension2-devicedialog
     */
    DeviceDialog(pDeviceDialogData) {
        result := ComCall(3, this, DEVICEDIALOGDATA2.Ptr, pDeviceDialogData, "HRESULT")
        return result
    }

    /**
     * IWiaUIExtension2::GetDeviceIcon method - Gets a custom device icon.
     * @param {BSTR} bstrDeviceId Type: **BSTR**
     * 
     * Specifies the device ID of the WIA device for which the icon is to be obtained.
     * @param {Integer} nSize Type: **ULONG**
     * 
     * Specifies the desired icon size, in pixels. The icon is assumed to be square, and nSize specifies both the width and height of the requested icon.
     * @returns {HICON} Type: **HICON\***
     * 
     * Points to a memory location that will receive a handle for the icon for the device.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiauiextension2-getdeviceicon
     */
    GetDeviceIcon(bstrDeviceId, nSize) {
        bstrDeviceId := bstrDeviceId is String ? BSTR.Alloc(bstrDeviceId).Value : bstrDeviceId

        phIcon := HICON.Owned()
        result := ComCall(4, this, BSTR, bstrDeviceId, HICON.Ptr, phIcon, "uint", nSize, "HRESULT")
        return phIcon
    }

    Query(iid) {
        if (IWiaUIExtension2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DeviceDialog := CallbackCreate(GetMethod(implObj, "DeviceDialog"), flags, 2)
        this.vtbl.GetDeviceIcon := CallbackCreate(GetMethod(implObj, "GetDeviceIcon"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DeviceDialog)
        CallbackFree(this.vtbl.GetDeviceIcon)
    }
}
