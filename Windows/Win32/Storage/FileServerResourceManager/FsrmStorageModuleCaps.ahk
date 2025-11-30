#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags that define the capabilities of the storage module.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmstoragemodulecaps
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmStorageModuleCaps extends Win32Enum{

    /**
     * The storage module's capabilities are unknown. Do not use this value.
     * @type {Integer (Int32)}
     */
    static FsrmStorageModuleCaps_Unknown => 0

    /**
     * The storage module is allowed to retrieve classification properties.
     * @type {Integer (Int32)}
     */
    static FsrmStorageModuleCaps_CanGet => 1

    /**
     * The storage module is allowed to store classification properties.
     * @type {Integer (Int32)}
     */
    static FsrmStorageModuleCaps_CanSet => 2

    /**
     * The storage module is allowed to handle folders. Only secure properties 
     *        (<b>FsrmPropertyDefinitionFlags_Secure</b> flags set on the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition2-get_propertydefinitionflags">PropertyDefinitionFlags</a> 
     *        property) can be stored unless <b>FsrmStorageModuleCaps_CanHandleFiles</b> is also 
     *        specified.
     * 
     * <b>Windows Server 2008 R2:  </b>This storage module capability is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmStorageModuleCaps_CanHandleDirectories => 4

    /**
     * The storage module is allowed to handle files.
     * 
     * <b>Windows Server 2008 R2:  </b>This storage module capability is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmStorageModuleCaps_CanHandleFiles => 8
}
