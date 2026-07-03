#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIACTIONFORMATA.ahk" { DIACTIONFORMATA }
#Import ".\DICOLORSET.ahk" { DICOLORSET }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset ANSI
 */
export default struct DICONFIGUREDEVICESPARAMSA {
    #StructPack 8

    dwSize : UInt32

    dwcUsers : UInt32

    lptszUserNames : PSTR

    dwcFormats : UInt32

    lprgFormats : DIACTIONFORMATA.Ptr

    hwnd : HWND

    dics : DICOLORSET

    lpUnkDDSTarget : IUnknown

}
