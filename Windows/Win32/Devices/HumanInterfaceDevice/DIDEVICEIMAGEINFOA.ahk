#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset ANSI
 */
export default struct DIDEVICEIMAGEINFOA {
    #StructPack 4

    tszImagePath : CHAR[260]

    dwFlags : UInt32

    dwViewID : UInt32

    rcOverlay : RECT

    dwObjID : UInt32

    dwcValidPts : UInt32

    rgptCalloutLine : POINT[5]

    rcCalloutRect : RECT

    dwTextAlign : UInt32

}
