#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_WME_AC_PARAMETERS.ahk" { DOT11_WME_AC_PARAMETERS }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WME_AC_PARAMETERS_LIST {
    #StructPack 4

    uNumOfEntries : UInt32

    uTotalNumOfEntries : UInt32

    dot11WMEACParameters : DOT11_WME_AC_PARAMETERS[1]

}
