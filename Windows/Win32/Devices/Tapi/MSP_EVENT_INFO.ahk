#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MSP_EVENT_INFO (msp.h) structure defines the type of event returned by the GetEvent method.
 * @see https://learn.microsoft.com/windows/win32/api/msp/ns-msp-msp_event_info
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class MSP_EVENT_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Total size of structure returned.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    Event {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * MSP handle; may be <b>NULL</b>.
     * @type {Pointer<Int32>}
     */
    hCall {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Pointer<ITTerminal>}
     */
    pTerminal {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Cause {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Pointer<ITStream>}
     */
    pStream {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<ITTerminal>}
     */
    pTerminal1 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    hrError {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwBufferSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    pBuffer{
        get {
            if(!this.HasProp("__pBufferProxyArray"))
                this.__pBufferProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "char")
            return this.__pBufferProxyArray
        }
    }

    /**
     * @type {Pointer<IDispatch>}
     */
    pEvent {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    lEventCode {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Pointer<ITTerminal>}
     */
    pParentFileTerminal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<ITFileTrack>}
     */
    pFileTrack {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    TerminalMediaState {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ftecEventCause {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    hrErrorCode {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Pointer<ITTerminal>}
     */
    pASRTerminal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    hrErrorCode1 {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Pointer<ITTerminal>}
     */
    pTTSTerminal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    hrErrorCode12 {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Pointer<ITTerminal>}
     */
    pToneTerminal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    hrErrorCode123 {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
