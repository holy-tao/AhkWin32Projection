#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_PROPERTY_OFFSET extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropCAP => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropVS => 8

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropINTMS => 12

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropINTMC => 16

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropCC => 20

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropCSTS => 28

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropNSSR => 32

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropAQA => 36

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropASQ => 40

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropACQ => 48

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropCMBLOC => 56

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropCMBSZ => 60

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropBPINFO => 64

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropBPRSEL => 68

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropBPMBL => 72

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropCMBMSC => 80

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropCMBSTS => 88

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropCMBEBS => 92

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropCMBSWTP => 96

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropNSSD => 100

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropCRTO => 104

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropPMRCAP => 3584

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropPMRCTL => 3588

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropPMRSTS => 3592

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropPMREBS => 3596

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropPMRSWTP => 3600

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropPMRMSCL => 3604

    /**
     * @type {Integer (Int32)}
     */
    static NvmePropPMRMSCU => 3608
}
