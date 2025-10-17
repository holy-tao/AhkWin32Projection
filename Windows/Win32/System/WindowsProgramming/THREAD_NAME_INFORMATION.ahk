#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class THREAD_NAME_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {UNICODE_STRING}
     */
    ThreadName{
        get {
            if(!this.HasProp("__ThreadName"))
                this.__ThreadName := UNICODE_STRING(0, this)
            return this.__ThreadName
        }
    }
}
