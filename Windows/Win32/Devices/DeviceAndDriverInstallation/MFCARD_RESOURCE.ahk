#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MFCARD_DES.ahk

/**
 * The MFCARD_RESOURCE structure is used for specifying either a resource list or a resource requirements list that describes resource usage by one of the hardware functions provided by an instance of a multifunction device.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-mfcard_resource
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class MFCARD_RESOURCE extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * A [MFCARD_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-mfcard_des) structure.
     * @type {MFCARD_DES}
     */
    MfCard_Header{
        get {
            if(!this.HasProp("__MfCard_Header"))
                this.__MfCard_Header := MFCARD_DES(0, this)
            return this.__MfCard_Header
        }
    }
}
