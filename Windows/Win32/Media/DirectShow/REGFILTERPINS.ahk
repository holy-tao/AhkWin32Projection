#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\REGPINTYPES.ahk" { REGPINTYPES }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The REGFILTERPINS structure contains pin information for registering a filter.
 * @remarks
 * This structure is used in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifiltermapper2">IFilterMapper2</a> interface for filter registration. If you use this structure, set the <b>dwVersion</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regfilter2">REGFILTER2</a> structure to 1. If you need to register a medium or pin category for the pin, use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regfilterpins2">REGFILTERPINS2</a> structure instead. In that case, set the <b>REGFILTER2</b> structure's <b>dwVersion</b> member to 2.
 * 
 * The equivalent <b>AMOVIESETUP_PIN</b> type is used in class factory templates (<a href="https://docs.microsoft.com/windows/desktop/DirectShow/cfactorytemplate">CFactoryTemplate</a>).
 * 
 * The <b>strName</b>, <b>clsConnectsToFilter</b>, and <b>strConnectsToPin</b> members are obsolete. Their values are not added to the registry.
 * 
 * For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/how-to-register-directshow-filters">How to Register DirectShow Filters</a>.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-regfilterpins
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct REGFILTERPINS {
    #StructPack 8

    /**
     * Name of the pin. (Obsolete.)
     */
    strName : PWSTR

    /**
     * If <b>TRUE</b>, the filter renders the input from this pin. (Applies only to input pins. For output pins, the value is always <b>FALSE</b>.)
     */
    bRendered : BOOL

    /**
     * If <b>TRUE</b>, this pin is an output pin. Otherwise, the pin is an input pin.
     */
    bOutput : BOOL

    /**
     * If <b>TRUE</b>, the filter can have zero instances of this pin.
     */
    bZero : BOOL

    /**
     * If <b>TRUE</b>, the filter can create more than one instance of this type of pin.
     */
    bMany : BOOL

    /**
     * Class identifier (CLSID) of the filter to which this pin connects. (Obsolete.)
     */
    clsConnectsToFilter : Guid.Ptr

    /**
     * Name of the pin to which this pin connects. (Obsolete.)
     */
    strConnectsToPin : PWSTR

    /**
     * Number of media types supported by this pin.
     */
    nMediaTypes : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regpintypes">REGPINTYPES</a> structures, of size <b>nMediaTypes</b>.
     */
    lpMediaType : REGPINTYPES.Ptr

}
