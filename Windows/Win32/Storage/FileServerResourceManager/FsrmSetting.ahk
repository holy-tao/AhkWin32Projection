#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Retrieves or sets the email address for the administrator. (Put)
 * @remarks
 * The address is used if a configured email address contains the string "[Admin Email]".
 * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmsetting-put_adminemail
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmSetting extends Win32Struct {
    static sizeof => 0

    static packingSize => 1
}
