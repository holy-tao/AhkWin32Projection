#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a part of the TDIObjectID structure to represent information about TDI drivers retrieved using the IOCTL_TCP_QUERY_INFORMATION_EX control code.
 * @see https://docs.microsoft.com/windows/win32/api//tdiinfo/ns-tdiinfo-tdientityid
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class TDIEntityID extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    tei_entity {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An opaque value that can uniquely identify an entity, if a specific one is being addressed.
     * @type {Integer}
     */
    tei_instance {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
