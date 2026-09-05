#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsLmOperation extends Win32Enum {

    /**
     * Native name: NTMS_LM_REMOVE
     * @type {Integer (Int32)}
     */
    static REMOVE => 0

    /**
     * Native name: NTMS_LM_DISABLECHANGER
     * @type {Integer (Int32)}
     */
    static DISABLECHANGER => 1

    /**
     * Native name: NTMS_LM_DISABLELIBRARY
     * @type {Integer (Int32)}
     */
    static DISABLELIBRARY => 1

    /**
     * Native name: NTMS_LM_ENABLECHANGER
     * @type {Integer (Int32)}
     */
    static ENABLECHANGER => 2

    /**
     * Native name: NTMS_LM_ENABLELIBRARY
     * @type {Integer (Int32)}
     */
    static ENABLELIBRARY => 2

    /**
     * Native name: NTMS_LM_DISABLEDRIVE
     * @type {Integer (Int32)}
     */
    static DISABLEDRIVE => 3

    /**
     * Native name: NTMS_LM_ENABLEDRIVE
     * @type {Integer (Int32)}
     */
    static ENABLEDRIVE => 4

    /**
     * Native name: NTMS_LM_DISABLEMEDIA
     * @type {Integer (Int32)}
     */
    static DISABLEMEDIA => 5

    /**
     * Native name: NTMS_LM_ENABLEMEDIA
     * @type {Integer (Int32)}
     */
    static ENABLEMEDIA => 6

    /**
     * Native name: NTMS_LM_UPDATEOMID
     * @type {Integer (Int32)}
     */
    static UPDATEOMID => 7

    /**
     * Native name: NTMS_LM_INVENTORY
     * @type {Integer (Int32)}
     */
    static INVENTORY => 8

    /**
     * Native name: NTMS_LM_DOORACCESS
     * @type {Integer (Int32)}
     */
    static DOORACCESS => 9

    /**
     * Native name: NTMS_LM_EJECT
     * @type {Integer (Int32)}
     */
    static EJECT => 10

    /**
     * Native name: NTMS_LM_EJECTCLEANER
     * @type {Integer (Int32)}
     */
    static EJECTCLEANER => 11

    /**
     * Native name: NTMS_LM_INJECT
     * @type {Integer (Int32)}
     */
    static INJECT => 12

    /**
     * Native name: NTMS_LM_INJECTCLEANER
     * @type {Integer (Int32)}
     */
    static INJECTCLEANER => 13

    /**
     * Native name: NTMS_LM_PROCESSOMID
     * @type {Integer (Int32)}
     */
    static PROCESSOMID => 14

    /**
     * Native name: NTMS_LM_CLEANDRIVE
     * @type {Integer (Int32)}
     */
    static CLEANDRIVE => 15

    /**
     * Native name: NTMS_LM_DISMOUNT
     * @type {Integer (Int32)}
     */
    static DISMOUNT => 16

    /**
     * Native name: NTMS_LM_MOUNT
     * @type {Integer (Int32)}
     */
    static MOUNT => 17

    /**
     * Native name: NTMS_LM_WRITESCRATCH
     * @type {Integer (Int32)}
     */
    static WRITESCRATCH => 18

    /**
     * Native name: NTMS_LM_CLASSIFY
     * @type {Integer (Int32)}
     */
    static CLASSIFY => 19

    /**
     * Native name: NTMS_LM_RESERVECLEANER
     * @type {Integer (Int32)}
     */
    static RESERVECLEANER => 20

    /**
     * Native name: NTMS_LM_RELEASECLEANER
     * @type {Integer (Int32)}
     */
    static RELEASECLEANER => 21

    /**
     * Native name: NTMS_LM_MAXWORKITEM
     * @type {Integer (Int32)}
     */
    static MAXWORKITEM => 22
}
