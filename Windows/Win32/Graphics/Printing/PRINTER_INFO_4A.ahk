#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The PRINTER\_INFO\_4 structure specifies general printer information.The structure can be used to retrieve minimal printer information on a call to EnumPrinters.
 * @remarks
 * The **PRINTER\_INFO\_4** structure provides an easy and extremely fast way to retrieve the names of the printers installed on a local machine, as well as the remote connections that a user has established. When [**EnumPrinters**](enumprinters.md) is called with a **PRINTER\_INFO\_4** data structure, that function queries the registry for the specified information, then returns immediately. This differs from the behavior of **EnumPrinters** when called with other levels of **PRINTER\_INFO\_xxx** data structures. In particular, when **EnumPrinters** is called with a level 2 (**PRINTER\_INFO\_2** ) data structure, it performs an **OpenPrinter** call on each remote connection. If a remote connection is down, if the remote server no longer exists, or if the remote printer no longer exists, the function must wait for RPC to time out and consequently fail the **OpenPrinter** call. This can take a while. Passing a **PRINTER\_INFO\_4** structure lets an application retrieve a bare minimum of required information; if more detailed information is desired, a subsequent **EnumPrinter** level 2 call can be made.
 * 
 * **Attributes** can also contain values that are defined in the **Attributes** field of **PRINTER\_INFO\_2**.
 * 
 * Some printer configurations, such as printer connections to some non-Windows-based print servers, might return both **PRINTER\_ATTRIBUTE\_LOCAL** and **PRINTER\_ATTRIBUTE\_NETWORK**.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-info-4
 * @namespace Windows.Win32.Graphics.Printing
 * @charset ANSI
 */
export default struct PRINTER_INFO_4A {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that specifies the name of the printer (local or remote).
     */
    pPrinterName : PSTR

    /**
     * Pointer to a null-terminated string that is the name of the server.
     */
    pServerName : PSTR

    /**
     * Specifies information about the returned data.
     * 
     * 
     * 
     * | Value                       | Meaning                          |
     * |-----------------------------|----------------------------------|
     * | PRINTER\_ATTRIBUTE\_LOCAL   | The printer is a local printer.  |
     * | PRINTER\_ATTRIBUTE\_NETWORK | The printer is a remote printer. |
     */
    Attributes : UInt32

}
