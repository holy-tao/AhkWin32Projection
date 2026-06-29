#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PROFILER_PROPERTY_TYPE_SUBSTRING_INFO.ahk" { PROFILER_PROPERTY_TYPE_SUBSTRING_INFO }
#Import ".\PROFILER_HEAP_OBJECT_RELATIONSHIP.ahk" { PROFILER_HEAP_OBJECT_RELATIONSHIP }
#Import ".\PROFILER_RELATIONSHIP_INFO.ahk" { PROFILER_RELATIONSHIP_INFO }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST {
    #StructPack 8

    count : UInt32

    elements : PROFILER_HEAP_OBJECT_RELATIONSHIP[1]

}
