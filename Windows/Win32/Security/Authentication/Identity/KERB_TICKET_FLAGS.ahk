#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_TICKET_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TICKET_FLAGS_forwardable => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TICKET_FLAGS_forwarded => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TICKET_FLAGS_hw_authent => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TICKET_FLAGS_initial => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TICKET_FLAGS_invalid => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TICKET_FLAGS_may_postdate => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TICKET_FLAGS_ok_as_delegate => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TICKET_FLAGS_postdated => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TICKET_FLAGS_pre_authent => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TICKET_FLAGS_proxiable => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TICKET_FLAGS_proxy => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TICKET_FLAGS_renewable => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TICKET_FLAGS_reserved => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TICKET_FLAGS_reserved1 => 1
}
