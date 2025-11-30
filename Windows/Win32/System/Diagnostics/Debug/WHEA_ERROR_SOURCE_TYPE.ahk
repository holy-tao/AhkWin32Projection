#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WHEA_ERROR_SOURCE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypeMCE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypeCMC => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypeCPE => 2

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypeNMI => 3

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypePCIe => 4

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypeGeneric => 5

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypeINIT => 6

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypeBOOT => 7

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypeSCIGeneric => 8

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypeIPFMCA => 9

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypeIPFCMC => 10

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypeIPFCPE => 11

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypeGenericV2 => 12

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypeSCIGenericV2 => 13

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypeBMC => 14

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypePMEM => 15

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypeDeviceDriver => 16

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypeSea => 17

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypeSei => 18

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcTypeMax => 19
}
