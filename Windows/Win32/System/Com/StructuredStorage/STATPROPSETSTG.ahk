#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\FILETIME.ahk

/**
 * The STATPROPSETSTG structure contains information about a property set. (STATPROPSETSTG structure)
 * @see https://learn.microsoft.com/windows/win32/api/propidlbase/ns-propidlbase-statpropsetstg
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class STATPROPSETSTG extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * FMTID of the current property set, specified when the property set was initially created.
     * @type {Pointer<Guid>}
     */
    fmtid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * <b>CLSID</b> associated with this property set, specified when the property set was initially created and possibly modified thereafter with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-setclass">IPropertyStorage::SetClass</a>. If not set, the value will be <b>CLSID_NULL</b>.
     * @type {Pointer<Guid>}
     */
    clsid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Flag values of the property set, as specified in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertysetstorage-create">IPropertySetStorage::Create</a>.
     * @type {Integer}
     */
    grfFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Time in Universal Coordinated Time (UTC) when the property set was last modified.
     * @type {FILETIME}
     */
    mtime{
        get {
            if(!this.HasProp("__mtime"))
                this.__mtime := FILETIME(this.ptr + 24)
            return this.__mtime
        }
    }

    /**
     * Time in UTC when this property set was created.
     * @type {FILETIME}
     */
    ctime{
        get {
            if(!this.HasProp("__ctime"))
                this.__ctime := FILETIME(this.ptr + 32)
            return this.__ctime
        }
    }

    /**
     * Time in UTC when this property set was last accessed.
     * @type {FILETIME}
     */
    atime{
        get {
            if(!this.HasProp("__atime"))
                this.__atime := FILETIME(this.ptr + 40)
            return this.__atime
        }
    }

    /**
     * 
     * @type {Integer}
     */
    dwOSVersion {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
