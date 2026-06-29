#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IQueryContinue.ahk" { IQueryContinue }
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that set notification information and then display that notification to the user in a balloon that appears in conjunction with the notification area of the taskbar. (IUserNotification)
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * An implementation of this interface is provided in Windows as CLSID_UserNotification.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iusernotification
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IUserNotification extends IUnknown {
    /**
     * The interface identifier for IUserNotification
     * @type {Guid}
     */
    static IID := Guid("{ba9711ba-5893-4787-a7e1-41277151550b}")

    /**
     * The class identifier for UserNotification
     * @type {Guid}
     */
    static CLSID := Guid("{0010890e-8789-413c-adbc-48f5b511b3af}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUserNotification interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetBalloonInfo  : IntPtr
        SetBalloonRetry : IntPtr
        SetIconInfo     : IntPtr
        Show            : IntPtr
        PlaySound       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUserNotification.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the information to be displayed in a balloon notification. (IUserNotification.SetBalloonInfo)
     * @param {PWSTR} pszTitle Type: <b>LPCWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the title of the notification.
     * @param {PWSTR} pszText Type: <b>LPCWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the text to be displayed in the body of the balloon.
     * @param {Integer} dwInfoFlags Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iusernotification-setballooninfo
     */
    SetBalloonInfo(pszTitle, pszText, dwInfoFlags) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(3, this, "ptr", pszTitle, "ptr", pszText, "uint", dwInfoFlags, "HRESULT")
        return result
    }

    /**
     * Specifies the conditions for trying to display user information when the first attempt fails. (IUserNotification.SetBalloonRetry)
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iusernotification-setballoonretry
     */
    SetBalloonRetry(dwShowTime, dwInterval, cRetryCount) {
        result := ComCall(4, this, "uint", dwShowTime, "uint", dwInterval, "uint", cRetryCount, "HRESULT")
        return result
    }

    /**
     * Sets the notification area icon associated with specific user information. (IUserNotification.SetIconInfo)
     * @param {HICON} _hIcon Type: <b>HICON</b>
     * 
     * A handle to the icon.
     * @param {PWSTR} pszToolTip Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string that contains the tooltip text to display for the specified icon. This value can be <b>NULL</b>, although it is not recommended.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iusernotification-seticoninfo
     */
    SetIconInfo(_hIcon, pszToolTip) {
        pszToolTip := pszToolTip is String ? StrPtr(pszToolTip) : pszToolTip

        result := ComCall(5, this, HICON, _hIcon, "ptr", pszToolTip, "HRESULT")
        return result
    }

    /**
     * Displays the notification.
     * @remarks
     * This method is equivalent to calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-iusernotification2-show">Show</a> with <i>pSink</i>=<b>NULL</b>.
     * @param {IQueryContinue} pqc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iquerycontinue">IQueryContinue</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iquerycontinue">IQueryContinue</a> interface pointer, used to determine whether the notification display can continue or should stop (for example, if the user closes the notification). This value can be <b>NULL</b>.
     * @param {Integer} dwContinuePollInterval Type: <b>DWORD</b>
     * 
     * The length of time, in milliseconds, to display user information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iusernotification-show
     */
    Show(pqc, dwContinuePollInterval) {
        result := ComCall(6, this, "ptr", pqc, "uint", dwContinuePollInterval, "HRESULT")
        return result
    }

    /**
     * Plays a sound in conjunction with the notification. (IUserNotification.PlaySound)
     * @remarks
     * The string pointed to by <i>pszSoundNamepqc</i> contains an alias for a system event found in the registry or the Win.ini file; for instance, "SystemExit".
     * 
     * The specified sound is played asynchronously and the method returns immediately after beginning the sound. To stop an asynchronous waveform sound, call <b>IUserNotification::PlaySound</b> with <i>pszSoundNamepqc</i> set to <b>NULL</b>.
     * 
     * The specified sound event will yield to another sound event that is already playing. If a sound cannot be played because the resource needed to play that sound is busy, the method immediately returns S_FALSE without playing the requested sound.
     * 
     * If the specified sound cannot be found, <b>IUserNotification::PlaySound</b> uses the system default sound.
     * @param {PWSTR} pszSoundName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string that specifies the alias of the sound file to play.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iusernotification-playsound
     */
    PlaySound(pszSoundName) {
        pszSoundName := pszSoundName is String ? StrPtr(pszSoundName) : pszSoundName

        result := ComCall(7, this, "ptr", pszSoundName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUserNotification.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetBalloonInfo := CallbackCreate(GetMethod(implObj, "SetBalloonInfo"), flags, 4)
        this.vtbl.SetBalloonRetry := CallbackCreate(GetMethod(implObj, "SetBalloonRetry"), flags, 4)
        this.vtbl.SetIconInfo := CallbackCreate(GetMethod(implObj, "SetIconInfo"), flags, 3)
        this.vtbl.Show := CallbackCreate(GetMethod(implObj, "Show"), flags, 3)
        this.vtbl.PlaySound := CallbackCreate(GetMethod(implObj, "PlaySound"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetBalloonInfo)
        CallbackFree(this.vtbl.SetBalloonRetry)
        CallbackFree(this.vtbl.SetIconInfo)
        CallbackFree(this.vtbl.Show)
        CallbackFree(this.vtbl.PlaySound)
    }
}
