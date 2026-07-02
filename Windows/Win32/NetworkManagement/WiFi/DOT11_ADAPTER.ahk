#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_CURRENT_OPERATION_MODE.ahk" { DOT11_CURRENT_OPERATION_MODE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_ADAPTER {
    #StructPack 8

    gAdapterId : Guid

    pszDescription : PWSTR

    Dot11CurrentOpMode : DOT11_CURRENT_OPERATION_MODE

}
