#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDDEVICEIDENTIFIER2 structure is passed to the IDirectDraw7::GetDeviceIdentifier method to obtain information about a device.
 * @remarks
 * The values in <b>szDriver</b> and <b>szDescription</b> are for presentation to the user only. They should not be used to identify particular drivers because different strings might be associated with the same device, or the same driver from different vendors might be described differently.
  * 
  * 
  * 
  * The <b>dwVendorId</b>, <b>dwDeviceId</b>, <b>dwSubSysId</b>, and <b>dwRevision</b> members can be used to identify particular chipsets, but use extreme caution.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/ns-ddraw-dddeviceidentifier2
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDDEVICEIDENTIFIER2 extends Win32Struct
{
    static sizeof => 2088

    static packingSize => 8

    /**
     * Name of the driver.
     * @type {String}
     */
    szDriver {
        get => StrGet(this.ptr + 0, 511, "UTF-16")
        set => StrPut(value, this.ptr + 0, 511, "UTF-16")
    }

    /**
     * Description of the driver.
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 1024, 511, "UTF-16")
        set => StrPut(value, this.ptr + 1024, 511, "UTF-16")
    }

    /**
     * Version of the driver. It is valid to do less than and greater than comparisons on all 64 bits. Caution should be exercised if you use this element to identify problematic drivers; instead, use the <b>guidDeviceIdentifier</b> member for this purpose.
     * 
     * The data takes the following form:
     * 
     * 
     * ```
     * 
     * wProduct = HIWORD(liDriverVersion.HighPart)
     * wVersion = LOWORD(liDriverVersion.HighPart)
     * wSubVersion = HIWORD(liDriverVersion.LowPart)
     * wBuild = LOWORD(liDriverVersion.LowPart)
     * 
     * ```
     * @type {Integer}
     */
    liDriverVersion {
        get => NumGet(this, 2048, "int64")
        set => NumPut("int64", value, this, 2048)
    }

    /**
     * Identifier of the manufacturer. Can be 0 if unknown.
     * @type {Integer}
     */
    dwVendorId {
        get => NumGet(this, 2056, "uint")
        set => NumPut("uint", value, this, 2056)
    }

    /**
     * Identifier of the type of chipset. Can be 0 if unknown.
     * @type {Integer}
     */
    dwDeviceId {
        get => NumGet(this, 2060, "uint")
        set => NumPut("uint", value, this, 2060)
    }

    /**
     * Identifier of the subsystem. Typically, this means the particular board. Can be 0 if unknown.
     * @type {Integer}
     */
    dwSubSysId {
        get => NumGet(this, 2064, "uint")
        set => NumPut("uint", value, this, 2064)
    }

    /**
     * Identifier of the revision level of the chipset. Can be 0 if unknown.
     * @type {Integer}
     */
    dwRevision {
        get => NumGet(this, 2068, "uint")
        set => NumPut("uint", value, this, 2068)
    }

    /**
     * Unique identifier for the driver and chipset pair. Use this value if you want to track changes to the driver or chipset to reprofile the graphics subsystem. It can also be used to identify particular problematic drivers.
     * @type {Pointer<Guid>}
     */
    guidDeviceIdentifier {
        get => NumGet(this, 2072, "ptr")
        set => NumPut("ptr", value, this, 2072)
    }

    /**
     * The Windows Hardware Quality Lab (WHQL) certification level for the device and driver pair.
     * @type {Integer}
     */
    dwWHQLLevel {
        get => NumGet(this, 2080, "uint")
        set => NumPut("uint", value, this, 2080)
    }
}
