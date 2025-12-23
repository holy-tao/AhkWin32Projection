#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The REGPINMEDIUM structure describes a pin medium for registration through the IFilterMapper2 interface.
 * @remarks
 * A <i>medium</i> identifies a hardware path of communication that exists within a single hardware device or between two devices. Register mediums if your filter is built on kernel streaming pins and needs to connect to other such filters.
 * 
 * This structure is equivalent to the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/kspin-medium-structure">KSPIN_MEDIUM</a> structure, which is used by kernel streaming drivers.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-regpinmedium
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class REGPINMEDIUM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * GUID that specifies the medium.
     * @type {Pointer<Guid>}
     */
    clsMedium {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Variable of type <b>DWORD</b> that specifies the instance of this medium. This is necessary when two identical devices are present on the host system.
     * @type {Integer}
     */
    dw1 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    dw2 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
