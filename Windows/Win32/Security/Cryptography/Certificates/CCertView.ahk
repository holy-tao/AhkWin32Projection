#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Obtains an instance of a column-enumeration sequence for the database schema.
 * @remarks
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-ienumcertviewcolumn">IEnumCERTVIEWCOLUMN</a> object can be used to enumerate the view's columns and retrieve each column's information.
 * @see https://learn.microsoft.com/windows/win32/api//content/certview/nf-certview-icertview-enumcertviewcolumn
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CCertView extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
