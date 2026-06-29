#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct VMEMR {
    #StructPack 8

    next : VMEMR.Ptr

    prev : VMEMR.Ptr

    pUp : VMEMR.Ptr

    pDown : VMEMR.Ptr

    pLeft : VMEMR.Ptr

    pRight : VMEMR.Ptr

    ptr : IntPtr

    size : UInt32

    x : UInt32

    y : UInt32

    cx : UInt32

    cy : UInt32

    flags : UInt32

    pBits : IntPtr

    bDiscardable : BOOL

}
