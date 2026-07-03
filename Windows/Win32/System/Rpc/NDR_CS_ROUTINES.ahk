#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDR_CS_SIZE_CONVERT_ROUTINES.ahk" { NDR_CS_SIZE_CONVERT_ROUTINES }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR_CS_ROUTINES {
    #StructPack 8

    pSizeConvertRoutines : NDR_CS_SIZE_CONVERT_ROUTINES.Ptr

    pTagGettingRoutines : IntPtr

}
