#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_PROPERTY_OFFSET extends Win32Enum {

    /**
     * Native name: NvmePropCAP
     * @type {Integer (Int32)}
     */
    static PropCAP => 0

    /**
     * Native name: NvmePropVS
     * @type {Integer (Int32)}
     */
    static PropVS => 8

    /**
     * Native name: NvmePropINTMS
     * @type {Integer (Int32)}
     */
    static PropINTMS => 12

    /**
     * Native name: NvmePropINTMC
     * @type {Integer (Int32)}
     */
    static PropINTMC => 16

    /**
     * Native name: NvmePropCC
     * @type {Integer (Int32)}
     */
    static PropCC => 20

    /**
     * Native name: NvmePropCSTS
     * @type {Integer (Int32)}
     */
    static PropCSTS => 28

    /**
     * Native name: NvmePropNSSR
     * @type {Integer (Int32)}
     */
    static PropNSSR => 32

    /**
     * Native name: NvmePropAQA
     * @type {Integer (Int32)}
     */
    static PropAQA => 36

    /**
     * Native name: NvmePropASQ
     * @type {Integer (Int32)}
     */
    static PropASQ => 40

    /**
     * Native name: NvmePropACQ
     * @type {Integer (Int32)}
     */
    static PropACQ => 48

    /**
     * Native name: NvmePropCMBLOC
     * @type {Integer (Int32)}
     */
    static PropCMBLOC => 56

    /**
     * Native name: NvmePropCMBSZ
     * @type {Integer (Int32)}
     */
    static PropCMBSZ => 60

    /**
     * Native name: NvmePropBPINFO
     * @type {Integer (Int32)}
     */
    static PropBPINFO => 64

    /**
     * Native name: NvmePropBPRSEL
     * @type {Integer (Int32)}
     */
    static PropBPRSEL => 68

    /**
     * Native name: NvmePropBPMBL
     * @type {Integer (Int32)}
     */
    static PropBPMBL => 72

    /**
     * Native name: NvmePropCMBMSC
     * @type {Integer (Int32)}
     */
    static PropCMBMSC => 80

    /**
     * Native name: NvmePropCMBSTS
     * @type {Integer (Int32)}
     */
    static PropCMBSTS => 88

    /**
     * Native name: NvmePropCMBEBS
     * @type {Integer (Int32)}
     */
    static PropCMBEBS => 92

    /**
     * Native name: NvmePropCMBSWTP
     * @type {Integer (Int32)}
     */
    static PropCMBSWTP => 96

    /**
     * Native name: NvmePropNSSD
     * @type {Integer (Int32)}
     */
    static PropNSSD => 100

    /**
     * Native name: NvmePropCRTO
     * @type {Integer (Int32)}
     */
    static PropCRTO => 104

    /**
     * Native name: NvmePropPMRCAP
     * @type {Integer (Int32)}
     */
    static PropPMRCAP => 3584

    /**
     * Native name: NvmePropPMRCTL
     * @type {Integer (Int32)}
     */
    static PropPMRCTL => 3588

    /**
     * Native name: NvmePropPMRSTS
     * @type {Integer (Int32)}
     */
    static PropPMRSTS => 3592

    /**
     * Native name: NvmePropPMREBS
     * @type {Integer (Int32)}
     */
    static PropPMREBS => 3596

    /**
     * Native name: NvmePropPMRSWTP
     * @type {Integer (Int32)}
     */
    static PropPMRSWTP => 3600

    /**
     * Native name: NvmePropPMRMSCL
     * @type {Integer (Int32)}
     */
    static PropPMRMSCL => 3604

    /**
     * Native name: NvmePropPMRMSCU
     * @type {Integer (Int32)}
     */
    static PropPMRMSCU => 3608
}
