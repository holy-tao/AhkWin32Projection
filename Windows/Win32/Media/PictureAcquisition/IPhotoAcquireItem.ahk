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
     * 
     * @param {Pointer<BSTR>} pbstrItemName 
     * @returns {HRESULT} 
     */
    GetItemName(pbstrItemName) {
        result := ComCall(3, this, "ptr", pbstrItemName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {SIZE} sizeThumbnail 
     * @param {Pointer<HBITMAP>} phbmpThumbnail 
     * @returns {HRESULT} 
     */
    GetThumbnail(sizeThumbnail, phbmpThumbnail) {
        result := ComCall(4, this, "ptr", sizeThumbnail, "ptr", phbmpThumbnail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} pv 
     * @returns {HRESULT} 
     */
    GetProperty(key, pv) {
        result := ComCall(5, this, "ptr", key, "ptr", pv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} pv 
     * @returns {HRESULT} 
     */
    SetProperty(key, pv) {
        result := ComCall(6, this, "ptr", key, "ptr", pv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} ppStream 
     * @returns {HRESULT} 
     */
    GetStream(ppStream) {
        result := ComCall(7, this, "ptr", ppStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfCanDelete 
     * @returns {HRESULT} 
     */
    CanDelete(pfCanDelete) {
        result := ComCall(8, this, "ptr", pfCanDelete, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pnCount 
     * @returns {HRESULT} 
     */
    GetSubItemCount(pnCount) {
        result := ComCall(10, this, "uint*", pnCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nItemIndex 
     * @param {Pointer<IPhotoAcquireItem>} ppPhotoAcquireItem 
     * @returns {HRESULT} 
     */
    GetSubItemAt(nItemIndex, ppPhotoAcquireItem) {
        result := ComCall(11, this, "uint", nItemIndex, "ptr", ppPhotoAcquireItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
