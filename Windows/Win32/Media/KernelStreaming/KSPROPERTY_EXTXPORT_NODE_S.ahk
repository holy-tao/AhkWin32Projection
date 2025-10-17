#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include .\KSP_NODE.ahk
#Include .\MEDIUM_INFO.ahk
#Include .\TRANSPORT_STATE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_EXTXPORT_NODE_S extends Win32Struct
{
    static sizeof => 544

    static packingSize => 8

    /**
     * @type {KSP_NODE}
     */
    NodeProperty{
        get {
            if(!this.HasProp("__NodeProperty"))
                this.__NodeProperty := KSP_NODE(0, this)
            return this.__NodeProperty
        }
    }

    class _Timecode extends Win32Struct {
        static sizeof => 520
        static packingSize => 8

        /**
         * @type {Integer}
         */
        frame {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        second {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
        /**
         * @type {Integer}
         */
        minute {
            get => NumGet(this, 2, "char")
            set => NumPut("char", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        hour {
            get => NumGet(this, 3, "char")
            set => NumPut("char", value, this, 3)
        }
    
    }

    class _RawAVC extends Win32Struct {
        static sizeof => 520
        static packingSize => 8

        /**
         * @type {Integer}
         */
        PayloadSize {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Array<Byte>}
         */
        Payload{
            get {
                if(!this.HasProp("__PayloadProxyArray"))
                    this.__PayloadProxyArray := Win32FixedArray(this.ptr + 4, 512, Primitive, "char")
                return this.__PayloadProxyArray
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    Capabilities {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    SignalMode {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    LoadMedium {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {MEDIUM_INFO}
     */
    MediumInfo{
        get {
            if(!this.HasProp("__MediumInfo"))
                this.__MediumInfo := MEDIUM_INFO(24, this)
            return this.__MediumInfo
        }
    }

    /**
     * @type {TRANSPORT_STATE}
     */
    XPrtState{
        get {
            if(!this.HasProp("__XPrtState"))
                this.__XPrtState := TRANSPORT_STATE(24, this)
            return this.__XPrtState
        }
    }

    /**
     * @type {_Timecode}
     */
    Timecode{
        get {
            if(!this.HasProp("__Timecode"))
                this.__Timecode := %this.__Class%._Timecode(24, this)
            return this.__Timecode
        }
    }

    /**
     * @type {Integer}
     */
    dwTimecode {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwAbsTrackNumber {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {_RawAVC}
     */
    RawAVC{
        get {
            if(!this.HasProp("__RawAVC"))
                this.__RawAVC := %this.__Class%._RawAVC(24, this)
            return this.__RawAVC
        }
    }
}
