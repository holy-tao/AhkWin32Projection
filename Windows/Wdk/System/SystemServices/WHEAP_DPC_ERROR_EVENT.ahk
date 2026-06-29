#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEAP_DPC_ERROR_EVENT_TYPE.ahk" { WHEAP_DPC_ERROR_EVENT_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_DPC_ERROR_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    ErrType : WHEAP_DPC_ERROR_EVENT_TYPE

    Bus : UInt32

    Device : UInt32

    Function : UInt32

    DeviceId : UInt16

    VendorId : UInt16

}
