#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the protection level for video content.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_authenticated_protection_flags
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_AUTHENTICATED_PROTECTION_FLAGS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    class _Flags extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - ProtectionEnabled
         * - OverlayOrFullscreenRequired
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ProtectionEnabled {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        OverlayOrFullscreenRequired {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
    }

    /**
     * 
     * @type {_Flags}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := %this.__Class%._Flags(0, this)
            return this.__Flags
        }
    }

    /**
     * Use this member to access all of the bits in the union.
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
