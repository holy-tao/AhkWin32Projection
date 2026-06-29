#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct TIMEREVENT {
    #StructPack 8

    wDelay : UInt16

    wResolution : UInt16

    lpFunction : IntPtr

    dwUser : UInt32

    wFlags : UInt16

    wReserved1 : UInt16

}
