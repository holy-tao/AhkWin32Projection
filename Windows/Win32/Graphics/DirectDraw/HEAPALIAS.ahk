#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct HEAPALIAS {
    #StructPack 8

    fpVidMem : IntPtr

    lpAlias : IntPtr

    dwAliasSize : UInt32

}
