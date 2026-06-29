#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSTOPOLOGY_ENDPOINTID.ahk" { KSTOPOLOGY_ENDPOINTID }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSTOPOLOGY_ENDPOINTIDPAIR {
    #StructPack 4

    RenderEndpoint : KSTOPOLOGY_ENDPOINTID

    CaptureEndpoint : KSTOPOLOGY_ENDPOINTID

}
