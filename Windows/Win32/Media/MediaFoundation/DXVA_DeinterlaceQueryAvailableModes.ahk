#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_DeinterlaceQueryAvailableModes {
    #StructPack 8

    Size : UInt32

    NumGuids : UInt32

    Guids : IntPtr[32]

}
