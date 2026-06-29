#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERFACE_TYPE.ahk" { INTERFACE_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_FULL_RESOURCE_DESCRIPTOR {
    #StructPack 8

    InterfaceType : INTERFACE_TYPE

    BusNumber : UInt32

    PartialResourceList : IntPtr

}
