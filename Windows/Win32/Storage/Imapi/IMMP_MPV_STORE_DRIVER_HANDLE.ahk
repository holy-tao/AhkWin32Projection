#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 */
class IMMP_MPV_STORE_DRIVER_HANDLE extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Guid}
     */
    guidSignature {
        get {
            if(!this.HasProp("__guidSignature"))
                this.__guidSignature := Guid(0, this)
            return this.__guidSignature
        }
    }
}
