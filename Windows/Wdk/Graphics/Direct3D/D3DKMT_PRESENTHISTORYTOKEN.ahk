#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_PRESENTHISTORYTOKEN extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _Token_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<D3DKMT_FLIPMODEL_PRESENTHISTORYTOKEN>}
         */
        Flip {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<D3DKMT_BLTMODEL_PRESENTHISTORYTOKEN>}
         */
        Blt {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        VistaBlt {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Pointer<D3DKMT_GDIMODEL_PRESENTHISTORYTOKEN>}
         */
        Gdi {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<D3DKMT_FENCE_PRESENTHISTORYTOKEN>}
         */
        Fence {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<D3DKMT_GDIMODEL_SYSMEM_PRESENTHISTORYTOKEN>}
         */
        GdiSysMem {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<D3DKMT_COMPOSITION_PRESENTHISTORYTOKEN>}
         */
        Composition {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<D3DKMT_FLIPMANAGER_PRESENTHISTORYTOKEN>}
         */
        FlipManager {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<D3DKMT_SURFACECOMPLETE_PRESENTHISTORYTOKEN>}
         */
        SurfaceComplete {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    /**
     * @type {Integer}
     */
    Model {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TokenSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    CompositionBindingId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {_Token_e__Union}
     */
    Token{
        get {
            if(!this.HasProp("__Token"))
                this.__Token := %this.__Class%._Token_e__Union(16, this)
            return this.__Token
        }
    }
}
