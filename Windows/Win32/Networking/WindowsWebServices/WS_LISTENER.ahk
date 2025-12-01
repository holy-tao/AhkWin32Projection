#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An opaque type used to reference a listener.
 * @remarks
 * This object is thread safe. For more information, see [thread safety](thread-safety.md).
 * @see https://learn.microsoft.com/windows/win32/wsw/ws-listener
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_LISTENER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
