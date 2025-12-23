#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags that defines how classification properties associated with a file are retrieved.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmgetfilepropertyoptions
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmGetFilePropertyOptions extends Win32Enum{

    /**
     * Retrieve the most up-to-date classification properties. Using this value may require more time than the 
     *       <b>FsrmGetFilePropertyOptions_NoRuleEvaluation</b> value.
     * @type {Integer (Int32)}
     */
    static FsrmGetFilePropertyOptions_None => 0

    /**
     * Retrieve classification properties from cache or storage without using any rule evaluation.
     * @type {Integer (Int32)}
     */
    static FsrmGetFilePropertyOptions_NoRuleEvaluation => 1

    /**
     * After retrieving the classification properties (and possibly reclassifying the file in the process), store 
     *        the classification properties with the file.
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmGetFilePropertyOptions_Persistent => 2

    /**
     * If the <b>FsrmGetFilePropertyOptions_Persistent</b> flag is set but the properties were 
     *        unable to be stored with the file, return a failure for the operation. If this flag is clear the operation will 
     *        not fail even though the properties were not persisted with the file.
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmGetFilePropertyOptions_FailOnPersistErrors => 4

    /**
     * If the <b>FsrmGetFilePropertyOptions_Persistent</b> flag is set, skip any properties 
     *        stored with the file that are not also defined for the machine.
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmGetFilePropertyOptions_SkipOrphaned => 8
}
