#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Retrieves a list of network shares that point to the specified local path.
 * @remarks
 * When you get the path property for a quota, the path is the local path. You use this method to convert that 
 *     local path to the network path if you want to know the actual network share that is running out of space.
 * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmpathmapper-getsharepathsforlocalpath
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmPathMapper extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
