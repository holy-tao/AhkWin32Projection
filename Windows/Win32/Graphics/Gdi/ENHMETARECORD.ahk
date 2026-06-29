#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The ENHMETARECORD structure contains data that describes a graphics device interface (GDI) function used to create part of a picture in an enhanced-format metafile.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-enhmetarecord
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct ENHMETARECORD {
    #StructPack 4

    /**
     * The record type.
     */
    iType : ENHANCED_METAFILE_RECORD_TYPE

    /**
     * The size of the record, in bytes.
     */
    nSize : UInt32

    /**
     * An array of parameters passed to the GDI function identified by the record.
     */
    dParm : UInt32[1]

}
