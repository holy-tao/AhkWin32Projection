#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct PIDListSpanningEvent {
    #StructPack 4

    wPIDCount : UInt16

    pulPIDs : UInt32[1]

}
