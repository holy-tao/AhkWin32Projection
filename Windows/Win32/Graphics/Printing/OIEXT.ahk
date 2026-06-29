#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct OIEXT {
    #StructPack 8

    cbSize : UInt16 := this.Size

    Flags : UInt16

    hInstCaller : HINSTANCE

    pHelpFile : IntPtr

    dwReserved : IntPtr[4]

}
