#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains both the data and header information.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
  * <div> </div>
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The wininet.h header defines INTERNET_BUFFERS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wininet/ns-wininet-internet_buffersa
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 * @charset ANSI
 */
class INTERNET_BUFFERSA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Size of the 
     * structure, in bytes.
     * @type {Integer}
     */
    dwStructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the next 
     * <b>INTERNET_BUFFERS</b> structure.
     * @type {Pointer<INTERNET_BUFFERSA>}
     */
    Next {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a string value that contains the headers. This member can be <b>NULL</b>.
     * @type {Pointer<Byte>}
     */
    lpcszHeader {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Size of the headers, in <b>TCHARs</b>, if 
     * <b>lpcszHeader</b> is not <b>NULL</b>.
     * @type {Integer}
     */
    dwHeadersLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Size of the headers, if there is not enough memory in the buffer.
     * @type {Integer}
     */
    dwHeadersTotal {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Pointer to the data buffer.
     * @type {Pointer<Void>}
     */
    lpvBuffer {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Size of the buffer, in bytes, if 
     * <b>lpvBuffer</b> is not <b>NULL</b>.
     * @type {Integer}
     */
    dwBufferLength {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Total size of the resource, in bytes.
     * @type {Integer}
     */
    dwBufferTotal {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    dwOffsetLow {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    dwOffsetHigh {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
