#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERFACE_TYPE.ahk" { INTERFACE_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_RESOURCE_REQUIREMENTS_LIST {
    #StructPack 8

    ListSize : UInt32

    InterfaceType : INTERFACE_TYPE

    BusNumber : UInt32

    SlotNumber : UInt32

    Reserved : UInt32[3]

    AlternativeLists : UInt32

    List : IntPtr[1]

}
