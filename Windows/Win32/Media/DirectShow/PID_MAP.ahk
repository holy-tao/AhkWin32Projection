#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PID\_MAP structure contains identifies the contents of an MPEG-2 transport stream packet ID.
 * @see https://learn.microsoft.com/windows/win32/DirectShow/pid-map
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class PID_MAP extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the packet ID (PID)
     * @type {Integer}
     */
    ulPID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the contents of the packet payload, as a [**MEDIA\_SAMPLE\_CONTENT**](media-sample-content.md) enumeration type.
     * @type {Integer}
     */
    MediaSampleContent {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
