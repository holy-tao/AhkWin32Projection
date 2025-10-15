#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Represents a generated SOAP fault.
 * @see https://docs.microsoft.com/windows/win32/api//wsdtypes/ns-wsdtypes-wsd_soap_fault
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_SOAP_FAULT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_fault_code">WSD_SOAP_FAULT_CODE</a> structure that contains a SOAP fault code.
     * @type {Pointer<WSD_SOAP_FAULT_CODE>}
     */
    Code {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_fault_reason">WSD_SOAP_FAULT_REASON</a> structure that contains localized human readable explanations of the fault.
     * @type {Pointer<WSD_SOAP_FAULT_REASON>}
     */
    Reason {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The SOAP node on the SOAP message path that caused the fault.
     * @type {PWSTR}
     */
    Node{
        get {
            if(!this.HasProp("__Node"))
                this.__Node := PWSTR(this.ptr + 16)
            return this.__Node
        }
    }

    /**
     * The SOAP role in which the <b>Node</b> was acting at the time the fault occurred.
     * @type {PWSTR}
     */
    Role{
        get {
            if(!this.HasProp("__Role"))
                this.__Role := PWSTR(this.ptr + 24)
            return this.__Role
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains application-specific error information pertaining to the fault.
     * @type {Pointer<WSDXML_ELEMENT>}
     */
    Detail {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
