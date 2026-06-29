#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct VMEML {
    #StructPack 8

    next : VMEML.Ptr

    ptr : IntPtr

    size : UInt32

    bDiscardable : BOOL

}
