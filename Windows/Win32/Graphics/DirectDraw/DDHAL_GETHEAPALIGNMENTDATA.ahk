#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HEAPALIGNMENT.ahk" { HEAPALIGNMENT }
#Import ".\SURFACEALIGNMENT.ahk" { SURFACEALIGNMENT }
#Import ".\DDSCAPS.ahk" { DDSCAPS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_GETHEAPALIGNMENTDATA {
    #StructPack 8

    dwInstance : IntPtr

    dwHeap : UInt32

    ddRVal : HRESULT

    GetHeapAlignment : IntPtr

    Alignment : HEAPALIGNMENT

}
