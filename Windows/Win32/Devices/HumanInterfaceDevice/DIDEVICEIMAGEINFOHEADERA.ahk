#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIDEVICEIMAGEINFOA.ahk" { DIDEVICEIMAGEINFOA }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset ANSI
 */
export default struct DIDEVICEIMAGEINFOHEADERA {
    #StructPack 8

    dwSize : UInt32

    dwSizeImageInfo : UInt32

    dwcViews : UInt32

    dwcButtons : UInt32

    dwcAxes : UInt32

    dwcPOVs : UInt32

    dwBufferSize : UInt32

    dwBufferUsed : UInt32

    lprgImageInfoArray : DIDEVICEIMAGEINFOA.Ptr

}
