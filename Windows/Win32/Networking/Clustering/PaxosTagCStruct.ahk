#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PaxosTagCStruct {
    #StructPack 8

    __padding__PaxosTagVtable : Int64

    __padding__NextEpochVtable : Int64

    __padding__NextEpoch_DateTimeVtable : Int64

    NextEpoch_DateTime_ticks : Int64

    NextEpoch_Value : Int32

    __padding__BoundryNextEpoch : UInt32

    __padding__EpochVtable : Int64

    __padding__Epoch_DateTimeVtable : Int64

    Epoch_DateTime_ticks : Int64

    Epoch_Value : Int32

    __padding__BoundryEpoch : UInt32

    Sequence : Int32

    __padding__BoundrySequence : UInt32

}
