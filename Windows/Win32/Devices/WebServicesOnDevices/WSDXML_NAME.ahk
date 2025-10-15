#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Specifies an XML qualified name.
 * @remarks
 * 
  * <b>WSDXML_NAME</b> represents a single name within a namespace. The relationship between the name and namespace is circular, in that the <b>Space</b> pointer of the name points to the namespace the name belongs to, and the <b>Names</b> array of the namespace will have an entry for the name.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdxmldom/ns-wsdxmldom-wsdxml_name
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSDXML_NAME extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_namespace">WSDXML_NAMESPACE</a> structure that specifies the namespace of the qualified name.
     * @type {Pointer<WSDXML_NAMESPACE>}
     */
    Space {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The local name of the qualified name.
     * @type {PWSTR}
     */
    LocalName{
        get {
            if(!this.HasProp("__LocalName"))
                this.__LocalName := PWSTR(this.ptr + 8)
            return this.__LocalName
        }
    }
}
