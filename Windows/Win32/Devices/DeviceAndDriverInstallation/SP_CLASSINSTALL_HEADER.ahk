#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class SP_CLASSINSTALL_HEADER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The size, in bytes, of the SP_CLASSINSTALL_HEADER structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The device installation request (DIF code) for the class install parameters structure. 
     * 
     * DIF codes have the format DIF_<i>XXX</i> and are defined in <i>Setupapi.h</i>. See <a href="https://docs.microsoft.com/windows-hardware/drivers/install/handling-dif-codes">Device Installation Function Codes</a> for a complete description of DIF codes.
     * @type {Integer}
     */
    InstallFunction {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 8
    }
}
