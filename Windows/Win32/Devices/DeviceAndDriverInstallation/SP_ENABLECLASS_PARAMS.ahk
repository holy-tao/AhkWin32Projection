#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SP_CLASSINSTALL_HEADER.ahk" { SP_CLASSINSTALL_HEADER }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DI_FUNCTION.ahk" { DI_FUNCTION }

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @architecture X64, Arm64
 */
export default struct SP_ENABLECLASS_PARAMS {
    #StructPack 4

    ClassInstallHeader : SP_CLASSINSTALL_HEADER

    ClassGuid : Guid

    EnableMessage : UInt32

}
