#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }

/**
 * The PRINTER\_INFO\_3 structure specifies printer security information.
 * @remarks
 * The **PRINTER\_INFO\_3** structure lets an application get and set a printer's security descriptor. The caller may do so even if it lacks specific printer permissions, as long as it has the standard rights described in [**SetPrinter**](setprinter.md) and [**GetPrinter**](getprinter.md). Thus, an application may temporarily deny all access to a printer, while allowing the owner of the printer to have access to the printer's discretionary ACL.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-info-3
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PRINTER_INFO_3 {
    #StructPack 8

    /**
     * Pointer to a [**SECURITY\_DESCRIPTOR**](/windows/desktop/api/winnt/ns-winnt-security_descriptor) structure that specifies a printer's security information.
     */
    pSecurityDescriptor : PSECURITY_DESCRIPTOR

}
