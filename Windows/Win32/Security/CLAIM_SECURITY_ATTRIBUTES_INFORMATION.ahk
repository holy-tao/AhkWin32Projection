#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\CLAIM_SECURITY_ATTRIBUTE_V1.ahk

/**
 * Defines the security attributes for the claim.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-claim_security_attributes_information
 * @namespace Windows.Win32.Security
 */
class CLAIM_SECURITY_ATTRIBUTES_INFORMATION extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    class _Attribute extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<CLAIM_SECURITY_ATTRIBUTE_V1>}
         */
        pAttributeV1 {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    }

    /**
     * The version of the security attribute. This must be CLAIM_SECURITY_ATTRIBUTES_INFORMATION_VERSION_V1.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * This member is currently reserved and must be zero when setting an attribute and is ignored when getting an attribute.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The number of values.
     * @type {Integer}
     */
    AttributeCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The actual attribute.
     * @type {_Attribute}
     */
    Attribute {
        get {
            if(!this.HasProp("__Attribute"))
                this.__Attribute := CLAIM_SECURITY_ATTRIBUTES_INFORMATION._Attribute(8, this)
            return this.__Attribute
        }
    }
}
