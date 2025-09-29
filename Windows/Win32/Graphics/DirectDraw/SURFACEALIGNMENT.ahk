#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SURFACEALIGNMENT structure is used by a display driver to describe the alignment restrictions for a surface being allocated by HeapVidMemAllocAligned.
 * @see https://learn.microsoft.com/windows/win32/api/dmemmgr/ns-dmemmgr-surfacealignment
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class SURFACEALIGNMENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    class _Linear extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        dwStartAlignment {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwPitchAlignment {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        dwFlags {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        dwReserved2 {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
    }

    class _Rectangular extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        dwXAlignment {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwYAlignment {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        dwFlags {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        dwReserved2 {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
    }

    /**
     * @type {_Linear}
     */
    Linear{
        get {
            if(!this.HasProp("__Linear"))
                this.__Linear := %this.__Class%._Linear(this.ptr + 0)
            return this.__Linear
        }
    }

    /**
     * @type {_Rectangular}
     */
    Rectangular{
        get {
            if(!this.HasProp("__Rectangular"))
                this.__Rectangular := %this.__Class%._Rectangular(this.ptr + 0)
            return this.__Rectangular
        }
    }
}
