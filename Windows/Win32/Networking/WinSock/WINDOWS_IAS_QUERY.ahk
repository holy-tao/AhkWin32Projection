#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class WINDOWS_IAS_QUERY extends Win32Struct {
    static sizeof => 1356

    static packingSize => 4

    class _irdaAttribute_e__Union extends Win32Struct {
        static sizeof => 1028
        static packingSize => 4

        class _irdaAttribOctetSeq extends Win32Struct {
            static sizeof => 1028
            static packingSize => 4

            /**
             * @type {Integer}
             */
            Len {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {Array<Integer>}
             */
            OctetSeq {
                get {
                    if(!this.HasProp("__OctetSeqProxyArray"))
                        this.__OctetSeqProxyArray := Win32FixedArray(this.ptr + 4, 1024, Primitive, "char")
                    return this.__OctetSeqProxyArray
                }
            }
        }

        class _irdaAttribUsrStr extends Win32Struct {
            static sizeof => 264
            static packingSize => 4

            /**
             * @type {Integer}
             */
            Len {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            CharSet {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }

            /**
             * @type {Array<Integer>}
             */
            UsrStr {
                get {
                    if(!this.HasProp("__UsrStrProxyArray"))
                        this.__UsrStrProxyArray := Win32FixedArray(this.ptr + 8, 256, Primitive, "char")
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
        irdaAttribOctetSeq {
            get {
                if(!this.HasProp("__irdaAttribOctetSeq"))
                    this.__irdaAttribOctetSeq := WINDOWS_IAS_QUERY._irdaAttribute_e__Union._irdaAttribOctetSeq(0, this)
                return this.__irdaAttribOctetSeq
            }
        }

        /**
         * @type {_irdaAttribUsrStr}
         */
        irdaAttribUsrStr {
            get {
                if(!this.HasProp("__irdaAttribUsrStr"))
                    this.__irdaAttribUsrStr := WINDOWS_IAS_QUERY._irdaAttribute_e__Union._irdaAttribUsrStr(0, this)
                return this.__irdaAttribUsrStr
            }
        }
    }

    /**
     * @type {Array<Integer>}
     */
    irdaDeviceID {
        get {
            if(!this.HasProp("__irdaDeviceIDProxyArray"))
                this.__irdaDeviceIDProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__irdaDeviceIDProxyArray
        }
    }

    /**
     * @type {String}
     */
    irdaClassName {
        get => StrGet(this.ptr + 4, 63, "UTF-8")
        set => StrPut(value, this.ptr + 4, 63, "UTF-8")
    }

    /**
     * @type {String}
     */
    irdaAttribName {
        get => StrGet(this.ptr + 68, 255, "UTF-8")
        set => StrPut(value, this.ptr + 68, 255, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    irdaAttribType {
        get => NumGet(this, 324, "uint")
        set => NumPut("uint", value, this, 324)
    }

    /**
     * @type {_irdaAttribute_e__Union}
     */
    irdaAttribute {
        get {
            if(!this.HasProp("__irdaAttribute"))
                this.__irdaAttribute := WINDOWS_IAS_QUERY._irdaAttribute_e__Union(328, this)
            return this.__irdaAttribute
        }
    }
}
