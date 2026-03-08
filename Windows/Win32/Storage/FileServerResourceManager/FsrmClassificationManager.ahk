#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Cancels classification if it is running.
 * @remarks
 * Cancels classification that was started manually using the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-runclassification">IFsrmClassificationManager::RunClassification</a> 
 *     method or that was started on a schedule (see 
 *     <b>RunClassification</b> for details 
 *     on running classification on a schedule).
 * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-cancelclassification
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmClassificationManager extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
