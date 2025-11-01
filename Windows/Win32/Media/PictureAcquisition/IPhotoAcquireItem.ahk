#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<BSTR>} pbstrItemName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireitem-getitemname
     */
    GetItemName(pbstrItemName) {
        result := ComCall(3, this, "ptr", pbstrItemName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SIZE} sizeThumbnail 
     * @param {Pointer<HBITMAP>} phbmpThumbnail 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireitem-getthumbnail
     */
    GetThumbnail(sizeThumbnail, phbmpThumbnail) {
        result := ComCall(4, this, "ptr", sizeThumbnail, "ptr", phbmpThumbnail, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} pv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireitem-getproperty
     */
    GetProperty(key, pv) {
        result := ComCall(5, this, "ptr", key, "ptr", pv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} pv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireitem-setproperty
     */
    SetProperty(key, pv) {
        result := ComCall(6, this, "ptr", key, "ptr", pv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} ppStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireitem-getstream
     */
    GetStream(ppStream) {
        result := ComCall(7, this, "ptr*", ppStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfCanDelete 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireitem-candelete
     */
    CanDelete(pfCanDelete) {
        result := ComCall(8, this, "ptr", pfCanDelete, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireitem-delete
     */
    Delete() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireitem-getsubitemcount
     */
    GetSubItemCount(pnCount) {
        pnCountMarshal := pnCount is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pnCountMarshal, pnCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nItemIndex 
     * @param {Pointer<IPhotoAcquireItem>} ppPhotoAcquireItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireitem-getsubitemat
     */
    GetSubItemAt(nItemIndex, ppPhotoAcquireItem) {
        result := ComCall(11, this, "uint", nItemIndex, "ptr*", ppPhotoAcquireItem, "HRESULT")
        return result
    }
}
