#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_FIELDOFVIEW2_CONFIGCAPS {
    #StructPack 4

    DefaultDiagonalFieldOfViewInDegrees : UInt16

    DiscreteFoVStopsCount : UInt16

    DiscreteFoVStops : UInt16[360]

    Reserved : UInt32

}
