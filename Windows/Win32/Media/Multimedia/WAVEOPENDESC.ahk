#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Audio\WAVEFORMAT.ahk" { WAVEFORMAT }
#Import "..\Audio\HWAVE.ahk" { HWAVE }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct WAVEOPENDESC {
    #StructPack 8

    hWave : HWAVE

    lpFormat : WAVEFORMAT.Ptr

    dwCallback : IntPtr

    dwInstance : IntPtr

    uMappedDeviceID : UInt32

    dnDevNode : IntPtr

}
