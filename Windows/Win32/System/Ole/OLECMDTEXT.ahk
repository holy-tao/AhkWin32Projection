#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a text name or status string for a single command identifier.
 * @see https://docs.microsoft.com/windows/win32/api//docobj/ns-docobj-olecmdtext
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLECMDTEXT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/ne-docobj-olecmdtextf">OLECMDTEXTF</a> enumeration describing whether the <b>rgwz</b> member contains a command name or status text.
     * @type {Integer}
     */
    cmdtextf {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of characters actually written into the <b>rgwz</b> buffer before <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-iolecommandtarget-querystatus">IOleCommandTarget::QueryStatus</a> returns.
     * @type {Integer}
     */
    cwActual {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of elements in the <b>rgwz</b> array.
     * @type {Integer}
     */
    cwBuf {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A caller-allocated array of wide characters to receive the command name or status text.
     * @type {String}
     */
    rgwz {
        get => StrGet(this.ptr + 12, 0, "UTF-16")
        set => StrPut(value, this.ptr + 12, 0, "UTF-16")
    }
}
