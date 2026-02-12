#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Retrieves the descriptions for the macros contained in the IFsrmFileScreenManager::ActionVariables property.
 * @see https://learn.microsoft.com/windows/win32/api//content/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenmanager-get_actionvariabledescriptions
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmFileScreenManager extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
