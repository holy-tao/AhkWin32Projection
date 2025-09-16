#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains statistical data about an open storage, stream, or byte-array object.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-statstg
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class STATSTG extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * A pointer to a <b>NULL</b>-terminated Unicode string that contains the name. Space for this string is allocated by the method called and freed by the caller (for more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>). To  not return this member, specify the STATFLAG_NONAME value when you call a method that returns a 
     * <b>STATSTG</b> structure, except for calls to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatstg">IEnumSTATSTG::Next</a>, which provides no way to specify this value.
     * @type {Pointer<PWSTR>}
     */
    pwcsName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Indicates the type of storage object. This is one of the values from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-stgty">STGTY</a> enumeration.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the size, in bytes, of the stream or byte array.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Indicates the last modification time for this storage, stream, or byte array.
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
     * Indicates the creation time for this storage, stream, or byte array.
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
     * Indicates the last access time for this storage, stream, or byte array.
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
     * Indicates the access mode specified when the object was opened. This member is only valid in calls to 
     * <b>Stat</b> methods.
     * @type {Integer}
     */
    grfMode {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Indicates the types of region locking supported by the stream or byte array. For more information about the values available, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-locktype">LOCKTYPE</a> enumeration. This member is not used for storage objects.
     * @type {Integer}
     */
    grfLocksSupported {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Indicates the class identifier for the storage object; set to CLSID_NULL for new storage objects. This member is not used for streams or byte arrays.
     * @type {Pointer<Guid>}
     */
    clsid {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Indicates the current state bits of the storage object; that is, the value most recently set by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-setstatebits">IStorage::SetStateBits</a> method. This member is not valid for streams or byte arrays.
     * @type {Integer}
     */
    grfStateBits {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    reserved {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 72
    }
}
