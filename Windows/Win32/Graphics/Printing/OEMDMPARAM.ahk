#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Gdi\DEVMODEA.ahk" { DEVMODEA }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct OEMDMPARAM {
    #StructPack 8

    cbSize : UInt32 := this.Size

    pdriverobj : IntPtr

    hPrinter : HANDLE

    hModule : HANDLE

    pPublicDMIn : DEVMODEA.Ptr

    pPublicDMOut : DEVMODEA.Ptr

    pOEMDMIn : IntPtr

    pOEMDMOut : IntPtr

    cbBufSize : UInt32

}
