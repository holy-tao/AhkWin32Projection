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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBalloonInfo", "SetBalloonRetry", "SetIconInfo", "Show", "PlaySound"]

    /**
     * Sets the information to be displayed in a balloon notification.
     * @param {PWSTR} pszTitle Type: <b>LPCWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the title of the notification.
     * @param {PWSTR} pszText Type: <b>LPCWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the text to be displayed in the body of the balloon.
     * @param {Integer} dwInfoFlags Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iusernotification2-setballooninfo
     */
    SetBalloonInfo(pszTitle, pszText, dwInfoFlags) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(3, this, "ptr", pszTitle, "ptr", pszText, "uint", dwInfoFlags, "HRESULT")
        return result
    }

    /**
     * Specifies the conditions for trying to display user information when the first attempt fails.
     * @param {Integer} dwShowTime Type: <b>DWORD</b>
     * 
     * The amount of time, in milliseconds, to display the user information.
     * @param {Integer} dwInterval Type: <b>DWORD</b>
     * 
     * The interval of time, in milliseconds, between attempts to display the user information.
     * @param {Integer} cRetryCount Type: <b>UINT</b>
     * 
     * The number of times the system should try to display the user information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iusernotification2-setballoonretry
     */
    SetBalloonRetry(dwShowTime, dwInterval, cRetryCount) {
        result := ComCall(4, this, "uint", dwShowTime, "uint", dwInterval, "uint", cRetryCount, "HRESULT")
        return result
    }

    /**
     * Sets the notification area icon associated with specific user information.
     * @param {HICON} hIcon Type: <b>HICON</b>
     * 
     * A handle to the icon.
     * @param {PWSTR} pszToolTip Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string that contains the tooltip text to display for the specified icon. This value can be <b>NULL</b>, although it is not recommended.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iusernotification2-seticoninfo
     */
    SetIconInfo(hIcon, pszToolTip) {
        hIcon := hIcon is Win32Handle ? NumGet(hIcon, "ptr") : hIcon
        pszToolTip := pszToolTip is String ? StrPtr(pszToolTip) : pszToolTip

        result := ComCall(5, this, "ptr", hIcon, "ptr", pszToolTip, "HRESULT")
        return result
    }

    /**
     * Displays the user information in a balloon-style tooltip.
     * @param {IQueryContinue} pqc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iquerycontinue">IQueryContinue</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iquerycontinue">IQueryContinue</a> interface pointer, used to determine whether the notification display can continue or should stop (for example, if the user closes the notification). This value can be <b>NULL</b>.
     * @param {Integer} dwContinuePollInterval Type: <b>DWORD</b>
     * 
     * The length of time, in milliseconds, to display user information.
     * @param {IUserNotificationCallback} pSink Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nn-shobjidl-iusernotificationcallback">IUserNotificationCallback</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nn-shobjidl-iusernotificationcallback">IUserNotificationCallback</a> interface, used to handle mouse click and hover actions on the notification area icon and within the notification itself. This value can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iusernotification2-show
     */
    Show(pqc, dwContinuePollInterval, pSink) {
        result := ComCall(6, this, "ptr", pqc, "uint", dwContinuePollInterval, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * Plays a sound in conjunction with the notification.
     * @param {PWSTR} pszSoundName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string that specifies the alias of the sound file to play.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iusernotification2-playsound
     */
    PlaySound(pszSoundName) {
        pszSoundName := pszSoundName is String ? StrPtr(pszSoundName) : pszSoundName

        result := ComCall(7, this, "ptr", pszSoundName, "HRESULT")
        return result
    }
}
