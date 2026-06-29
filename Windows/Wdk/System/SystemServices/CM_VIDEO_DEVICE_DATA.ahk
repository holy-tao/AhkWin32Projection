#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_VIDEO_DEVICE_DATA {
    #StructPack 4

    Version : UInt16

    Revision : UInt16

    VideoClock : UInt32

}
