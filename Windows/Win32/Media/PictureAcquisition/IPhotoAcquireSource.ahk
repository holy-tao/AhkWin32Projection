#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPhotoAcquireItem.ahk
#Include .\IPhotoAcquireSettings.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPhotoAcquireSource interface is used for acquisition of items from a device.
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nn-photoacquire-iphotoacquiresource
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class IPhotoAcquireSource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoAcquireSource
     * @type {Guid}
     */
    static IID => Guid("{00f2c703-8613-4282-a53b-6ec59c5883ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFriendlyName", "GetDeviceIcons", "InitializeItemList", "GetItemCount", "GetItemAt", "GetPhotoAcquireSettings", "GetDeviceId", "BindToObject"]

    /**
     * The GetFriendlyName method retrieves the name of the device, formatted for display.
     * @returns {BSTR} Pointer to a string containing the friendly name.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresource-getfriendlyname
     */
    GetFriendlyName() {
        pbstrFriendlyName := BSTR()
        result := ComCall(3, this, "ptr", pbstrFriendlyName, "HRESULT")
        return pbstrFriendlyName
    }

    /**
     * The GetDeviceIcons method retrieves the icons that are used to represent the device.
     * @param {Integer} nSize Integer value containing the size of the icon to retrieve.
     * @param {Pointer<HICON>} phLargeIcon Specifies the large icon used for the device.
     * @param {Pointer<HICON>} phSmallIcon Specifies the small icon used for the device.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A null pointer was passed where non-null was expected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresource-getdeviceicons
     */
    GetDeviceIcons(nSize, phLargeIcon, phSmallIcon) {
        result := ComCall(4, this, "uint", nSize, "ptr", phLargeIcon, "ptr", phSmallIcon, "HRESULT")
        return result
    }

    /**
     * The InitializeItemList method enumerates transferable items on the device and passes each item to the optional progress callback, if it is supplied.
     * @param {BOOL} fForceEnumeration Flag that, if set to <b>TRUE</b>, indicates that enumeration will be repeated even if the item list has already been initialized. If set to <b>FALSE</b>, this flag indicates that repeated calls to <c>InitializeItemList</c> after the item list has already been initialized will not enumerate items again.
     * @param {IPhotoAcquireProgressCB} pPhotoAcquireProgressCB Optional. Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iphotoacquireprogresscb">IPhotoAcquireProgressCB</a> object.
     * @param {Pointer<Integer>} pnItemCount Returns the number of items found.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Non-<b>NULL</b> pointer was expected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresource-initializeitemlist
     */
    InitializeItemList(fForceEnumeration, pPhotoAcquireProgressCB, pnItemCount) {
        pnItemCountMarshal := pnItemCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "int", fForceEnumeration, "ptr", pPhotoAcquireProgressCB, pnItemCountMarshal, pnItemCount, "HRESULT")
        return result
    }

    /**
     * The GetItemCount method retrieves the number of items found by the InitializeItemList method.
     * @returns {Integer} Pointer to an integer value containing the item count.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresource-getitemcount
     */
    GetItemCount() {
        result := ComCall(6, this, "uint*", &pnItemCount := 0, "HRESULT")
        return pnItemCount
    }

    /**
     * The GetItemAt method retrieves the IPhotoAcquireItem object at the given index in the list of items.
     * @param {Integer} nIndex Integer value containing the index.
     * @returns {IPhotoAcquireItem} Pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iphotoacquireitem">IPhotoAcquireItem</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresource-getitemat
     */
    GetItemAt(nIndex) {
        result := ComCall(7, this, "uint", nIndex, "ptr*", &ppPhotoAcquireItem := 0, "HRESULT")
        return IPhotoAcquireItem(ppPhotoAcquireItem)
    }

    /**
     * The GetPhotoAcquireSettings method obtains an IPhotoAcquireSettings object for working with acquisition settings.
     * @returns {IPhotoAcquireSettings} Pointer to the address of a photo acquire settings object.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresource-getphotoacquiresettings
     */
    GetPhotoAcquireSettings() {
        result := ComCall(8, this, "ptr*", &ppPhotoAcquireSettings := 0, "HRESULT")
        return IPhotoAcquireSettings(ppPhotoAcquireSettings)
    }

    /**
     * The GetDeviceId method retrieves the identifier (ID) of the device.
     * @returns {BSTR} Pointer to a string containing the device ID.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresource-getdeviceid
     */
    GetDeviceId() {
        pbstrDeviceId := BSTR()
        result := ComCall(9, this, "ptr", pbstrDeviceId, "HRESULT")
        return pbstrDeviceId
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    BindToObject(riid) {
        result := ComCall(10, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
