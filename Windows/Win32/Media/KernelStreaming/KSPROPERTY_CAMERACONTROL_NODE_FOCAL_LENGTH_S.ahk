#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSNODEPROPERTY.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_CAMERACONTROL_NODE_FOCAL_LENGTH_S extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {KSNODEPROPERTY}
     */
    NodeProperty {
        get {
            if(!this.HasProp("__NodeProperty"))
                this.__NodeProperty := KSNODEPROPERTY(0, this)
            return this.__NodeProperty
        }
    }

    /**
     * @type {Integer}
     */
    lOcularFocalLength {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    lObjectiveFocalLengthMin {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    lObjectiveFocalLengthMax {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
