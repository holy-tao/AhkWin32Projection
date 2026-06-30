#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSAUDIO_PACKETSIZE_PROCESSINGMODE_CONSTRAINT extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Guid}
     */
    ProcessingMode {
        get {
            if(!this.HasProp("__ProcessingMode"))
                this.__ProcessingMode := Guid(0, this)
            return this.__ProcessingMode
        }
    }

    /**
     * @type {Integer}
     */
    SamplesPerProcessingPacket {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ProcessingPacketDurationInHns {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
