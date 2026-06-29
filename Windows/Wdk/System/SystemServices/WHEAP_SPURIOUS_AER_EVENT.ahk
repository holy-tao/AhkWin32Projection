#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_ERROR_SEVERITY.ahk" { WHEA_ERROR_SEVERITY }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_SPURIOUS_AER_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    ErrorSeverity : WHEA_ERROR_SEVERITY

    ErrorHandlerType : UInt32

    SpuriousErrorSourceId : UInt32

    RootErrorCommand : UInt32

    RootErrorStatus : UInt32

    DeviceAssociationBitmap : UInt32

}
