#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HTTP_TRACE_CONFIGURATION {
    #StructPack 8

    pProviderGuid : Guid.Ptr

    dwAreas : UInt32

    dwVerbosity : UInt32

    fProviderEnabled : BOOL

}
