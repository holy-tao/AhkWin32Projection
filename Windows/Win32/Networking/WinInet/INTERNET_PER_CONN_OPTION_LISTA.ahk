#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the list of options for a particular Internet connection. (ANSI)
 * @remarks
 * In Microsoft Internet Explorer 5, only the ANSI versions of 
  * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetqueryoptiona">InternetQueryOption</a> and 
  * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetoptiona">InternetSetOption</a> will work with the 
  * <b>INTERNET_PER_CONN_OPTION_LIST</b> structure. The Unicode versions will support using the 
  * <b>INTERNET_PER_CONN_OPTION_LIST</b> structure in later versions of Internet Explorer.
  * 
  * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
  * <div> </div>
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The wininet.h header defines INTERNET_PER_CONN_OPTION_LIST as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-internet_per_conn_option_lista
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 * @charset ANSI
 */
class INTERNET_PER_CONN_OPTION_LISTA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Size of the 
     * structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a string that contains the name of the RAS connection or <b>NULL</b>, which indicates the default or LAN connection, to set or query options on.
     * @type {Pointer<PSTR>}
     */
    pszConnection {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Number of options to query or set.
     * @type {Integer}
     */
    dwOptionCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Options that failed, if an error occurs.
     * @type {Integer}
     */
    dwOptionError {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_per_conn_optiona">INTERNET_PER_CONN_OPTION</a> structures containing the options to query or set.
     * @type {Pointer<INTERNET_PER_CONN_OPTIONA>}
     */
    pOptions {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
