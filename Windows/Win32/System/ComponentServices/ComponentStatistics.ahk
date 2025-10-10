#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents statistical information about a COM+ component hosted in a particular process.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/ns-comsvcs-componentstatistics
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ComponentStatistics extends Win32Struct
{
    static sizeof => 52

    static packingSize => 4

    /**
     * The number of instances of the component in the hosting process.
     * @type {Integer}
     */
    NumInstances {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of client references bound to an instance of this component.
     * @type {Integer}
     */
    NumBoundReferences {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of instances of the component in the hosting process's object pool.
     * @type {Integer}
     */
    NumPooledObjects {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of instances of the component that are currently servicing a call.
     * @type {Integer}
     */
    NumObjectsInCall {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A rolling average of the time it takes an instance of this component to service a call.
     * @type {Integer}
     */
    AvgResponseTimeInMs {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of calls to instances of this component that have completed (successfully or not) in a recent time period (for comparison with <b>NumCallsFailedRecent</b>).
     * @type {Integer}
     */
    NumCallsCompletedRecent {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The number of calls to instances of this component that have failed in a recent time period (for comparison with <b>NumCallsCompletedRecent</b>).
     * @type {Integer}
     */
    NumCallsFailedRecent {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The total number of calls to instances of this component that have completed (successfully or not) throughout the lifetime of the hosting process. This data is not currently available, and this member is always set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     * @type {Integer}
     */
    NumCallsCompletedTotal {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The total number of calls to instances of this component that have failed throughout the lifetime of the hosting process. This data is not currently available, and this member is always set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     * @type {Integer}
     */
    NumCallsFailedTotal {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * This member is reserved and set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * This member is reserved and set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * This member is reserved and set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     * @type {Integer}
     */
    Reserved3 {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * This member is reserved and set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     * @type {Integer}
     */
    Reserved4 {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
