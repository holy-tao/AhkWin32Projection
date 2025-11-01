#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} cViews 
     * @param {Pointer<IOleDocumentView>} rgpView 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ienumoledocumentviews-next
     */
    Next(cViews, rgpView, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cViews, "ptr*", rgpView, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cViews 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ienumoledocumentviews-skip
     */
    Skip(cViews) {
        result := ComCall(4, this, "uint", cViews, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ienumoledocumentviews-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumOleDocumentViews>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ienumoledocumentviews-clone
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
