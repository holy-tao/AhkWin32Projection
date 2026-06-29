#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WME_UPDATE_IE {
    #StructPack 4

    uParamElemMinBeaconIntervals : UInt32

    uWMEInfoElemOffset : UInt32

    uWMEInfoElemLength : UInt32

    uWMEParamElemOffset : UInt32

    uWMEParamElemLength : UInt32

    ucBuffer : Int8[1]

}
