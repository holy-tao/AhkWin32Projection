#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains both the data and header information. (ANSI)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines INTERNET_BUFFERS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-internet_buffersa
 * @namespace Windows.Win32.Networking.WinInet
 * @charset ANSI
 */
export default struct INTERNET_BUFFERSA {
    #StructPack 8

    /**
     * Size of the 
     * structure, in bytes.
     */
    dwStructSize : UInt32

    /**
     * Pointer to the next 
     * <b>INTERNET_BUFFERS</b> structure.
     */
    Next : INTERNET_BUFFERSA.Ptr

    /**
     * Pointer to a string value that contains the headers. This member can be <b>NULL</b>.
     */
    lpcszHeader : PSTR

    /**
     * Size of the headers, in <b>TCHARs</b>, if 
     * <b>lpcszHeader</b> is not <b>NULL</b>.
     */
    dwHeadersLength : UInt32

    /**
     * Size of the headers, if there is not enough memory in the buffer.
     */
    dwHeadersTotal : UInt32

    /**
     * Pointer to the data buffer.
     */
    lpvBuffer : IntPtr

    /**
     * Size of the buffer, in bytes, if 
     * <b>lpvBuffer</b> is not <b>NULL</b>.
     */
    dwBufferLength : UInt32

    /**
     * Total size of the resource, in bytes.
     */
    dwBufferTotal : UInt32

    /**
     * Reserved; do not use.
     */
    dwOffsetLow : UInt32

    /**
     * Reserved; do not use.
     */
    dwOffsetHigh : UInt32

}
