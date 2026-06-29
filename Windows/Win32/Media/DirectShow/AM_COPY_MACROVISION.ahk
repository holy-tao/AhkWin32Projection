#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AM_COPY_MACROVISION structure specifies the analog copy protection level for an NTSC encoder.
 * @remarks
 * The AM_PROPERTY_COPY_MACROVISION property of the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-copy-protection-property-set">DVD Copy Protection</a> property set uses this structure.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-am_copy_macrovision
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_COPY_MACROVISION {
    #StructPack 4

    /**
     * Analog copy protection level for the NTSC encoder. Member of the <a href="https://docs.microsoft.com/windows/desktop/api/dvdmedia/ne-dvdmedia-am_copy_macrovision_level">AM_COPY_MACROVISION_LEVEL</a> enumerated data type.
     */
    MACROVISIONLevel : UInt32

}
