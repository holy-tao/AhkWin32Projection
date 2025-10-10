#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\Sources.ahk

/**
 * The Adapter structure describes a graphics adapter.
 * @see https://docs.microsoft.com/windows/win32/api//cloneviewhelper/ns-cloneviewhelper-adapter
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class Adapter extends Win32Struct
{
    static sizeof => 272

    static packingSize => 8

    /**
     * A single wide-character string that holds the name of the graphics adapter.
     * @type {String}
     */
    AdapterName {
        get => StrGet(this.ptr + 0, 127, "UTF-16")
        set => StrPut(value, this.ptr + 0, 127, "UTF-16")
    }

    /**
     * The number of video present sources in the array that the <b>sources</b> member specifies.
     * @type {Integer}
     */
    numSources {
        get => NumGet(this, 256, "int")
        set => NumPut("int", value, this, 256)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/cloneviewhelper/ns-cloneviewhelper-sources">Sources</a> structures that specify a list of Video Present Network (VidPN) topologies.
     * @type {Array<Sources>}
     */
    sources{
        get {
            if(!this.HasProp("__sourcesProxyArray"))
                this.__sourcesProxyArray := Win32FixedArray(this.ptr + 264, 1, Sources, "")
            return this.__sourcesProxyArray
        }
    }
}
