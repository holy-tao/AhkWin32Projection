#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERNET_PER_CONN.ahk" { INTERNET_PER_CONN }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains the value of an option. (ANSI)
 * @remarks
 * In Internet Explorer 5, only the ANSI versions of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetqueryoptiona">InternetQueryOption</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetoptiona">InternetSetOption</a> will work with the 
 * <b>INTERNET_PER_CONN_OPTION</b> structure. The Unicode versions will support the 
 * <b>INTERNET_PER_CONN_OPTION</b> structure in later versions of Internet Explorer.
 * 
 * For queries that return strings, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetqueryoptiona">InternetQueryOption</a> allocates the memory for the 
 * <b>pszValue</b> member of the structure. The calling application must free this memory using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalfree">GlobalFree</a> function when it has finished using the string.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines INTERNET_PER_CONN_OPTION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-internet_per_conn_optiona
 * @namespace Windows.Win32.Networking.WinInet
 * @charset ANSI
 */
export default struct INTERNET_PER_CONN_OPTIONA {
    #StructPack 8


    struct _Value {
        dwValue : UInt32

        static __New() {
            DefineProp(this.Prototype, 'pszValue', { type: PSTR, offset: 0 })
            DefineProp(this.Prototype, 'ftValue', { type: FILETIME, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    dwOption : INTERNET_PER_CONN

    /**
     * Union that contains the value for the option. It can be any one of the following types depending on the value of 
     * <b>dwOption</b>:
     */
    Value : INTERNET_PER_CONN_OPTIONA._Value

}
