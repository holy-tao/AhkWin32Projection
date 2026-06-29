#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MCI_ANIM_STEP_PARMS {
    #StructPack 8

    dwCallback : IntPtr

    dwFrames : UInt32

}
