#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SP_CLASSINSTALL_HEADER.ahk" { SP_CLASSINSTALL_HEADER }
#Import ".\DI_FUNCTION.ahk" { DI_FUNCTION }

/**
 * An SP_UNREMOVEDEVICE_PARAMS structure corresponds to a DIF_UNREMOVE installation request.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_unremovedevice_params
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @architecture X64, Arm64
 */
export default struct SP_UNREMOVEDEVICE_PARAMS {
    #StructPack 4

    /**
     * An install request header that contains the header size and the DIF code for the request. See <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/ns-setupapi-sp_classinstall_header">SP_CLASSINSTALL_HEADER</a>.
     */
    ClassInstallHeader : SP_CLASSINSTALL_HEADER

    /**
     * A flag that indicates the scope of the unremove operation. This flag must always be set to DI_UNREMOVEDEVICE_CONFIGSPECIFIC.
     */
    Scope : UInt32

    /**
     * The hardware profile ID for profile-specific changes. Zero specifies the current hardware profile.
     */
    HwProfile : UInt32

}
