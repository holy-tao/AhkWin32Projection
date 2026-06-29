#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_VIDEO_SPHERICAL_VIEWDIRECTION {
    #StructPack 4

    iHeading : Int32

    iPitch : Int32

    iRoll : Int32

}
