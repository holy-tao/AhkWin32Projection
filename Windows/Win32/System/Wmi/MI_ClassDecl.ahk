#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_ProviderFT.ahk" { MI_ProviderFT }
#Import ".\MI_Class.ahk" { MI_Class }
#Import ".\MI_MethodDecl.ahk" { MI_MethodDecl }
#Import ".\MI_PropertyDecl.ahk" { MI_PropertyDecl }
#Import ".\MI_Qualifier.ahk" { MI_Qualifier }
#Import ".\MI_SchemaDecl.ahk" { MI_SchemaDecl }

/**
 * This structure outlines the class declaration. It contains class name and hierarchy, properties, qualifiers, and methods.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_classdecl
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ClassDecl {
    #StructPack 8

    /**
     * Flags can consist of values from following list.
     */
    flags : UInt32

    /**
     * Hash code: (name[0] &lt;&lt; 16) | (name[len-1] &lt;&lt; 8) | len
     */
    code : UInt32

    /**
     * Name of this feature.
     */
    name : IntPtr

    /**
     * Describes extra metadata for classes, properties, methods, and parameters.
     */
    qualifiers : IntPtr

    /**
     * Length of <b>qualifiers</b> array.
     */
    numQualifiers : UInt32

    /**
     * The properties of this object.
     */
    properties : IntPtr

    /**
     * The number of properties of this object.
     */
    numProperties : UInt32

    /**
     * Size of structure described by <b>MI_ClassDecl</b>.
     */
    size : UInt32

    /**
     * Parent class name.
     */
    superClass : IntPtr

    /**
     * The classDecl for the parent class <b>superClass</b>.
     */
    superClassDecl : MI_ClassDecl.Ptr

    /**
     * The methods of this class.
     */
    methods : IntPtr

    /**
     * Number of  methods in this class.
     */
    numMethods : UInt32

    /**
     * Pointer to schema this class belongs to.
     */
    schema : MI_SchemaDecl.Ptr

    /**
     * Provider functions.
     */
    providerFT : MI_ProviderFT.Ptr

    __owningClass_ptr : IntPtr
    /**
     * Owning <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_class">MI_Class</a> object, if any.
     */
    owningClass {
        get => (addr := this.__owningClass_ptr) ? MI_Class.At(addr) : unset
        set => this.__owningClass_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

}
