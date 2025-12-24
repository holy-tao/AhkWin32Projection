#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_XPF_PROCINFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    class _CheckInfo_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 1

        /**
         * @type {Pointer<WHEA_XPF_CACHE_CHECK>}
         */
        CacheCheck {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<WHEA_XPF_TLB_CHECK>}
         */
        TlbCheck {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<WHEA_XPF_BUS_CHECK>}
         */
        BusCheck {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<WHEA_XPF_MS_CHECK>}
         */
        MsCheck {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        AsULONGLONG {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    /**
     * @type {Pointer<Guid>}
     */
    CheckInfoId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<WHEA_XPF_PROCINFO_VALIDBITS>}
     */
    ValidBits {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {_CheckInfo_e__Union}
     */
    CheckInfo{
        get {
            if(!this.HasProp("__CheckInfo"))
                this.__CheckInfo := %this.__Class%._CheckInfo_e__Union(16, this)
            return this.__CheckInfo
        }
    }

    /**
     * @type {Integer}
     */
    TargetId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    RequesterId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ResponderId {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    InstructionPointer {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
