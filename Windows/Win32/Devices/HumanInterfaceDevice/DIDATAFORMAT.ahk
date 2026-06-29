#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIOBJECTDATAFORMAT.ahk" { DIOBJECTDATAFORMAT }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIDATAFORMAT {
    #StructPack 8

    dwSize : UInt32

    dwObjSize : UInt32

    dwFlags : UInt32

    dwDataSize : UInt32

    dwNumObjs : UInt32

    rgodf : DIOBJECTDATAFORMAT.Ptr

}
