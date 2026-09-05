#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.AssessmentTool
 */
class WINSAT_OEM_CUSTOMIZATION_STATE extends Win32Enum {

    /**
     * Native name: WINSAT_OEM_DATA_VALID
     * @type {Integer (Int32)}
     */
    static DATA_VALID => 0

    /**
     * Native name: WINSAT_OEM_DATA_NON_SYS_CONFIG_MATCH
     * @type {Integer (Int32)}
     */
    static DATA_NON_SYS_CONFIG_MATCH => 1

    /**
     * Native name: WINSAT_OEM_DATA_INVALID
     * @type {Integer (Int32)}
     */
    static DATA_INVALID => 2

    /**
     * Native name: WINSAT_OEM_NO_DATA_SUPPLIED
     * @type {Integer (Int32)}
     */
    static NO_DATA_SUPPLIED => 3
}
