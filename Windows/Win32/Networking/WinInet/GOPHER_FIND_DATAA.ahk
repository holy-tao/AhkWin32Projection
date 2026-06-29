#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GOPHER_TYPE.ahk" { GOPHER_TYPE }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains information retrieved by the GopherFindFirstFile and InternetFindNextFile functions. (ANSI)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines GOPHER_FIND_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-gopher_find_dataa
 * @namespace Windows.Win32.Networking.WinInet
 * @charset ANSI
 */
export default struct GOPHER_FIND_DATAA {
    #StructPack 4

    /**
     * Friendly name of an object. An application can display this string to allow the user to select the object.
     */
    DisplayString : CHAR[129]

    GopherType : GOPHER_TYPE

    /**
     * Low 32 bits of the file size.
     */
    SizeLow : UInt32

    /**
     * High 32 bits of the file size.
     */
    SizeHigh : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time when the file was last modified.
     */
    LastModificationTime : FILETIME

    /**
     * File locator. An application can pass the locator string to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopheropenfilea">GopherOpenFile</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopherfindfirstfilea">GopherFindFirstFile</a>.
     */
    Locator : CHAR[654]

}
