#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * The IPhotoAcquireItem interface provides methods for working with items as they are acquired from a device.
 * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nn-photoacquire-iphotoacquireitem
 * @namespace Windows.Win32.Media.PictureAcquisition
 */
export default struct IPhotoAcquireItem extends IUnknown {
    /**
     * The interface identifier for IPhotoAcquireItem
     * @type {Guid}
     */
    static IID := Guid("{00f21c97-28bf-4c02-b842-5e4e90139a30}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPhotoAcquireItem interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetItemName     : IntPtr
        GetThumbnail    : IntPtr
        GetProperty     : IntPtr
        SetProperty     : IntPtr
        GetStream       : IntPtr
        CanDelete       : IntPtr
        Delete          : IntPtr
        GetSubItemCount : IntPtr
        GetSubItemAt    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPhotoAcquireItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetItemName method retrieves the file name for an item.
     * @remarks
     * The file name consists of the display name and the extension, even if the <b>Hide extensions for known file types</b> setting is checked in the Windows <b>Folder Options</b> dialog box.
     * @returns {BSTR} Pointer to a string containing the name of the item.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireitem-getitemname
     */
    GetItemName() {
        pbstrItemName := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pbstrItemName, "HRESULT")
        return pbstrItemName
    }

    /**
     * The GetThumbnail method retrieves the thumbnail provided for an item.
     * @param {SIZE} sizeThumbnail Specifies the size of the thumbnail.
     * @returns {HBITMAP} Specifies a handle to the thumbnail bitmap.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireitem-getthumbnail
     */
    GetThumbnail(sizeThumbnail) {
        phbmpThumbnail := HBITMAP.Owned()
        result := ComCall(4, this, SIZE, sizeThumbnail, HBITMAP.Ptr, phbmpThumbnail, "HRESULT")
        return phbmpThumbnail
    }

    /**
     * The GetProperty method retrieves the value of a property of an item.
     * @remarks
     * For an item that is a shell object, this method will defer to the <b>IPropertyStore</b> object provided by the item if the property hasn't been set or updated using <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireitem-setproperty">SetProperty</a>.
     * @param {Pointer<PROPERTYKEY>} key Specifies a key for the property.
     * @returns {PROPVARIANT} Pointer to a property variant containing the property value.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireitem-getproperty
     */
    GetProperty(key) {
        pv := PROPVARIANT()
        result := ComCall(5, this, PROPERTYKEY.Ptr, key, PROPVARIANT.Ptr, pv, "HRESULT")
        return pv
    }

    /**
     * The SetProperty method sets a property for an item.
     * @remarks
     * The property is stored in memory, but is not written to the file.
     * @param {Pointer<PROPERTYKEY>} key Specifies a key for the property to set.
     * @param {Pointer<PROPVARIANT>} pv Pointer to a property variant containing the value to set the property to.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireitem-setproperty
     */
    SetProperty(key, pv) {
        result := ComCall(6, this, PROPERTYKEY.Ptr, key, PROPVARIANT.Ptr, pv, "HRESULT")
        return result
    }

    /**
     * The GetStream method retrieves a read-only stream containing the contents of an item.
     * @returns {IStream} Returns a stream object with the file contents.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireitem-getstream
     */
    GetStream() {
        result := ComCall(7, this, "ptr*", &ppStream := 0, "HRESULT")
        return IStream(ppStream)
    }

    /**
     * The CanDelete method indicates whether an item may be deleted.
     * @returns {BOOL} Pointer to a flag that, when set to <b>TRUE</b>, indicates that the item can be deleted.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireitem-candelete
     */
    CanDelete() {
        result := ComCall(8, this, BOOL.Ptr, &pfCanDelete := 0, "HRESULT")
        return pfCanDelete
    }

    /**
     * The Delete method deletes an item.
     * @remarks
     * To determine whether an item may be deleted, call <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireitem-candelete">CanDelete</a> first.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireitem-delete
     */
    Delete() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The GetSubItemCount method retrieves the number of subitems contained in an item.
     * @remarks
     * If an error occurs, <i>pnCount</i> will be set to <b>NULL</b>.
     * @returns {Integer} Pointer to an integer containing the count of subitems.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireitem-getsubitemcount
     */
    GetSubItemCount() {
        result := ComCall(10, this, "uint*", &pnCount := 0, "HRESULT")
        return pnCount
    }

    /**
     * The GetSubItemAt method retrieves a subitem of an item, given the index of the subitem.
     * @remarks
     * If no item is found at the given index, <i>ppPhotoAcquireItem</i> is set to <b>NULL</b>.
     * @param {Integer} nItemIndex Integer containing the index of the item.
     * @returns {IPhotoAcquireItem} Returns the <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iphotoacquireitem">IPhotoAcquireItem</a> object at the given index.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireitem-getsubitemat
     */
    GetSubItemAt(nItemIndex) {
        result := ComCall(11, this, "uint", nItemIndex, "ptr*", &ppPhotoAcquireItem := 0, "HRESULT")
        return IPhotoAcquireItem(ppPhotoAcquireItem)
    }

    Query(iid) {
        if (IPhotoAcquireItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetItemName := CallbackCreate(GetMethod(implObj, "GetItemName"), flags, 2)
        this.vtbl.GetThumbnail := CallbackCreate(GetMethod(implObj, "GetThumbnail"), flags, 3)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 3)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 3)
        this.vtbl.GetStream := CallbackCreate(GetMethod(implObj, "GetStream"), flags, 2)
        this.vtbl.CanDelete := CallbackCreate(GetMethod(implObj, "CanDelete"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.GetSubItemCount := CallbackCreate(GetMethod(implObj, "GetSubItemCount"), flags, 2)
        this.vtbl.GetSubItemAt := CallbackCreate(GetMethod(implObj, "GetSubItemAt"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetItemName)
        CallbackFree(this.vtbl.GetThumbnail)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.SetProperty)
        CallbackFree(this.vtbl.GetStream)
        CallbackFree(this.vtbl.CanDelete)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.GetSubItemCount)
        CallbackFree(this.vtbl.GetSubItemAt)
    }
}
