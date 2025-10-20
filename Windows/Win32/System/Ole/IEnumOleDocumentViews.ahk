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
     * 
     * @param {Integer} cViews 
     * @param {Pointer<IOleDocumentView>} rgpView 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(cViews, rgpView, pcFetched) {
        result := ComCall(3, this, "uint", cViews, "ptr", rgpView, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cViews 
     * @returns {HRESULT} 
     */
    Skip(cViews) {
        result := ComCall(4, this, "uint", cViews, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumOleDocumentViews>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
