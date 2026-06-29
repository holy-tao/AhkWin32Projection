#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The REGPINMEDIUM structure describes a pin medium for registration through the IFilterMapper2 interface.
 * @remarks
 * A <i>medium</i> identifies a hardware path of communication that exists within a single hardware device or between two devices. Register mediums if your filter is built on kernel streaming pins and needs to connect to other such filters.
 * 
 * This structure is equivalent to the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/kspin-medium-structure">KSPIN_MEDIUM</a> structure, which is used by kernel streaming drivers.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-regpinmedium
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct REGPINMEDIUM {
    #StructPack 4

    /**
     * GUID that specifies the medium.
     */
    clsMedium : Guid

    /**
     * Variable of type <b>DWORD</b> that specifies the instance of this medium. This is necessary when two identical devices are present on the host system.
     */
    dw1 : UInt32

    /**
     * Not used.
     */
    dw2 : UInt32

}
