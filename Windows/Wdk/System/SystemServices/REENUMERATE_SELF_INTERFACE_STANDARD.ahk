#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PREENUMERATE_SELF.ahk" { PREENUMERATE_SELF }
#Import ".\PINTERFACE_DEREFERENCE.ahk" { PINTERFACE_DEREFERENCE }
#Import ".\PINTERFACE_REFERENCE.ahk" { PINTERFACE_REFERENCE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct REENUMERATE_SELF_INTERFACE_STANDARD {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : PINTERFACE_REFERENCE

    InterfaceDereference : PINTERFACE_DEREFERENCE

    SurpriseRemoveAndReenumerateSelf : PREENUMERATE_SELF

}
