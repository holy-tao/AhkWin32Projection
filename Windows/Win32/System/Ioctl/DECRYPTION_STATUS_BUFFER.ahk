#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DECRYPTION_STATUS_BUFFER extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    NoEncryptedStreams{
        get {
            if(!this.HasProp("__NoEncryptedStreams"))
                this.__NoEncryptedStreams := BOOLEAN(this.ptr + 0)
            return this.__NoEncryptedStreams
        }
    }
}
