#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Specifies parameters for a Shell data source for which a filter is loaded.
 * @remarks
 * 
  * A filter, also known as a filter handler, is an implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface.
  * 
  * <b>FILTERED_DATA_SOURCES</b> can hold one file content identifier of each type. CLSIDs are always searched first, followed by the  file name extension, then MIME type, and finally the path.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//filtereg/ns-filtereg-filtered_data_sources
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class FILTERED_DATA_SOURCES extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to a buffer that contains a file name extension.
     * @type {PWSTR}
     */
    pwcsExtension{
        get {
            if(!this.HasProp("__pwcsExtension"))
                this.__pwcsExtension := PWSTR(this.ptr + 0)
            return this.__pwcsExtension
        }
    }

    /**
     * Pointer to a buffer that contains the name of a MIME type.
     * @type {PWSTR}
     */
    pwcsMime{
        get {
            if(!this.HasProp("__pwcsMime"))
                this.__pwcsMime := PWSTR(this.ptr + 8)
            return this.__pwcsMime
        }
    }

    /**
     * Pointer to a CLSID that identifies the content type.
     * @type {Pointer<Guid>}
     */
    pClsid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Not implemented.
     * @type {PWSTR}
     */
    pwcsOverride{
        get {
            if(!this.HasProp("__pwcsOverride"))
                this.__pwcsOverride := PWSTR(this.ptr + 24)
            return this.__pwcsOverride
        }
    }
}
