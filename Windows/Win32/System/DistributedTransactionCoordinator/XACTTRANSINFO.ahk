#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BOID.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class XACTTRANSINFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {BOID}
     */
    uow{
        get {
            if(!this.HasProp("__uow"))
                this.__uow := BOID(0, this)
            return this.__uow
        }
    }

    /**
     * @type {Integer}
     */
    isoLevel {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    isoFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    grfTCSupported {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    grfRMSupported {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    grfTCSupportedRetaining {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    grfRMSupportedRetaining {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
