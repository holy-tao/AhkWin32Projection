#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicate whether the method should try to return a name in the pwcsName member of the STATSTG structure.
 * @see https://docs.microsoft.com/windows/win32/api//wtypes/ne-wtypes-statflag
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class STATFLAG extends Win32Enum{

    /**
     * Requests that the statistics include the <b>pwcsName</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structure.
     * @type {Integer (Int32)}
     */
    static STATFLAG_DEFAULT => 0

    /**
     * Requests that the statistics not include the <b>pwcsName</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structure. If the name is omitted, there is no need for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ilockbytes-stat">ILockBytes::Stat</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-stat">IStorage::Stat</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">IStream::Stat</a> methods methods to allocate and free memory for the string value of the name, therefore the method reduces time and resources used in an allocation and free operation.
     * @type {Integer (Int32)}
     */
    static STATFLAG_NONAME => 1

    /**
     * Not implemented.
     * @type {Integer (Int32)}
     */
    static STATFLAG_NOOPEN => 2
}
