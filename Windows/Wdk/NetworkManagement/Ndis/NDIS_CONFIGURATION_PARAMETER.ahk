#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_PARAMETER_TYPE.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_CONFIGURATION_PARAMETER extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    class _ParameterData_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        IntegerData {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        StringData {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        BinaryData {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    }

    /**
     * @type {NDIS_PARAMETER_TYPE}
     */
    ParameterType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {_ParameterData_e__Union}
     */
    ParameterData {
        get {
            if(!this.HasProp("__ParameterData"))
                this.__ParameterData := NDIS_CONFIGURATION_PARAMETER._ParameterData_e__Union(8, this)
            return this.__ParameterData
        }
    }
}
