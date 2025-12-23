#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class ScanModulationTypes extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_16QAM => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_32QAM => 2

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_64QAM => 4

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_80QAM => 8

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_96QAM => 16

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_112QAM => 32

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_128QAM => 64

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_160QAM => 128

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_192QAM => 256

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_224QAM => 512

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_256QAM => 1024

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_320QAM => 2048

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_384QAM => 4096

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_448QAM => 8192

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_512QAM => 16384

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_640QAM => 32768

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_768QAM => 65536

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_896QAM => 131072

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_1024QAM => 262144

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_QPSK => 524288

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_BPSK => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_OQPSK => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_8VSB => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_16VSB => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_AM_RADIO => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_FM_RADIO => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_8PSK => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_RF => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static ScanModulationTypesMask_MCE_DigitalCable => 11

    /**
     * @type {Integer (Int32)}
     */
    static ScanModulationTypesMask_MCE_TerrestrialATSC => 23

    /**
     * @type {Integer (Int32)}
     */
    static ScanModulationTypesMask_MCE_AnalogTv => 28

    /**
     * @type {Integer (Int32)}
     */
    static ScanModulationTypesMask_MCE_All_TV => -1

    /**
     * @type {Integer (Int32)}
     */
    static ScanModulationTypesMask_DVBC => 75

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_16APSK => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SCAN_MOD_32APSK => 536870912
}
