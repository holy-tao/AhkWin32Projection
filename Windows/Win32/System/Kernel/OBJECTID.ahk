#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Kernel
 */
export default struct OBJECTID {
    #StructPack 4

    Lineage : Guid

    Uniquifier : UInt32

}
