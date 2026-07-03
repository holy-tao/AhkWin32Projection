#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PINTERFACE_DEREFERENCE.ahk" { PINTERFACE_DEREFERENCE }
#Import ".\PINTERFACE_REFERENCE.ahk" { PINTERFACE_REFERENCE }
#Import ".\PQUERYEXTENDEDADDRESS.ahk" { PQUERYEXTENDEDADDRESS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PNP_EXTENDED_ADDRESS_INTERFACE {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : PINTERFACE_REFERENCE

    InterfaceDereference : PINTERFACE_DEREFERENCE

    QueryExtendedAddress : PQUERYEXTENDEDADDRESS

}
