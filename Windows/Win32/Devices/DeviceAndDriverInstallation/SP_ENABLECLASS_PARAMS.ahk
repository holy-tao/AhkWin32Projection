#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DI_FUNCTION.ahk" { DI_FUNCTION }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SP_CLASSINSTALL_HEADER.ahk" { SP_CLASSINSTALL_HEADER }

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
