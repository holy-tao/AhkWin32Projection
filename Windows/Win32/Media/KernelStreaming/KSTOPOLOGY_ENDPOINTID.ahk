#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSTOPOLOGY_ENDPOINTID {
    #StructPack 4

    TopologyName : WCHAR[260]

    PinId : UInt32

}
