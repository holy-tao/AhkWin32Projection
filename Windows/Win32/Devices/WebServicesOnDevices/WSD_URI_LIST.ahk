#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a node in a linked list of URIs.
 * @see https://docs.microsoft.com/windows/win32/api//wsdtypes/ns-wsdtypes-wsd_uri_list
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_URI_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reference to the next node in the single-linked list of <b>WSD_URI_LIST</b> structures.
     * @type {Pointer<WSD_URI_LIST>}
     */
    Next {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The URI referenced by this node.
     * @type {PWSTR}
     */
    Element {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
