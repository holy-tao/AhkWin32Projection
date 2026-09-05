#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 */
class CCM_INSERTIONPOINTID extends Win32Enum {

    /**
     * Native name: CCM_INSERTIONPOINTID_MASK_SPECIAL
     * @type {Integer (Int32)}
     */
    static MASK_SPECIAL => -65536

    /**
     * Native name: CCM_INSERTIONPOINTID_MASK_SHARED
     * @type {Integer (Int32)}
     */
    static MASK_SHARED => -2147483648

    /**
     * Native name: CCM_INSERTIONPOINTID_MASK_CREATE_PRIMARY
     * @type {Integer (Int32)}
     */
    static MASK_CREATE_PRIMARY => 1073741824

    /**
     * Native name: CCM_INSERTIONPOINTID_MASK_ADD_PRIMARY
     * @type {Integer (Int32)}
     */
    static MASK_ADD_PRIMARY => 536870912

    /**
     * Native name: CCM_INSERTIONPOINTID_MASK_ADD_3RDPARTY
     * @type {Integer (Int32)}
     */
    static MASK_ADD_3RDPARTY => 268435456

    /**
     * Native name: CCM_INSERTIONPOINTID_MASK_RESERVED
     * @type {Integer (Int32)}
     */
    static MASK_RESERVED => 268369920

    /**
     * Native name: CCM_INSERTIONPOINTID_MASK_FLAGINDEX
     * @type {Integer (Int32)}
     */
    static MASK_FLAGINDEX => 31

    /**
     * Native name: CCM_INSERTIONPOINTID_PRIMARY_TOP
     * @type {Integer (Int32)}
     */
    static PRIMARY_TOP => -1610612736

    /**
     * Native name: CCM_INSERTIONPOINTID_PRIMARY_NEW
     * @type {Integer (Int32)}
     */
    static PRIMARY_NEW => -1610612735

    /**
     * Native name: CCM_INSERTIONPOINTID_PRIMARY_TASK
     * @type {Integer (Int32)}
     */
    static PRIMARY_TASK => -1610612734

    /**
     * Native name: CCM_INSERTIONPOINTID_PRIMARY_VIEW
     * @type {Integer (Int32)}
     */
    static PRIMARY_VIEW => -1610612733

    /**
     * Native name: CCM_INSERTIONPOINTID_PRIMARY_HELP
     * @type {Integer (Int32)}
     */
    static PRIMARY_HELP => -1610612732

    /**
     * Native name: CCM_INSERTIONPOINTID_3RDPARTY_NEW
     * @type {Integer (Int32)}
     */
    static 3RDPARTY_NEW => -1879048191

    /**
     * Native name: CCM_INSERTIONPOINTID_3RDPARTY_TASK
     * @type {Integer (Int32)}
     */
    static 3RDPARTY_TASK => -1879048190

    /**
     * Native name: CCM_INSERTIONPOINTID_ROOT_MENU
     * @type {Integer (Int32)}
     */
    static ROOT_MENU => -2147483648
}
