#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\UNICODE_STRING.ahk

/**
 * Contains process parameter information.
 * @see https://learn.microsoft.com/windows/win32/api/winternl/ns-winternl-rtl_user_process_parameters
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class RTL_USER_PROCESS_PARAMETERS extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * Reserved for internal use by the operating system.
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * Reserved for internal use by the operating system.
     * @type {Array<Void>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 16, 8, Primitive, "ptr")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * The path of the image file for the process.
     * @type {UNICODE_STRING}
     */
    ImagePathName{
        get {
            if(!this.HasProp("__ImagePathName"))
                this.__ImagePathName := UNICODE_STRING(this.ptr + 96)
            return this.__ImagePathName
        }
    }

    /**
     * The command-line string passed to the process.
     * @type {UNICODE_STRING}
     */
    CommandLine{
        get {
            if(!this.HasProp("__CommandLine"))
                this.__CommandLine := UNICODE_STRING(this.ptr + 112)
            return this.__CommandLine
        }
    }
}
