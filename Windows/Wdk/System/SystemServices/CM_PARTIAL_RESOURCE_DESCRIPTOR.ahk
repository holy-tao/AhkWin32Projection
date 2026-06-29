#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_PARTIAL_RESOURCE_DESCRIPTOR {
    #StructPack 8


    struct _u {

        struct _Generic {
            Start : Int64

            Length : UInt32

        }

        struct _Port {
            Start : Int64

            Length : UInt32

        }

        struct _Interrupt {
            Level : UInt32

            Vector : UInt32

            Affinity : IntPtr

        }

        struct _MessageInterrupt {

            struct _Raw {
                Reserved : UInt16

                MessageCount : UInt16

                Vector : UInt32

                Affinity : IntPtr

            }

            struct _Translated {
                Level : UInt32

                Vector : UInt32

                Affinity : IntPtr

            }

            Raw : CM_PARTIAL_RESOURCE_DESCRIPTOR._u._MessageInterrupt._Raw

            static __New() {
                DefineProp(this.Prototype, 'Translated', { type: CM_PARTIAL_RESOURCE_DESCRIPTOR._u._MessageInterrupt._Translated, offset: 0 })
                this.DeleteProp("__New")
            }
        }

        struct _Memory {
            Start : Int64

            Length : UInt32

        }

        struct _Dma {
            Channel : UInt32

            Port : UInt32

            Reserved1 : UInt32

        }

        struct _DmaV3 {
            Channel : UInt32

            RequestLine : UInt32

            TransferWidth : Int8

            Reserved1 : Int8

            Reserved2 : Int8

            Reserved3 : Int8

        }

        struct _DevicePrivate {
            Data : UInt32[3]

        }

        struct _BusNumber {
            Start : UInt32

            Length : UInt32

            Reserved : UInt32

        }

        struct _DeviceSpecificData {
            DataSize : UInt32

            Reserved1 : UInt32

            Reserved2 : UInt32

        }

        struct _Memory40 {
            Start : Int64

            Length40 : UInt32

        }

        struct _Memory48 {
            Start : Int64

            Length48 : UInt32

        }

        struct _Memory64 {
            Start : Int64

            Length64 : UInt32

        }

        struct _Connection {
            Class : Int8

            Type : Int8

            Reserved1 : Int8

            Reserved2 : Int8

            IdLowPart : UInt32

            IdHighPart : UInt32

        }

        Generic : CM_PARTIAL_RESOURCE_DESCRIPTOR._u._Generic

        static __New() {
            DefineProp(this.Prototype, 'Port', { type: CM_PARTIAL_RESOURCE_DESCRIPTOR._u._Port, offset: 0 })
            DefineProp(this.Prototype, 'Interrupt', { type: CM_PARTIAL_RESOURCE_DESCRIPTOR._u._Interrupt, offset: 0 })
            DefineProp(this.Prototype, 'MessageInterrupt', { type: CM_PARTIAL_RESOURCE_DESCRIPTOR._u._MessageInterrupt, offset: 0 })
            DefineProp(this.Prototype, 'Memory', { type: CM_PARTIAL_RESOURCE_DESCRIPTOR._u._Memory, offset: 0 })
            DefineProp(this.Prototype, 'Dma', { type: CM_PARTIAL_RESOURCE_DESCRIPTOR._u._Dma, offset: 0 })
            DefineProp(this.Prototype, 'DmaV3', { type: CM_PARTIAL_RESOURCE_DESCRIPTOR._u._DmaV3, offset: 0 })
            DefineProp(this.Prototype, 'DevicePrivate', { type: CM_PARTIAL_RESOURCE_DESCRIPTOR._u._DevicePrivate, offset: 0 })
            DefineProp(this.Prototype, 'BusNumber', { type: CM_PARTIAL_RESOURCE_DESCRIPTOR._u._BusNumber, offset: 0 })
            DefineProp(this.Prototype, 'DeviceSpecificData', { type: CM_PARTIAL_RESOURCE_DESCRIPTOR._u._DeviceSpecificData, offset: 0 })
            DefineProp(this.Prototype, 'Memory40', { type: CM_PARTIAL_RESOURCE_DESCRIPTOR._u._Memory40, offset: 0 })
            DefineProp(this.Prototype, 'Memory48', { type: CM_PARTIAL_RESOURCE_DESCRIPTOR._u._Memory48, offset: 0 })
            DefineProp(this.Prototype, 'Memory64', { type: CM_PARTIAL_RESOURCE_DESCRIPTOR._u._Memory64, offset: 0 })
            DefineProp(this.Prototype, 'Connection', { type: CM_PARTIAL_RESOURCE_DESCRIPTOR._u._Connection, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Type : Int8

    ShareDisposition : Int8

    Flags : UInt16

    u : CM_PARTIAL_RESOURCE_DESCRIPTOR._u

}
