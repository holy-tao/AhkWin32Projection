#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MSP_EVENT.ahk
#Include .\MSP_ADDRESS_EVENT.ahk
#Include .\ITTerminal.ahk
#Include .\MSP_CALL_EVENT.ahk
#Include .\MSP_CALL_EVENT_CAUSE.ahk
#Include .\ITStream.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\ITFileTrack.ahk
#Include .\TERMINAL_MEDIA_STATE.ahk
#Include .\FT_STATE_EVENT_CAUSE.ahk

/**
 * The MSP_EVENT_INFO (msp.h) structure defines the type of event returned by the GetEvent method.
 * @see https://learn.microsoft.com/windows/win32/api/msp/ns-msp-msp_event_info
 * @namespace Windows.Win32.Devices.Tapi
 */
class MSP_EVENT_INFO extends Win32Struct {
    static sizeof => 48

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
     * @type {MSP_EVENT}
     */
    Event {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * MSP handle; may be <b>NULL</b>.
     * @type {Pointer<Integer>}
     */
    hCall {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    class _MSP_ADDRESS_EVENT_INFO extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {MSP_ADDRESS_EVENT}
         */
        Type {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {ITTerminal}
         */
        pTerminal {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    }

    class _MSP_CALL_EVENT_INFO extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {MSP_CALL_EVENT}
         */
        Type {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {MSP_CALL_EVENT_CAUSE}
         */
        Cause {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }

        /**
         * @type {ITStream}
         */
        pStream {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }

        /**
         * @type {ITTerminal}
         */
        pTerminal {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }

        /**
         * @type {HRESULT}
         */
        hrError {
            get => NumGet(this, 24, "int")
            set => NumPut("int", value, this, 24)
        }
    }

    class _MSP_TSP_DATA extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        dwBufferSize {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Array<Integer>}
         */
        pBuffer {
            get {
                if(!this.HasProp("__pBufferProxyArray"))
                    this.__pBufferProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
                return this.__pBufferProxyArray
            }
        }
    }

    class _MSP_PRIVATE_EVENT_INFO extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {IDispatch}
         */
        pEvent {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        lEventCode {
            get => NumGet(this, 8, "int")
            set => NumPut("int", value, this, 8)
        }
    }

    class _MSP_FILE_TERMINAL_EVENT_INFO extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {ITTerminal}
         */
        pParentFileTerminal {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {ITFileTrack}
         */
        pFileTrack {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }

        /**
         * @type {TERMINAL_MEDIA_STATE}
         */
        TerminalMediaState {
            get => NumGet(this, 16, "int")
            set => NumPut("int", value, this, 16)
        }

        /**
         * @type {FT_STATE_EVENT_CAUSE}
         */
        ftecEventCause {
            get => NumGet(this, 20, "int")
            set => NumPut("int", value, this, 20)
        }

        /**
         * @type {HRESULT}
         */
        hrErrorCode {
            get => NumGet(this, 24, "int")
            set => NumPut("int", value, this, 24)
        }
    }

    class _MSP_ASR_TERMINAL_EVENT_INFO extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {ITTerminal}
         */
        pASRTerminal {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {HRESULT}
         */
        hrErrorCode {
            get => NumGet(this, 8, "int")
            set => NumPut("int", value, this, 8)
        }
    }

    class _MSP_TTS_TERMINAL_EVENT_INFO extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {ITTerminal}
         */
        pTTSTerminal {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {HRESULT}
         */
        hrErrorCode {
            get => NumGet(this, 8, "int")
            set => NumPut("int", value, this, 8)
        }
    }

    class _MSP_TONE_TERMINAL_EVENT_INFO extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {ITTerminal}
         */
        pToneTerminal {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {HRESULT}
         */
        hrErrorCode {
            get => NumGet(this, 8, "int")
            set => NumPut("int", value, this, 8)
        }
    }

    /**
     * @type {_MSP_ADDRESS_EVENT_INFO}
     */
    MSP_ADDRESS_EVENT_INFO {
        get {
            if(!this.HasProp("__MSP_ADDRESS_EVENT_INFO"))
                this.__MSP_ADDRESS_EVENT_INFO := MSP_EVENT_INFO._MSP_ADDRESS_EVENT_INFO(16, this)
            return this.__MSP_ADDRESS_EVENT_INFO
        }
    }

    /**
     * @type {_MSP_CALL_EVENT_INFO}
     */
    MSP_CALL_EVENT_INFO {
        get {
            if(!this.HasProp("__MSP_CALL_EVENT_INFO"))
                this.__MSP_CALL_EVENT_INFO := MSP_EVENT_INFO._MSP_CALL_EVENT_INFO(16, this)
            return this.__MSP_CALL_EVENT_INFO
        }
    }

    /**
     * @type {_MSP_TSP_DATA}
     */
    MSP_TSP_DATA {
        get {
            if(!this.HasProp("__MSP_TSP_DATA"))
                this.__MSP_TSP_DATA := MSP_EVENT_INFO._MSP_TSP_DATA(16, this)
            return this.__MSP_TSP_DATA
        }
    }

    /**
     * @type {_MSP_PRIVATE_EVENT_INFO}
     */
    MSP_PRIVATE_EVENT_INFO {
        get {
            if(!this.HasProp("__MSP_PRIVATE_EVENT_INFO"))
                this.__MSP_PRIVATE_EVENT_INFO := MSP_EVENT_INFO._MSP_PRIVATE_EVENT_INFO(16, this)
            return this.__MSP_PRIVATE_EVENT_INFO
        }
    }

    /**
     * @type {_MSP_FILE_TERMINAL_EVENT_INFO}
     */
    MSP_FILE_TERMINAL_EVENT_INFO {
        get {
            if(!this.HasProp("__MSP_FILE_TERMINAL_EVENT_INFO"))
                this.__MSP_FILE_TERMINAL_EVENT_INFO := MSP_EVENT_INFO._MSP_FILE_TERMINAL_EVENT_INFO(16, this)
            return this.__MSP_FILE_TERMINAL_EVENT_INFO
        }
    }

    /**
     * @type {_MSP_ASR_TERMINAL_EVENT_INFO}
     */
    MSP_ASR_TERMINAL_EVENT_INFO {
        get {
            if(!this.HasProp("__MSP_ASR_TERMINAL_EVENT_INFO"))
                this.__MSP_ASR_TERMINAL_EVENT_INFO := MSP_EVENT_INFO._MSP_ASR_TERMINAL_EVENT_INFO(16, this)
            return this.__MSP_ASR_TERMINAL_EVENT_INFO
        }
    }

    /**
     * @type {_MSP_TTS_TERMINAL_EVENT_INFO}
     */
    MSP_TTS_TERMINAL_EVENT_INFO {
        get {
            if(!this.HasProp("__MSP_TTS_TERMINAL_EVENT_INFO"))
                this.__MSP_TTS_TERMINAL_EVENT_INFO := MSP_EVENT_INFO._MSP_TTS_TERMINAL_EVENT_INFO(16, this)
            return this.__MSP_TTS_TERMINAL_EVENT_INFO
        }
    }

    /**
     * @type {_MSP_TONE_TERMINAL_EVENT_INFO}
     */
    MSP_TONE_TERMINAL_EVENT_INFO {
        get {
            if(!this.HasProp("__MSP_TONE_TERMINAL_EVENT_INFO"))
                this.__MSP_TONE_TERMINAL_EVENT_INFO := MSP_EVENT_INFO._MSP_TONE_TERMINAL_EVENT_INFO(16, this)
            return this.__MSP_TONE_TERMINAL_EVENT_INFO
        }
    }
}
