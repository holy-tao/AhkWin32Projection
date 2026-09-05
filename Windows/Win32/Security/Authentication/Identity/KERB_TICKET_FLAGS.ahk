#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class KERB_TICKET_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: KERB_TICKET_FLAGS_forwardable
     * @type {Integer (UInt32)}
     */
    static forwardable => 1073741824

    /**
     * Native name: KERB_TICKET_FLAGS_forwarded
     * @type {Integer (UInt32)}
     */
    static forwarded => 536870912

    /**
     * Native name: KERB_TICKET_FLAGS_hw_authent
     * @type {Integer (UInt32)}
     */
    static hw_authent => 1048576

    /**
     * Native name: KERB_TICKET_FLAGS_initial
     * @type {Integer (UInt32)}
     */
    static initial => 4194304

    /**
     * Native name: KERB_TICKET_FLAGS_invalid
     * @type {Integer (UInt32)}
     */
    static invalid => 16777216

    /**
     * Native name: KERB_TICKET_FLAGS_may_postdate
     * @type {Integer (UInt32)}
     */
    static may_postdate => 67108864

    /**
     * Native name: KERB_TICKET_FLAGS_ok_as_delegate
     * @type {Integer (UInt32)}
     */
    static ok_as_delegate => 262144

    /**
     * Native name: KERB_TICKET_FLAGS_postdated
     * @type {Integer (UInt32)}
     */
    static postdated => 33554432

    /**
     * Native name: KERB_TICKET_FLAGS_pre_authent
     * @type {Integer (UInt32)}
     */
    static pre_authent => 2097152

    /**
     * Native name: KERB_TICKET_FLAGS_proxiable
     * @type {Integer (UInt32)}
     */
    static proxiable => 268435456

    /**
     * Native name: KERB_TICKET_FLAGS_proxy
     * @type {Integer (UInt32)}
     */
    static proxy => 134217728

    /**
     * Native name: KERB_TICKET_FLAGS_renewable
     * @type {Integer (UInt32)}
     */
    static renewable => 8388608

    /**
     * Native name: KERB_TICKET_FLAGS_reserved
     * @type {Integer (UInt32)}
     */
    static reserved => 2147483648

    /**
     * Native name: KERB_TICKET_FLAGS_reserved1
     * @type {Integer (UInt32)}
     */
    static reserved1 => 1
}
