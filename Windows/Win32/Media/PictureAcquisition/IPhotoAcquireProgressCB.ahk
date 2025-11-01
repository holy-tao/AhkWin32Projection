#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPhotoAcquireProgressCB interface may be implemented if you wish to do extra processing at various stages in the acquisition process.
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nn-photoacquire-iphotoacquireprogresscb
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class IPhotoAcquireProgressCB extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoAcquireProgressCB
     * @type {Guid}
     */
    static IID => Guid("{00f2ce1e-935e-4248-892c-130f32c45cb4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancelled", "StartEnumeration", "FoundItem", "EndEnumeration", "StartTransfer", "StartItemTransfer", "DirectoryCreated", "UpdateTransferPercent", "EndItemTransfer", "EndTransfer", "StartDelete", "StartItemDelete", "UpdateDeletePercent", "EndItemDelete", "EndDelete", "EndSession", "GetDeleteAfterAcquire", "ErrorAdvise", "GetUserInput"]

    /**
     * 
     * @param {Pointer<BOOL>} pfCancelled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-cancelled
     */
    Cancelled(pfCancelled) {
        result := ComCall(3, this, "ptr", pfCancelled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPhotoAcquireSource} pPhotoAcquireSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-startenumeration
     */
    StartEnumeration(pPhotoAcquireSource) {
        result := ComCall(4, this, "ptr", pPhotoAcquireSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPhotoAcquireItem} pPhotoAcquireItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-founditem
     */
    FoundItem(pPhotoAcquireItem) {
        result := ComCall(5, this, "ptr", pPhotoAcquireItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-endenumeration
     */
    EndEnumeration(hr) {
        result := ComCall(6, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPhotoAcquireSource} pPhotoAcquireSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-starttransfer
     */
    StartTransfer(pPhotoAcquireSource) {
        result := ComCall(7, this, "ptr", pPhotoAcquireSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nItemIndex 
     * @param {IPhotoAcquireItem} pPhotoAcquireItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-startitemtransfer
     */
    StartItemTransfer(nItemIndex, pPhotoAcquireItem) {
        result := ComCall(8, this, "uint", nItemIndex, "ptr", pPhotoAcquireItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszDirectory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-directorycreated
     */
    DirectoryCreated(pszDirectory) {
        pszDirectory := pszDirectory is String ? StrPtr(pszDirectory) : pszDirectory

        result := ComCall(9, this, "ptr", pszDirectory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fOverall 
     * @param {Integer} nPercent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-updatetransferpercent
     */
    UpdateTransferPercent(fOverall, nPercent) {
        result := ComCall(10, this, "int", fOverall, "uint", nPercent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nItemIndex 
     * @param {IPhotoAcquireItem} pPhotoAcquireItem 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-enditemtransfer
     */
    EndItemTransfer(nItemIndex, pPhotoAcquireItem, hr) {
        result := ComCall(11, this, "uint", nItemIndex, "ptr", pPhotoAcquireItem, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-endtransfer
     */
    EndTransfer(hr) {
        result := ComCall(12, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPhotoAcquireSource} pPhotoAcquireSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-startdelete
     */
    StartDelete(pPhotoAcquireSource) {
        result := ComCall(13, this, "ptr", pPhotoAcquireSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nItemIndex 
     * @param {IPhotoAcquireItem} pPhotoAcquireItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-startitemdelete
     */
    StartItemDelete(nItemIndex, pPhotoAcquireItem) {
        result := ComCall(14, this, "uint", nItemIndex, "ptr", pPhotoAcquireItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nPercent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-updatedeletepercent
     */
    UpdateDeletePercent(nPercent) {
        result := ComCall(15, this, "uint", nPercent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nItemIndex 
     * @param {IPhotoAcquireItem} pPhotoAcquireItem 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-enditemdelete
     */
    EndItemDelete(nItemIndex, pPhotoAcquireItem, hr) {
        result := ComCall(16, this, "uint", nItemIndex, "ptr", pPhotoAcquireItem, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-enddelete
     */
    EndDelete(hr) {
        result := ComCall(17, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-endsession
     */
    EndSession(hr) {
        result := ComCall(18, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfDeleteAfterAcquire 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-getdeleteafteracquire
     */
    GetDeleteAfterAcquire(pfDeleteAfterAcquire) {
        result := ComCall(19, this, "ptr", pfDeleteAfterAcquire, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @param {PWSTR} pszErrorMessage 
     * @param {Integer} nMessageType 
     * @param {Pointer<Integer>} pnErrorAdviseResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-erroradvise
     */
    ErrorAdvise(hr, pszErrorMessage, nMessageType, pnErrorAdviseResult) {
        pszErrorMessage := pszErrorMessage is String ? StrPtr(pszErrorMessage) : pszErrorMessage

        pnErrorAdviseResultMarshal := pnErrorAdviseResult is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, "int", hr, "ptr", pszErrorMessage, "int", nMessageType, pnErrorAdviseResultMarshal, pnErrorAdviseResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riidType 
     * @param {IUnknown} pUnknown 
     * @param {Pointer<PROPVARIANT>} pPropVarResult 
     * @param {Pointer<PROPVARIANT>} pPropVarDefault 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-getuserinput
     */
    GetUserInput(riidType, pUnknown, pPropVarResult, pPropVarDefault) {
        result := ComCall(21, this, "ptr", riidType, "ptr", pUnknown, "ptr", pPropVarResult, "ptr", pPropVarDefault, "HRESULT")
        return result
    }
}
