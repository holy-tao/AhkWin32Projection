#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class userCLIPFORMAT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _u extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Integer}
         */
        dwValue {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {PWSTR}
         */
        pwszName{
            get {
                if(!this.HasProp("__pwszName"))
                    this.__pwszName := PWSTR(this.ptr + 0)
                return this.__pwszName
            }
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
                this.__u := %this.__Class%._u(this.ptr + 8)
            return this.__u
        }
    }
}
