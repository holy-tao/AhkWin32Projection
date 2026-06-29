#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_SEEKING_FLAGS.ahk" { KS_SEEKING_FLAGS }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_POSITIONS {
    #StructPack 8

    Current : Int64

    Stop : Int64

    CurrentFlags : KS_SEEKING_FLAGS

    StopFlags : KS_SEEKING_FLAGS

}
