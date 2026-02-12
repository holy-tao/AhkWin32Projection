#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The REGFILTER2 structure contains information for registering a filter.
 * @remarks
 * This structure is passed to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifiltermapper2-registerfilter">IFilterMapper2::RegisterFilter</a> method.
 * 
 * If you need to register pin mediums or pin categories, set <b>dwVersion</b> to 2 and use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regfilterpins2">REGFILTERPINS2</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/ns-strmif-regfilter2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class REGFILTER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    Clsid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    Name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
