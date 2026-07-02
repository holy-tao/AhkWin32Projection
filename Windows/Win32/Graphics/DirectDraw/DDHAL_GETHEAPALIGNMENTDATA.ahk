#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPDDHAL_GETHEAPALIGNMENT.ahk" { LPDDHAL_GETHEAPALIGNMENT }
#Import ".\SURFACEALIGNMENT.ahk" { SURFACEALIGNMENT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HEAPALIGNMENT.ahk" { HEAPALIGNMENT }
#Import ".\DDSCAPS.ahk" { DDSCAPS }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_GETHEAPALIGNMENTDATA {
    #StructPack 8

    dwInstance : IntPtr

    dwHeap : UInt32

    ddRVal : HRESULT

    GetHeapAlignment : LPDDHAL_GETHEAPALIGNMENT

    Alignment : HEAPALIGNMENT

}
