#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\STGM.ahk" { STGM }

/**
 * Contains statistical data about an open storage, stream, or byte-array object.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-statstg
 * @namespace Windows.Win32.System.Com
 */
export default struct STATSTG {
    #StructPack 8

    /**
     * A pointer to a <b>NULL</b>-terminated Unicode string that contains the name. Space for this string is allocated by the method called and freed by the caller (for more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>). To  not return this member, specify the STATFLAG_NONAME value when you call a method that returns a 
     * <b>STATSTG</b> structure, except for calls to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatstg">IEnumSTATSTG::Next</a>, which provides no way to specify this value.
     */
    pwcsName : PWSTR

    /**
     * Indicates the type of storage object. This is one of the values from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-stgty">STGTY</a> enumeration.
     */
    type : UInt32

    /**
     * Specifies the size, in bytes, of the stream or byte array.
     */
    cbSize : Int64 := this.Size

    /**
     * Indicates the last modification time for this storage, stream, or byte array.
     */
    mtime : FILETIME

    /**
     * Indicates the creation time for this storage, stream, or byte array.
     */
    ctime : FILETIME

    /**
     * Indicates the last access time for this storage, stream, or byte array.
     */
    atime : FILETIME

    /**
     * Indicates the access mode specified when the object was opened. This member is only valid in calls to 
     * <b>Stat</b> methods.
     */
    grfMode : STGM

    /**
     * Indicates the types of region locking supported by the stream or byte array. For more information about the values available, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-locktype">LOCKTYPE</a> enumeration. This member is not used for storage objects.
     */
    grfLocksSupported : UInt32

    /**
     * Indicates the class identifier for the storage object; set to CLSID_NULL for new storage objects. This member is not used for streams or byte arrays.
     */
    clsid : Guid

    /**
     * Indicates the current state bits of the storage object; that is, the value most recently set by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-setstatebits">IStorage::SetStateBits</a> method. This member is not valid for streams or byte arrays.
     */
    grfStateBits : UInt32

    /**
     * Reserved for future use.
     */
    reserved : UInt32

}
