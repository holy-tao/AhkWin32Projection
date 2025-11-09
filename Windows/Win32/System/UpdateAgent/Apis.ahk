#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class UpdateAgent {

;@region Constants

    /**
     * @type {Guid}
     */
    static LIBID_WUApiLib => Guid("{b596cc9f-56e5-419e-a622-e01bb457431e}")

    /**
     * @type {Integer (UInt32)}
     */
    static UPDATE_LOCKDOWN_WEBSITE_ACCESS => 1

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_SERVICE_STOP => 2359297

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_SELFUPDATE => 2359298

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_UPDATE_ERROR => 2359299

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_MARKED_FOR_DISCONNECT => 2359300

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_REBOOT_REQUIRED => 2359301

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_ALREADY_INSTALLED => 2359302

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_ALREADY_UNINSTALLED => 2359303

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_ALREADY_DOWNLOADED => 2359304

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_SOME_UPDATES_SKIPPED_ON_BATTERY => 2359305

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_ALREADY_REVERTED => 2359306

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_SEARCH_CRITERIA_NOT_SUPPORTED => 2359312

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_UH_INSTALLSTILLPENDING => 2367509

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_UH_DOWNLOAD_SIZE_CALCULATED => 2367510

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_SIH_NOOP => 2379777

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_DM_ALREADYDOWNLOADING => 2383873

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_METADATA_SKIPPED_BY_ENFORCEMENTMODE => 2388225

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_METADATA_IGNORED_SIGNATURE_VERIFICATION => 2388226

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_SEARCH_LOAD_SHEDDING => 2392065

    /**
     * @type {Integer (Int32)}
     */
    static WU_S_AAD_DEVICE_TICKET_NOT_NEEDED => 2392066

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_NO_SERVICE => -2145124351

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_MAX_CAPACITY_REACHED => -2145124350

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UNKNOWN_ID => -2145124349

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_NOT_INITIALIZED => -2145124348

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_RANGEOVERLAP => -2145124347

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_TOOMANYRANGES => -2145124346

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVALIDINDEX => -2145124345

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_ITEMNOTFOUND => -2145124344

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_OPERATIONINPROGRESS => -2145124343

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_COULDNOTCANCEL => -2145124342

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_CALL_CANCELLED => -2145124341

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_NOOP => -2145124340

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_XML_MISSINGDATA => -2145124339

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_XML_INVALID => -2145124338

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_CYCLE_DETECTED => -2145124337

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_TOO_DEEP_RELATION => -2145124336

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVALID_RELATIONSHIP => -2145124335

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REG_VALUE_INVALID => -2145124334

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DUPLICATE_ITEM => -2145124333

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVALID_INSTALL_REQUESTED => -2145124332

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INSTALL_NOT_ALLOWED => -2145124330

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_NOT_APPLICABLE => -2145124329

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_NO_USERTOKEN => -2145124328

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_EXCLUSIVE_INSTALL_CONFLICT => -2145124327

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_POLICY_NOT_SET => -2145124326

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SELFUPDATE_IN_PROGRESS => -2145124325

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVALID_UPDATE => -2145124323

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SERVICE_STOP => -2145124322

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_NO_CONNECTION => -2145124321

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_NO_INTERACTIVE_USER => -2145124320

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_TIME_OUT => -2145124319

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_ALL_UPDATES_FAILED => -2145124318

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_EULAS_DECLINED => -2145124317

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_NO_UPDATE => -2145124316

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_USER_ACCESS_DISABLED => -2145124315

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVALID_UPDATE_TYPE => -2145124314

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_URL_TOO_LONG => -2145124313

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UNINSTALL_NOT_ALLOWED => -2145124312

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVALID_PRODUCT_LICENSE => -2145124311

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_MISSING_HANDLER => -2145124310

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_LEGACYSERVER => -2145124309

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_BIN_SOURCE_ABSENT => -2145124308

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SOURCE_ABSENT => -2145124307

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_WU_DISABLED => -2145124306

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_CALL_CANCELLED_BY_POLICY => -2145124305

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVALID_PROXY_SERVER => -2145124304

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVALID_FILE => -2145124303

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVALID_CRITERIA => -2145124302

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_EULA_UNAVAILABLE => -2145124301

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DOWNLOAD_FAILED => -2145124300

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UPDATE_NOT_PROCESSED => -2145124299

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVALID_OPERATION => -2145124298

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_NOT_SUPPORTED => -2145124297

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_WINHTTP_INVALID_FILE => -2145124296

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_TOO_MANY_RESYNC => -2145124295

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_NO_SERVER_CORE_SUPPORT => -2145124288

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SYSPREP_IN_PROGRESS => -2145124287

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UNKNOWN_SERVICE => -2145124286

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_NO_UI_SUPPORT => -2145124285

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PER_MACHINE_UPDATE_ACCESS_DENIED => -2145124284

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UNSUPPORTED_SEARCHSCOPE => -2145124283

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_BAD_FILE_URL => -2145124282

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REVERT_NOT_ALLOWED => -2145124281

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVALID_NOTIFICATION_INFO => -2145124280

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_OUTOFRANGE => -2145124279

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_IN_PROGRESS => -2145124278

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_ORPHANED_DOWNLOAD_JOB => -2145124277

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_LOW_BATTERY => -2145124276

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INFRASTRUCTUREFILE_INVALID_FORMAT => -2145124275

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INFRASTRUCTUREFILE_REQUIRES_SSL => -2145124274

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_IDLESHUTDOWN_OPCOUNT_DISCOVERY => -2145124273

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_IDLESHUTDOWN_OPCOUNT_SEARCH => -2145124272

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_IDLESHUTDOWN_OPCOUNT_DOWNLOAD => -2145124271

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_IDLESHUTDOWN_OPCOUNT_INSTALL => -2145124270

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_IDLESHUTDOWN_OPCOUNT_OTHER => -2145124269

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INTERACTIVE_CALL_CANCELLED => -2145124268

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_AU_CALL_CANCELLED => -2145124267

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SYSTEM_UNSUPPORTED => -2145124266

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_NO_SUCH_HANDLER_PLUGIN => -2145124265

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVALID_SERIALIZATION_VERSION => -2145124264

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_NETWORK_COST_EXCEEDS_POLICY => -2145124263

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_CALL_CANCELLED_BY_HIDE => -2145124262

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_CALL_CANCELLED_BY_INVALID => -2145124261

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVALID_VOLUMEID => -2145124260

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UNRECOGNIZED_VOLUMEID => -2145124259

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_EXTENDEDERROR_NOTSET => -2145124258

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_EXTENDEDERROR_FAILED => -2145124257

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_IDLESHUTDOWN_OPCOUNT_SERVICEREGISTRATION => -2145124256

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_FILETRUST_SHA2SIGNATURE_MISSING => -2145124255

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UPDATE_NOT_APPROVED => -2145124254

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_CALL_CANCELLED_BY_INTERACTIVE_SEARCH => -2145124253

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INSTALL_JOB_RESUME_NOT_ALLOWED => -2145124252

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INSTALL_JOB_NOT_SUSPENDED => -2145124251

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INSTALL_USERCONTEXT_ACCESSDENIED => -2145124250

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_STANDBY_ACTIVITY_NOT_ALLOWED => -2145124249

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_COULD_NOT_EVALUATE_PROPERTY => -2145124248

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SERVICE_UNEXPECTED_EXIT => -2145124247

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_ACCESS_DENIED_CALLER_IDENTITY => -2145124246

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SERVICE_REENABLE_ACCESS_DENIED => -2145124245

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UNEXPECTED => -2145120257

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_MSI_WRONG_VERSION => -2145120255

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_MSI_NOT_CONFIGURED => -2145120254

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_MSP_DISABLED => -2145120253

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_MSI_WRONG_APP_CONTEXT => -2145120252

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_MSI_NOT_PRESENT => -2145120251

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_MSP_UNEXPECTED => -2145116161

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SOAPCLIENT_BASE => -2145107968

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SOAPCLIENT_INITIALIZE => -2145107967

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SOAPCLIENT_OUTOFMEMORY => -2145107966

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SOAPCLIENT_GENERATE => -2145107965

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SOAPCLIENT_CONNECT => -2145107964

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SOAPCLIENT_SEND => -2145107963

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SOAPCLIENT_SERVER => -2145107962

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SOAPCLIENT_SOAPFAULT => -2145107961

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SOAPCLIENT_PARSEFAULT => -2145107960

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SOAPCLIENT_READ => -2145107959

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SOAPCLIENT_PARSE => -2145107958

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SOAP_VERSION => -2145107957

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SOAP_MUST_UNDERSTAND => -2145107956

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SOAP_CLIENT => -2145107955

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SOAP_SERVER => -2145107954

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_WMI_ERROR => -2145107953

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_EXCEEDED_MAX_SERVER_TRIPS => -2145107952

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SUS_SERVER_NOT_SET => -2145107951

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_DOUBLE_INITIALIZATION => -2145107950

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_INVALID_COMPUTER_NAME => -2145107949

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_REFRESH_CACHE_REQUIRED => -2145107947

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_HTTP_STATUS_BAD_REQUEST => -2145107946

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_HTTP_STATUS_DENIED => -2145107945

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_HTTP_STATUS_FORBIDDEN => -2145107944

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_HTTP_STATUS_NOT_FOUND => -2145107943

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_HTTP_STATUS_BAD_METHOD => -2145107942

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_HTTP_STATUS_PROXY_AUTH_REQ => -2145107941

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_HTTP_STATUS_REQUEST_TIMEOUT => -2145107940

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_HTTP_STATUS_CONFLICT => -2145107939

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_HTTP_STATUS_GONE => -2145107938

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_HTTP_STATUS_SERVER_ERROR => -2145107937

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_HTTP_STATUS_NOT_SUPPORTED => -2145107936

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_HTTP_STATUS_BAD_GATEWAY => -2145107935

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_HTTP_STATUS_SERVICE_UNAVAIL => -2145107934

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_HTTP_STATUS_GATEWAY_TIMEOUT => -2145107933

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_HTTP_STATUS_VERSION_NOT_SUP => -2145107932

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_FILE_LOCATIONS_CHANGED => -2145107931

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_REGISTRATION_NOT_SUPPORTED => -2145107930

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_NO_AUTH_PLUGINS_REQUESTED => -2145107929

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_NO_AUTH_COOKIES_CREATED => -2145107928

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_INVALID_CONFIG_PROP => -2145107927

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_CONFIG_PROP_MISSING => -2145107926

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_HTTP_STATUS_NOT_MAPPED => -2145107925

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_WINHTTP_NAME_NOT_RESOLVED => -2145107924

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_LOAD_SHEDDING => -2145107923

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_CLIENT_ENFORCED_LOAD_SHEDDING => -2145107922

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SAME_REDIR_ID => -2145103827

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_NO_MANAGED_RECOVER => -2145103826

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_ECP_SUCCEEDED_WITH_ERRORS => -2145107921

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_ECP_INIT_FAILED => -2145107920

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_ECP_INVALID_FILE_FORMAT => -2145107919

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_ECP_INVALID_METADATA => -2145107918

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_ECP_FAILURE_TO_EXTRACT_DIGEST => -2145107917

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_ECP_FAILURE_TO_DECOMPRESS_CAB_FILE => -2145107916

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_ECP_FILE_LOCATION_ERROR => -2145107915

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_CATALOG_SYNC_REQUIRED => -2145123274

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SECURITY_VERIFICATION_FAILURE => -2145123273

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_ENDPOINT_UNREACHABLE => -2145123272

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_INVALID_FORMAT => -2145123271

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_INVALID_URL => -2145123270

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_NWS_NOT_LOADED => -2145123269

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_PROXY_AUTH_SCHEME_NOT_SUPPORTED => -2145123268

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SERVICEPROP_NOTAVAIL => -2145123267

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_ENDPOINT_REFRESH_REQUIRED => -2145123266

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_ENDPOINTURL_NOTAVAIL => -2145123265

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_ENDPOINT_DISCONNECTED => -2145123264

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_INVALID_OPERATION => -2145123263

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_OBJECT_FAULTED => -2145123262

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_NUMERIC_OVERFLOW => -2145123261

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_OPERATION_ABORTED => -2145123260

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_OPERATION_ABANDONED => -2145123259

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_QUOTA_EXCEEDED => -2145123258

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_NO_TRANSLATION_AVAILABLE => -2145123257

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_ADDRESS_IN_USE => -2145123256

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_ADDRESS_NOT_AVAILABLE => -2145123255

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_OTHER => -2145123254

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_SECURITY_SYSTEM_FAILURE => -2145123253

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_DATA_BOUNDARY_RESTRICTED => -2145107712

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_GENERAL_AAD_CLIENT_ERROR => -2145107711

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_PT_UNEXPECTED => -2145103873

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REDIRECTOR_LOAD_XML => -2145103871

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REDIRECTOR_S_FALSE => -2145103870

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REDIRECTOR_ID_SMALLER => -2145103869

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REDIRECTOR_UNKNOWN_SERVICE => -2145103868

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REDIRECTOR_UNSUPPORTED_CONTENTTYPE => -2145103867

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REDIRECTOR_INVALID_RESPONSE => -2145103866

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REDIRECTOR_ATTRPROVIDER_EXCEEDED_MAX_NAMEVALUE => -2145103864

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REDIRECTOR_ATTRPROVIDER_INVALID_NAME => -2145103863

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REDIRECTOR_ATTRPROVIDER_INVALID_VALUE => -2145103862

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REDIRECTOR_SLS_GENERIC_ERROR => -2145103861

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REDIRECTOR_CONNECT_POLICY => -2145103860

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REDIRECTOR_ONLINE_DISALLOWED => -2145103859

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REDIRECTOR_UNEXPECTED => -2145103617

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_VERIFY_DOWNLOAD_ENGINE => -2145103615

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_VERIFY_DOWNLOAD_PAYLOAD => -2145103614

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_VERIFY_STAGE_ENGINE => -2145103613

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_VERIFY_STAGE_PAYLOAD => -2145103612

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_ACTION_NOT_FOUND => -2145103611

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_SLS_PARSE => -2145103610

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_INVALIDHASH => -2145103609

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_NO_ENGINE => -2145103608

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_POST_REBOOT_INSTALL_FAILED => -2145103607

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_POST_REBOOT_NO_CACHED_SLS_RESPONSE => -2145103606

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_PARSE => -2145103605

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_SECURITY => -2145103604

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_PPL => -2145103603

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_POLICY => -2145103602

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_STDEXCEPTION => -2145103601

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_NONSTDEXCEPTION => -2145103600

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_ENGINE_EXCEPTION => -2145103599

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_BLOCKED_FOR_PLATFORM => -2145103598

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_ANOTHER_INSTANCE_RUNNING => -2145103597

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_DNSRESILIENCY_OFF => -2145103596

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SIH_UNEXPECTED => -2145103361

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DRV_PRUNED => -2145075199

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DRV_NOPROP_OR_LEGACY => -2145075198

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DRV_REG_MISMATCH => -2145075197

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DRV_NO_METADATA => -2145075196

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DRV_MISSING_ATTRIBUTE => -2145075195

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DRV_SYNC_FAILED => -2145075194

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DRV_NO_PRINTER_CONTENT => -2145075193

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DRV_DEVICE_PROBLEM => -2145075192

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DRV_UNEXPECTED => -2145071105

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_SHUTDOWN => -2145091584

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_INUSE => -2145091583

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_INVALID => -2145091582

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_TABLEMISSING => -2145091581

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_TABLEINCORRECT => -2145091580

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_INVALIDTABLENAME => -2145091579

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_BADVERSION => -2145091578

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_NODATA => -2145091577

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_MISSINGDATA => -2145091576

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_MISSINGREF => -2145091575

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_UNKNOWNHANDLER => -2145091574

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_CANTDELETE => -2145091573

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_LOCKTIMEOUTEXPIRED => -2145091572

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_NOCATEGORIES => -2145091571

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_ROWEXISTS => -2145091570

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_STOREFILELOCKED => -2145091569

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_CANNOTREGISTER => -2145091568

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_UNABLETOSTART => -2145091567

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_DUPLICATEUPDATEID => -2145091565

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_UNKNOWNSERVICE => -2145091564

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_SERVICEEXPIRED => -2145091563

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_DECLINENOTALLOWED => -2145091562

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_TABLESESSIONMISMATCH => -2145091561

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_SESSIONLOCKMISMATCH => -2145091560

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_NEEDWINDOWSSERVICE => -2145091559

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_INVALIDOPERATION => -2145091558

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_SCHEMAMISMATCH => -2145091557

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_RESETREQUIRED => -2145091556

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_IMPERSONATED => -2145091555

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_DATANOTAVAILABLE => -2145091554

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_DATANOTLOADED => -2145091553

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_NODATA_NOSUCHREVISION => -2145091552

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_NODATA_NOSUCHUPDATE => -2145091551

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_NODATA_EULA => -2145091550

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_NODATA_SERVICE => -2145091549

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_NODATA_COOKIE => -2145091548

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_NODATA_TIMER => -2145091547

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_NODATA_CCR => -2145091546

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_NODATA_FILE => -2145091545

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_NODATA_DOWNLOADJOB => -2145091544

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_NODATA_TMI => -2145091543

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DS_UNEXPECTED => -2145087489

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVENTORY_PARSEFAILED => -2145087487

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVENTORY_GET_INVENTORY_TYPE_FAILED => -2145087486

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVENTORY_RESULT_UPLOAD_FAILED => -2145087485

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVENTORY_UNEXPECTED => -2145087484

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVENTORY_WMI_ERROR => -2145087483

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_AU_NOSERVICE => -2145083392

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_AU_NONLEGACYSERVER => -2145083390

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_AU_LEGACYCLIENTDISABLED => -2145083389

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_AU_PAUSED => -2145083388

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_AU_NO_REGISTERED_SERVICE => -2145083387

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_AU_DETECT_SVCID_MISMATCH => -2145083386

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REBOOT_IN_PROGRESS => -2145083385

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_AU_OOBE_IN_PROGRESS => -2145083384

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_AU_UNEXPECTED => -2145079297

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_REMOTEUNAVAILABLE => -2145116160

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_LOCALONLY => -2145116159

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_UNKNOWNHANDLER => -2145116158

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_REMOTEALREADYACTIVE => -2145116157

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_DOESNOTSUPPORTACTION => -2145116156

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_WRONGHANDLER => -2145116155

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_INVALIDMETADATA => -2145116154

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_INSTALLERHUNG => -2145116153

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_OPERATIONCANCELLED => -2145116152

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_BADHANDLERXML => -2145116151

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_CANREQUIREINPUT => -2145116150

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_INSTALLERFAILURE => -2145116149

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_FALLBACKTOSELFCONTAINED => -2145116148

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_NEEDANOTHERDOWNLOAD => -2145116147

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_NOTIFYFAILURE => -2145116146

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_INCONSISTENT_FILE_NAMES => -2145116145

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_FALLBACKERROR => -2145116144

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_TOOMANYDOWNLOADREQUESTS => -2145116143

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_UNEXPECTEDCBSRESPONSE => -2145116142

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_BADCBSPACKAGEID => -2145116141

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_POSTREBOOTSTILLPENDING => -2145116140

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_POSTREBOOTRESULTUNKNOWN => -2145116139

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_POSTREBOOTUNEXPECTEDSTATE => -2145116138

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_NEW_SERVICING_STACK_REQUIRED => -2145116137

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_CALLED_BACK_FAILURE => -2145116136

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_CUSTOMINSTALLER_INVALID_SIGNATURE => -2145116135

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_UNSUPPORTED_INSTALLCONTEXT => -2145116134

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_INVALID_TARGETSESSION => -2145116133

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_DECRYPTFAILURE => -2145116132

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_HANDLER_DISABLEDUNTILREBOOT => -2145116131

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_APPX_NOT_PRESENT => -2145116130

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_NOTREADYTOCOMMIT => -2145116129

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_APPX_INVALID_PACKAGE_VOLUME => -2145116128

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_APPX_DEFAULT_PACKAGE_VOLUME_UNAVAILABLE => -2145116127

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_APPX_INSTALLED_PACKAGE_VOLUME_UNAVAILABLE => -2145116126

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_APPX_PACKAGE_FAMILY_NOT_FOUND => -2145116125

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_APPX_SYSTEM_VOLUME_NOT_FOUND => -2145116124

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_UA_SESSION_INFO_VERSION_NOT_SUPPORTED => -2145116123

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_RESERVICING_REQUIRED_BASELINE => -2145116122

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UH_UNEXPECTED => -2145112065

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_URLNOTAVAILABLE => -2145099775

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_INCORRECTFILEHASH => -2145099774

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_UNKNOWNALGORITHM => -2145099773

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_NEEDDOWNLOADREQUEST => -2145099772

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_NONETWORK => -2145099771

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_WRONGBITSVERSION => -2145099770

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_NOTDOWNLOADED => -2145099769

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_FAILTOCONNECTTOBITS => -2145099768

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_BITSTRANSFERERROR => -2145099767

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_DOWNLOADLOCATIONCHANGED => -2145099766

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_CONTENTCHANGED => -2145099765

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_DOWNLOADLIMITEDBYUPDATESIZE => -2145099764

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_UNAUTHORIZED => -2145099762

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_BG_ERROR_TOKEN_REQUIRED => -2145099761

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_DOWNLOADSANDBOXNOTFOUND => -2145099760

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_DOWNLOADFILEPATHUNKNOWN => -2145099759

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_DOWNLOADFILEMISSING => -2145099758

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_UPDATEREMOVED => -2145099757

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_READRANGEFAILED => -2145099756

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_UNAUTHORIZED_NO_USER => -2145099754

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_UNAUTHORIZED_LOCAL_USER => -2145099753

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_UNAUTHORIZED_DOMAIN_USER => -2145099752

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_UNAUTHORIZED_MSA_USER => -2145099751

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_FALLINGBACKTOBITS => -2145099750

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_DOWNLOAD_VOLUME_CONFLICT => -2145099749

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_SANDBOX_HASH_MISMATCH => -2145099748

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_HARDRESERVEID_CONFLICT => -2145099747

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_DOSVC_REQUIRED => -2145099746

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_DOWNLOADTYPE_CONFLICT => -2145099745

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_DM_UNEXPECTED => -2145095681

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_INVALID_INFDATA => -2145071103

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_INVALID_IDENTDATA => -2145071102

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_ALREADY_INITIALIZED => -2145071101

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_NOT_INITIALIZED => -2145071100

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_SOURCE_VERSION_MISMATCH => -2145071099

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_TARGET_VERSION_GREATER => -2145071098

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_REGISTRATION_FAILED => -2145071097

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SELFUPDATE_SKIP_ON_FAILURE => -2145071096

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_SKIP_UPDATE => -2145071095

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_UNSUPPORTED_CONFIGURATION => -2145071094

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_BLOCKED_CONFIGURATION => -2145071093

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_REBOOT_TO_FIX => -2145071092

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_ALREADYRUNNING => -2145071091

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_REBOOTREQUIRED => -2145071090

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_HANDLER_EXEC_FAILURE => -2145071089

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_INVALID_REGISTRY_DATA => -2145071088

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SELFUPDATE_REQUIRED => -2145071087

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SELFUPDATE_REQUIRED_ADMIN => -2145071086

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_WRONG_SERVER_VERSION => -2145071085

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_DEFERRABLE_REBOOT_PENDING => -2145071084

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_NON_DEFERRABLE_REBOOT_PENDING => -2145071083

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_FAIL => -2145071082

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SETUP_UNEXPECTED => -2145067009

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_EE_UNKNOWN_EXPRESSION => -2145067007

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_EE_INVALID_EXPRESSION => -2145067006

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_EE_MISSING_METADATA => -2145067005

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_EE_INVALID_VERSION => -2145067004

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_EE_NOT_INITIALIZED => -2145067003

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_EE_INVALID_ATTRIBUTEDATA => -2145067002

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_EE_CLUSTER_ERROR => -2145067001

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_EE_UNEXPECTED => -2145062913

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INSTALLATION_RESULTS_UNKNOWN_VERSION => -2145112063

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INSTALLATION_RESULTS_INVALID_DATA => -2145112062

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INSTALLATION_RESULTS_NOT_FOUND => -2145112061

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_TRAYICON_FAILURE => -2145112060

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_NON_UI_MODE => -2145107971

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_WUCLTUI_UNSUPPORTED_VERSION => -2145107970

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_AUCLIENT_UNEXPECTED => -2145107969

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REPORTER_EVENTCACHECORRUPT => -2145062911

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REPORTER_EVENTNAMESPACEPARSEFAILED => -2145062910

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVALID_EVENT => -2145062909

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SERVER_BUSY => -2145062908

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_CALLBACK_COOKIE_NOT_FOUND => -2145062907

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_REPORTER_UNEXPECTED => -2145058817

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_OL_INVALID_SCANFILE => -2145095679

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_OL_NEWCLIENT_REQUIRED => -2145095678

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVALID_EVENT_PAYLOAD => -2145095677

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_INVALID_EVENT_PAYLOADSIZE => -2145095676

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SERVICE_NOT_REGISTERED => -2145095675

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_OL_UNEXPECTED => -2145091585

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_NOOP => -2145095424

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_CONFIG_INVALID_BINARY_ENCODING => -2145095423

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_FETCH_CONFIG => -2145095422

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_INVALID_PARAMETER => -2145095420

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_UNEXPECTED => -2145095419

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_NO_VERIFICATION_DATA => -2145095418

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_BAD_FRAGMENTSIGNING_CONFIG => -2145095417

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_FAILURE_PROCESSING_FRAGMENTSIGNING_CONFIG => -2145095416

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_XML_MISSING => -2145095392

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_XML_FRAGMENTSIGNING_MISSING => -2145095391

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_XML_MODE_MISSING => -2145095390

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_XML_MODE_INVALID => -2145095389

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_XML_VALIDITY_INVALID => -2145095388

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_XML_LEAFCERT_MISSING => -2145095387

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_XML_INTERMEDIATECERT_MISSING => -2145095386

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_XML_LEAFCERT_ID_MISSING => -2145095385

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_XML_BASE64CERDATA_MISSING => -2145095384

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_BAD_SIGNATURE => -2145095360

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_UNSUPPORTED_HASH_ALG => -2145095359

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_SIGNATURE_VERIFY_FAILED => -2145095358

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATATRUST_CERTIFICATECHAIN_VERIFICATION => -2145095344

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATATRUST_UNTRUSTED_CERTIFICATECHAIN => -2145095343

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_TIMESTAMP_TOKEN_MISSING => -2145095328

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_TIMESTAMP_TOKEN_VERIFICATION_FAILED => -2145095327

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_TIMESTAMP_TOKEN_UNTRUSTED => -2145095326

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_TIMESTAMP_TOKEN_VALIDITY_WINDOW => -2145095325

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_TIMESTAMP_TOKEN_SIGNATURE => -2145095324

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_TIMESTAMP_TOKEN_CERTCHAIN => -2145095323

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_TIMESTAMP_TOKEN_REFRESHONLINE => -2145095322

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_TIMESTAMP_TOKEN_ALL_BAD => -2145095321

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_TIMESTAMP_TOKEN_NODATA => -2145095320

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_TIMESTAMP_TOKEN_CACHELOOKUP => -2145095319

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_TIMESTAMP_TOKEN_VALIDITYWINDOW_UNEXPECTED => -2145095298

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_TIMESTAMP_TOKEN_UNEXPECTED => -2145095297

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_CERT_MISSING => -2145095296

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_LEAFCERT_BAD_TRANSPORT_ENCODING => -2145095295

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_INTCERT_BAD_TRANSPORT_ENCODING => -2145095294

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_METADATA_CERT_UNTRUSTED => -2145095293

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_WUTASK_INPROGRESS => -2145079295

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_WUTASK_STATUS_DISABLED => -2145079294

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_WUTASK_NOT_STARTED => -2145079293

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_WUTASK_RETRY => -2145079292

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_WUTASK_CANCELINSTALL_DISALLOWED => -2145079291

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UNKNOWN_HARDWARECAPABILITY => -2145079039

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_BAD_XML_HARDWARECAPABILITY => -2145079038

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_WMI_NOT_SUPPORTED => -2145079037

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_UPDATE_MERGE_NOT_ALLOWED => -2145079036

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SKIPPED_UPDATE_INSTALLATION => -2145079035

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_SLS_INVALID_REVISION => -2145078783

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_FILETRUST_DUALSIGNATURE_RSA => -2145078527

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_FILETRUST_DUALSIGNATURE_ECC => -2145078526

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_TRUST_SUBJECT_NOT_TRUSTED => -2145078525

    /**
     * @type {Integer (Int32)}
     */
    static WU_E_TRUST_PROVIDER_UNKNOWN => -2145078524

    /**
     * @type {String}
     */
    static c_szUpdatePropertyName_ContainsUpdateBootstrapper => "ContainsUpdateBootstrapper"

    /**
     * @type {String}
     */
    static c_szUpdatePropertyName_DoesUpdateRequireReboot => "DoesUpdateRequireReboot"
;@endregion Constants

;@region Methods
;@endregion Methods
}
