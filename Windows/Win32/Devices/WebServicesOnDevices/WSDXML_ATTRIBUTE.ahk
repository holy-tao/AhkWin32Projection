#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Describes an XML attribute.
 * @remarks
 * 
  * <b>WSDXML_ATTRIBUTE</b> is used to describe attribute values in an XML element.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdxmldom/ns-wsdxmldom-wsdxml_attribute
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSDXML_ATTRIBUTE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies parent element of the attribute.
     * @type {Pointer<WSDXML_ELEMENT>}
     */
    Element {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Reference to a <b>WSDXML_ATTRIBUTE</b> structure that specifies the next sibling attribute, if any.
     * @type {Pointer<WSDXML_ATTRIBUTE>}
     */
    Next {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_name">WSDXML_NAME</a> structure that specifies the qualified name of the attribute.
     * @type {Pointer<WSDXML_NAME>}
     */
    Name {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The value of the attribute.
     * @type {PWSTR}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := PWSTR(this.ptr + 24)
            return this.__Value
        }
    }
}
