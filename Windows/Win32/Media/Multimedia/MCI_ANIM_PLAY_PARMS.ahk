#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MCI_ANIM_PLAY_PARMS {
    #StructPack 8

    dwCallback : IntPtr

    dwFrom : UInt32

    dwTo : UInt32

    dwSpeed : UInt32

}
