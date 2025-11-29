#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WINDOWS_IAS_SET extends Win32Struct
{
    static sizeof => 1680

    static packingSize => 8

    class _irdaAttribute_e__Union extends Win32Struct {
        static sizeof => 1032
        static packingSize => 8

        class _irdaAttribOctetSeq extends Win32Struct {
            static sizeof => 1026
            static packingSize => 2
    
            /**
             * @type {Integer}
             */
            Len {
                get => NumGet(this, 0, "ushort")
                set => NumPut("ushort", value, this, 0)
            }
        
            /**
             * @type {Array<Byte>}
             */
            OctetSeq{
                get {
                    if(!this.HasProp("__OctetSeqProxyArray"))
                        this.__OctetSeqProxyArray := Win32FixedArray(this.ptr + 2, 1024, Primitive, "char")
                    return this.__OctetSeqProxyArray
                }
            }
        
        }
    
        class _irdaAttribUsrStr extends Win32Struct {
            static sizeof => 258
            static packingSize => 1
    
            /**
             * @type {Integer}
             */
            Len {
                get => NumGet(this, 0, "char")
                set => NumPut("char", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            CharSet {
                get => NumGet(this, 1, "char")
                set => NumPut("char", value, this, 1)
            }
        
            /**
             * @type {Array<Byte>}
             */
            UsrStr{
                get {
                    if(!this.HasProp("__UsrStrProxyArray"))
                        this.__UsrStrProxyArray := Win32FixedArray(this.ptr + 2, 256, Primitive, "char")
                    return this.__UsrStrProxyArray
                }
            }
        
        }
    
        /**
         * @type {Integer}
         */
        irdaAttribInt {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {_irdaAttribOctetSeq}
         */
        irdaAttribOctetSeq{
            get {
                if(!this.HasProp("__irdaAttribOctetSeq"))
                    this.__irdaAttribOctetSeq := %this.__Class%._irdaAttribOctetSeq(0, this)
                return this.__irdaAttribOctetSeq
            }
        }
    
        /**
         * @type {_irdaAttribUsrStr}
         */
        irdaAttribUsrStr{
            get {
                if(!this.HasProp("__irdaAttribUsrStr"))
                    this.__irdaAttribUsrStr := %this.__Class%._irdaAttribUsrStr(0, this)
                return this.__irdaAttribUsrStr
            }
        }
    
    }

    /**
     * @type {String}
     */
    irdaClassName {
        get => StrGet(this.ptr + 0, 63, "UTF-16")
        set => StrPut(value, this.ptr + 0, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    irdaAttribName {
        get => StrGet(this.ptr + 128, 255, "UTF-16")
        set => StrPut(value, this.ptr + 128, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    irdaAttribType {
        get => NumGet(this, 640, "uint")
        set => NumPut("uint", value, this, 640)
    }

    /**
     * @type {_irdaAttribute_e__Union}
     */
    irdaAttribute{
        get {
            if(!this.HasProp("__irdaAttribute"))
                this.__irdaAttribute := %this.__Class%._irdaAttribute_e__Union(648, this)
            return this.__irdaAttribute
        }
    }
}
