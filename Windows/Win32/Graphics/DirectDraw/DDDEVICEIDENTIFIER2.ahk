#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

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
 */
export default struct DDDEVICEIDENTIFIER2 {
    #StructPack 8

    /**
     * Name of the driver.
     */
    szDriver : CHAR[512]

    /**
     * Description of the driver.
     */
    szDescription : CHAR[512]

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
     */
    liDriverVersion : Int64

    /**
     * Identifier of the manufacturer. Can be 0 if unknown.
     */
    dwVendorId : UInt32

    /**
     * Identifier of the type of chipset. Can be 0 if unknown.
     */
    dwDeviceId : UInt32

    /**
     * Identifier of the subsystem. Typically, this means the particular board. Can be 0 if unknown.
     */
    dwSubSysId : UInt32

    /**
     * Identifier of the revision level of the chipset. Can be 0 if unknown.
     */
    dwRevision : UInt32

    /**
     * Unique identifier for the driver and chipset pair. Use this value if you want to track changes to the driver or chipset to reprofile the graphics subsystem. It can also be used to identify particular problematic drivers.
     */
    guidDeviceIdentifier : Guid

    /**
     * The Windows Hardware Quality Lab (WHQL) certification level for the device and driver pair.
     */
    dwWHQLLevel : UInt32

}
