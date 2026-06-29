#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_COMMON_HEADER {
    #StructPack 4


    struct _u {

        struct _PCI_HEADER_TYPE_0 {
            BaseAddresses : UInt32[6]

            CIS : UInt32

            SubVendorID : UInt16

            SubSystemID : UInt16

            ROMBaseAddress : UInt32

            CapabilitiesPtr : Int8

            Reserved1 : Int8[3]

            Reserved2 : UInt32

            InterruptLine : Int8

            InterruptPin : Int8

            MinimumGrant : Int8

            MaximumLatency : Int8

        }

        struct _PCI_HEADER_TYPE_1 {
            BaseAddresses : UInt32[2]

            PrimaryBus : Int8

            SecondaryBus : Int8

            SubordinateBus : Int8

            SecondaryLatency : Int8

            IOBase : Int8

            IOLimit : Int8

            SecondaryStatus : UInt16

            MemoryBase : UInt16

            MemoryLimit : UInt16

            PrefetchBase : UInt16

            PrefetchLimit : UInt16

            PrefetchBaseUpper32 : UInt32

            PrefetchLimitUpper32 : UInt32

            IOBaseUpper16 : UInt16

            IOLimitUpper16 : UInt16

            CapabilitiesPtr : Int8

            Reserved1 : Int8[3]

            ROMBaseAddress : UInt32

            InterruptLine : Int8

            InterruptPin : Int8

            BridgeControl : UInt16

        }

        struct _PCI_HEADER_TYPE_2 {
            SocketRegistersBaseAddress : UInt32

            CapabilitiesPtr : Int8

            Reserved : Int8

            SecondaryStatus : UInt16

            PrimaryBus : Int8

            SecondaryBus : Int8

            SubordinateBus : Int8

            SecondaryLatency : Int8

            Base : UInt32

            Limit : UInt32

            InterruptLine : Int8

            InterruptPin : Int8

            BridgeControl : UInt16

        }

        type0 : PCI_COMMON_HEADER._u._PCI_HEADER_TYPE_0

        static __New() {
            DefineProp(this.Prototype, 'type1', { type: PCI_COMMON_HEADER._u._PCI_HEADER_TYPE_1, offset: 0 })
            DefineProp(this.Prototype, 'type2', { type: PCI_COMMON_HEADER._u._PCI_HEADER_TYPE_2, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    VendorID : UInt16

    DeviceID : UInt16

    Command : UInt16

    Status : UInt16

    RevisionID : Int8

    ProgIf : Int8

    SubClass : Int8

    BaseClass : Int8

    CacheLineSize : Int8

    LatencyTimer : Int8

    HeaderType : Int8

    BIST : Int8

    u : PCI_COMMON_HEADER._u

}
