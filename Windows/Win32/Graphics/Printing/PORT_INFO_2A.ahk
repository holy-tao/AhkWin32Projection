#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PORT\_INFO\_2 structure identifies a supported printer port.
 * @remarks
 * Use the **PORT\_INFO\_2** structure when calling [**EnumPorts**](enumports.md) if there are multiple monitors installed that support the same ports.
  * 
  * The **fPortType** member can be queried to determine information about the port. Note that port settings do not influence printer attributes (as returned by the **Attributes** member of [**PRINTER\_INFO\_2**](printer-info-2.md)).
 * @see https://learn.microsoft.com/windows/win32/printdocs/port-info-2
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class PORT_INFO_2A extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that identifies a supported printer port (for example, "LPT1:").
     * @type {Pointer<Ptr>}
     */
    pPortName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a null-terminated string that identifies an installed monitor (for example, "PJL monitor"). This can be **NULL**.
     * @type {Pointer<Ptr>}
     */
    pMonitorName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a null-terminated string that describes the port in more detail (for example, if **pPortName** is "LPT1:", **pDescription** is "printer port"). This can be **NULL**.
     * @type {Pointer<Ptr>}
     */
    pDescription {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Bitmask describing the type of port. This member can be a combination of the following values:
     * 
     * 
     * **PORT\_TYPE\_WRITE**
     * 
     * **PORT\_TYPE\_READ**
     * 
     * **PORT\_TYPE\_REDIRECTED**
     * 
     * **PORT\_TYPE\_NET\_ATTACHED**
     * @type {Integer}
     */
    fPortType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved; must be zero.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
