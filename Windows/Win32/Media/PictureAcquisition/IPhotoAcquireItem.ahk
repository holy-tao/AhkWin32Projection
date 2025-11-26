#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\IStream.ahk
#Include .\IPhotoAcquireItem.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPhotoAcquireItem interface provides methods for working with items as they are acquired from a device.
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nn-photoacquire-iphotoacquireitem
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class IPhotoAcquireItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoAcquireItem
     * @type {Guid}
     */
    static IID => Guid("{00f21c97-28bf-4c02-b842-5e4e90139a30}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemName", "GetThumbnail", "GetProperty", "SetProperty", "GetStream", "CanDelete", "Delete", "GetSubItemCount", "GetSubItemAt"]

    /**
     * The GetItemName method retrieves the file name for an item.
     * @returns {BSTR} Pointer to a string containing the name of the item.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquireitem-getitemname
     */
    GetItemName() {
        pbstrItemName := BSTR()
        result := ComCall(3, this, "ptr", pbstrItemName, "HRESULT")
        return pbstrItemName
    }

    /**
     * The GetThumbnail method retrieves the thumbnail provided for an item.
     * @param {SIZE} sizeThumbnail Specifies the size of the thumbnail.
     * @returns {HBITMAP} Specifies a handle to the thumbnail bitmap.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquireitem-getthumbnail
     */
    GetThumbnail(sizeThumbnail) {
        phbmpThumbnail := HBITMAP()
        result := ComCall(4, this, "ptr", sizeThumbnail, "ptr", phbmpThumbnail, "HRESULT")
        return phbmpThumbnail
    }

    /**
     * The GetProperty method retrieves the value of a property of an item.
     * @param {Pointer<PROPERTYKEY>} key Specifies a key for the property.
     * @returns {PROPVARIANT} Pointer to a property variant containing the property value.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquireitem-getproperty
     */
    GetProperty(key) {
        pv := PROPVARIANT()
        result := ComCall(5, this, "ptr", key, "ptr", pv, "HRESULT")
        return pv
    }

    /**
     * The SetProperty method sets a property for an item.
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
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquireitem-setproperty
     */
    SetProperty(key, pv) {
        result := ComCall(6, this, "ptr", key, "ptr", pv, "HRESULT")
        return result
    }

    /**
     * The GetStream method retrieves a read-only stream containing the contents of an item.
     * @returns {IStream} Returns a stream object with the file contents.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquireitem-getstream
     */
    GetStream() {
        result := ComCall(7, this, "ptr*", &ppStream := 0, "HRESULT")
        return IStream(ppStream)
    }

    /**
     * The CanDelete method indicates whether an item may be deleted.
     * @returns {BOOL} Pointer to a flag that, when set to <b>TRUE</b>, indicates that the item can be deleted.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquireitem-candelete
     */
    CanDelete() {
        result := ComCall(8, this, "int*", &pfCanDelete := 0, "HRESULT")
        return pfCanDelete
    }

    /**
     * The Delete method deletes an item.
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
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquireitem-delete
     */
    Delete() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The GetSubItemCount method retrieves the number of subitems contained in an item.
     * @returns {Integer} Pointer to an integer containing the count of subitems.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquireitem-getsubitemcount
     */
    GetSubItemCount() {
        result := ComCall(10, this, "uint*", &pnCount := 0, "HRESULT")
        return pnCount
    }

    /**
     * The GetSubItemAt method retrieves a subitem of an item, given the index of the subitem.
     * @param {Integer} nItemIndex Integer containing the index of the item.
     * @returns {IPhotoAcquireItem} Returns the <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iphotoacquireitem">IPhotoAcquireItem</a> object at the given index.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquireitem-getsubitemat
     */
    GetSubItemAt(nItemIndex) {
        result := ComCall(11, this, "uint", nItemIndex, "ptr*", &ppPhotoAcquireItem := 0, "HRESULT")
        return IPhotoAcquireItem(ppPhotoAcquireItem)
    }
}
