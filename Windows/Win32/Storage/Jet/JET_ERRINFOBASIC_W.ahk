#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_ERRINFOBASIC_W extends Win32Struct
{
    static sizeof => 152

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    errValue {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    errcatMostSpecific {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    rgCategoricalHierarchy{
        get {
            if(!this.HasProp("__rgCategoricalHierarchyProxyArray"))
                this.__rgCategoricalHierarchyProxyArray := Win32FixedArray(this.ptr + 12, 8, Primitive, "char")
            return this.__rgCategoricalHierarchyProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    lSourceLine {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {String}
     */
    rgszSourceFile {
        get => StrGet(this.ptr + 24, 63, "UTF-16")
        set => StrPut(value, this.ptr + 24, 63, "UTF-16")
    }
}
