#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FileServerResourceManager {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static FSRM_DISPID_FEATURE_MASK => 251658240

    /**
     * @type {Integer (UInt32)}
     */
    static FSRM_DISPID_INTERFACE_A_MASK => 15728640

    /**
     * @type {Integer (UInt32)}
     */
    static FSRM_DISPID_INTERFACE_B_MASK => 983040

    /**
     * @type {Integer (UInt32)}
     */
    static FSRM_DISPID_INTERFACE_C_MASK => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static FSRM_DISPID_INTERFACE_D_MASK => 3840

    /**
     * @type {Integer (UInt32)}
     */
    static FSRM_DISPID_IS_PROPERTY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FSRM_DISPID_METHOD_NUM_MASK => 127

    /**
     * @type {Integer (UInt32)}
     */
    static FSRM_DISPID_FEATURE_GENERAL => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static FSRM_DISPID_FEATURE_QUOTA => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static FSRM_DISPID_FEATURE_FILESCREEN => 50331648

    /**
     * @type {Integer (UInt32)}
     */
    static FSRM_DISPID_FEATURE_REPORTS => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static FSRM_DISPID_FEATURE_CLASSIFICATION => 83886080

    /**
     * @type {Integer (UInt32)}
     */
    static FSRM_DISPID_FEATURE_PIPELINE => 100663296

    /**
     * @type {Integer (UInt32)}
     */
    static FsrmMaxNumberThresholds => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FsrmMinThresholdValue => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FsrmMaxThresholdValue => 250

    /**
     * @type {Integer (UInt32)}
     */
    static FsrmMinQuotaLimit => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static FsrmMaxExcludeFolders => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FsrmMaxNumberPropertyDefinitions => 100

    /**
     * @type {Integer (UInt32)}
     */
    static MessageSizeLimit => 4096

    /**
     * @type {Integer (Int32)}
     */
    static FsrmDaysNotSpecified => -1

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_S_PARTIAL_BATCH => 283396

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_S_PARTIAL_CLASSIFICATION => 283397

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_S_CLASSIFICATION_SCAN_FAILURES => 283398

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_NOT_FOUND => -2147200255

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INVALID_SCHEDULER_ARGUMENT => -2147200254

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_ALREADY_EXISTS => -2147200253

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_PATH_NOT_FOUND => -2147200252

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INVALID_USER => -2147200251

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INVALID_PATH => -2147200250

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INVALID_LIMIT => -2147200249

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INVALID_NAME => -2147200248

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_FAIL_BATCH => -2147200247

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INVALID_TEXT => -2147200246

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INVALID_IMPORT_VERSION => -2147200245

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_OUT_OF_RANGE => -2147200243

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_REQD_PARAM_MISSING => -2147200242

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INVALID_COMBINATION => -2147200241

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_DUPLICATE_NAME => -2147200240

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_NOT_SUPPORTED => -2147200239

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_DRIVER_NOT_READY => -2147200237

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INSUFFICIENT_DISK => -2147200236

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_VOLUME_UNSUPPORTED => -2147200235

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_UNEXPECTED => -2147200234

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INSECURE_PATH => -2147200233

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INVALID_SMTP_SERVER => -2147200232

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_AUTO_QUOTA => 283419

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_EMAIL_NOT_SENT => -2147200228

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INVALID_EMAIL_ADDRESS => -2147200226

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_FILE_SYSTEM_CORRUPT => -2147200225

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_LONG_CMDLINE => -2147200224

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INVALID_FILEGROUP_DEFINITION => -2147200223

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INVALID_DATASCREEN_DEFINITION => -2147200220

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INVALID_REPORT_FORMAT => -2147200216

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INVALID_REPORT_DESC => -2147200215

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INVALID_FILENAME => -2147200214

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_SHADOW_COPY => -2147200212

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_XML_CORRUPTED => -2147200211

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CLUSTER_NOT_RUNNING => -2147200210

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_STORE_NOT_INSTALLED => -2147200209

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_NOT_CLUSTER_VOLUME => -2147200208

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_DIFFERENT_CLUSTER_GROUP => -2147200207

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_REPORT_TYPE_ALREADY_EXISTS => -2147200206

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_REPORT_JOB_ALREADY_RUNNING => -2147200205

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_REPORT_GENERATION_ERR => -2147200204

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_REPORT_TASK_TRIGGER => -2147200203

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_LOADING_DISABLED_MODULE => -2147200202

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CANNOT_AGGREGATE => -2147200201

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_MESSAGE_LIMIT_EXCEEDED => -2147200200

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_OBJECT_IN_USE => -2147200199

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CANNOT_RENAME_PROPERTY => -2147200198

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CANNOT_CHANGE_PROPERTY_TYPE => -2147200197

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_MAX_PROPERTY_DEFINITIONS => -2147200196

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CLASSIFICATION_ALREADY_RUNNING => -2147200195

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CLASSIFICATION_NOT_RUNNING => -2147200194

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_FILE_MANAGEMENT_JOB_ALREADY_RUNNING => -2147200193

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_FILE_MANAGEMENT_JOB_EXPIRATION => -2147200192

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_FILE_MANAGEMENT_JOB_CUSTOM => -2147200191

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_FILE_MANAGEMENT_JOB_NOTIFICATION => -2147200190

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_FILE_OPEN_ERROR => -2147200189

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_UNSECURE_LINK_TO_HOSTED_MODULE => -2147200188

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CACHE_INVALID => -2147200187

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CACHE_MODULE_ALREADY_EXISTS => -2147200186

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_FILE_MANAGEMENT_EXPIRATION_DIR_IN_SCOPE => -2147200185

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_FILE_MANAGEMENT_JOB_ALREADY_EXISTS => -2147200184

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_PROPERTY_DELETED => -2147200183

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_LAST_ACCESS_UPDATE_DISABLED => -2147200176

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_NO_PROPERTY_VALUE => -2147200175

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INPROC_MODULE_BLOCKED => -2147200174

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_ENUM_PROPERTIES_FAILED => -2147200173

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_SET_PROPERTY_FAILED => -2147200172

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CANNOT_STORE_PROPERTIES => -2147200171

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CANNOT_ALLOW_REPARSE_POINT_TAG => -2147200170

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_PARTIAL_CLASSIFICATION_PROPERTY_NOT_FOUND => -2147200169

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_TEXTREADER_NOT_INITIALIZED => -2147200168

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_TEXTREADER_IFILTER_NOT_FOUND => -2147200167

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_PERSIST_PROPERTIES_FAILED_ENCRYPTED => -2147200166

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_TEXTREADER_IFILTER_CLSID_MALFORMED => -2147200160

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_TEXTREADER_STREAM_ERROR => -2147200159

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_TEXTREADER_FILENAME_TOO_LONG => -2147200158

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INCOMPATIBLE_FORMAT => -2147200157

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_FILE_ENCRYPTED => -2147200156

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_PERSIST_PROPERTIES_FAILED => -2147200155

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_VOLUME_OFFLINE => -2147200154

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_FILE_MANAGEMENT_ACTION_TIMEOUT => -2147200153

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_FILE_MANAGEMENT_ACTION_GET_EXITCODE_FAILED => -2147200152

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_MODULE_INVALID_PARAM => -2147200151

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_MODULE_INITIALIZATION => -2147200150

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_MODULE_SESSION_INITIALIZATION => -2147200149

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CLASSIFICATION_SCAN_FAIL => -2147200148

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_FILE_MANAGEMENT_JOB_NOT_LEGACY_ACCESSIBLE => -2147200147

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_FILE_MANAGEMENT_JOB_MAX_FILE_CONDITIONS => -2147200146

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CANNOT_USE_DEPRECATED_PROPERTY => -2147200145

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_SYNC_TASK_TIMEOUT => -2147200144

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CANNOT_USE_DELETED_PROPERTY => -2147200143

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INVALID_AD_CLAIM => -2147200142

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CLASSIFICATION_CANCELED => -2147200141

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_INVALID_FOLDER_PROPERTY_STORE => -2147200140

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_REBUILDING_FODLER_TYPE_INDEX => -2147200139

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_PROPERTY_MUST_APPLY_TO_FILES => -2147200138

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CLASSIFICATION_TIMEOUT => -2147200137

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CLASSIFICATION_PARTIAL_BATCH => -2147200136

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CANNOT_DELETE_SYSTEM_PROPERTY => -2147200135

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_FILE_IN_USE => -2147200134

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_ERROR_NOT_ENABLED => -2147200133

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CANNOT_CREATE_TEMP_COPY => -2147200132

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_NO_EMAIL_ADDRESS => -2147200131

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_ADR_MAX_EMAILS_SENT => -2147200130

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_PATH_NOT_IN_NAMESPACE => -2147200129

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_RMS_TEMPLATE_NOT_FOUND => -2147200128

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_SECURE_PROPERTIES_NOT_SUPPORTED => -2147200127

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_RMS_NO_PROTECTORS_INSTALLED => -2147200126

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_RMS_NO_PROTECTOR_INSTALLED_FOR_FILE => -2147200125

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_PROPERTY_MUST_APPLY_TO_FOLDERS => -2147200124

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_PROPERTY_MUST_BE_SECURE => -2147200123

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_PROPERTY_MUST_BE_GLOBAL => -2147200122

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_WMI_FAILURE => -2147200121

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_FILE_MANAGEMENT_JOB_RMS => -2147200120

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_SYNC_TASK_HAD_ERRORS => -2147200119

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_ADR_SRV_NOT_SUPPORTED => -2147200112

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_ADR_PATH_IS_LOCAL => -2147200111

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_ADR_NOT_DOMAIN_JOINED => -2147200110

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CANNOT_REMOVE_READONLY => -2147200109

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_FILE_MANAGEMENT_JOB_INVALID_CONTINUOUS_CONFIG => -2147200108

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_LEGACY_SCHEDULE => -2147200107

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_CSC_PATH_NOT_SUPPORTED => -2147200106

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_EXPIRATION_PATH_NOT_WRITEABLE => -2147200105

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_EXPIRATION_PATH_TOO_LONG => -2147200104

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_EXPIRATION_VOLUME_NOT_NTFS => -2147200103

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_FILE_MANAGEMENT_JOB_DEPRECATED => -2147200102

    /**
     * @type {Integer (Int32)}
     */
    static FSRM_E_MODULE_TIMEOUT => -2147200101
;@endregion Constants

;@region Methods
;@endregion Methods
}
