#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NTMS_CHANGERTYPEINFORMATION structure defines the properties specific to a type of robotic changer supported by RSM. (Unicode)
 * @remarks
 * The 
  * <b>NTMS_CHANGERTYPEINFORMATION</b> structure is included in the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The ntmsapi.h header defines NTMS_CHANGERTYPEINFORMATION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_changertypeinformationw
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 * @charset Unicode
 */
class NTMS_CHANGERTYPEINFORMATIONW extends Win32Struct
{
    static sizeof => 516

    static packingSize => 4

    /**
     * Name of the vendor of the changer. This is acquired directly from the device inquiry data.
     * @type {String}
     */
    szVendor {
        get => StrGet(this.ptr + 0, 127, "UTF-16")
        set => StrPut(value, this.ptr + 0, 127, "UTF-16")
    }

    /**
     * Product name of the changer. This is acquired directly from the device inquiry data.
     * @type {String}
     */
    szProduct {
        get => StrGet(this.ptr + 256, 127, "UTF-16")
        set => StrPut(value, this.ptr + 256, 127, "UTF-16")
    }

    /**
     * SCSI device type as reported from device inquiry data. From Winioctl.h. This can be the following value. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_DEVICE_CHANGER"></a><a id="file_device_changer"></a><dl>
     * <dt><b>FILE_DEVICE_CHANGER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Changer device.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    DeviceType {
        get => NumGet(this, 512, "uint")
        set => NumPut("uint", value, this, 512)
    }
}
