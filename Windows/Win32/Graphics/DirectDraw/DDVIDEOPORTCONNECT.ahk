#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDVIDEOPORTCONNECT {
    #StructPack 8

    dwSize : UInt32

    dwPortWidth : UInt32

    guidTypeID : Guid

    dwFlags : UInt32

    dwReserved1 : IntPtr

}
