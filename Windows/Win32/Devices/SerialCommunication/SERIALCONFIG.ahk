#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 */
export default struct SERIALCONFIG {
    #StructPack 4

    Size : UInt32

    Version : UInt16

    SubType : UInt32

    ProvOffset : UInt32

    ProviderSize : UInt32

    ProviderData : WCHAR[1]

}
