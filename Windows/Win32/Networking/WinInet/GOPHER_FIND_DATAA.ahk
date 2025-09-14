#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

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
 * @version v4.0.30319
 * @charset ANSI
 */
class GOPHER_FIND_DATAA extends Win32Struct
{
    static sizeof => 808

    static packingSize => 8

    /**
     * Friendly name of an object. An application can display this string to allow the user to select the object.
     * @type {Array<SByte>}
     */
    DisplayString{
        get {
            if(!this.HasProp("__DisplayStringProxyArray"))
                this.__DisplayStringProxyArray := Win32FixedArray(this.ptr + 0, 129, Primitive, "char")
            return this.__DisplayStringProxyArray
        }
    }

    /**
     * 
     * @type {Integer}
     */
    GopherType {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * Low 32 bits of the file size.
     * @type {Integer}
     */
    SizeLow {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * High 32 bits of the file size.
     * @type {Integer}
     */
    SizeHigh {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time when the file was last modified.
     * @type {FILETIME}
     */
    LastModificationTime{
        get {
            if(!this.HasProp("__LastModificationTime"))
                this.__LastModificationTime := FILETIME(this.ptr + 144)
            return this.__LastModificationTime
        }
    }

    /**
     * File locator. An application can pass the locator string to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopheropenfilea">GopherOpenFile</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopherfindfirstfilea">GopherFindFirstFile</a>.
     * @type {Array<SByte>}
     */
    Locator{
        get {
            if(!this.HasProp("__LocatorProxyArray"))
                this.__LocatorProxyArray := Win32FixedArray(this.ptr + 152, 654, Primitive, "char")
            return this.__LocatorProxyArray
        }
    }
}
