#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DRVENABLEDATA structure contains a pointer to an array of DRVFN structures and the graphics DDI version number of an NT-based operating system.
 * @remarks
 * To run on these NT-based operating systems versions, the <b>iDriverVersion</b> member must be set as follows:
  * 
  * <table>
  * <tr>
  * <th>Windows version</th>
  * <th>Value of iDriverVersion</th>
  * </tr>
  * <tr>
  * <td>
  * Windows NT 4.0
  * 
  * </td>
  * <td>
  * <b>iDriverVersion</b> == DDI_DRIVER_VERSION_NT4
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * Windows NT 4.0 SP3
  * 
  * </td>
  * <td>
  * DDI_DRIVER_VERSION_NT4 &lt;= <b>iDriverVersion</b> &lt;= DDI_DRIVER_VERSION_SP3
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * Windows 2000
  * 
  * </td>
  * <td>
  * DDI_DRIVER_VERSION_NT4 &lt;= <b>iDriverVersion</b> &lt;= DDI_DRIVER_VERSION_NT5
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * Windows XP
  * 
  * </td>
  * <td>
  * DDI_DRIVER_VERSION_NT4 &lt;= <b>iDriverVersion</b> &lt;= DDI_DRIVER_VERSION_NT5_01
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * Windows XP SP1
  * 
  * </td>
  * <td>
  * DDI_DRIVER_VERSION_NT4 &lt;= <b>iDriverVersion</b> &lt;= DDI_DRIVER_VERSION_NT5_01_SP1
  * 
  * </td>
  * </tr>
  * </table>
  *  
  * 
  * As the table shows, a driver can run on any of these operating system versions if <b>iDriverVersion</b> is set to DDI_DRIVER_VERSION_NT4, but a driver can run only on Windows XP and later versions of the operating system if <b>iDriverVersion</b> is set to DDI_DRIVER_VERSION_NT5_01.
  * 
  * <div class="alert"><b>Note</b>  If a driver implements a <i>DrvXxx</i> graphics DDI that is not supported in all versions of Windows, the driver cannot specify a DRVFN entry for that graphics DDI when running on versions of Windows that do not support it. If the driver does specify a DRVFN entry for such a graphics DDI, Windows will reject the driver. The <i>permedia2</i> sample demonstrates how to specify different DRVFN structures for different versions of Windows.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-drvenabledata
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DRVENABLEDATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    iDriverVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the number of <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-drvfn">DRVFN</a> structures in the buffer pointed to by the <b>pdrvfn</b> member.
     * @type {Integer}
     */
    c {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to a buffer containing an array of <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-drvfn">DRVFN</a> structures.
     * @type {Pointer<DRVFN>}
     */
    pdrvfn {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
