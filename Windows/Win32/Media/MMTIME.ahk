#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media
 * @version v4.0.30319
 */
class MMTIME extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    class _u_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 1

        class _smpte extends Win32Struct {
            static sizeof => 8
            static packingSize => 1
    
            /**
             * @type {Integer}
             */
            hour {
                get => NumGet(this, 0, "char")
                set => NumPut("char", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            min {
                get => NumGet(this, 1, "char")
                set => NumPut("char", value, this, 1)
            }
        
            /**
             * @type {Integer}
             */
            sec {
                get => NumGet(this, 2, "char")
                set => NumPut("char", value, this, 2)
            }
        
            /**
             * @type {Integer}
             */
            frame {
                get => NumGet(this, 3, "char")
                set => NumPut("char", value, this, 3)
            }
        
            /**
             * @type {Integer}
             */
            fps {
                get => NumGet(this, 4, "char")
                set => NumPut("char", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            dummy {
                get => NumGet(this, 5, "char")
                set => NumPut("char", value, this, 5)
            }
        
            /**
             * @type {Array<Byte>}
             */
            pad{
                get {
                    if(!this.HasProp("__padProxyArray"))
                        this.__padProxyArray := Win32FixedArray(this.ptr + 6, 2, Primitive, "char")
                    return this.__padProxyArray
                }
            }
        
        }
    
        class _midi extends Win32Struct {
            static sizeof => 4
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            songptrpos {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
        }
    
        /**
         * @type {Integer}
         */
        ms {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        sample {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        cb {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ticks {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {_smpte}
         */
        smpte{
            get {
                if(!this.HasProp("__smpte"))
                    this.__smpte := %this.__Class%._smpte(0, this)
                return this.__smpte
            }
        }
    
        /**
         * @type {_midi}
         */
        midi{
            get {
                if(!this.HasProp("__midi"))
                    this.__midi := %this.__Class%._midi(0, this)
                return this.__midi
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    wType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {_u_e__Union}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._u_e__Union(8, this)
            return this.__u
        }
    }
}
