#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class WHEA_ERROR_SOURCE_TYPE extends Win32Enum {

    /**
     * Native name: WheaErrSrcTypeMCE
     * @type {Integer (Int32)}
     */
    static ErrSrcTypeMCE => 0

    /**
     * Native name: WheaErrSrcTypeCMC
     * @type {Integer (Int32)}
     */
    static ErrSrcTypeCMC => 1

    /**
     * Native name: WheaErrSrcTypeCPE
     * @type {Integer (Int32)}
     */
    static ErrSrcTypeCPE => 2

    /**
     * Native name: WheaErrSrcTypeNMI
     * @type {Integer (Int32)}
     */
    static ErrSrcTypeNMI => 3

    /**
     * Native name: WheaErrSrcTypePCIe
     * @type {Integer (Int32)}
     */
    static ErrSrcTypePCIe => 4

    /**
     * Native name: WheaErrSrcTypeGeneric
     * @type {Integer (Int32)}
     */
    static ErrSrcTypeGeneric => 5

    /**
     * Native name: WheaErrSrcTypeINIT
     * @type {Integer (Int32)}
     */
    static ErrSrcTypeINIT => 6

    /**
     * Native name: WheaErrSrcTypeBOOT
     * @type {Integer (Int32)}
     */
    static ErrSrcTypeBOOT => 7

    /**
     * Native name: WheaErrSrcTypeSCIGeneric
     * @type {Integer (Int32)}
     */
    static ErrSrcTypeSCIGeneric => 8

    /**
     * Native name: WheaErrSrcTypeIPFMCA
     * @type {Integer (Int32)}
     */
    static ErrSrcTypeIPFMCA => 9

    /**
     * Native name: WheaErrSrcTypeIPFCMC
     * @type {Integer (Int32)}
     */
    static ErrSrcTypeIPFCMC => 10

    /**
     * Native name: WheaErrSrcTypeIPFCPE
     * @type {Integer (Int32)}
     */
    static ErrSrcTypeIPFCPE => 11

    /**
     * Native name: WheaErrSrcTypeGenericV2
     * @type {Integer (Int32)}
     */
    static ErrSrcTypeGenericV2 => 12

    /**
     * Native name: WheaErrSrcTypeSCIGenericV2
     * @type {Integer (Int32)}
     */
    static ErrSrcTypeSCIGenericV2 => 13

    /**
     * Native name: WheaErrSrcTypeBMC
     * @type {Integer (Int32)}
     */
    static ErrSrcTypeBMC => 14

    /**
     * Native name: WheaErrSrcTypePMEM
     * @type {Integer (Int32)}
     */
    static ErrSrcTypePMEM => 15

    /**
     * Native name: WheaErrSrcTypeDeviceDriver
     * @type {Integer (Int32)}
     */
    static ErrSrcTypeDeviceDriver => 16

    /**
     * Native name: WheaErrSrcTypeSea
     * @type {Integer (Int32)}
     */
    static ErrSrcTypeSea => 17

    /**
     * Native name: WheaErrSrcTypeSei
     * @type {Integer (Int32)}
     */
    static ErrSrcTypeSei => 18

    /**
     * Native name: WheaErrSrcTypeMax
     * @type {Integer (Int32)}
     */
    static ErrSrcTypeMax => 19
}
