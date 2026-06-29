#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\COLORSPACE_TRANSFORM_DATA_TYPE.ahk" { COLORSPACE_TRANSFORM_DATA_TYPE }
#Import ".\COLORSPACE_TRANSFORM_DATA_CAP.ahk" { COLORSPACE_TRANSFORM_DATA_CAP }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct COLORSPACE_TRANSFORM_1DLUT_CAP {
    #StructPack 4

    NumberOfLUTEntries : UInt32

    DataCap : COLORSPACE_TRANSFORM_DATA_CAP

}
