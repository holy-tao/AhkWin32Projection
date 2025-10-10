#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure is used by the WdsTransportProviderInitialize callback function.
 * @see https://docs.microsoft.com/windows/win32/api//wdstpdi/ns-wdstpdi-wds_transportprovider_settings
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDS_TRANSPORTPROVIDER_SETTINGS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The length of this structure.
     * 
     * The version of the api that this provider implements.
     * @type {Integer}
     */
    ulLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    ulProviderVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
