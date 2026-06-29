#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PSINJECT_POINT.ahk" { PSINJECT_POINT }

/**
 * The PSINJECTDATA structure is a header for the input buffer used with the POSTSCRIPT_INJECTION printer escape function.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-psinjectdata
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct PSINJECTDATA {
    #StructPack 4

    /**
     * The number of bytes of raw data to be injected. The raw data begins immediately following this structure. This size does not include the size of the <b>PSINJECTDATA</b> structure.
     */
    DataBytes : UInt32

    InjectionPoint : PSINJECT_POINT

    /**
     * The page number (starting from 1) to which the injection data is applied. Specify zero to apply the injection data to all pages. This member is meaningful only for page level injection points starting from PSINJECT_PAGENUMBER. For other injection points, set <b>PageNumber</b> to zero.
     */
    PageNumber : UInt16

}
