#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DI_FUNCTION.ahk" { DI_FUNCTION }

/**
 * An SP_CLASSINSTALL_HEADER is the first member of any class install parameters structure. It contains the device installation request code that defines the format of the rest of the install parameters structure.
 * @remarks
 * When a component allocates a class install parameters structure, it typically initializes the header fields of the structure. Such a component sets the <b>InstallFunction</b> member to the DIF code for the installation request and sets <b>cbSize</b> to the size of the SP_CLASSINSTALL_HEADER structure. For example:
 * 
 * 
 * ```
 * SP_REMOVEDEVICE_PARAMS RemoveDeviceParams;
 * RemoveDeviceParams.ClassInstallHeader.cbSize = sizeof(SP_CLASSINSTALL_HEADER);
 * RemoveDeviceParams.ClassInstallHeader.InstallFunction = DIF_REMOVE;
 * ```
 * 
 * 
 * A component must set the <b>InstallFunction</b> member before passing a class install parameters structure to <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/nf-setupapi-setupdisetclassinstallparamsa">SetupDiSetClassInstallParams</a>. 
 * 
 * However, a component does not have to set this field when passing class install parameters to <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/nf-setupapi-setupdigetclassinstallparamsa">SetupDiGetClassInstallParams</a>. This function sets the <b>InstallFunction</b> member in the structure it passes back to the caller. It sets <b>InstallFunction</b> to the DIF_<i>XXX</i> code for the currently active device installation request.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_classinstall_header
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @architecture X64, Arm64
 */
export default struct SP_CLASSINSTALL_HEADER {
    #StructPack 4

    /**
     * The size, in bytes, of the SP_CLASSINSTALL_HEADER structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * The device installation request (DIF code) for the class install parameters structure. 
     * 
     * DIF codes have the format DIF_<i>XXX</i> and are defined in <i>Setupapi.h</i>. See <a href="https://docs.microsoft.com/windows-hardware/drivers/install/handling-dif-codes">Device Installation Function Codes</a> for a complete description of DIF codes.
     */
    InstallFunction : DI_FUNCTION

}
