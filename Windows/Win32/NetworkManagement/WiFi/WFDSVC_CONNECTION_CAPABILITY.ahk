#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WFDSVC_CONNECTION_CAPABILITY {
    #StructPack 1

    bNew : BOOLEAN

    bClient : BOOLEAN

    bGO : BOOLEAN

}
