#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Documentation varies per use. Refer to each: <see href="https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-deleterow">CCertAdmin.DeleteRow</see>, <see href="https://learn.microsoft.com/windows/win32/api/certview/nf-certview-icertview2-settable">CCertView.SetTable</see>, <see href="https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-deleterow">ICertAdmin.DeleteRow</see>, <see href="https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-deleterow">ICertAdmin2.DeleteRow</see>, <see href="https://learn.microsoft.com/windows/win32/api/certview/nf-certview-icertview2-settable">ICertView.SetTable</see>, <see href="https://learn.microsoft.com/windows/win32/api/certview/nf-certview-icertview2-settable">ICertView2.SetTable</see>.
 * @see 
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CVRC_TABLE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CVRC_TABLE_ATTRIBUTES => 16384

    /**
     * @type {Integer (Int32)}
     */
    static CVRC_TABLE_CRL => 20480

    /**
     * @type {Integer (Int32)}
     */
    static CVRC_TABLE_EXTENSIONS => 12288

    /**
     * @type {Integer (Int32)}
     */
    static CVRC_TABLE_REQCERT => 0
}
