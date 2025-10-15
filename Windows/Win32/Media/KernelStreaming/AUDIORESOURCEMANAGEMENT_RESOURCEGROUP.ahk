#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class AUDIORESOURCEMANAGEMENT_RESOURCEGROUP extends Win32Struct
{
    static sizeof => 516

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    ResourceGroupAcquired{
        get {
            if(!this.HasProp("__ResourceGroupAcquired"))
                this.__ResourceGroupAcquired := BOOL(this.ptr + 0)
            return this.__ResourceGroupAcquired
        }
    }

    /**
     * @type {String}
     */
    ResourceGroupName {
        get => StrGet(this.ptr + 4, 255, "UTF-16")
        set => StrPut(value, this.ptr + 4, 255, "UTF-16")
    }
}
