#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains error information that is returned by a Windows Remote Management (WinRM) client.
 * @see https://docs.microsoft.com/windows/win32/api//wsman/ns-wsman-wsman_error
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_ERROR extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Specifies an error code. This error can be a general error code that is defined in winerror.h or a WinRM-specific error code.
     * @type {Integer}
     */
    code {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies extended error information that relates to a failed call. This field contains the fault detail text if it is present in the fault. If there is no fault detail, this field contains the fault reason text. This field can be set to <b>NULL</b>.
     * @type {PWSTR}
     */
    errorDetail{
        get {
            if(!this.HasProp("__errorDetail"))
                this.__errorDetail := PWSTR(this.ptr + 8)
            return this.__errorDetail
        }
    }

    /**
     * Specifies the language for the error description. This field can be set to <b>NULL</b>.  For more information about the language format, see the    RFC 3066 specification from the Internet Engineering Task Force at <a href="https://www.ietf.org/rfc/rfc3066.txt">http://www.ietf.org/rfc/rfc3066.txt</a>.
     * @type {PWSTR}
     */
    language{
        get {
            if(!this.HasProp("__language"))
                this.__language := PWSTR(this.ptr + 16)
            return this.__language
        }
    }

    /**
     * Specifies the name of the computer. This field can be set to <b>NULL</b>.
     * @type {PWSTR}
     */
    machineName{
        get {
            if(!this.HasProp("__machineName"))
                this.__machineName := PWSTR(this.ptr + 24)
            return this.__machineName
        }
    }

    /**
     * Specifies the name of the plug-in that generated the error. This field can be set to <b>NULL</b>.
     * @type {PWSTR}
     */
    pluginName{
        get {
            if(!this.HasProp("__pluginName"))
                this.__pluginName := PWSTR(this.ptr + 32)
            return this.__pluginName
        }
    }
}
