#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_SERIAL {
    #StructPack 8

    PropTypeSet : KSIDENTIFIER

    Id : UInt32

    PropertyLength : UInt32

}
