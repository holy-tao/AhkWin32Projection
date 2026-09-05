#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class DXVA2_DestinationFlags extends Win32Enum {

    /**
     * Native name: DXVA2_DestinationFlag_Background_Changed
     * @type {Integer (Int32)}
     */
    static Flag_Background_Changed => 1

    /**
     * Native name: DXVA2_DestinationFlag_TargetRect_Changed
     * @type {Integer (Int32)}
     */
    static Flag_TargetRect_Changed => 2

    /**
     * Native name: DXVA2_DestinationFlag_ColorData_Changed
     * @type {Integer (Int32)}
     */
    static Flag_ColorData_Changed => 4

    /**
     * Native name: DXVA2_DestinationFlag_Alpha_Changed
     * @type {Integer (Int32)}
     */
    static Flag_Alpha_Changed => 8

    /**
     * Native name: DXVA2_DestinationFlag_RFF
     * @type {Integer (Int32)}
     */
    static Flag_RFF => 65536

    /**
     * Native name: DXVA2_DestinationFlag_TFF
     * @type {Integer (Int32)}
     */
    static Flag_TFF => 131072

    /**
     * Native name: DXVA2_DestinationFlag_RFF_TFF_Present
     * @type {Integer (Int32)}
     */
    static Flag_RFF_TFF_Present => 262144

    /**
     * Native name: DXVA2_DestinationFlagMask
     * @type {Integer (Int32)}
     */
    static FlagMask => -65521
}
