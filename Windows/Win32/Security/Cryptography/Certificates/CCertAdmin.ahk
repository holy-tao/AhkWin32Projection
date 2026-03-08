#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The DeleteRow method deletes a row or set of rows from a database table. The caller specifies a database table and either a row ID or an ending date.
 * @remarks
 * <i>RowID</i> and <i>Date</i> are mutually exclusive; one and only one of them can be nonzero.
 * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-deleterow
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CCertAdmin extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
