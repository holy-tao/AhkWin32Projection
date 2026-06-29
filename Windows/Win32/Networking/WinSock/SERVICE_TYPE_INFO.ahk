#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SERVICE_TYPE_VALUE.ahk" { SERVICE_TYPE_VALUE }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SERVICE_TYPE_INFO {
    #StructPack 4

    dwTypeNameOffset : UInt32

    dwValueCount : UInt32

    Values : SERVICE_TYPE_VALUE[1]

}
