#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies one or more security attributes and values.
 * @see https://docs.microsoft.com/windows/win32/api//authz/ns-authz-authz_security_attributes_information
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUTHZ_SECURITY_ATTRIBUTES_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    class _Attribute_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<AUTHZ_SECURITY_ATTRIBUTE_V1>}
         */
        pAttributeV1 {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    /**
     * The  version of this structure. Currently the only value supported is 1.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The number of attributes specified by the <b>Attribute</b> member.
     * @type {Integer}
     */
    AttributeCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {_Attribute_e__Union}
     */
    Attribute{
        get {
            if(!this.HasProp("__Attribute"))
                this.__Attribute := %this.__Class%._Attribute_e__Union(8, this)
            return this.__Attribute
        }
    }
}
