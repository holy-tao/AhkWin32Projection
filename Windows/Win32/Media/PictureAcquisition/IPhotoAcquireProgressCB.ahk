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
     * 
     * @param {Pointer<BOOL>} pfCancelled 
     * @returns {HRESULT} 
     */
    Cancelled(pfCancelled) {
        result := ComCall(3, this, "ptr", pfCancelled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPhotoAcquireSource>} pPhotoAcquireSource 
     * @returns {HRESULT} 
     */
    StartEnumeration(pPhotoAcquireSource) {
        result := ComCall(4, this, "ptr", pPhotoAcquireSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPhotoAcquireItem>} pPhotoAcquireItem 
     * @returns {HRESULT} 
     */
    FoundItem(pPhotoAcquireItem) {
        result := ComCall(5, this, "ptr", pPhotoAcquireItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    EndEnumeration(hr) {
        result := ComCall(6, this, "int", hr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPhotoAcquireSource>} pPhotoAcquireSource 
     * @returns {HRESULT} 
     */
    StartTransfer(pPhotoAcquireSource) {
        result := ComCall(7, this, "ptr", pPhotoAcquireSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nItemIndex 
     * @param {Pointer<IPhotoAcquireItem>} pPhotoAcquireItem 
     * @returns {HRESULT} 
     */
    StartItemTransfer(nItemIndex, pPhotoAcquireItem) {
        result := ComCall(8, this, "uint", nItemIndex, "ptr", pPhotoAcquireItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszDirectory 
     * @returns {HRESULT} 
     */
    DirectoryCreated(pszDirectory) {
        pszDirectory := pszDirectory is String ? StrPtr(pszDirectory) : pszDirectory

        result := ComCall(9, this, "ptr", pszDirectory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fOverall 
     * @param {Integer} nPercent 
     * @returns {HRESULT} 
     */
    UpdateTransferPercent(fOverall, nPercent) {
        result := ComCall(10, this, "int", fOverall, "uint", nPercent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nItemIndex 
     * @param {Pointer<IPhotoAcquireItem>} pPhotoAcquireItem 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    EndItemTransfer(nItemIndex, pPhotoAcquireItem, hr) {
        result := ComCall(11, this, "uint", nItemIndex, "ptr", pPhotoAcquireItem, "int", hr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    EndTransfer(hr) {
        result := ComCall(12, this, "int", hr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPhotoAcquireSource>} pPhotoAcquireSource 
     * @returns {HRESULT} 
     */
    StartDelete(pPhotoAcquireSource) {
        result := ComCall(13, this, "ptr", pPhotoAcquireSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nItemIndex 
     * @param {Pointer<IPhotoAcquireItem>} pPhotoAcquireItem 
     * @returns {HRESULT} 
     */
    StartItemDelete(nItemIndex, pPhotoAcquireItem) {
        result := ComCall(14, this, "uint", nItemIndex, "ptr", pPhotoAcquireItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nPercent 
     * @returns {HRESULT} 
     */
    UpdateDeletePercent(nPercent) {
        result := ComCall(15, this, "uint", nPercent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nItemIndex 
     * @param {Pointer<IPhotoAcquireItem>} pPhotoAcquireItem 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    EndItemDelete(nItemIndex, pPhotoAcquireItem, hr) {
        result := ComCall(16, this, "uint", nItemIndex, "ptr", pPhotoAcquireItem, "int", hr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    EndDelete(hr) {
        result := ComCall(17, this, "int", hr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    EndSession(hr) {
        result := ComCall(18, this, "int", hr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfDeleteAfterAcquire 
     * @returns {HRESULT} 
     */
    GetDeleteAfterAcquire(pfDeleteAfterAcquire) {
        result := ComCall(19, this, "ptr", pfDeleteAfterAcquire, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @param {PWSTR} pszErrorMessage 
     * @param {Integer} nMessageType 
     * @param {Pointer<Int32>} pnErrorAdviseResult 
     * @returns {HRESULT} 
     */
    ErrorAdvise(hr, pszErrorMessage, nMessageType, pnErrorAdviseResult) {
        pszErrorMessage := pszErrorMessage is String ? StrPtr(pszErrorMessage) : pszErrorMessage

        result := ComCall(20, this, "int", hr, "ptr", pszErrorMessage, "int", nMessageType, "int*", pnErrorAdviseResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riidType 
     * @param {Pointer<IUnknown>} pUnknown 
     * @param {Pointer<PROPVARIANT>} pPropVarResult 
     * @param {Pointer<PROPVARIANT>} pPropVarDefault 
     * @returns {HRESULT} 
     */
    GetUserInput(riidType, pUnknown, pPropVarResult, pPropVarDefault) {
        result := ComCall(21, this, "ptr", riidType, "ptr", pUnknown, "ptr", pPropVarResult, "ptr", pPropVarDefault, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
