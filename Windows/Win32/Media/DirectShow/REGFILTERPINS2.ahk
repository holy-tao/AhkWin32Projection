#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\REGPINMEDIUM.ahk" { REGPINMEDIUM }
#Import ".\REGPINTYPES.ahk" { REGPINTYPES }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The REGFILTERPINS2 structure contains information for registering a filter through the IFilterMapper2 interface.
 * @remarks
 * If you use this structure, set the <b>dwVersion</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regfilter2">REGFILTER2</a> structure to 2.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-regfilterpins2
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct REGFILTERPINS2 {
    #StructPack 8

    /**
     * Bitwise combination of zero or more <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd377518(v=vs.85)">REG_PINFLAG</a> flags.
     */
    dwFlags : UInt32

    /**
     * Number of instances of this pin.
     */
    cInstances : UInt32

    /**
     * Number of media types supported by this pin.
     */
    nMediaTypes : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regpintypes">REGPINTYPES</a> structures, of size nMediaTypes.
     */
    lpMediaType : REGPINTYPES.Ptr

    /**
     * Number of mediums. Can be zero.
     */
    nMediums : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regpinmedium">REGPINMEDIUM</a> structures, of size nMediums.
     */
    lpMedium : REGPINMEDIUM.Ptr

    /**
     * Optional pin category, from the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/pin-property-set">Pin Property Set</a>.
     */
    clsPinCategory : Guid.Ptr

}
