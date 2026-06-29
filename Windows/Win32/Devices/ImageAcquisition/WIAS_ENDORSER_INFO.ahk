#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WIAS_ENDORSER_VALUE.ahk" { WIAS_ENDORSER_VALUE }

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WIAS_ENDORSER_INFO {
    #StructPack 8

    ulPageCount : UInt32

    ulNumEndorserValues : UInt32

    pEndorserValues : WIAS_ENDORSER_VALUE.Ptr

}
