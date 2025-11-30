#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DS_MANGLE_FOR enumeration is used to define whether a relative distinguished name is mangled (encoded) and in what form the mangling occurs.
 * @see https://docs.microsoft.com/windows/win32/api//dsparse/ne-dsparse-ds_mangle_for
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_MANGLE_FOR extends Win32Enum{

    /**
     * Indicates that the relative distinguished name is  not mangled or that the type of mangling is 
     *       unknown.
     * @type {Integer (Int32)}
     */
    static DS_MANGLE_UNKNOWN => 0

    /**
     * Indicates that the relative distinguished name has been mangled for deletion.
     * @type {Integer (Int32)}
     */
    static DS_MANGLE_OBJECT_RDN_FOR_DELETION => 1

    /**
     * Indicates that the relative distinguished name has been mangled due to a naming conflict.
     * @type {Integer (Int32)}
     */
    static DS_MANGLE_OBJECT_RDN_FOR_NAME_CONFLICT => 2
}
