#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_RAW_DATA_FORMAT.ahk" { WHEA_RAW_DATA_FORMAT }
#Import ".\WHEA_ERROR_TYPE.ahk" { WHEA_ERROR_TYPE }
#Import ".\WHEA_ERROR_SEVERITY.ahk" { WHEA_ERROR_SEVERITY }
#Import "..\..\..\Win32\System\Diagnostics\Debug\WHEA_ERROR_SOURCE_TYPE.ahk" { WHEA_ERROR_SOURCE_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ERROR_PACKET_V1 {
    #StructPack 8


    struct _u {
        ProcessorError : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'MemoryError', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'NmiError', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'PciExpressError', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'PciXBusError', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'PciXDeviceError', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'PmemError', { type: IntPtr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Signature : UInt32

    Flags : IntPtr

    Size : UInt32

    RawDataLength : UInt32

    Reserved1 : Int64

    Context : Int64

    ErrorType : WHEA_ERROR_TYPE

    ErrorSeverity : WHEA_ERROR_SEVERITY

    ErrorSourceId : UInt32

    ErrorSourceType : WHEA_ERROR_SOURCE_TYPE

    Reserved2 : UInt32

    Version : UInt32

    Cpu : Int64

    u : WHEA_ERROR_PACKET_V1._u

    RawDataFormat : WHEA_RAW_DATA_FORMAT

    RawDataOffset : UInt32

    RawData : Int8[1]

}
