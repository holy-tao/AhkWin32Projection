#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct CDDDXGK_REDIRBITMAPPRESENTINFO {
    #StructPack 8

    NumDirtyRects : UInt32

    DirtyRect : RECT.Ptr

    NumContexts : UInt32

    hContext : HANDLE[65]

    bDoNotSynchronizeWithDxContent : BOOLEAN

}
