#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\NetworkManagement\WNet\NETRESOURCEA.ahk

/**
 * Defines the CF_NETRESOURCE clipboard format.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-nresarray
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class NRESARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>UINT</b>
     * 
     * The number of elements in the <b>nr</b> array.
     * @type {Integer}
     */
    cItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a>[1]</b>
     * 
     * The array of <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structures that contain information about network resources. The string members (<b>LPSTR</b> types) in the structure contain offsets instead of addresses.
     * @type {Array<NETRESOURCEA>}
     */
    nr{
        get {
            if(!this.HasProp("__nrProxyArray"))
                this.__nrProxyArray := Win32FixedArray(this.ptr + 8, 1, NETRESOURCEA, "")
            return this.__nrProxyArray
        }
    }
}
