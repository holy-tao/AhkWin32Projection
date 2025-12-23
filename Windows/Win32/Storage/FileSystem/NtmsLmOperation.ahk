#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsLmOperation extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_REMOVE => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_DISABLECHANGER => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_DISABLELIBRARY => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_ENABLECHANGER => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_ENABLELIBRARY => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_DISABLEDRIVE => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_ENABLEDRIVE => 4

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_DISABLEMEDIA => 5

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_ENABLEMEDIA => 6

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_UPDATEOMID => 7

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_INVENTORY => 8

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_DOORACCESS => 9

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_EJECT => 10

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_EJECTCLEANER => 11

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_INJECT => 12

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_INJECTCLEANER => 13

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_PROCESSOMID => 14

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_CLEANDRIVE => 15

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_DISMOUNT => 16

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_MOUNT => 17

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_WRITESCRATCH => 18

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_CLASSIFY => 19

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_RESERVECLEANER => 20

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_RELEASECLEANER => 21

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_MAXWORKITEM => 22
}
