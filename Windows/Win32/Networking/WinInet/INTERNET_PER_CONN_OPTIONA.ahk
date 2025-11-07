#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains the value of an option.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wininet/ns-wininet-internet_per_conn_optiona
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 * @charset ANSI
 */
class INTERNET_PER_CONN_OPTIONA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwOption {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwValue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {PSTR}
     */
    pszValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {FILETIME}
     */
    ftValue{
        get {
            if(!this.HasProp("__ftValue"))
                this.__ftValue := FILETIME(8, this)
            return this.__ftValue
        }
    }
}
