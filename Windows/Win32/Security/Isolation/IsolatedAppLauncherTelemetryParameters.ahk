#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Security.Isolation
 */
class IsolatedAppLauncherTelemetryParameters extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    EnableForLaunch {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    CorrelationGUID {
        get {
            if(!this.HasProp("__CorrelationGUID"))
                this.__CorrelationGUID := Guid(4, this)
            return this.__CorrelationGUID
        }
    }
}
