#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_STATISTICS extends Win32Struct
{
    static sizeof => 200

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TransmittedFragmentCount {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    MulticastTransmittedFrameCount {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    FailedCount {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    RetryCount {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    MultipleRetryCount {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    RTSSuccessCount {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    RTSFailureCount {
        get => NumGet(this, 56, "int64")
        set => NumPut("int64", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    ACKFailureCount {
        get => NumGet(this, 64, "int64")
        set => NumPut("int64", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    FrameDuplicateCount {
        get => NumGet(this, 72, "int64")
        set => NumPut("int64", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    ReceivedFragmentCount {
        get => NumGet(this, 80, "int64")
        set => NumPut("int64", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    MulticastReceivedFrameCount {
        get => NumGet(this, 88, "int64")
        set => NumPut("int64", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    FCSErrorCount {
        get => NumGet(this, 96, "int64")
        set => NumPut("int64", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    TKIPLocalMICFailures {
        get => NumGet(this, 104, "int64")
        set => NumPut("int64", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    TKIPICVErrorCount {
        get => NumGet(this, 112, "int64")
        set => NumPut("int64", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    TKIPCounterMeasuresInvoked {
        get => NumGet(this, 120, "int64")
        set => NumPut("int64", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    TKIPReplays {
        get => NumGet(this, 128, "int64")
        set => NumPut("int64", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    CCMPFormatErrors {
        get => NumGet(this, 136, "int64")
        set => NumPut("int64", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    CCMPReplays {
        get => NumGet(this, 144, "int64")
        set => NumPut("int64", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    CCMPDecryptErrors {
        get => NumGet(this, 152, "int64")
        set => NumPut("int64", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    FourWayHandshakeFailures {
        get => NumGet(this, 160, "int64")
        set => NumPut("int64", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    WEPUndecryptableCount {
        get => NumGet(this, 168, "int64")
        set => NumPut("int64", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    WEPICVErrorCount {
        get => NumGet(this, 176, "int64")
        set => NumPut("int64", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    DecryptSuccessCount {
        get => NumGet(this, 184, "int64")
        set => NumPut("int64", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    DecryptFailureCount {
        get => NumGet(this, 192, "int64")
        set => NumPut("int64", value, this, 192)
    }
}
