#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IMessageView interface is introduced in MMC 1.2.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-imessageview
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IMessageView extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMessageView
     * @type {Guid}
     */
    static IID => Guid("{80f94174-fccc-11d2-b991-00c04f8ecd78}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTitleText", "SetBodyText", "SetIcon", "Clear"]

    /**
     * 
     * @param {PWSTR} pszTitleText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-imessageview-settitletext
     */
    SetTitleText(pszTitleText) {
        pszTitleText := pszTitleText is String ? StrPtr(pszTitleText) : pszTitleText

        result := ComCall(3, this, "ptr", pszTitleText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszBodyText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-imessageview-setbodytext
     */
    SetBodyText(pszBodyText) {
        pszBodyText := pszBodyText is String ? StrPtr(pszBodyText) : pszBodyText

        result := ComCall(4, this, "ptr", pszBodyText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-imessageview-seticon
     */
    SetIcon(id) {
        result := ComCall(5, this, "int", id, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-imessageview-clear
     */
    Clear() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
