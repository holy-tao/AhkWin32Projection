#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the types of modules that you can define.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmpipelinemoduletype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmPipelineModuleType extends Win32Enum {

    /**
     * The module type is unknown; do not use this value.
     * Native name: FsrmPipelineModuleType_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The module is a storage module. A storage module persists property values for the files that it 
     *       supports.
     * Native name: FsrmPipelineModuleType_Storage
     * @type {Integer (Int32)}
     */
    static Storage => 1

    /**
     * The module is a classifier module. A classifier module assigns property values to files based on 
     *       classification rules.
     * Native name: FsrmPipelineModuleType_Classifier
     * @type {Integer (Int32)}
     */
    static Classifier => 2
}
