#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information identifying the adapter.
 * @remarks
 * The following pseudocode example illustrates the version format encoded in the DriverVersion, DriverVersionLowPart, and DriverVersionHighPart members.
  * 
  * 
  * ```
  * Product = HIWORD(DriverVersion.HighPart)
  * Version = LOWORD(DriverVersion.HighPart)
  * SubVersion = HIWORD(DriverVersion.LowPart)
  * Build = LOWORD(DriverVersion.LowPart)
  * ```
  * 
  * 
  * 
  * See the Platform SDK for more information about the HIWORD macro, the LOWORD macro, and the LARGE\_INTEGER structure.
  * 
  * MAX\_DEVICE\_IDENTIFIER\_STRING is a constant with the following definition.
  * 
  * 
  * ```
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dadapter-identifier9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DADAPTER_IDENTIFIER9 extends Win32Struct
{
    static sizeof => 1092

    static packingSize => 4

    /**
     * Type: **char**
     * 
     * 
     * Used for presentation to the user. This should not be used to identify particular drivers, because many different strings might be associated with the same device and driver from different vendors.
     * @type {Array<SByte>}
     */
    Driver{
        get {
            if(!this.HasProp("__DriverProxyArray"))
                this.__DriverProxyArray := Win32FixedArray(this.ptr + 0, 512, Primitive, "char")
            return this.__DriverProxyArray
        }
    }

    /**
     * Type: **char**
     * 
     * 
     * Used for presentation to the user.
     * @type {Array<SByte>}
     */
    Description{
        get {
            if(!this.HasProp("__DescriptionProxyArray"))
                this.__DescriptionProxyArray := Win32FixedArray(this.ptr + 512, 512, Primitive, "char")
            return this.__DescriptionProxyArray
        }
    }

    /**
     * Type: **char**
     * 
     * 
     * Device name for GDI.
     * @type {Array<SByte>}
     */
    DeviceName{
        get {
            if(!this.HasProp("__DeviceNameProxyArray"))
                this.__DeviceNameProxyArray := Win32FixedArray(this.ptr + 1024, 32, Primitive, "char")
            return this.__DeviceNameProxyArray
        }
    }

    /**
     * Type: **[**LARGE\_INTEGER**](/windows/win32/api/winnt/ns-winnt-large_integer-r1)**
     * 
     * 
     * Identify the version of the Direct3D driver. It is legal to do less than and greater than comparisons on the 64-bit signed integer value. However, exercise caution if you use this element to identify problematic drivers. Instead, you should use DeviceIdentifier. See Remarks.
     * @type {Integer}
     */
    DriverVersion {
        get => NumGet(this, 1056, "int64")
        set => NumPut("int64", value, this, 1056)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Can be used to help identify a particular chip set. Query this member to identify the manufacturer. The value can be zero if unknown.
     * @type {Integer}
     */
    VendorId {
        get => NumGet(this, 1064, "uint")
        set => NumPut("uint", value, this, 1064)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Can be used to help identify a particular chip set. Query this member to identify the type of chip set. The value can be zero if unknown.
     * @type {Integer}
     */
    DeviceId {
        get => NumGet(this, 1068, "uint")
        set => NumPut("uint", value, this, 1068)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Can be used to help identify a particular chip set. Query this member to identify the subsystem, typically the particular board. The value can be zero if unknown.
     * @type {Integer}
     */
    SubSysId {
        get => NumGet(this, 1072, "uint")
        set => NumPut("uint", value, this, 1072)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Can be used to help identify a particular chip set. Query this member to identify the revision level of the chip set. The value can be zero if unknown.
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 1076, "uint")
        set => NumPut("uint", value, this, 1076)
    }

    /**
     * Type: **[**GUID**](guid.md)**
     * 
     * 
     * Can be queried to check changes in the driver and chip set. This GUID is a unique identifier for the driver and chip set pair. Query this member to track changes to the driver and chip set in order to generate a new profile for the graphics subsystem. DeviceIdentifier can also be used to identify particular problematic drivers.
     * @type {Pointer<Guid>}
     */
    DeviceIdentifier {
        get => NumGet(this, 1080, "ptr")
        set => NumPut("ptr", value, this, 1080)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Used to determine the Windows Hardware Quality Labs (WHQL) validation level for this driver and device pair. The DWORD is a packed date structure defining the date of the release of the most recent WHQL test passed by the driver. It is legal to perform < and > operations on this value. The following illustrates the date format.
     * 
     * 
     * 
     * | Bits  |  Description                                             |
     * |-------|-----------------------------------------------|
     * | 31-16 | The year, a decimal number from 1999 upwards. |
     * | 15-8  | The month, a decimal number from 1 to 12.     |
     * | 7-0   | The day, a decimal number from 1 to 31.       |
     * 
     * 
     * 
     *  
     * 
     * The following values are also used.
     * 
     * 
     * 
     * | Value    |  Description                                                     |
     * |-----|-------------------------------------------------------|
     * | 0   | Not certified.                                        |
     * | 1   | WHQL validated, but no date information is available. |
     * 
     * 
     * 
     *  
     * 
     * Differences between Direct3D 9 and Direct3D 9Ex:
     * 
     * For Direct3D9Ex running on Windows Vista, Windows Server 2008, Windows 7, and Windows Server 2008 R2 (or more current operating system), [**IDirect3D9::GetAdapterIdentifier**](/windows/win32/api/d3d9/nf-d3d9-idirect3d9-getadapteridentifier) returns 1 for the WHQL level without checking the status of the driver.
     * @type {Integer}
     */
    WHQLLevel {
        get => NumGet(this, 1088, "uint")
        set => NumPut("uint", value, this, 1088)
    }
}
