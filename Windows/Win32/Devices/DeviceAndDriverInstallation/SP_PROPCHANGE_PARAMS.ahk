#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SETUP_DI_PROPERTY_CHANGE_SCOPE.ahk" { SETUP_DI_PROPERTY_CHANGE_SCOPE }
#Import ".\SP_CLASSINSTALL_HEADER.ahk" { SP_CLASSINSTALL_HEADER }
#Import ".\SETUP_DI_STATE_CHANGE.ahk" { SETUP_DI_STATE_CHANGE }
#Import ".\DI_FUNCTION.ahk" { DI_FUNCTION }

/**
 * An SP_PROPCHANGE_PARAMS structure corresponds to a DIF_PROPERTYCHANGE installation request.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_propchange_params
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @architecture X64, Arm64
 */
export default struct SP_PROPCHANGE_PARAMS {
    #StructPack 4

    /**
     * An install request header that contains the header size and the DIF code for the request. See <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/ns-setupapi-sp_classinstall_header">SP_CLASSINSTALL_HEADER</a>.
     */
    ClassInstallHeader : SP_CLASSINSTALL_HEADER

    StateChange : SETUP_DI_STATE_CHANGE

    /**
     * Flags that specify the scope of a device property change. Can be one of the following:
     */
    Scope : SETUP_DI_PROPERTY_CHANGE_SCOPE

    /**
     * Supplies the hardware profile ID for profile-specific changes. Zero specifies the current hardware profile.
     */
    HwProfile : UInt32

}
