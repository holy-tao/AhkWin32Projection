#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Exports one or more file groups to the specified file.
 * @remarks
 * The file group name is specified when you call the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-createfilegroup">IFsrmFileGroupManager::CreateFileGroup</a> 
 *     method. To enumerate the file groups, call the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-enumfilegroups">IFsrmFileGroupManager::EnumFileGroups</a> 
 *     method.
 * 
 * You can also use the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-exportfilegroups">IFsrmFileGroupManager::ExportFileGroups</a> 
 *     method to export the templates.
 * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmexportimport-exportfilegroups
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmExportImport extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
