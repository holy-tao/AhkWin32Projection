#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DSOBJECT.ahk

/**
 * The DSOBJECTNAMES structure is used to contain directory object data for use by an Active Directory property sheet or context menu extension.
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/ns-dsclient-dsobjectnames
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
class DSOBJECTNAMES extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    /**
     * Contains the namespace identifier which indicates the origin of the namespace selection. The <b>CLSID_DsFolder</b> value (identical to <b>CLSID_MicrosoftDS</b>) is used to identify namespaces implemented by Active Directory Domain Services.
     * @type {Guid}
     */
    clsidNamespace {
        get {
            if(!this.HasProp("__clsidNamespace"))
                this.__clsidNamespace := Guid(0, this)
            return this.__clsidNamespace
        }
    }

    /**
     * Contains the number of elements in the <b>aObjects</b> array.
     * @type {Integer}
     */
    cItems {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-dsobject">DSBOJECT</a> structures. Each <b>DSBOJECT</b> structure represents a single directory object. The <b>cItems</b> member contains the number of elements in the array.
     * @type {DSOBJECT}
     */
    aObjects {
        get {
            if(!this.HasProp("__aObjectsProxyArray"))
                this.__aObjectsProxyArray := Win32FixedArray(this.ptr + 20, 1, DSOBJECT, "")
            return this.__aObjectsProxyArray
        }
    }
}
