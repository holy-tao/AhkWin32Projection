#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The opaque type used for a reference to an XML writer.
 * @remarks
 * This object is not thread safe. For more information, see [thread safety](thread-safety.md).
 * @see https://learn.microsoft.com/windows/win32/wsw/ws-xml-writer
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_WRITER extends Win32Struct
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
