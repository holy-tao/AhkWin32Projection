#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Creates a report job.
 * @see https://learn.microsoft.com/windows/win32/api//content/fsrmreports/nf-fsrmreports-ifsrmreportmanager-createreportjob
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmReportManager extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
