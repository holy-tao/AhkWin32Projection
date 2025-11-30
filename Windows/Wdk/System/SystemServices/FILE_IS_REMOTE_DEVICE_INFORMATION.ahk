#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class FILE_IS_REMOTE_DEVICE_INFORMATION extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    IsRemote {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
