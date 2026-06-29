#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IRQ_PRIORITY.ahk" { IRQ_PRIORITY }
#Import ".\IRQ_DEVICE_POLICY.ahk" { IRQ_DEVICE_POLICY }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_RESOURCE_DESCRIPTOR {
    #StructPack 8


    struct _u {

        struct _Port {
            Length : UInt32

            Alignment : UInt32

            MinimumAddress : Int64

            MaximumAddress : Int64

        }

        struct _Memory {
            Length : UInt32

            Alignment : UInt32

            MinimumAddress : Int64

            MaximumAddress : Int64

        }

        struct _Interrupt {
            MinimumVector : UInt32

            MaximumVector : UInt32

            AffinityPolicy : IRQ_DEVICE_POLICY

            PriorityPolicy : IRQ_PRIORITY

            TargetedProcessors : IntPtr

        }

        struct _Dma {
            MinimumChannel : UInt32

            MaximumChannel : UInt32

        }

        struct _DmaV3 {
            RequestLine : UInt32

            Reserved : UInt32

            Channel : UInt32

            TransferWidth : UInt32

        }

        struct _Generic {
            Length : UInt32

            Alignment : UInt32

            MinimumAddress : Int64

            MaximumAddress : Int64

        }

        struct _DevicePrivate {
            Data : UInt32[3]

        }

        struct _BusNumber {
            Length : UInt32

            MinBusNumber : UInt32

            MaxBusNumber : UInt32

            Reserved : UInt32

        }

        struct _ConfigData {
            Priority : UInt32

            Reserved1 : UInt32

            Reserved2 : UInt32

        }

        struct _Memory40 {
            Length40 : UInt32

            Alignment40 : UInt32

            MinimumAddress : Int64

            MaximumAddress : Int64

        }

        struct _Memory48 {
            Length48 : UInt32

            Alignment48 : UInt32

            MinimumAddress : Int64

            MaximumAddress : Int64

        }

        struct _Memory64 {
            Length64 : UInt32

            Alignment64 : UInt32

            MinimumAddress : Int64

            MaximumAddress : Int64

        }

        struct _Connection {
            Class : Int8

            Type : Int8

            Reserved1 : Int8

            Reserved2 : Int8

            IdLowPart : UInt32

            IdHighPart : UInt32

        }

        Port : IO_RESOURCE_DESCRIPTOR._u._Port

        static __New() {
            DefineProp(this.Prototype, 'Memory', { type: IO_RESOURCE_DESCRIPTOR._u._Memory, offset: 0 })
            DefineProp(this.Prototype, 'Interrupt', { type: IO_RESOURCE_DESCRIPTOR._u._Interrupt, offset: 0 })
            DefineProp(this.Prototype, 'Dma', { type: IO_RESOURCE_DESCRIPTOR._u._Dma, offset: 0 })
            DefineProp(this.Prototype, 'DmaV3', { type: IO_RESOURCE_DESCRIPTOR._u._DmaV3, offset: 0 })
            DefineProp(this.Prototype, 'Generic', { type: IO_RESOURCE_DESCRIPTOR._u._Generic, offset: 0 })
            DefineProp(this.Prototype, 'DevicePrivate', { type: IO_RESOURCE_DESCRIPTOR._u._DevicePrivate, offset: 0 })
            DefineProp(this.Prototype, 'BusNumber', { type: IO_RESOURCE_DESCRIPTOR._u._BusNumber, offset: 0 })
            DefineProp(this.Prototype, 'ConfigData', { type: IO_RESOURCE_DESCRIPTOR._u._ConfigData, offset: 0 })
            DefineProp(this.Prototype, 'Memory40', { type: IO_RESOURCE_DESCRIPTOR._u._Memory40, offset: 0 })
            DefineProp(this.Prototype, 'Memory48', { type: IO_RESOURCE_DESCRIPTOR._u._Memory48, offset: 0 })
            DefineProp(this.Prototype, 'Memory64', { type: IO_RESOURCE_DESCRIPTOR._u._Memory64, offset: 0 })
            DefineProp(this.Prototype, 'Connection', { type: IO_RESOURCE_DESCRIPTOR._u._Connection, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Option : Int8

    Type : Int8

    ShareDisposition : Int8

    Spare1 : Int8

    Flags : UInt16

    Spare2 : UInt16

    u : IO_RESOURCE_DESCRIPTOR._u

}
