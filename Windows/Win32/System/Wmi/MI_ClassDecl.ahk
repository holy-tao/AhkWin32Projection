#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure outlines the class declaration. It contains class name and hierarchy, properties, qualifiers, and methods.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_classdecl
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_ClassDecl extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * Flags can consist of values from following list.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Hash code: (name[0] &lt;&lt; 16) | (name[len-1] &lt;&lt; 8) | len
     * @type {Integer}
     */
    code {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Name of this feature.
     * @type {Pointer<Integer>}
     */
    name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Describes extra metadata for classes, properties, methods, and parameters.
     * @type {Pointer<Pointer<MI_Qualifier>>}
     */
    qualifiers {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Length of <b>qualifiers</b> array.
     * @type {Integer}
     */
    numQualifiers {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The properties of this object.
     * @type {Pointer<Pointer<MI_PropertyDecl>>}
     */
    properties {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The number of properties of this object.
     * @type {Integer}
     */
    numProperties {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Size of structure described by <b>MI_ClassDecl</b>.
     * @type {Integer}
     */
    size {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Parent class name.
     * @type {Pointer<Integer>}
     */
    superClass {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The classDecl for the parent class <b>superClass</b>.
     * @type {Pointer<MI_ClassDecl>}
     */
    superClassDecl {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The methods of this class.
     * @type {Pointer<Pointer<MI_MethodDecl>>}
     */
    methods {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Number of  methods in this class.
     * @type {Integer}
     */
    numMethods {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Pointer to schema this class belongs to.
     * @type {Pointer<MI_SchemaDecl>}
     */
    schema {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Provider functions.
     * @type {Pointer<MI_ProviderFT>}
     */
    providerFT {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Owning <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_class">MI_Class</a> object, if any.
     * @type {Pointer<MI_Class>}
     */
    owningClass {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
