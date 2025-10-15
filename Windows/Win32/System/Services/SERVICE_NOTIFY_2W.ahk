#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SERVICE_STATUS_PROCESS.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 * @charset Unicode
 */
class SERVICE_NOTIFY_2W extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<PFN_SC_NOTIFY_CALLBACK>}
     */
    pfnNotifyCallback {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    pContext {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwNotificationStatus {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {SERVICE_STATUS_PROCESS}
     */
    ServiceStatus{
        get {
            if(!this.HasProp("__ServiceStatus"))
                this.__ServiceStatus := SERVICE_STATUS_PROCESS(this.ptr + 32)
            return this.__ServiceStatus
        }
    }

    /**
     * @type {Integer}
     */
    dwNotificationTriggered {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {PWSTR}
     */
    pszServiceNames{
        get {
            if(!this.HasProp("__pszServiceNames"))
                this.__pszServiceNames := PWSTR(this.ptr + 72)
            return this.__pszServiceNames
        }
    }
}
