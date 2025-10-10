#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The REGFILTERPINS2 structure contains information for registering a filter through the IFilterMapper2 interface.
 * @remarks
 * 
  * If you use this structure, set the <b>dwVersion</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regfilter2">REGFILTER2</a> structure to 2.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-regfilterpins2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class REGFILTERPINS2 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Bitwise combination of zero or more <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd377518(v=vs.85)">REG_PINFLAG</a> flags.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of instances of this pin.
     * @type {Integer}
     */
    cInstances {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Number of media types supported by this pin.
     * @type {Integer}
     */
    nMediaTypes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regpintypes">REGPINTYPES</a> structures, of size nMediaTypes.
     * @type {Pointer<REGPINTYPES>}
     */
    lpMediaType {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Number of mediums. Can be zero.
     * @type {Integer}
     */
    nMediums {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regpinmedium">REGPINMEDIUM</a> structures, of size nMediums.
     * @type {Pointer<REGPINMEDIUM>}
     */
    lpMedium {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Optional pin category, from the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/pin-property-set">Pin Property Set</a>.
     * @type {Pointer<Guid>}
     */
    clsPinCategory {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
