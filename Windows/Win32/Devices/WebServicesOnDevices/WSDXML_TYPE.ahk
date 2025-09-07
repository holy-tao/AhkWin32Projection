#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an XSD type.
 * @see https://learn.microsoft.com/windows/win32/api/wsdxmldom/ns-wsdxmldom-wsdxml_type
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSDXML_TYPE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The optional URI that identifies the type.
     * @type {Pointer<Ptr>}
     */
    Uri {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The type table that describes the schema of the type and its binary representation.
     * @type {Pointer<Byte>}
     */
    Table {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
