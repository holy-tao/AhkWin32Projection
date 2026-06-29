#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FILE_IS_REMOTE_DEVICE_INFORMATION {
    #StructPack 1

    IsRemote : BOOLEAN

}
