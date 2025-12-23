#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.AssessmentTool
 * @version v4.0.30319
 */
class WINSAT_OEM_CUSTOMIZATION_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WINSAT_OEM_DATA_VALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static WINSAT_OEM_DATA_NON_SYS_CONFIG_MATCH => 1

    /**
     * @type {Integer (Int32)}
     */
    static WINSAT_OEM_DATA_INVALID => 2

    /**
     * @type {Integer (Int32)}
     */
    static WINSAT_OEM_NO_DATA_SUPPLIED => 3
}
