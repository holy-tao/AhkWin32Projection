#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SERVICE_STATUS_PROCESS.ahk

/**
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_NOTIFY_1 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Ptr>}
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
}
