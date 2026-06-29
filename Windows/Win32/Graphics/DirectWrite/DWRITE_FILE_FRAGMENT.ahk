#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a range of bytes in a font file.
 * @remarks
 * DWRITE_FILE_FRAGMENT is passed as input to <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfilestream-begindownload">IDWriteRemoteFontFileStream::BeginDownload</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_file_fragment
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_FILE_FRAGMENT {
    #StructPack 8

    /**
     * Starting offset of the fragment from the beginning of the file.
     */
    fileOffset : Int64

    /**
     * Size of the file fragment, in bytes.
     */
    fragmentSize : Int64

}
