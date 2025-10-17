#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDSCAPSEX.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDMORESURFACECAPS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    class ExtendedHeapRestrictions extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {DDSCAPSEX}
         */
        ddsCapsEx{
            get {
                if(!this.HasProp("__ddsCapsEx"))
                    this.__ddsCapsEx := DDSCAPSEX(0, this)
                return this.__ddsCapsEx
            }
        }
    
        /**
         * @type {DDSCAPSEX}
         */
        ddsCapsExAlt{
            get {
                if(!this.HasProp("__ddsCapsExAlt"))
                    this.__ddsCapsExAlt := DDSCAPSEX(16, this)
                return this.__ddsCapsExAlt
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {DDSCAPSEX}
     */
    ddsCapsMore{
        get {
            if(!this.HasProp("__ddsCapsMore"))
                this.__ddsCapsMore := DDSCAPSEX(8, this)
            return this.__ddsCapsMore
        }
    }

    /**
     * @type {Array<ExtendedHeapRestrictions>}
     */
    ddsExtendedHeapRestrictions{
        get {
            if(!this.HasProp("__ddsExtendedHeapRestrictionsProxyArray"))
                this.__ddsExtendedHeapRestrictionsProxyArray := Win32FixedArray(this.ptr + 24, 1, %this.__Class%.ExtendedHeapRestrictions, "")
            return this.__ddsExtendedHeapRestrictionsProxyArray
        }
    }
}
