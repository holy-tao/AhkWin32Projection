#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECURITY_DESCRIPTOR_CONTROL.ahk" { SECURITY_DESCRIPTOR_CONTROL }

/**
 * @namespace Windows.Win32.Security
 */
export default struct SECURITY_DESCRIPTOR_RELATIVE {
    #StructPack 4

    Revision : Int8

    Sbz1 : Int8

    Control : SECURITY_DESCRIPTOR_CONTROL

    Owner : UInt32

    Group : UInt32

    Sacl : UInt32

    Dacl : UInt32

}
