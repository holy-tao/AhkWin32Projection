#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }

/**
 * @namespace Windows.Win32.Media.PictureAcquisition
 */

;@region Constants

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PhotoAcquire_RelativePathname := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PhotoAcquire_RelativePathname.fmtid),
    Guid.Ptr, Guid("{00f23377-7ac6-4b7a-8443-345e731fa57a}"),
    UInt32, 16)
PKEY_PhotoAcquire_RelativePathname.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PhotoAcquire_FinalFilename := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PhotoAcquire_FinalFilename.fmtid),
    Guid.Ptr, Guid("{00f23377-7ac6-4b7a-8443-345e731fa57a}"),
    UInt32, 16)
PKEY_PhotoAcquire_FinalFilename.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PhotoAcquire_GroupTag := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PhotoAcquire_GroupTag.fmtid),
    Guid.Ptr, Guid("{00f23377-7ac6-4b7a-8443-345e731fa57a}"),
    UInt32, 16)
PKEY_PhotoAcquire_GroupTag.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PhotoAcquire_TransferResult := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PhotoAcquire_TransferResult.fmtid),
    Guid.Ptr, Guid("{00f23377-7ac6-4b7a-8443-345e731fa57a}"),
    UInt32, 16)
PKEY_PhotoAcquire_TransferResult.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PhotoAcquire_OriginalFilename := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PhotoAcquire_OriginalFilename.fmtid),
    Guid.Ptr, Guid("{00f23377-7ac6-4b7a-8443-345e731fa57a}"),
    UInt32, 16)
PKEY_PhotoAcquire_OriginalFilename.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PhotoAcquire_CameraSequenceNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PhotoAcquire_CameraSequenceNumber.fmtid),
    Guid.Ptr, Guid("{00f23377-7ac6-4b7a-8443-345e731fa57a}"),
    UInt32, 16)
PKEY_PhotoAcquire_CameraSequenceNumber.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PhotoAcquire_IntermediateFile := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PhotoAcquire_IntermediateFile.fmtid),
    Guid.Ptr, Guid("{00f23377-7ac6-4b7a-8443-345e731fa57a}"),
    UInt32, 16)
PKEY_PhotoAcquire_IntermediateFile.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PhotoAcquire_SkipImport := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PhotoAcquire_SkipImport.fmtid),
    Guid.Ptr, Guid("{00f23377-7ac6-4b7a-8443-345e731fa57a}"),
    UInt32, 16)
PKEY_PhotoAcquire_SkipImport.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PhotoAcquire_DuplicateDetectionID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PhotoAcquire_DuplicateDetectionID.fmtid),
    Guid.Ptr, Guid("{00f23377-7ac6-4b7a-8443-345e731fa57a}"),
    UInt32, 16)
PKEY_PhotoAcquire_DuplicateDetectionID.pid := 10

/**
 * @type {Integer (Int32)}
 */
export global PROGRESS_INDETERMINATE := -1

/**
 * @type {Integer (Int32)}
 */
export global PHOTOACQ_ERROR_RESTART_REQUIRED := -2147180543

/**
 * @type {Integer (UInt32)}
 */
export global PHOTOACQ_RUN_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global PHOTOACQ_NO_GALLERY_LAUNCH := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHOTOACQ_DISABLE_AUTO_ROTATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PHOTOACQ_DISABLE_PLUGINS := 4

/**
 * @type {Integer (UInt32)}
 */
export global PHOTOACQ_DISABLE_GROUP_TAG_PROMPT := 8

/**
 * @type {Integer (UInt32)}
 */
export global PHOTOACQ_DISABLE_DB_INTEGRATION := 16

/**
 * @type {Integer (UInt32)}
 */
export global PHOTOACQ_DELETE_AFTER_ACQUIRE := 32

/**
 * @type {Integer (UInt32)}
 */
export global PHOTOACQ_DISABLE_DUPLICATE_DETECTION := 64

/**
 * @type {Integer (UInt32)}
 */
export global PHOTOACQ_ENABLE_THUMBNAIL_CACHING := 128

/**
 * @type {Integer (UInt32)}
 */
export global PHOTOACQ_DISABLE_METADATA_WRITE := 256

/**
 * @type {Integer (UInt32)}
 */
export global PHOTOACQ_DISABLE_THUMBNAIL_PROGRESS := 512

/**
 * @type {Integer (UInt32)}
 */
export global PHOTOACQ_DISABLE_SETTINGS_LINK := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PHOTOACQ_ABORT_ON_SETTINGS_UPDATE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PHOTOACQ_IMPORT_VIDEO_AS_MULTIPLE_FILES := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DSF_WPD_DEVICES := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSF_WIA_CAMERAS := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSF_WIA_SCANNERS := 4

/**
 * @type {Integer (UInt32)}
 */
export global DSF_STI_DEVICES := 8

/**
 * @type {Integer (UInt32)}
 */
export global DSF_TWAIN_DEVICES := 16

/**
 * @type {Integer (UInt32)}
 */
export global DSF_FS_DEVICES := 32

/**
 * @type {Integer (UInt32)}
 */
export global DSF_DV_DEVICES := 64

/**
 * @type {Integer (UInt32)}
 */
export global DSF_ALL_DEVICES := 65535

/**
 * @type {Integer (UInt32)}
 */
export global DSF_CPL_MODE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global DSF_SHOW_OFFLINE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PAPS_PRESAVE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PAPS_POSTSAVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PAPS_CLEANUP := 2
;@endregion Constants
