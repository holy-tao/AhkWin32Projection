#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The METARECORD structure contains a Windows-format metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-metarecord
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct METARECORD {
    #StructPack 4

    /**
     * The size, in words, of the record.
     */
    rdSize : UInt32

    /**
     * The function number.
     */
    rdFunction : UInt16

    /**
     * An array of words containing the function parameters, in reverse of the order they are passed to the function.
     */
    rdParm : UInt16[1]

}
