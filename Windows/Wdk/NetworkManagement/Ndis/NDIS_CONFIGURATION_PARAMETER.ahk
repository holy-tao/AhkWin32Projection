#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_CONFIGURATION_PARAMETER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _ParameterData_e__Union extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        IntegerData {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {UNICODE_STRING}
         */
        StringData{
            get {
                if(!this.HasProp("__StringData"))
                    this.__StringData := UNICODE_STRING(0, this)
                return this.__StringData
            }
        }
    
        /**
         * @type {Pointer<BINARY_DATA>}
         */
        BinaryData {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    /**
     * @type {Integer}
     */
    ParameterType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {_ParameterData_e__Union}
     */
    ParameterData{
        get {
            if(!this.HasProp("__ParameterData"))
                this.__ParameterData := %this.__Class%._ParameterData_e__Union(8, this)
            return this.__ParameterData
        }
    }
}
