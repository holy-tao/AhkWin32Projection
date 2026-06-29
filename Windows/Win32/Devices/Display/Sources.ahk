#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The Sources structure contains a Video Present Network (VidPN) topology.
 * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/ns-cloneviewhelper-sources
 * @namespace Windows.Win32.Devices.Display
 */
export default struct Sources {
    #StructPack 4

    /**
     * The source identifier for the video present source in the VidPN topology.
     */
    sourceId : UInt32

    /**
     * The number of video present targets in the array that the <b>aTargets</b> member specifies, which is the number of video present targets in the VidPN topology.
     */
    numTargets : Int32

    /**
     * An array of identifiers for the video present targets in the VidPN topology.
     */
    aTargets : UInt32[1]

}
