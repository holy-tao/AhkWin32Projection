#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA_DestinationFlags extends Win32Enum {

    /**
     * Native name: DXVA_DestinationFlagMask
     * @type {Integer (Int32)}
     */
    static FlagMask => 15

    /**
     * Native name: DXVA_DestinationFlag_Background_Changed
     * @type {Integer (Int32)}
     */
    static Flag_Background_Changed => 1

    /**
     * Native name: DXVA_DestinationFlag_TargetRect_Changed
     * @type {Integer (Int32)}
     */
    static Flag_TargetRect_Changed => 2

    /**
     * Native name: DXVA_DestinationFlag_ColorData_Changed
     * @type {Integer (Int32)}
     */
    static Flag_ColorData_Changed => 4

    /**
     * Native name: DXVA_DestinationFlag_Alpha_Changed
     * @type {Integer (Int32)}
     */
    static Flag_Alpha_Changed => 8
}
