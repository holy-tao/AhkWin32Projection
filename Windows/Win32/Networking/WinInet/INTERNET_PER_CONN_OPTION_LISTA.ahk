#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERNET_PER_CONN_OPTIONA.ahk" { INTERNET_PER_CONN_OPTIONA }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

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
 * @charset ANSI
 */
export default struct INTERNET_PER_CONN_OPTION_LISTA {
    #StructPack 8

    /**
     * Size of the 
     * structure, in bytes.
     */
    dwSize : UInt32

    /**
     * Pointer to a string that contains the name of the RAS connection or <b>NULL</b>, which indicates the default or LAN connection, to set or query options on.
     */
    pszConnection : PSTR

    /**
     * Number of options to query or set.
     */
    dwOptionCount : UInt32

    /**
     * Options that failed, if an error occurs.
     */
    dwOptionError : UInt32

    /**
     * Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_per_conn_optiona">INTERNET_PER_CONN_OPTION</a> structures containing the options to query or set.
     */
    pOptions : INTERNET_PER_CONN_OPTIONA.Ptr

}
