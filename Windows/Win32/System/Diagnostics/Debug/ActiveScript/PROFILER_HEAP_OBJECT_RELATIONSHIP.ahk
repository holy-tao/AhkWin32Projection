#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PROFILER_PROPERTY_TYPE_SUBSTRING_INFO.ahk" { PROFILER_PROPERTY_TYPE_SUBSTRING_INFO }
#Import ".\PROFILER_RELATIONSHIP_INFO.ahk" { PROFILER_RELATIONSHIP_INFO }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct PROFILER_HEAP_OBJECT_RELATIONSHIP {
    #StructPack 8

    relationshipId : UInt32

    relationshipInfo : PROFILER_RELATIONSHIP_INFO

    numberValue : Float64

    static __New() {
        DefineProp(this.Prototype, 'stringValue', { type: PWSTR, offset: 8 })
        DefineProp(this.Prototype, 'bstrValue', { type: BSTR, offset: 8 })
        DefineProp(this.Prototype, 'objectId', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'externalObjectAddress', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'subString', { type: PROFILER_PROPERTY_TYPE_SUBSTRING_INFO.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
