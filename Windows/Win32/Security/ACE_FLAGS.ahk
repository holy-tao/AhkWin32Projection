#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class ACE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CONTAINER_INHERIT_ACE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FAILED_ACCESS_ACE_FLAG => 128

    /**
     * @type {Integer (UInt32)}
     */
    static INHERIT_ONLY_ACE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INHERITED_ACE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NO_PROPAGATE_INHERIT_ACE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OBJECT_INHERIT_ACE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUCCESSFUL_ACCESS_ACE_FLAG => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SUB_CONTAINERS_AND_OBJECTS_INHERIT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SUB_CONTAINERS_ONLY_INHERIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUB_OBJECTS_ONLY_INHERIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INHERIT_NO_PROPAGATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INHERIT_ONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NO_INHERITANCE => 0
}
