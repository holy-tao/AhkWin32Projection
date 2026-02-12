#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Accepts and processes a file that contains a PKCS
 * @remarks
 * By default, the My, Ca, Root, and Request system stores are used to store the certificates. However, you can specify other stores by assigning the following properties before calling this method:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_mystorename">MyStoreName</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_castorename">CAStoreName</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_rootstorename">RootStoreName</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_requeststorename">RequestStoreName</a>
 * </li>
 * </ul>
 * 
 * 
 * The <b>acceptFilePKCS7</b> method differs from 
 * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a> only in that a file supplies the certificate.
 * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll-acceptfilepkcs7
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CEnroll extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
