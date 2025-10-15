#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class PROFILER_HEAP_OBJECT_RELATIONSHIP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    relationshipId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    relationshipInfo {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Float}
     */
    numberValue {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    stringValue{
        get {
            if(!this.HasProp("__stringValue"))
                this.__stringValue := PWSTR(this.ptr + 8)
            return this.__stringValue
        }
    }

    /**
     * @type {BSTR}
     */
    bstrValue{
        get {
            if(!this.HasProp("__bstrValue"))
                this.__bstrValue := BSTR(this.ptr + 8)
            return this.__bstrValue
        }
    }

    /**
     * @type {Pointer}
     */
    objectId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    externalObjectAddress {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PROFILER_PROPERTY_TYPE_SUBSTRING_INFO>}
     */
    subString {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
