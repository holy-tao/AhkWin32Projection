#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIACTIONFORMATW.ahk" { DIACTIONFORMATW }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\DICOLORSET.ahk" { DICOLORSET }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset Unicode
 */
export default struct DICONFIGUREDEVICESPARAMSW {
    #StructPack 8

    dwSize : UInt32

    dwcUsers : UInt32

    lptszUserNames : PWSTR

    dwcFormats : UInt32

    lprgFormats : DIACTIONFORMATW.Ptr

    hwnd : HWND

    dics : DICOLORSET

    lpUnkDDSTarget : IUnknown

}
