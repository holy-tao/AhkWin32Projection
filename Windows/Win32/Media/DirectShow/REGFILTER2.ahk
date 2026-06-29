#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\REGFILTERPINS.ahk" { REGFILTERPINS }
#Import ".\REGFILTERPINS2.ahk" { REGFILTERPINS2 }

/**
 * The REGFILTER2 structure contains information for registering a filter.
 * @remarks
 * This structure is passed to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifiltermapper2-registerfilter">IFilterMapper2::RegisterFilter</a> method.
 * 
 * If you need to register pin mediums or pin categories, set <b>dwVersion</b> to 2 and use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regfilterpins2">REGFILTERPINS2</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-regfilter2
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct REGFILTER2 {
    #StructPack 8

    /**
     * Filter registration format. If the value is 1, the union contains the first unnamed structure. If the value is 2, the union contains the second unnamed structure.
     */
    dwVersion : UInt32

    /**
     * Filter merit. Filters with higher merit are enumerated first. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/merit">Merit</a>.
     */
    dwMerit : UInt32

    cPins : UInt32

    rgPins : REGFILTERPINS.Ptr

    static __New() {
        DefineProp(this.Prototype, 'cPins2', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'rgPins2', { type: REGFILTERPINS2.Ptr, offset: 16 })
        this.DeleteProp("__New")
    }
}
