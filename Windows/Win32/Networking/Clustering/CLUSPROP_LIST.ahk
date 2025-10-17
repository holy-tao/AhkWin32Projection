#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUSPROP_SYNTAX.ahk
#Include .\CLUSPROP_VALUE.ahk
#Include .\CLUSPROP_SZ.ahk

/**
 * Accesses the beginning of a property list.
 * @remarks
 * 
  * For information about property lists, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/property-lists">Property Lists</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clusprop_list
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSPROP_LIST extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Number of properties in the property list.
     * @type {Integer}
     */
    nPropertyCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Structure describing the name of the first property in the list.
     * @type {CLUSPROP_SZ}
     */
    PropertyName{
        get {
            if(!this.HasProp("__PropertyName"))
                this.__PropertyName := CLUSPROP_SZ(8, this)
            return this.__PropertyName
        }
    }
}
