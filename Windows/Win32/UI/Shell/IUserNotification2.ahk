#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that set notification information and then display that notification to the user in a balloon that appears in conjunction with the notification area of the taskbar.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * An implementation of this interface is provided in Windows as CLSID_UserNotification.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iusernotification2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IUserNotification2 extends IUnknown{
    /**
     * The interface identifier for IUserNotification2
     * @type {Guid}
     */
    static IID => Guid("{215913cc-57eb-4fab-ab5a-e5fa7bea2a6c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszTitle 
     * @param {PWSTR} pszText 
     * @param {Integer} dwInfoFlags 
     * @returns {HRESULT} 
     */
    SetBalloonInfo(pszTitle, pszText, dwInfoFlags) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(3, this, "ptr", pszTitle, "ptr", pszText, "uint", dwInfoFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwShowTime 
     * @param {Integer} dwInterval 
     * @param {Integer} cRetryCount 
     * @returns {HRESULT} 
     */
    SetBalloonRetry(dwShowTime, dwInterval, cRetryCount) {
        result := ComCall(4, this, "uint", dwShowTime, "uint", dwInterval, "uint", cRetryCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HICON} hIcon 
     * @param {PWSTR} pszToolTip 
     * @returns {HRESULT} 
     */
    SetIconInfo(hIcon, pszToolTip) {
        hIcon := hIcon is Win32Handle ? NumGet(hIcon, "ptr") : hIcon
        pszToolTip := pszToolTip is String ? StrPtr(pszToolTip) : pszToolTip

        result := ComCall(5, this, "ptr", hIcon, "ptr", pszToolTip, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IQueryContinue>} pqc 
     * @param {Integer} dwContinuePollInterval 
     * @param {Pointer<IUserNotificationCallback>} pSink 
     * @returns {HRESULT} 
     */
    Show(pqc, dwContinuePollInterval, pSink) {
        result := ComCall(6, this, "ptr", pqc, "uint", dwContinuePollInterval, "ptr", pSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszSoundName 
     * @returns {HRESULT} 
     */
    PlaySound(pszSoundName) {
        pszSoundName := pszSoundName is String ? StrPtr(pszSoundName) : pszSoundName

        result := ComCall(7, this, "ptr", pszSoundName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
