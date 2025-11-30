#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class CCM_INSERTIONPOINTID extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CCM_INSERTIONPOINTID_MASK_SPECIAL => -65536

    /**
     * @type {Integer (Int32)}
     */
    static CCM_INSERTIONPOINTID_MASK_SHARED => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static CCM_INSERTIONPOINTID_MASK_CREATE_PRIMARY => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static CCM_INSERTIONPOINTID_MASK_ADD_PRIMARY => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static CCM_INSERTIONPOINTID_MASK_ADD_3RDPARTY => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static CCM_INSERTIONPOINTID_MASK_RESERVED => 268369920

    /**
     * @type {Integer (Int32)}
     */
    static CCM_INSERTIONPOINTID_MASK_FLAGINDEX => 31

    /**
     * @type {Integer (Int32)}
     */
    static CCM_INSERTIONPOINTID_PRIMARY_TOP => -1610612736

    /**
     * @type {Integer (Int32)}
     */
    static CCM_INSERTIONPOINTID_PRIMARY_NEW => -1610612735

    /**
     * @type {Integer (Int32)}
     */
    static CCM_INSERTIONPOINTID_PRIMARY_TASK => -1610612734

    /**
     * @type {Integer (Int32)}
     */
    static CCM_INSERTIONPOINTID_PRIMARY_VIEW => -1610612733

    /**
     * @type {Integer (Int32)}
     */
    static CCM_INSERTIONPOINTID_PRIMARY_HELP => -1610612732

    /**
     * @type {Integer (Int32)}
     */
    static CCM_INSERTIONPOINTID_3RDPARTY_NEW => -1879048191

    /**
     * @type {Integer (Int32)}
     */
    static CCM_INSERTIONPOINTID_3RDPARTY_TASK => -1879048190

    /**
     * @type {Integer (Int32)}
     */
    static CCM_INSERTIONPOINTID_ROOT_MENU => -2147483648
}
