#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains error information that is returned by a Windows Remote Management (WinRM) client.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_error
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_ERROR {
    #StructPack 8

    /**
     * Specifies an error code. This error can be a general error code that is defined in winerror.h or a WinRM-specific error code.
     */
    code : UInt32

    /**
     * Specifies extended error information that relates to a failed call. This field contains the fault detail text if it is present in the fault. If there is no fault detail, this field contains the fault reason text. This field can be set to <b>NULL</b>.
     */
    errorDetail : PWSTR

    /**
     * Specifies the language for the error description. This field can be set to <b>NULL</b>.  For more information about the language format, see the    RFC 3066 specification from the Internet Engineering Task Force at <a href="https://www.ietf.org/rfc/rfc3066.txt">http://www.ietf.org/rfc/rfc3066.txt</a>.
     */
    language : PWSTR

    /**
     * Specifies the name of the computer. This field can be set to <b>NULL</b>.
     */
    machineName : PWSTR

    /**
     * Specifies the name of the plug-in that generated the error. This field can be set to <b>NULL</b>.
     */
    pluginName : PWSTR

}
