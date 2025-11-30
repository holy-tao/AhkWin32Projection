#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA_DestinationFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_DestinationFlagMask => 15

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_DestinationFlag_Background_Changed => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_DestinationFlag_TargetRect_Changed => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_DestinationFlag_ColorData_Changed => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_DestinationFlag_Alpha_Changed => 8
}
