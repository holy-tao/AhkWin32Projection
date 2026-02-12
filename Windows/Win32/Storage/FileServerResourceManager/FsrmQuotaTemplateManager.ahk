#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Creates a quota template object.
 * @see https://learn.microsoft.com/windows/win32/api//content/fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-createtemplate
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmQuotaTemplateManager extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
