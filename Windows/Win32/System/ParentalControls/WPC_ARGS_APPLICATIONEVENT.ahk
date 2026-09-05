#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_APPLICATIONEVENT extends Win32Enum {

    /**
     * Native name: WPC_ARGS_APPLICATIONEVENT_SERIALIZEDAPPLICATION
     * @type {Integer (Int32)}
     */
    static SERIALIZEDAPPLICATION => 0

    /**
     * Native name: WPC_ARGS_APPLICATIONEVENT_DECISION
     * @type {Integer (Int32)}
     */
    static DECISION => 1

    /**
     * Native name: WPC_ARGS_APPLICATIONEVENT_PROCESSID
     * @type {Integer (Int32)}
     */
    static PROCESSID => 2

    /**
     * Native name: WPC_ARGS_APPLICATIONEVENT_CREATIONTIME
     * @type {Integer (Int32)}
     */
    static CREATIONTIME => 3

    /**
     * Native name: WPC_ARGS_APPLICATIONEVENT_TIMEUSED
     * @type {Integer (Int32)}
     */
    static TIMEUSED => 4

    /**
     * Native name: WPC_ARGS_APPLICATIONEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 5
}
