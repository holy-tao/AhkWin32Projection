#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An SP_DRVINSTALL_PARAMS structure contains driver installation parameters associated with a particular driver information element.
 * @remarks
 * Starting with Windows 7, an installer or co-installer can set the DNF_REQUESTADDITIONALSOFTWARE flag to indicate that the <a href="https://docs.microsoft.com/windows-hardware/drivers/install/difx-guidelines">driver package</a> requires additional software that may or not be installed in the computer.
 * 
 * After the <a href="https://docs.microsoft.com/windows-hardware/drivers/install/difx-guidelines">driver package</a> for the device is installed, the Plug and Play (PnP) manager performs the following steps if the installer sets the DNF_REQUESTADDITIONALSOFTWARE flag:
 * 
 * <ol>
 * <li>
 * The PnP manager generates a Problem Report and Solution (PRS) error report with the type of <b>RequestAddtionalSoftware</b>. This report contains information about the specific hardware ID of the device and the system architecture of the computer. 
 * 
 * </li>
 * <li>
 * If there is a solution that is provided by the independent hardware vendor (IHV) for the device-specific software, the solution is downloaded to the computer.
 * 
 * <div class="alert"><b>Note</b>  The download of the solution does not install the software itself.</div>
 * <div> </div>
 * </li>
 * <li>
 * If the device-specific software is not installed on the computer, the PnP manager presents the solution to the user and provides a link to download the software. The user can then choose to download and install this software by following the instructions presented in the solution.
 * 
 * </li>
 * </ol>
 * <div class="alert"><b>Note</b>  The installer does not have to set the DNF_REQUESTADDITIONALSOFTWARE flag if the INF file for the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/difxapi/driverpackagepreinstall">driver package</a> has set the <b>RequestAdditionalSoftware </b> flag in the <a href="https://docs.microsoft.com/windows-hardware/drivers/install/inf-controlflags-section">INF ControlFlags Section</a>.</div>
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_drvinstall_params
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SP_DRVINSTALL_PARAMS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size, in bytes, of the SP_DRVINSTALL_PARAMS structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The rank match of this driver. Ranges from 0 to <i>n</i>, where 0 is the most compatible.
     * @type {Integer}
     */
    Rank {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Flags that control functions operating on this driver. Can be a combination of the following:
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A field a class installer can use to store private data. Co-installers should not use this field.
     * @type {Pointer}
     */
    PrivateData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Reserved. For internal use only.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 32
    }
}
