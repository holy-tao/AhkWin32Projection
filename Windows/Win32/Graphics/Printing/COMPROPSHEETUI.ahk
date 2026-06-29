#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import ".\DLGPAGE.ahk" { DLGPAGE }
#Import ".\OPTITEM.ahk" { OPTITEM }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct COMPROPSHEETUI {
    #StructPack 8

    cbSize : UInt16 := this.Size

    Flags : UInt16

    hInstCaller : HINSTANCE

    pCallerName : IntPtr

    UserData : IntPtr

    pHelpFile : IntPtr

    pfnCallBack : IntPtr

    pOptItem : OPTITEM.Ptr

    pDlgPage : DLGPAGE.Ptr

    cOptItem : UInt16

    cDlgPage : UInt16

    IconID : IntPtr

    pOptItemName : IntPtr

    CallerVersion : UInt16

    OptItemVersion : UInt16

    dwReserved : IntPtr[4]

}
