#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an XML namespace prefix.
 * @see https://learn.microsoft.com/windows/win32/api/wsdxmldom/ns-wsdxmldom-wsdxml_prefix_mapping
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSDXML_PREFIX_MAPPING extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The number of references to the mapping. When the value reaches zero, the mapping is deleted.
     * @type {Integer}
     */
    Refs {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reference to the next node in a linked list of <b>WSDXML_PREFIX_MAPPING</b> structures.
     * @type {Pointer<WSDXML_PREFIX_MAPPING>}
     */
    Next {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_namespace">WSDXML_NAMESPACE</a> structure.
     * @type {Pointer<WSDXML_NAMESPACE>}
     */
    Space {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The text of the XML prefix.
     * @type {Pointer<Char>}
     */
    Prefix {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
