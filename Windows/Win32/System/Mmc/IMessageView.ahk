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
     * 
     * @param {PWSTR} pszTitleText 
     * @returns {HRESULT} 
     */
    SetTitleText(pszTitleText) {
        pszTitleText := pszTitleText is String ? StrPtr(pszTitleText) : pszTitleText

        result := ComCall(3, this, "ptr", pszTitleText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszBodyText 
     * @returns {HRESULT} 
     */
    SetBodyText(pszBodyText) {
        pszBodyText := pszBodyText is String ? StrPtr(pszBodyText) : pszBodyText

        result := ComCall(4, this, "ptr", pszBodyText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @returns {HRESULT} 
     */
    SetIcon(id) {
        result := ComCall(5, this, "int", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
