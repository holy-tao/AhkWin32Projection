#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security
 */
class SYSTEM_AUDIT_OBJECT_ACE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: ACE_OBJECT_TYPE_PRESENT
     * @type {Integer (UInt32)}
     */
    static OBJECT_TYPE_PRESENT => 1

    /**
     * Native name: ACE_INHERITED_OBJECT_TYPE_PRESENT
     * @type {Integer (UInt32)}
     */
    static INHERITED_OBJECT_TYPE_PRESENT => 2
}
