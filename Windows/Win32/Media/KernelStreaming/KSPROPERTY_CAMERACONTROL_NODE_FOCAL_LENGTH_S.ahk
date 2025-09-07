#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include .\KSNODEPROPERTY.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_CAMERACONTROL_NODE_FOCAL_LENGTH_S extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {KSNODEPROPERTY}
     */
    NodeProperty{
        get {
            if(!this.HasProp("__NodeProperty"))
                this.__NodeProperty := KSNODEPROPERTY(this.ptr + 0)
            return this.__NodeProperty
        }
    }

    /**
     * @type {Integer}
     */
    lOcularFocalLength {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    lObjectiveFocalLengthMin {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    lObjectiveFocalLengthMax {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
