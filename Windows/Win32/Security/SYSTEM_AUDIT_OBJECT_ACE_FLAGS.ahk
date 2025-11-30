#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SYSTEM_AUDIT_OBJECT_ACE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static ACE_OBJECT_TYPE_PRESENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACE_INHERITED_OBJECT_TYPE_PRESENT => 2
}
