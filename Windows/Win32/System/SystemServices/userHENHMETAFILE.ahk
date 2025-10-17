#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class userHENHMETAFILE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    class _u extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Integer}
         */
        hInproc {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Pointer<BYTE_BLOB>}
         */
        hRemote {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        hInproc64 {
            get => NumGet(this, 0, "int64")
            set => NumPut("int64", value, this, 0)
        }
    
    }

    /**
     * @type {Integer}
     */
    fContext {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
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
