#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GNSS_FIXDATA_ACCURACY.ahk" { GNSS_FIXDATA_ACCURACY }
#Import ".\GNSS_FIXDATA_BASIC.ahk" { GNSS_FIXDATA_BASIC }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_AGNSS_INJECTPOSITION {
    #StructPack 8

    Size : UInt32

    Version : UInt32

    Age : UInt32

    BasicData : GNSS_FIXDATA_BASIC

    AccuracyData : GNSS_FIXDATA_ACCURACY

}
