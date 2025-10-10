#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DSOBJECT.ahk

/**
 * The DSOBJECTNAMES structure is used to contain directory object data for use by an Active Directory property sheet or context menu extension.
 * @see https://docs.microsoft.com/windows/win32/api//dsclient/ns-dsclient-dsobjectnames
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DSOBJECTNAMES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Contains the namespace identifier which indicates the origin of the namespace selection. The <b>CLSID_DsFolder</b> value (identical to <b>CLSID_MicrosoftDS</b>) is used to identify namespaces implemented by Active Directory Domain Services.
     * @type {Pointer<Guid>}
     */
    clsidNamespace {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Contains the number of elements in the <b>aObjects</b> array.
     * @type {Integer}
     */
    cItems {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-dsobject">DSBOJECT</a> structures. Each <b>DSBOJECT</b> structure represents a single directory object. The <b>cItems</b> member contains the number of elements in the array.
     * @type {Array<DSOBJECT>}
     */
    aObjects{
        get {
            if(!this.HasProp("__aObjectsProxyArray"))
                this.__aObjectsProxyArray := Win32FixedArray(this.ptr + 16, 1, DSOBJECT, "")
            return this.__aObjectsProxyArray
        }
    }
}
