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
 */
class FsrmPropertyFlags extends Win32Enum {

    /**
     * Native name: FsrmPropertyFlags_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The property does not have a corresponding property definition defined in FSRM.
     * Native name: FsrmPropertyFlags_Orphaned
     * @type {Integer (Int32)}
     */
    static Orphaned => 1

    /**
     * The value of the property was retrieved from the cache during this classification session.
     * Native name: FsrmPropertyFlags_RetrievedFromCache
     * @type {Integer (Int32)}
     */
    static RetrievedFromCache => 2

    /**
     * The value of the property was retrieved from the file or database during this classification session.
     * Native name: FsrmPropertyFlags_RetrievedFromStorage
     * @type {Integer (Int32)}
     */
    static RetrievedFromStorage => 4

    /**
     * The value of the property was set by a classification rule during the last classification run.
     * Native name: FsrmPropertyFlags_SetByClassifier
     * @type {Integer (Int32)}
     */
    static SetByClassifier => 8

    /**
     * The property was deleted by 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-clearfileproperty">IFsrmClassificationManager::ClearFileProperty</a>.
     * Native name: FsrmPropertyFlags_Deleted
     * @type {Integer (Int32)}
     */
    static Deleted => 16

    /**
     * The property value from storage was changed to a different value by a classifier.
     * Native name: FsrmPropertyFlags_Reclassified
     * @type {Integer (Int32)}
     */
    static Reclassified => 32

    /**
     * There are values from multiple sources that could not be aggregated together.
     * Native name: FsrmPropertyFlags_AggregationFailed
     * @type {Integer (Int32)}
     */
    static AggregationFailed => 64

    /**
     * The property already exists in storage.
     * Native name: FsrmPropertyFlags_Existing
     * @type {Integer (Int32)}
     */
    static Existing => 128

    /**
     * The property may only be partially classified because a failure occurred while loading properties from 
     *       storage.
     * Native name: FsrmPropertyFlags_FailedLoadingProperties
     * @type {Integer (Int32)}
     */
    static FailedLoadingProperties => 256

    /**
     * The property may only be partially classified because a failure occurred while classifying 
     *       properties.
     * Native name: FsrmPropertyFlags_FailedClassifyingProperties
     * @type {Integer (Int32)}
     */
    static FailedClassifyingProperties => 512

    /**
     * The property failed to be saved by the storage module with the highest precedence.
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * Native name: FsrmPropertyFlags_FailedSavingProperties
     * @type {Integer (Int32)}
     */
    static FailedSavingProperties => 1024

    /**
     * The property is defined to be used for security purposes or came from secure storage.
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * Native name: FsrmPropertyFlags_Secure
     * @type {Integer (Int32)}
     */
    static Secure => 2048

    /**
     * The property value originally came from a classification policy.
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * Native name: FsrmPropertyFlags_PolicyDerived
     * @type {Integer (Int32)}
     */
    static PolicyDerived => 4096

    /**
     * The property value was inherited from the property value of the file's parent folder.
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * Native name: FsrmPropertyFlags_Inherited
     * @type {Integer (Int32)}
     */
    static Inherited => 8192

    /**
     * The property value was set manually.
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * Native name: FsrmPropertyFlags_Manual
     * @type {Integer (Int32)}
     */
    static Manual => 16384

    /**
     * An explicit property value was deleted and replaced with an inherited value.
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * Native name: FsrmPropertyFlags_ExplicitValueDeleted
     * @type {Integer (Int32)}
     */
    static ExplicitValueDeleted => 32768

    /**
     * The property has been deleted due to a rule marked with clear property.
     * 
     * <b>Windows Server 2012 and Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012 R2.
     * Native name: FsrmPropertyFlags_PropertyDeletedFromClear
     * @type {Integer (Int32)}
     */
    static PropertyDeletedFromClear => 65536

    /**
     * This mask shows which flags are used to indicate the source of the property and is equivalent to the 
     *        following flag combination:
     * 
     * <c>(FsrmPropertyFlags_RetrievedFromCache | FsrmPropertyFlags_RetrievedFromStorage | FsrmPropertyFlags_SetByClassifier)</c>
     * Native name: FsrmPropertyFlags_PropertySourceMask
     * @type {Integer (Int32)}
     */
    static PropertySourceMask => 14

    /**
     * This mask shows which flags are persisted by the cache and secure storage modules and is equivalent to the 
     *        following flag combination:
     * 
     * <c>(FsrmPropertyFlags_PolicyDerived | FsrmPropertyFlags_Manual)</c>
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * Native name: FsrmPropertyFlags_PersistentMask
     * @type {Integer (Int32)}
     */
    static PersistentMask => 20480
}
