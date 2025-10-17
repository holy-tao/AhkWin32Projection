#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KS_COMPRESSION.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class PIPE_DIMENSIONS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {KS_COMPRESSION}
     */
    AllocatorPin{
        get {
            if(!this.HasProp("__AllocatorPin"))
                this.__AllocatorPin := KS_COMPRESSION(0, this)
            return this.__AllocatorPin
        }
    }

    /**
     * @type {KS_COMPRESSION}
     */
    MaxExpansionPin{
        get {
            if(!this.HasProp("__MaxExpansionPin"))
                this.__MaxExpansionPin := KS_COMPRESSION(16, this)
            return this.__MaxExpansionPin
        }
    }

    /**
     * @type {KS_COMPRESSION}
     */
    EndPin{
        get {
            if(!this.HasProp("__EndPin"))
                this.__EndPin := KS_COMPRESSION(32, this)
            return this.__EndPin
        }
    }
}
