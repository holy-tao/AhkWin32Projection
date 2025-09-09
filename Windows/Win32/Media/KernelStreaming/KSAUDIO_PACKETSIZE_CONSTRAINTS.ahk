#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSAUDIO_PACKETSIZE_PROCESSINGMODE_CONSTRAINT.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSAUDIO_PACKETSIZE_CONSTRAINTS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MinPacketPeriodInHns {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PacketSizeFileAlignment {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumProcessingModeConstraints {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<KSAUDIO_PACKETSIZE_PROCESSINGMODE_CONSTRAINT>}
     */
    ProcessingModeConstraints{
        get {
            if(!this.HasProp("__ProcessingModeConstraintsProxyArray"))
                this.__ProcessingModeConstraintsProxyArray := Win32FixedArray(this.ptr + 16, 1, KSAUDIO_PACKETSIZE_PROCESSINGMODE_CONSTRAINT, "")
            return this.__ProcessingModeConstraintsProxyArray
        }
    }
}
