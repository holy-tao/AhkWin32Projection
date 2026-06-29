#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DSMCC_FILTER_OPTIONS.ahk" { DSMCC_FILTER_OPTIONS }
#Import ".\ATSC_FILTER_OPTIONS.ahk" { ATSC_FILTER_OPTIONS }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DVB_EIT_FILTER_OPTIONS.ahk" { DVB_EIT_FILTER_OPTIONS }

/**
 * The MPEG2_FILTER2 structure specifies criteria for matching MPEG-2 section headers.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg2_filter2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MPEG2_FILTER2 {
    #StructPack 4

    bVersionNumber : Int8

    wFilterSize : UInt16

    fUseRawFilteringBits : BOOL

    Filter : Int8[16]

    Mask : Int8[16]

    fSpecifyTableIdExtension : BOOL

    TableIdExtension : UInt16

    fSpecifyVersion : BOOL

    Version : Int8

    fSpecifySectionNumber : BOOL

    SectionNumber : Int8

    fSpecifyCurrentNext : BOOL

    fNext : BOOL

    fSpecifyDsmccOptions : BOOL

    Dsmcc : DSMCC_FILTER_OPTIONS

    fSpecifyAtscOptions : BOOL

    Atsc : ATSC_FILTER_OPTIONS

    /**
     * If <b>TRUE</b>, the <b>Dvb_Eit</b> member contains additional filtering criteria. Otherwise, the <b>Dvb_Eit</b> member is ignored. <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     */
    fSpecifyDvbEitOptions : BOOL

    /**
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-dvb_eit_filter_options">DVB_EIT_FILTER_OPTIONS</a> structure that contains additional filtering criteria. 
     * 
     * 
     * 
     *           
     * 
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     */
    DvbEit : DVB_EIT_FILTER_OPTIONS

    static __New() {
        DefineProp(this.Prototype, 'bVersion1Bytes', { type: Int8[124], offset: 0 })
        this.DeleteProp("__New")
    }
}
