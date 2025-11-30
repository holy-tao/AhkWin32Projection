#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PROCESS_ACCESS_TOKEN extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    Token{
        get {
            if(!this.HasProp("__Token"))
                this.__Token := HANDLE(0, this)
            return this.__Token
        }
    }

    /**
     * @type {HANDLE}
     */
    Thread{
        get {
            if(!this.HasProp("__Thread"))
                this.__Thread := HANDLE(8, this)
            return this.__Thread
        }
    }
}
