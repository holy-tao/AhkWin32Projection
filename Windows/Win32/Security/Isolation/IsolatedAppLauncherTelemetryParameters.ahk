#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Security.Isolation
 * @version v4.0.30319
 */
class IsolatedAppLauncherTelemetryParameters extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {BOOL}
     */
    EnableForLaunch{
        get {
            if(!this.HasProp("__EnableForLaunch"))
                this.__EnableForLaunch := BOOL(this.ptr + 0)
            return this.__EnableForLaunch
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    CorrelationGUID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
