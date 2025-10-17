#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The contents of the XPS_COLOR structure when the colorType is XPS_COLOR_TYPE_CONTEXT.
 * @remarks
 * 
  * For information about how to interpret or apply the values in this structure's members, see the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/ns-xpsobjectmodel-xps_color
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_COLOR extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    class XPS_COLOR_VALUE extends Win32Struct {
        static sizeof => 72
        static packingSize => 8

        class _sRGB extends Win32Struct {
            static sizeof => 64
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            alpha {
                get => NumGet(this, 0, "char")
                set => NumPut("char", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            red {
                get => NumGet(this, 1, "char")
                set => NumPut("char", value, this, 1)
            }
        
            /**
             * @type {Integer}
             */
            green {
                get => NumGet(this, 2, "char")
                set => NumPut("char", value, this, 2)
            }
        
            /**
             * @type {Integer}
             */
            blue {
                get => NumGet(this, 3, "char")
                set => NumPut("char", value, this, 3)
            }
        
        }
    
        class _scRGB extends Win32Struct {
            static sizeof => 64
            static packingSize => 8
    
            /**
             * @type {Float}
             */
            alpha {
                get => NumGet(this, 0, "float")
                set => NumPut("float", value, this, 0)
            }
        
            /**
             * @type {Float}
             */
            red {
                get => NumGet(this, 4, "float")
                set => NumPut("float", value, this, 4)
            }
        
            /**
             * @type {Float}
             */
            green {
                get => NumGet(this, 8, "float")
                set => NumPut("float", value, this, 8)
            }
        
            /**
             * @type {Float}
             */
            blue {
                get => NumGet(this, 12, "float")
                set => NumPut("float", value, this, 12)
            }
        
        }
    
        class _context extends Win32Struct {
            static sizeof => 64
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            channelCount {
                get => NumGet(this, 0, "char")
                set => NumPut("char", value, this, 0)
            }
        
            /**
             * @type {Array<Single>}
             */
            channels{
                get {
                    if(!this.HasProp("__channelsProxyArray"))
                        this.__channelsProxyArray := Win32FixedArray(this.ptr + 4, 9, Primitive, "float")
                    return this.__channelsProxyArray
                }
            }
        
        }
    
        /**
         * @type {_sRGB}
         */
        sRGB{
            get {
                if(!this.HasProp("__sRGB"))
                    this.__sRGB := %this.__Class%._sRGB(0, this)
                return this.__sRGB
            }
        }
    
        /**
         * @type {_scRGB}
         */
        scRGB{
            get {
                if(!this.HasProp("__scRGB"))
                    this.__scRGB := %this.__Class%._scRGB(0, this)
                return this.__scRGB
            }
        }
    
        /**
         * @type {_context}
         */
        context{
            get {
                if(!this.HasProp("__context"))
                    this.__context := %this.__Class%._context(0, this)
                return this.__context
            }
        }
    
    }

    /**
     * 
     * @type {Integer}
     */
    colorType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * 
     * @type {XPS_COLOR_VALUE}
     */
    value{
        get {
            if(!this.HasProp("__value"))
                this.__value := %this.__Class%.XPS_COLOR_VALUE(8, this)
            return this.__value
        }
    }
}
