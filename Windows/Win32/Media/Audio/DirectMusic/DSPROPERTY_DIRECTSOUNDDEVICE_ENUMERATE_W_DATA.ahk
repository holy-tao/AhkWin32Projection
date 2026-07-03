#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_W_DATA {
    #StructPack 8

    Callback : IntPtr

    Context : IntPtr

}
