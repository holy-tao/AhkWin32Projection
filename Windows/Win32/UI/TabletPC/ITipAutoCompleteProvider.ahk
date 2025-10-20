#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class ITipAutoCompleteProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITipAutoCompleteProvider
     * @type {Guid}
     */
    static IID => Guid("{7c6cf46d-8404-46b9-ad33-f5b6036d4007}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdatePendingText", "Show"]

    /**
     * 
     * @param {BSTR} bstrPendingText 
     * @returns {HRESULT} 
     */
    UpdatePendingText(bstrPendingText) {
        bstrPendingText := bstrPendingText is String ? BSTR.Alloc(bstrPendingText).Value : bstrPendingText

        result := ComCall(3, this, "ptr", bstrPendingText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     */
    Show(fShow) {
        result := ComCall(4, this, "int", fShow, "HRESULT")
        return result
    }
}
