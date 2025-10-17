#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SAFEARR_BSTR.ahk
#Include .\SAFEARR_UNKNOWN.ahk
#Include .\SAFEARR_DISPATCH.ahk
#Include .\SAFEARR_VARIANT.ahk
#Include .\SAFEARR_BRECORD.ahk
#Include .\SAFEARR_HAVEIID.ahk
#Include ..\Com\BYTE_SIZEDARR.ahk
#Include ..\Com\WORD_SIZEDARR.ahk
#Include ..\Com\DWORD_SIZEDARR.ahk
#Include ..\Com\HYPER_SIZEDARR.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class SAFEARRAYUNION extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    class _u extends Win32Struct {
        static sizeof => 176
        static packingSize => 8

        /**
         * @type {SAFEARR_BSTR}
         */
        BstrStr{
            get {
                if(!this.HasProp("__BstrStr"))
                    this.__BstrStr := SAFEARR_BSTR(0, this)
                return this.__BstrStr
            }
        }
    
        /**
         * @type {SAFEARR_UNKNOWN}
         */
        UnknownStr{
            get {
                if(!this.HasProp("__UnknownStr"))
                    this.__UnknownStr := SAFEARR_UNKNOWN(0, this)
                return this.__UnknownStr
            }
        }
    
        /**
         * @type {SAFEARR_DISPATCH}
         */
        DispatchStr{
            get {
                if(!this.HasProp("__DispatchStr"))
                    this.__DispatchStr := SAFEARR_DISPATCH(0, this)
                return this.__DispatchStr
            }
        }
    
        /**
         * @type {SAFEARR_VARIANT}
         */
        VariantStr{
            get {
                if(!this.HasProp("__VariantStr"))
                    this.__VariantStr := SAFEARR_VARIANT(0, this)
                return this.__VariantStr
            }
        }
    
        /**
         * @type {SAFEARR_BRECORD}
         */
        RecordStr{
            get {
                if(!this.HasProp("__RecordStr"))
                    this.__RecordStr := SAFEARR_BRECORD(0, this)
                return this.__RecordStr
            }
        }
    
        /**
         * @type {SAFEARR_HAVEIID}
         */
        HaveIidStr{
            get {
                if(!this.HasProp("__HaveIidStr"))
                    this.__HaveIidStr := SAFEARR_HAVEIID(0, this)
                return this.__HaveIidStr
            }
        }
    
        /**
         * @type {BYTE_SIZEDARR}
         */
        ByteStr{
            get {
                if(!this.HasProp("__ByteStr"))
                    this.__ByteStr := BYTE_SIZEDARR(0, this)
                return this.__ByteStr
            }
        }
    
        /**
         * @type {WORD_SIZEDARR}
         */
        WordStr{
            get {
                if(!this.HasProp("__WordStr"))
                    this.__WordStr := WORD_SIZEDARR(0, this)
                return this.__WordStr
            }
        }
    
        /**
         * @type {DWORD_SIZEDARR}
         */
        LongStr{
            get {
                if(!this.HasProp("__LongStr"))
                    this.__LongStr := DWORD_SIZEDARR(0, this)
                return this.__LongStr
            }
        }
    
        /**
         * @type {HYPER_SIZEDARR}
         */
        HyperStr{
            get {
                if(!this.HasProp("__HyperStr"))
                    this.__HyperStr := HYPER_SIZEDARR(0, this)
                return this.__HyperStr
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    sfType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {_u}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._u(8, this)
            return this.__u
        }
    }
}
