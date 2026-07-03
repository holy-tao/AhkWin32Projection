#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WINBIO_ADAPTER_INTERFACE_VERSION.ahk" { WINBIO_ADAPTER_INTERFACE_VERSION }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_FRAMEWORK_INTERFACE {
    #StructPack 8

    Version : WINBIO_ADAPTER_INTERFACE_VERSION

    Type : UInt32

    Size : IntPtr

    AdapterId : Guid

    SetUnitStatus : IntPtr

    VsmStorageAttach : IntPtr

    VsmStorageDetach : IntPtr

    VsmStorageClearContext : IntPtr

    VsmStorageCreateDatabase : IntPtr

    VsmStorageOpenDatabase : IntPtr

    VsmStorageCloseDatabase : IntPtr

    VsmStorageDeleteRecord : IntPtr

    VsmStorageNotifyPowerChange : IntPtr

    VsmStoragePipelineInit : IntPtr

    VsmStoragePipelineCleanup : IntPtr

    VsmStorageActivate : IntPtr

    VsmStorageDeactivate : IntPtr

    VsmStorageQueryExtendedInfo : IntPtr

    VsmStorageCacheClear : IntPtr

    VsmStorageCacheImportBegin : IntPtr

    VsmStorageCacheImportNext : IntPtr

    VsmStorageCacheImportEnd : IntPtr

    VsmStorageCacheExportBegin : IntPtr

    VsmStorageCacheExportNext : IntPtr

    VsmStorageCacheExportEnd : IntPtr

    VsmSensorAttach : IntPtr

    VsmSensorDetach : IntPtr

    VsmSensorClearContext : IntPtr

    VsmSensorPushDataToEngine : IntPtr

    VsmSensorNotifyPowerChange : IntPtr

    VsmSensorPipelineInit : IntPtr

    VsmSensorPipelineCleanup : IntPtr

    VsmSensorActivate : IntPtr

    VsmSensorDeactivate : IntPtr

    VsmSensorAsyncImportRawBuffer : IntPtr

    VsmSensorAsyncImportSecureBuffer : IntPtr

    Reserved1 : IntPtr

    Reserved2 : IntPtr

    Reserved3 : IntPtr

    Reserved4 : IntPtr

    Reserved5 : IntPtr

    AllocateMemory : IntPtr

    FreeMemory : IntPtr

    GetProperty : IntPtr

    LockAndValidateSecureBuffer : IntPtr

    ReleaseSecureBuffer : IntPtr

    QueryAuthorizedEnrollments : IntPtr

    DecryptSample : IntPtr

}
