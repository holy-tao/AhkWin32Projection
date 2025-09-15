#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * An SP_DRVINFO_DETAIL_DATA structure contains detailed information about a particular driver information structure. (Unicode)
 * @remarks
 * The <a href="https://docs.microsoft.com/windows-hardware/drivers/install/hardware-ids">hardware ID</a> and <a href="https://docs.microsoft.com/windows-hardware/drivers/install/compatible-ids">compatible IDs</a> for a device are specified in the <a href="https://docs.microsoft.com/windows-hardware/drivers/install/inf-models-section">INF Models section</a> in the following order:
  * 
  * <ul>
  * <li>
  * The first ID (if specified) is the hardware ID for the device.
  * 
  * </li>
  * <li>
  * The remaining IDs (if specified) are compatible IDs for the device.
  * 
  * </li>
  * </ul>
  * When you parse the <b>HardwareID</b> buffer, you must ensure that you correctly determine the end of the data in the buffer. Be aware that the buffer is not necessarily double NULL terminated.
  * 
  * For example, depending on how the list of <a href="https://docs.microsoft.com/windows-hardware/drivers/install/hardware-ids">hardware ID</a> and <a href="https://docs.microsoft.com/windows-hardware/drivers/install/compatible-ids">compatible IDs</a> are specified in the <a href="https://docs.microsoft.com/windows-hardware/drivers/install/inf-models-section">INF Models section</a>, the <b>HardwareID</b> buffer can resemble any of the following:
  * 
  * <ul>
  * <li>
  * \0
  * 
  * </li>
  * <li>
  * &lt;HWID&gt;\0
  * 
  * </li>
  * <li>
  * &lt;HWID&gt;\0&lt;COMPATID_1&gt;\0...&lt;COMPATID_N&gt;\0\0
  * 
  * </li>
  * <li>
  * \0&lt;COMPATID_1&gt;\0...&lt;COMPATID_N&gt;\0\0
  * 
  * </li>
  * </ul>
  * An algorithm to correctly parse this buffer must use the <b>CompatIDsOffset</b> and <b>CompatIDsLength</b> fields to extract the <a href="https://docs.microsoft.com/windows-hardware/drivers/install/hardware-ids">hardware ID</a> and <a href="https://docs.microsoft.com/windows-hardware/drivers/install/compatible-ids">compatible IDs</a>, as shown in the following code example:
  * 
  * 
  * ```
  * // parse the hardware ID, if it exists
  * if (CompatIDsOffset > 1)
  * {
  *     // Parse for hardware ID from index 0. 
  *     // This is a single NULL-terminated string
  * }
  *  // Parse the compatible IDs, if they exist
  * if (CompatIDsLength > 0)
  * {
  *     // Parse for list of compatible IDs from CompatIDsOffset. 
  *     // This is a double NULL-terminated list of strings (i.e. MULTI-SZ)
  * }
  * ```
  * 
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The setupapi.h header defines SP_DRVINFO_DETAIL_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_drvinfo_detail_data_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class SP_DRVINFO_DETAIL_DATA_W extends Win32Struct
{
    static sizeof => 1584

    static packingSize => 8

    /**
     * The size, in bytes, of the SP_DRVINFO_DETAIL_DATA structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Date of the INF file for this driver.
     * @type {FILETIME}
     */
    InfDate{
        get {
            if(!this.HasProp("__InfDate"))
                this.__InfDate := FILETIME(this.ptr + 8)
            return this.__InfDate
        }
    }

    /**
     * The offset, in characters, from the beginning of the <b>HardwareID</b> buffer where the CompatIDs list begins.
     * 
     * This value can also be used to determine whether there is a <a href="https://docs.microsoft.com/windows-hardware/drivers/install/hardware-ids">hardware ID</a> that precedes the CompatIDs list. If this value is greater than 1, the first string in the <b>HardwareID</b> buffer is the hardware ID. If this value is less than or equal to 1, there is no hardware ID.
     * @type {Integer}
     */
    CompatIDsOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The length, in characters, of the CompatIDs list starting at offset <b>CompatIDsOffset</b> from the beginning of the <b>HardwareID</b> buffer. 
     * 
     * If <b>CompatIDsLength</b> is nonzero, the CompatIDs list contains one or more NULL-terminated strings with an additional NULL character at the end of the list.
     * 
     * If <b>CompatIDsLength</b> is zero, the CompatIDs list is empty. In that case, there is no additional NULL character at the end of the list.
     * @type {Integer}
     */
    CompatIDsLength {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Reserved. For internal use only.
     * @type {Pointer}
     */
    Reserved {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A NULL-terminated string that contains the name of the <a href="https://docs.microsoft.com/windows-hardware/drivers/install/inf-ddinstall-section">INF DDInstall section</a> for this driver. This must be the basic <i>DDInstall</i> section name, such as <b>InstallSec</b>, without any OS/architecture-specific extensions.
     * @type {String}
     */
    SectionName {
        get => StrGet(this.ptr + 32, 255, "UTF-16")
        set => StrPut(value, this.ptr + 32, 255, "UTF-16")
    }

    /**
     * A NULL-terminated string that contains the full-qualified name of the INF file for this driver.
     * @type {String}
     */
    InfFileName {
        get => StrGet(this.ptr + 544, 259, "UTF-16")
        set => StrPut(value, this.ptr + 544, 259, "UTF-16")
    }

    /**
     * A NULL-terminated string that describes the driver.
     * @type {String}
     */
    DrvDescription {
        get => StrGet(this.ptr + 1064, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1064, 255, "UTF-16")
    }

    /**
     * A buffer that contains a list of IDs (a single <a href="https://docs.microsoft.com/windows-hardware/drivers/install/hardware-ids">hardware ID</a> followed by a list of <a href="https://docs.microsoft.com/windows-hardware/drivers/install/compatible-ids">compatible IDs</a>). These IDs correspond to the hardware ID and compatible IDs in the <a href="https://docs.microsoft.com/windows-hardware/drivers/install/inf-models-section">INF Models section</a>. 
     * 
     * Each ID in the list is a NULL-terminated string.
     * 
     * If the hardware ID exists (that is, if <b>CompatIDsOffset</b> is greater than one), this single NULL-terminated string is found at the beginning of the buffer. 
     * 
     * If the CompatIDs list is not empty (that is, if <b>CompatIDsLength</b> is not zero), the CompatIDs list starts at offset <b>CompatIDsOffset</b> from the beginning of this buffer, and is terminated with an additional NULL character at the end of the list.
     * @type {String}
     */
    HardwareID {
        get => StrGet(this.ptr + 1576, 0, "UTF-16")
        set => StrPut(value, this.ptr + 1576, 0, "UTF-16")
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 1584
    }
}
