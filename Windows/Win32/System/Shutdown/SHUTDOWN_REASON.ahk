#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Shutdown
 * @version v4.0.30319
 */
class SHUTDOWN_REASON extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_FLAG_COMMENT_REQUIRED => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_FLAG_DIRTY_PROBLEM_ID_REQUIRED => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_FLAG_CLEAN_UI => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_FLAG_DIRTY_UI => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_FLAG_MOBILE_UI_RESERVED => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_FLAG_USER_DEFINED => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_FLAG_PLANNED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MAJOR_OTHER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MAJOR_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MAJOR_HARDWARE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MAJOR_OPERATINGSYSTEM => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MAJOR_SOFTWARE => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MAJOR_APPLICATION => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MAJOR_SYSTEM => 327680

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MAJOR_POWER => 393216

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MAJOR_LEGACY_API => 458752

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_OTHER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_NONE => 255

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_MAINTENANCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_INSTALLATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_UPGRADE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_RECONFIG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_HUNG => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_UNSTABLE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_DISK => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_PROCESSOR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_NETWORKCARD => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_POWER_SUPPLY => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_CORDUNPLUGGED => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_ENVIRONMENT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_HARDWARE_DRIVER => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_OTHERDRIVER => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_BLUESCREEN => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_SERVICEPACK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_HOTFIX => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_SECURITYFIX => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_SECURITY => 19

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_NETWORK_CONNECTIVITY => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_WMI => 21

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_SERVICEPACK_UNINSTALL => 22

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_HOTFIX_UNINSTALL => 23

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_SECURITYFIX_UNINSTALL => 24

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_MMC => 25

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_SYSTEMRESTORE => 26

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_TERMSRV => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_DC_PROMOTION => 33

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_MINOR_DC_DEMOTION => 34

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_UNKNOWN => 255

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_LEGACY_API => 2147942400

    /**
     * @type {Integer (UInt32)}
     */
    static SHTDN_REASON_VALID_BIT_MASK => 3238002687
}
