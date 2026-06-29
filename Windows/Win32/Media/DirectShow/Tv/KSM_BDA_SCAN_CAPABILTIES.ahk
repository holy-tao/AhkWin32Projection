#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSM_BDA_SCAN_CAPABILTIES extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Method {
        get {
            if(!this.HasProp("__Method"))
                this.__Method := KSIDENTIFIER(0, this)
            return this.__Method
        }
    }

    /**
     * @type {Guid}
     */
    uuidBroadcastStandard {
        get {
            if(!this.HasProp("__uuidBroadcastStandard"))
                this.__uuidBroadcastStandard := Guid(24, this)
            return this.__uuidBroadcastStandard
        }
    }
}
