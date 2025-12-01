#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines flag values that provide additional information about a classification property.
 * @remarks
 * The <b>FsrmPropertyFlags_SetByClassifier</b> flag is set in the following cases:
 * 
 * <ul>
 * <li>This is the first time the property value is being applied.</li>
 * <li>The execution option of the classification rule applying the value is set to 
 *       <b>FsrmExecutionOption_ReEvaluate_IgnoreExistingValue</b>.</li>
 * <li>The execution option of the classification rule applying the value is set to 
 *       <b>FsrmExecutionOption_ReEvaluate_ConsiderExistingValue</b> and the aggregation policy set 
 *       the value specified by the rule.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmpropertyflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmPropertyFlags extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_None => 0

    /**
     * The property does not have a corresponding property definition defined in FSRM.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_Orphaned => 1

    /**
     * The value of the property was retrieved from the cache during this classification session.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_RetrievedFromCache => 2

    /**
     * The value of the property was retrieved from the file or database during this classification session.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_RetrievedFromStorage => 4

    /**
     * The value of the property was set by a classification rule during the last classification run.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_SetByClassifier => 8

    /**
     * The property was deleted by 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-clearfileproperty">IFsrmClassificationManager::ClearFileProperty</a>.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_Deleted => 16

    /**
     * The property value from storage was changed to a different value by a classifier.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_Reclassified => 32

    /**
     * There are values from multiple sources that could not be aggregated together.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_AggregationFailed => 64

    /**
     * The property already exists in storage.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_Existing => 128

    /**
     * The property may only be partially classified because a failure occurred while loading properties from 
     *       storage.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_FailedLoadingProperties => 256

    /**
     * The property may only be partially classified because a failure occurred while classifying 
     *       properties.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_FailedClassifyingProperties => 512

    /**
     * The property failed to be saved by the storage module with the highest precedence.
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_FailedSavingProperties => 1024

    /**
     * The property is defined to be used for security purposes or came from secure storage.
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_Secure => 2048

    /**
     * The property value originally came from a classification policy.
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_PolicyDerived => 4096

    /**
     * The property value was inherited from the property value of the file's parent folder.
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_Inherited => 8192

    /**
     * The property value was set manually.
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_Manual => 16384

    /**
     * An explicit property value was deleted and replaced with an inherited value.
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_ExplicitValueDeleted => 32768

    /**
     * The property has been deleted due to a rule marked with clear property.
     * 
     * <b>Windows Server 2012 and Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_PropertyDeletedFromClear => 65536

    /**
     * This mask shows which flags are used to indicate the source of the property and is equivalent to the 
     *        following flag combination:
     * 
     * <c>(FsrmPropertyFlags_RetrievedFromCache | FsrmPropertyFlags_RetrievedFromStorage | FsrmPropertyFlags_SetByClassifier)</c>
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_PropertySourceMask => 14

    /**
     * This mask shows which flags are persisted by the cache and secure storage modules and is equivalent to the 
     *        following flag combination:
     * 
     * <c>(FsrmPropertyFlags_PolicyDerived | FsrmPropertyFlags_Manual)</c>
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyFlags_PersistentMask => 20480
}
