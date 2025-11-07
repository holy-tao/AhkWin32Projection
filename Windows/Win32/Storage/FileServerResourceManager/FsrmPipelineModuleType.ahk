#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the types of modules that you can define.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmpipelinemoduletype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmPipelineModuleType{

    /**
     * The module type is unknown; do not use this value.
     * @type {Integer (Int32)}
     */
    static FsrmPipelineModuleType_Unknown => 0

    /**
     * The module is a storage module. A storage module persists property values for the files that it 
     *       supports.
     * @type {Integer (Int32)}
     */
    static FsrmPipelineModuleType_Storage => 1

    /**
     * The module is a classifier module. A classifier module assigns property values to files based on 
     *       classification rules.
     * @type {Integer (Int32)}
     */
    static FsrmPipelineModuleType_Classifier => 2
}
