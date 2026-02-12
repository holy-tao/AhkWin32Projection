#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Retrieves the descriptions for the macros contained in the IFsrmQuotaManager::ActionVariables property.
 * @see https://learn.microsoft.com/windows/win32/api//content/fsrmquota/nf-fsrmquota-ifsrmquotamanager-get_actionvariabledescriptions
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmQuotaManager extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
