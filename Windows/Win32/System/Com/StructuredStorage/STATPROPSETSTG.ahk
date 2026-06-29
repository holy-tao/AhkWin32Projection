#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\FILETIME.ahk

/**
 * The STATPROPSETSTG structure contains information about a property set. (STATPROPSETSTG structure)
 * @see https://learn.microsoft.com/windows/win32/api/propidlbase/ns-propidlbase-statpropsetstg
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
class STATPROPSETSTG extends Win32Struct {
    static sizeof => 64

    static packingSize => 4

    /**
     * FMTID of the current property set, specified when the property set was initially created.
     * @type {Guid}
     */
    fmtid {
        get {
            if(!this.HasProp("__fmtid"))
                this.__fmtid := Guid(0, this)
            return this.__fmtid
        }
    }

    /**
     * <b>CLSID</b> associated with this property set, specified when the property set was initially created and possibly modified thereafter with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-setclass">IPropertyStorage::SetClass</a>. If not set, the value will be <b>CLSID_NULL</b>.
     * @type {Guid}
     */
    clsid {
        get {
            if(!this.HasProp("__clsid"))
                this.__clsid := Guid(16, this)
            return this.__clsid
        }
    }

    /**
     * Flag values of the property set, as specified in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertysetstorage-create">IPropertySetStorage::Create</a>.
     * @type {Integer}
     */
    grfFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Time in Universal Coordinated Time (UTC) when the property set was last modified.
     * @type {FILETIME}
     */
    mtime {
        get {
            if(!this.HasProp("__mtime"))
                this.__mtime := FILETIME(36, this)
            return this.__mtime
        }
    }

    /**
     * Time in UTC when this property set was created.
     * @type {FILETIME}
     */
    ctime {
        get {
            if(!this.HasProp("__ctime"))
                this.__ctime := FILETIME(44, this)
            return this.__ctime
        }
    }

    /**
     * Time in UTC when this property set was last accessed.
     * @type {FILETIME}
     */
    atime {
        get {
            if(!this.HasProp("__atime"))
                this.__atime := FILETIME(52, this)
            return this.__atime
        }
    }

    /**
     * @type {Integer}
     */
    dwOSVersion {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }
}
