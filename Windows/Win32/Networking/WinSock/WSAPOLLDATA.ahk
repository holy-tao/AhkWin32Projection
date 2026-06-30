#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSAPOLL_EVENT_FLAGS.ahk
#Include .\SOCKET.ahk
#Include .\WSAPOLLFD.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class WSAPOLLDATA extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    result {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    fds {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    timeout {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {WSAPOLLFD}
     */
    fdArray {
        get {
            if(!this.HasProp("__fdArrayProxyArray"))
                this.__fdArrayProxyArray := Win32FixedArray(this.ptr + 16, 1, WSAPOLLFD, "")
            return this.__fdArrayProxyArray
        }
    }
}
