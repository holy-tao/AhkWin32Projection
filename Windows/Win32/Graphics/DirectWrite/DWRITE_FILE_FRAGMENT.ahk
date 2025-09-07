#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a range of bytes in a font file.
 * @remarks
 * DWRITE_FILE_FRAGMENT is passed as input to <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfilestream-begindownload">IDWriteRemoteFontFileStream::BeginDownload</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_file_fragment
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_FILE_FRAGMENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Starting offset of the fragment from the beginning of the file.
     * @type {Integer}
     */
    fileOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size of the file fragment, in bytes.
     * @type {Integer}
     */
    fragmentSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
