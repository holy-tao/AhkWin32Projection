#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DSQUERYCLASSLIST structure describes a list of classes against which a directory service query is made.
 * @remarks
 * The class list is retrieved by the form pages upon receiving a DSQPM_GETCLASSLIST page message.
 * @see https://learn.microsoft.com/windows/win32/api/dsquery/ns-dsquery-dsqueryclasslist
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DSQUERYCLASSLIST extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of the classes in the array.
     * @type {Integer}
     */
    cClasses {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Offset to the class names of Unicode strings.
     * @type {Array<UInt32>}
     */
    offsetClass{
        get {
            if(!this.HasProp("__offsetClassProxyArray"))
                this.__offsetClassProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "uint")
            return this.__offsetClassProxyArray
        }
    }
}
