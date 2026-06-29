#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\BITMAPINFO.ahk" { BITMAPINFO }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.System.Console
 */
export default struct CONSOLE_GRAPHICS_BUFFER_INFO {
    #StructPack 8

    dwBitMapInfoLength : UInt32

    lpBitMapInfo : BITMAPINFO.Ptr

    dwUsage : UInt32

    hMutex : HANDLE

    lpBitMap : IntPtr

}
