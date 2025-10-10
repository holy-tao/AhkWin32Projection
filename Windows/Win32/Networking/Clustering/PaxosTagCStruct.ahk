#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the Paxos tag values of a cluster node, which stores information about the cluster configuration version of the node when the cluster uses a File Share witness.
 * @see https://docs.microsoft.com/windows/win32/api//resapi/ns-resapi-paxostagcstruct
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PaxosTagCStruct extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * TBD
     * @type {Integer}
     */
    __padding__PaxosTagVtable {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * TBD
     * @type {Integer}
     */
    __padding__NextEpochVtable {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * TBD
     * @type {Integer}
     */
    __padding__NextEpoch_DateTimeVtable {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * TBD
     * @type {Integer}
     */
    NextEpoch_DateTime_ticks {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The next epoch of the cluster configuration.
     * @type {Integer}
     */
    NextEpoch_Value {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * TBD
     * @type {Integer}
     */
    __padding__BoundryNextEpoch {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * TBD
     * @type {Integer}
     */
    __padding__EpochVtable {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * TBD
     * @type {Integer}
     */
    __padding__Epoch_DateTimeVtable {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * TBD
     * @type {Integer}
     */
    Epoch_DateTime_ticks {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The epoch of the cluster configuration.
     * @type {Integer}
     */
    Epoch_Value {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * TBD
     * @type {Integer}
     */
    __padding__BoundryEpoch {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The sequence of the cluster configuration.
     * @type {Integer}
     */
    Sequence {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * TBD
     * @type {Integer}
     */
    __padding__BoundrySequence {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }
}
