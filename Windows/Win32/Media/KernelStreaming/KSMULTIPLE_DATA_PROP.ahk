#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include .\KSMULTIPLE_ITEM.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSMULTIPLE_DATA_PROP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property{
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(this.ptr + 0)
            return this.__Property
        }
    }

    /**
     * @type {KSMULTIPLE_ITEM}
     */
    MultipleItem{
        get {
            if(!this.HasProp("__MultipleItem"))
                this.__MultipleItem := KSMULTIPLE_ITEM(this.ptr + 8)
            return this.__MultipleItem
        }
    }
}
