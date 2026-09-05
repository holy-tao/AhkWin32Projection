#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class EMBDHLP_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: EMBDHLP_INPROC_HANDLER
     * @type {Integer (UInt32)}
     */
    static INPROC_HANDLER => 0

    /**
     * Native name: EMBDHLP_INPROC_SERVER
     * @type {Integer (UInt32)}
     */
    static INPROC_SERVER => 1

    /**
     * Native name: EMBDHLP_CREATENOW
     * @type {Integer (UInt32)}
     */
    static CREATENOW => 0

    /**
     * Native name: EMBDHLP_DELAYCREATE
     * @type {Integer (UInt32)}
     */
    static DELAYCREATE => 65536
}
