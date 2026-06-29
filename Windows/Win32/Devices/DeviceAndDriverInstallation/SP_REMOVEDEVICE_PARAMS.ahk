#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SETUP_DI_REMOVE_DEVICE_SCOPE.ahk" { SETUP_DI_REMOVE_DEVICE_SCOPE }
#Import ".\SP_CLASSINSTALL_HEADER.ahk" { SP_CLASSINSTALL_HEADER }
#Import ".\DI_FUNCTION.ahk" { DI_FUNCTION }

/**
 * An SP_REMOVEDEVICE_PARAMS structure corresponds to the DIF_REMOVE installation request.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_removedevice_params
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @architecture X64, Arm64
 */
export default struct SP_REMOVEDEVICE_PARAMS {
    #StructPack 4

    /**
     * An install request header that contains the header size and the DIF code for the request. See <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/ns-setupapi-sp_classinstall_header">SP_CLASSINSTALL_HEADER</a>.
     */
    ClassInstallHeader : SP_CLASSINSTALL_HEADER

    Scope : SETUP_DI_REMOVE_DEVICE_SCOPE

    /**
     * The hardware profile ID for profile-specific changes. Zero specifies the current hardware profile.
     */
    HwProfile : UInt32

}
