#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The ADSPROPERROR structure is used to pass error data to the notification object with the ADsPropSendErrorMessage function or the WM_ADSPROP_NOTIFY_ERROR message.
 * @see https://learn.microsoft.com/windows/win32/api/adsprop/ns-adsprop-adsproperror
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADSPROPERROR extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Contains the window handle of the property page that generated the error.
     * @type {HWND}
     */
    hwndPage{
        get {
            if(!this.HasProp("__hwndPage"))
                this.__hwndPage := HWND(this.ptr + 0)
            return this.__hwndPage
        }
    }

    /**
     * Pointer to a NULL-terminated Unicode string that contains the title of the property page that generated the error.
     * @type {PWSTR}
     */
    pszPageTitle{
        get {
            if(!this.HasProp("__pszPageTitle"))
                this.__pszPageTitle := PWSTR(this.ptr + 8)
            return this.__pszPageTitle
        }
    }

    /**
     * Pointer to a NULL-terminated Unicode string that contains the ADsPath of the directory object that the error occurred on.
     * @type {PWSTR}
     */
    pszObjPath{
        get {
            if(!this.HasProp("__pszObjPath"))
                this.__pszObjPath := PWSTR(this.ptr + 16)
            return this.__pszObjPath
        }
    }

    /**
     * Pointer to a NULL-terminated Unicode string that contains the class name of the directory object that the error occurred on.
     * @type {PWSTR}
     */
    pszObjClass{
        get {
            if(!this.HasProp("__pszObjClass"))
                this.__pszObjClass := PWSTR(this.ptr + 24)
            return this.__pszObjClass
        }
    }

    /**
     * Contains an <b>HRESULT</b> value that specifies the  code of the error that occurred. If <i>hr</i> is not equal to <b>S_OK</b>, then <i>pszError</i> is ignored. If <i>hr</i> is equal to <b>S_OK</b>, then <i>pszError</i> contains an error message.
     * @type {Integer}
     */
    hr {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Pointer to a NULL-terminated Unicode string that contains the error message to be displayed in the error dialog box. This member is ignored if <i>hr</i> is not equal to <b>S_OK</b>. In this case, the error dialog box will display a system-defined message for the error specified by <i>hr</i>.
     * @type {PWSTR}
     */
    pszError{
        get {
            if(!this.HasProp("__pszError"))
                this.__pszError := PWSTR(this.ptr + 40)
            return this.__pszError
        }
    }
}
