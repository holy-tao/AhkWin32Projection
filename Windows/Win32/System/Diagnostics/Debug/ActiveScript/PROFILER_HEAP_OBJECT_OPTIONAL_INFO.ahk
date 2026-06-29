#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST.ahk" { PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST }
#Import ".\PROFILER_HEAP_OBJECT_SCOPE_LIST.ahk" { PROFILER_HEAP_OBJECT_SCOPE_LIST }
#Import ".\PROFILER_HEAP_OBJECT_OPTIONAL_INFO_TYPE.ahk" { PROFILER_HEAP_OBJECT_OPTIONAL_INFO_TYPE }
#Import ".\PROFILER_HEAP_OBJECT_RELATIONSHIP.ahk" { PROFILER_HEAP_OBJECT_RELATIONSHIP }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct PROFILER_HEAP_OBJECT_OPTIONAL_INFO {
    #StructPack 8

    infoType : PROFILER_HEAP_OBJECT_OPTIONAL_INFO_TYPE

    prototype : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'functionName', { type: PWSTR, offset: 8 })
        DefineProp(this.Prototype, 'elementAttributesSize', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'elementTextChildrenSize', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'scopeList', { type: PROFILER_HEAP_OBJECT_SCOPE_LIST.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'internalProperty', { type: PROFILER_HEAP_OBJECT_RELATIONSHIP.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'namePropertyList', { type: PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'indexPropertyList', { type: PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'relationshipList', { type: PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'eventList', { type: PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'weakMapCollectionList', { type: PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'mapCollectionList', { type: PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'setCollectionList', { type: PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
