#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\Sources.ahk
#Include .\Adapter.ahk

/**
 * The Adapters structure contains a list of graphics adapters.
 * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/ns-cloneviewhelper-adapters
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class Adapters extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of graphics adapters in the array that the <b>adapter</b> member specifies.
     * @type {Integer}
     */
    numAdapters {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/cloneviewhelper/ns-cloneviewhelper-adapter">Adapter</a> structures that specify information about graphics adapters.
     * @type {Array<Adapter>}
     */
    adapter{
        get {
            if(!this.HasProp("__adapterProxyArray"))
                this.__adapterProxyArray := Win32FixedArray(this.ptr + 8, 8, Adapter, "")
            return this.__adapterProxyArray
        }
    }
}
