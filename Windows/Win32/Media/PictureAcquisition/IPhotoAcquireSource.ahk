#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPhotoAcquireSource interface is used for acquisition of items from a device.
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nn-photoacquire-iphotoacquiresource
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class IPhotoAcquireSource extends IUnknown{
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
     * 
     * @param {Pointer<BSTR>} pbstrFriendlyName 
     * @returns {HRESULT} 
     */
    GetFriendlyName(pbstrFriendlyName) {
        result := ComCall(3, this, "ptr", pbstrFriendlyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nSize 
     * @param {Pointer<HICON>} phLargeIcon 
     * @param {Pointer<HICON>} phSmallIcon 
     * @returns {HRESULT} 
     */
    GetDeviceIcons(nSize, phLargeIcon, phSmallIcon) {
        result := ComCall(4, this, "uint", nSize, "ptr", phLargeIcon, "ptr", phSmallIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fForceEnumeration 
     * @param {Pointer<IPhotoAcquireProgressCB>} pPhotoAcquireProgressCB 
     * @param {Pointer<UInt32>} pnItemCount 
     * @returns {HRESULT} 
     */
    InitializeItemList(fForceEnumeration, pPhotoAcquireProgressCB, pnItemCount) {
        result := ComCall(5, this, "int", fForceEnumeration, "ptr", pPhotoAcquireProgressCB, "uint*", pnItemCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pnItemCount 
     * @returns {HRESULT} 
     */
    GetItemCount(pnItemCount) {
        result := ComCall(6, this, "uint*", pnItemCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<IPhotoAcquireItem>} ppPhotoAcquireItem 
     * @returns {HRESULT} 
     */
    GetItemAt(nIndex, ppPhotoAcquireItem) {
        result := ComCall(7, this, "uint", nIndex, "ptr", ppPhotoAcquireItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPhotoAcquireSettings>} ppPhotoAcquireSettings 
     * @returns {HRESULT} 
     */
    GetPhotoAcquireSettings(ppPhotoAcquireSettings) {
        result := ComCall(8, this, "ptr", ppPhotoAcquireSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDeviceId 
     * @returns {HRESULT} 
     */
    GetDeviceId(pbstrDeviceId) {
        result := ComCall(9, this, "ptr", pbstrDeviceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    BindToObject(riid, ppv) {
        result := ComCall(10, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
