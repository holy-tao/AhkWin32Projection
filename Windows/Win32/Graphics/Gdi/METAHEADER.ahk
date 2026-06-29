#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The METAHEADER structure contains information about a Windows-format metafile.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-metaheader
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct METAHEADER {
    #StructPack 4

    mtType : UInt16

    /**
     * The size, in words, of the metafile header.
     */
    mtHeaderSize : UInt16

    /**
     * The system version number. The version number for metafiles that support device-independent bitmaps (DIBs) is 0x0300. Otherwise, the version number is 0x0100.
     */
    mtVersion : UInt16

    /**
     * The size, in words, of the file.
     */
    mtSize : UInt32

    /**
     * The maximum number of objects that exist in the metafile at the same time.
     */
    mtNoObjects : UInt16

    /**
     * The size, in words, of the largest record in the metafile.
     */
    mtMaxRecord : UInt32

    /**
     * Reserved.
     */
    mtNoParameters : UInt16

}
