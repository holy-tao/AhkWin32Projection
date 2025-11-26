#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumOleDocumentViews.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates the views supported by a document object.
 * @see https://docs.microsoft.com/windows/win32/api//docobj/nn-docobj-ienumoledocumentviews
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IEnumOleDocumentViews extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumOleDocumentViews
     * @type {Guid}
     */
    static IID => Guid("{b722bcc8-4e68-101b-a2bc-00aa00404770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * Retrieves the specified number of items in the enumeration sequence.
     * @param {Integer} cViews The number of items to be retrieved. If there are fewer than the requested number of items left in the sequence, this method retrieves the remaining elements.
     * 
     * If <i>pcFetched</i> is <b>NULL</b>, this parameter must be 1.
     * @param {Pointer<IOleDocumentView>} rgpView An array of enumerated items.
     * 
     * The enumerator is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a>, and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> through each pointer enumerated. If <i>cViews</i> is greater than 1, the caller must also pass a non-<b>NULL</b> pointer passed to <i>pcFetched</i> to know how many pointers to release.
     * @param {Pointer<Integer>} pcFetched The number of items that were retrieved. This parameter is always less than or equal to the number of items requested. This parameter can be <b>NULL</b>, in which case the <i>cViews</i> parameter must be 1.
     * @returns {HRESULT} If the method retrieves the number of items requested, the return value is S_OK. Otherwise, it is S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ienumoledocumentviews-next
     */
    Next(cViews, rgpView, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cViews, "ptr*", rgpView, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * Skips over the specified number of items in the enumeration sequence.
     * @param {Integer} cViews The number of items to be skipped.
     * @returns {HRESULT} If the method skips the number of items requested, the return value is S_OK. Otherwise, it is S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ienumoledocumentviews-skip
     */
    Skip(cViews) {
        result := ComCall(4, this, "uint", cViews, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration sequence to the beginning.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ienumoledocumentviews-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a new enumerator that contains the same enumeration state as the current one.
     * @returns {IEnumOleDocumentViews} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-ienumoledocumentviews">IEnumOleDocumentViews</a> interface pointer on the newly created enumerator. The caller must release this enumerator separately from the one from which it was cloned.
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ienumoledocumentviews-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumOleDocumentViews(ppEnum)
    }
}
