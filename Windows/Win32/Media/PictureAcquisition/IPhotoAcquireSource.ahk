#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPhotoAcquireSettings.ahk" { IPhotoAcquireSettings }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IPhotoAcquireItem.ahk" { IPhotoAcquireItem }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IPhotoAcquireProgressCB.ahk" { IPhotoAcquireProgressCB }
#Import "..\..\UI\WindowsAndMessaging\HICON.ahk" { HICON }

/**
 * The IPhotoAcquireSource interface is used for acquisition of items from a device.
 * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nn-photoacquire-iphotoacquiresource
 * @namespace Windows.Win32.Media.PictureAcquisition
 */
export default struct IPhotoAcquireSource extends IUnknown {
    /**
     * The interface identifier for IPhotoAcquireSource
     * @type {Guid}
     */
    static IID := Guid("{00f2c703-8613-4282-a53b-6ec59c5883ac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPhotoAcquireSource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFriendlyName         : IntPtr
        GetDeviceIcons          : IntPtr
        InitializeItemList      : IntPtr
        GetItemCount            : IntPtr
        GetItemAt               : IntPtr
        GetPhotoAcquireSettings : IntPtr
        GetDeviceId             : IntPtr
        BindToObject            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPhotoAcquireSource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetFriendlyName method retrieves the name of the device, formatted for display.
     * @returns {BSTR} Pointer to a string containing the friendly name.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresource-getfriendlyname
     */
    GetFriendlyName() {
        pbstrFriendlyName := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pbstrFriendlyName, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresource-getdeviceicons
     */
    GetDeviceIcons(nSize, phLargeIcon, phSmallIcon) {
        result := ComCall(4, this, "uint", nSize, HICON.Ptr, phLargeIcon, HICON.Ptr, phSmallIcon, "HRESULT")
        return result
    }

    /**
     * The InitializeItemList method enumerates transferable items on the device and passes each item to the optional progress callback, if it is supplied.
     * @remarks
     * If <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquire-acquire">IPhotoAcquire::Acquire</a> is called without first calling <c>InitializeItemList</c>, initialization of the item list is done implicitly.
     * 
     * The first time the item list is initialized—either implicitly through <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquire-acquire">IPhotoAcquire::Acquire</a> or explicitly by calling <c>InitializeItemList</code>—each item is enumerated. During enumeration, if an <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iphotoacquireprogresscb">IPhotoAcquireProgressCB</a> object is passed to <code>InitializeItemList</c>, its implementation of <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-startenumeration">StartEnumeration</a>, <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-founditem">FoundItem</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-endenumeration">EndEnumeration</a> may be used to apply further filtering or control to the list of items to be transferred.
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
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresource-initializeitemlist
     */
    InitializeItemList(fForceEnumeration, pPhotoAcquireProgressCB, pnItemCount) {
        pnItemCountMarshal := pnItemCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, BOOL, fForceEnumeration, "ptr", pPhotoAcquireProgressCB, pnItemCountMarshal, pnItemCount, "HRESULT")
        return result
    }

    /**
     * The GetItemCount method retrieves the number of items found by the InitializeItemList method.
     * @remarks
     * Before calling this method, call <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquiresource-initializeitemlist">InitializeItemList</a> to initialize the item list.
     * @returns {Integer} Pointer to an integer value containing the item count.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresource-getitemcount
     */
    GetItemCount() {
        result := ComCall(6, this, "uint*", &pnItemCount := 0, "HRESULT")
        return pnItemCount
    }

    /**
     * The GetItemAt method retrieves the IPhotoAcquireItem object at the given index in the list of items.
     * @remarks
     * Before calling this method, call <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquiresource-initializeitemlist">InitializeItemList</a> to initialize the item list.
     * @param {Integer} nIndex Integer value containing the index.
     * @returns {IPhotoAcquireItem} Pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iphotoacquireitem">IPhotoAcquireItem</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresource-getitemat
     */
    GetItemAt(nIndex) {
        result := ComCall(7, this, "uint", nIndex, "ptr*", &ppPhotoAcquireItem := 0, "HRESULT")
        return IPhotoAcquireItem(ppPhotoAcquireItem)
    }

    /**
     * The GetPhotoAcquireSettings method obtains an IPhotoAcquireSettings object for working with acquisition settings.
     * @returns {IPhotoAcquireSettings} Pointer to the address of a photo acquire settings object.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresource-getphotoacquiresettings
     */
    GetPhotoAcquireSettings() {
        result := ComCall(8, this, "ptr*", &ppPhotoAcquireSettings := 0, "HRESULT")
        return IPhotoAcquireSettings(ppPhotoAcquireSettings)
    }

    /**
     * The GetDeviceId method retrieves the identifier (ID) of the device.
     * @returns {BSTR} Pointer to a string containing the device ID.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresource-getdeviceid
     */
    GetDeviceId() {
        pbstrDeviceId := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrDeviceId, "HRESULT")
        return pbstrDeviceId
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    BindToObject(riid) {
        result := ComCall(10, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IPhotoAcquireSource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFriendlyName := CallbackCreate(GetMethod(implObj, "GetFriendlyName"), flags, 2)
        this.vtbl.GetDeviceIcons := CallbackCreate(GetMethod(implObj, "GetDeviceIcons"), flags, 4)
        this.vtbl.InitializeItemList := CallbackCreate(GetMethod(implObj, "InitializeItemList"), flags, 4)
        this.vtbl.GetItemCount := CallbackCreate(GetMethod(implObj, "GetItemCount"), flags, 2)
        this.vtbl.GetItemAt := CallbackCreate(GetMethod(implObj, "GetItemAt"), flags, 3)
        this.vtbl.GetPhotoAcquireSettings := CallbackCreate(GetMethod(implObj, "GetPhotoAcquireSettings"), flags, 2)
        this.vtbl.GetDeviceId := CallbackCreate(GetMethod(implObj, "GetDeviceId"), flags, 2)
        this.vtbl.BindToObject := CallbackCreate(GetMethod(implObj, "BindToObject"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFriendlyName)
        CallbackFree(this.vtbl.GetDeviceIcons)
        CallbackFree(this.vtbl.InitializeItemList)
        CallbackFree(this.vtbl.GetItemCount)
        CallbackFree(this.vtbl.GetItemAt)
        CallbackFree(this.vtbl.GetPhotoAcquireSettings)
        CallbackFree(this.vtbl.GetDeviceId)
        CallbackFree(this.vtbl.BindToObject)
    }
}
