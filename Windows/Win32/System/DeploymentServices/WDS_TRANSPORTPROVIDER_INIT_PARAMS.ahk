#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Registry\HKEY.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * This structure is used by the WdsTransportProviderInitialize callback function. (WDS_TRANSPORTPROVIDER_INIT_PARAMS)
 * @see https://learn.microsoft.com/windows/win32/api/wdstpdi/ns-wdstpdi-wds_transportprovider_init_params
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDS_TRANSPORTPROVIDER_INIT_PARAMS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The length of this structure.
     * @type {Integer}
     */
    ulLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The multicast server's version.
     * @type {Integer}
     */
    ulMcServerVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An open handle to the registry key where this provider should
     *      store and retrieve its settings.
     * @type {HKEY}
     */
    hRegistryKey{
        get {
            if(!this.HasProp("__hRegistryKey"))
                this.__hRegistryKey := HKEY(8, this)
            return this.__hRegistryKey
        }
    }

    /**
     * A handle that the provider can use to uniquely identify itself in calls to the multicast server.
     * @type {HANDLE}
     */
    hProvider{
        get {
            if(!this.HasProp("__hProvider"))
                this.__hProvider := HANDLE(16, this)
            return this.__hProvider
        }
    }
}
