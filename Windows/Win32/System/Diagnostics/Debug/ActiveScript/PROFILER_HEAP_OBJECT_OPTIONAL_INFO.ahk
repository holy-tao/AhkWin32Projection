#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include .\PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST.ahk
#Include ..\..\..\..\Foundation\PWSTR.ahk
#Include .\PROFILER_HEAP_OBJECT_RELATIONSHIP.ahk
#Include .\PROFILER_HEAP_OBJECT_SCOPE_LIST.ahk
#Include .\PROFILER_HEAP_OBJECT_OPTIONAL_INFO_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class PROFILER_HEAP_OBJECT_OPTIONAL_INFO extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PROFILER_HEAP_OBJECT_OPTIONAL_INFO_TYPE}
     */
    infoType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    prototype {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    functionName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    elementAttributesSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    elementTextChildrenSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<PROFILER_HEAP_OBJECT_SCOPE_LIST>}
     */
    scopeList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PROFILER_HEAP_OBJECT_RELATIONSHIP>}
     */
    internalProperty {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST>}
     */
    namePropertyList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST>}
     */
    indexPropertyList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST>}
     */
    relationshipList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST>}
     */
    eventList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST>}
     */
    weakMapCollectionList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST>}
     */
    mapCollectionList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST>}
     */
    setCollectionList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
