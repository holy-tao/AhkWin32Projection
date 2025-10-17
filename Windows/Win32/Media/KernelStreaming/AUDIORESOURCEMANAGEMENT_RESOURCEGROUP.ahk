#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
    ResourceGroupAcquired {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {String}
     */
    ResourceGroupName {
        get => StrGet(this.ptr + 4, 255, "UTF-16")
        set => StrPut(value, this.ptr + 4, 255, "UTF-16")
    }
}
