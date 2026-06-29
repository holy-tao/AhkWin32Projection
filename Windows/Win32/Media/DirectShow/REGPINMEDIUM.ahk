#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The REGPINMEDIUM structure describes a pin medium for registration through the IFilterMapper2 interface.
 * @remarks
 * A <i>medium</i> identifies a hardware path of communication that exists within a single hardware device or between two devices. Register mediums if your filter is built on kernel streaming pins and needs to connect to other such filters.
 * 
 * This structure is equivalent to the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/kspin-medium-structure">KSPIN_MEDIUM</a> structure, which is used by kernel streaming drivers.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-regpinmedium
 * @namespace Windows.Win32.Media.DirectShow
 */
class REGPINMEDIUM extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * GUID that specifies the medium.
     * @type {Guid}
     */
    clsMedium {
        get {
            if(!this.HasProp("__clsMedium"))
                this.__clsMedium := Guid(0, this)
            return this.__clsMedium
        }
    }

    /**
     * Variable of type <b>DWORD</b> that specifies the instance of this medium. This is necessary when two identical devices are present on the host system.
     * @type {Integer}
     */
    dw1 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    dw2 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
