#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ADSPROPERROR structure is used to pass error data to the notification object with the ADsPropSendErrorMessage function or the WM_ADSPROP_NOTIFY_ERROR message.
 * @see https://learn.microsoft.com/windows/win32/api/adsprop/ns-adsprop-adsproperror
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADSPROPERROR {
    #StructPack 8

    /**
     * Contains the window handle of the property page that generated the error.
     */
    hwndPage : HWND

    /**
     * Pointer to a NULL-terminated Unicode string that contains the title of the property page that generated the error.
     */
    pszPageTitle : PWSTR

    /**
     * Pointer to a NULL-terminated Unicode string that contains the ADsPath of the directory object that the error occurred on.
     */
    pszObjPath : PWSTR

    /**
     * Pointer to a NULL-terminated Unicode string that contains the class name of the directory object that the error occurred on.
     */
    pszObjClass : PWSTR

    /**
     * Contains an <b>HRESULT</b> value that specifies the  code of the error that occurred. If <i>hr</i> is not equal to <b>S_OK</b>, then <i>pszError</i> is ignored. If <i>hr</i> is equal to <b>S_OK</b>, then <i>pszError</i> contains an error message.
     */
    hr : HRESULT

    /**
     * Pointer to a NULL-terminated Unicode string that contains the error message to be displayed in the error dialog box. This member is ignored if <i>hr</i> is not equal to <b>S_OK</b>. In this case, the error dialog box will display a system-defined message for the error specified by <i>hr</i>.
     */
    pszError : PWSTR

}
