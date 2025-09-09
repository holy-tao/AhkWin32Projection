#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the schema of an instance.
 * @remarks
 * The <b>MI_Class</b> object represents the schema of an instance.  Classes can be retrieved from the server, and instances can be queried for the <b>MI_Class</b> object.  Use the <b>MI_Class</b> APIs rather than navigating the structures themselves.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_class
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Class extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Pointer to <b>MI_Class</b> function table.
     * @type {Pointer<MI_ClassFT>}
     */
    ft {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to the class declaration.
     * @type {Pointer<MI_ClassDecl>}
     */
    classDecl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The namespace name.
     * @type {Pointer<UInt16>}
     */
    namespaceName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The server name.
     * @type {Pointer<UInt16>}
     */
    serverName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Reserved for internal use.
     * @type {Array<IntPtr>}
     */
    reserved{
        get {
            if(!this.HasProp("__reservedProxyArray"))
                this.__reservedProxyArray := Win32FixedArray(this.ptr + 32, 4, Primitive, "ptr")
            return this.__reservedProxyArray
        }
    }
}
