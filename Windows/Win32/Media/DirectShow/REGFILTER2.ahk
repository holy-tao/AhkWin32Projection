#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The REGFILTER2 structure contains information for registering a filter.
 * @remarks
 * 
 * This structure is passed to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifiltermapper2-registerfilter">IFilterMapper2::RegisterFilter</a> method.
 * 
 * If you need to register pin mediums or pin categories, set <b>dwVersion</b> to 2 and use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regfilterpins2">REGFILTERPINS2</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-regfilter2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class REGFILTER2 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Filter registration format. If the value is 1, the union contains the first unnamed structure. If the value is 2, the union contains the second unnamed structure.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Filter merit. Filters with higher merit are enumerated first. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/merit">Merit</a>.
     * @type {Integer}
     */
    dwMerit {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    cPins {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<REGFILTERPINS>}
     */
    rgPins {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    cPins2 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<REGFILTERPINS2>}
     */
    rgPins2 {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
