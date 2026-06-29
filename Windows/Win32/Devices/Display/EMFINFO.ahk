#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct EMFINFO {
    #StructPack 8

    nSize : UInt32

    hdc : HDC

    pvEMF : IntPtr

    pvCurrentRecord : IntPtr

}
