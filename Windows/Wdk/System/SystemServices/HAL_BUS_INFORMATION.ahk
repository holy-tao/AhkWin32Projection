#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BUS_DATA_TYPE.ahk" { BUS_DATA_TYPE }
#Import ".\INTERFACE_TYPE.ahk" { INTERFACE_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct HAL_BUS_INFORMATION {
    #StructPack 4

    BusType : INTERFACE_TYPE

    ConfigurationType : BUS_DATA_TYPE

    BusNumber : UInt32

    Reserved : UInt32

}
