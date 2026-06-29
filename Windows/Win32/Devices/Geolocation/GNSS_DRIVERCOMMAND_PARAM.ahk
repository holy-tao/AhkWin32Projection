#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GNSS_DRIVERCOMMAND_TYPE.ahk" { GNSS_DRIVERCOMMAND_TYPE }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_DRIVERCOMMAND_PARAM {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    CommandType : GNSS_DRIVERCOMMAND_TYPE

    Reserved : UInt32

    CommandDataSize : UInt32

    Unused : Int8[512]

    CommandData : Int8[1]

}
