#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the format and type of a data value. It is used as the Syntax member of the CLUSPROP_VALUE structure.
 * @remarks
 * 
 * To parse data that is returned from a 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/control-code-functions">control code function</a>, use the 
 *      <b>wFormat</b> member of this structure if the <b>wType</b> member 
 *      defines a type that the application cannot understand.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clusprop_syntax
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSPROP_SYNTAX extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A DWORD that describes the format and type of the data value. The 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_property_syntax">CLUSTER_PROPERTY_SYNTAX</a> enumeration defines the 
     *        possible values.
     * @type {Integer}
     */
    dw {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wFormat {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wType {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
