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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresource-getfriendlyname
     */
    GetFriendlyName() {
        pbstrFriendlyName := BSTR()
        result := ComCall(3, this, "ptr", pbstrFriendlyName, "HRESULT")
        return pbstrFriendlyName
    }

    /**
     * 
     * @param {Integer} nSize 
     * @param {Pointer<HICON>} phLargeIcon 
     * @param {Pointer<HICON>} phSmallIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresource-getdeviceicons
     */
    GetDeviceIcons(nSize, phLargeIcon, phSmallIcon) {
        result := ComCall(4, this, "uint", nSize, "ptr", phLargeIcon, "ptr", phSmallIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fForceEnumeration 
     * @param {IPhotoAcquireProgressCB} pPhotoAcquireProgressCB 
     * @param {Pointer<Integer>} pnItemCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresource-initializeitemlist
     */
    InitializeItemList(fForceEnumeration, pPhotoAcquireProgressCB, pnItemCount) {
        pnItemCountMarshal := pnItemCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "int", fForceEnumeration, "ptr", pPhotoAcquireProgressCB, pnItemCountMarshal, pnItemCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresource-getitemcount
     */
    GetItemCount() {
        result := ComCall(6, this, "uint*", &pnItemCount := 0, "HRESULT")
        return pnItemCount
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {IPhotoAcquireItem} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresource-getitemat
     */
    GetItemAt(nIndex) {
        result := ComCall(7, this, "uint", nIndex, "ptr*", &ppPhotoAcquireItem := 0, "HRESULT")
        return IPhotoAcquireItem(ppPhotoAcquireItem)
    }

    /**
     * 
     * @returns {IPhotoAcquireSettings} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresource-getphotoacquiresettings
     */
    GetPhotoAcquireSettings() {
        result := ComCall(8, this, "ptr*", &ppPhotoAcquireSettings := 0, "HRESULT")
        return IPhotoAcquireSettings(ppPhotoAcquireSettings)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresource-getdeviceid
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
