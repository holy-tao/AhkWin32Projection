#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class DEVICE_POWER_CAPABILITIES extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_D0_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_D1_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_D2_SUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_D3_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_WAKE_FROM_D0_SUPPORTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_WAKE_FROM_D1_SUPPORTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_WAKE_FROM_D2_SUPPORTED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_WAKE_FROM_D3_SUPPORTED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_WARM_EJECT_SUPPORTED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_S0_SUPPORTED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_S1_SUPPORTED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_S2_SUPPORTED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_S3_SUPPORTED => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_WAKE_FROM_S0_SUPPORTED => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_WAKE_FROM_S1_SUPPORTED => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_WAKE_FROM_S2_SUPPORTED => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_WAKE_FROM_S3_SUPPORTED => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_S4_SUPPORTED => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static PDCAP_S5_SUPPORTED => 33554432
}
