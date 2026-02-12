#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Creates a file group object.
 * @see https://learn.microsoft.com/windows/win32/api//content/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-createfilegroup
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmFileGroupManager extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
