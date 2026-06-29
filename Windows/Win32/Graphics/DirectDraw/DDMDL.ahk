#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDMDL {
    #StructPack 8

    MdlNext : DDMDL.Ptr

    MdlSize : Int16

    MdlFlags : Int16

    Process : IntPtr

    lpMappedSystemVa : IntPtr

    lpStartVa : IntPtr

    ByteCount : UInt32

    ByteOffset : UInt32

}
