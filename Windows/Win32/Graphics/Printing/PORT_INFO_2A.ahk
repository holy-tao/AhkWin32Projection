#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The PORT\_INFO\_2 structure identifies a supported printer port.
 * @remarks
 * Use the **PORT\_INFO\_2** structure when calling [**EnumPorts**](enumports.md) if there are multiple monitors installed that support the same ports.
 * 
 * The **fPortType** member can be queried to determine information about the port. Note that port settings do not influence printer attributes (as returned by the **Attributes** member of [**PRINTER\_INFO\_2**](printer-info-2.md)).
 * @see https://learn.microsoft.com/windows/win32/printdocs/port-info-2
 * @namespace Windows.Win32.Graphics.Printing
 * @charset ANSI
 */
export default struct PORT_INFO_2A {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that identifies a supported printer port (for example, "LPT1:").
     */
    pPortName : PSTR

    /**
     * Pointer to a null-terminated string that identifies an installed monitor (for example, "PJL monitor"). This can be **NULL**.
     */
    pMonitorName : PSTR

    /**
     * Pointer to a null-terminated string that describes the port in more detail (for example, if **pPortName** is "LPT1:", **pDescription** is "printer port"). This can be **NULL**.
     */
    pDescription : PSTR

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
     */
    fPortType : UInt32

    /**
     * Reserved; must be zero.
     */
    Reserved : UInt32

}
