#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains error and status codes returned by methods in the WMI API.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbemstatus
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEMSTATUS{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_NO_ERROR => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_S_NO_ERROR => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_S_SAME => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_S_FALSE => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_S_ALREADY_EXISTS => 262145

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_S_RESET_TO_DEFAULT => 262146

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_S_DIFFERENT => 262147

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_S_TIMEDOUT => 262148

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_S_NO_MORE_DATA => 262149

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_S_OPERATION_CANCELLED => 262150

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_S_PENDING => 262151

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_S_DUPLICATE_OBJECTS => 262152

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_S_ACCESS_DENIED => 262153

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_S_PARTIAL_RESULTS => 262160

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_S_SOURCE_NOT_AVAILABLE => 262167

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_FAILED => -2147217407

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_NOT_FOUND => -2147217406

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_ACCESS_DENIED => -2147217405

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_PROVIDER_FAILURE => -2147217404

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_TYPE_MISMATCH => -2147217403

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_OUT_OF_MEMORY => -2147217402

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_CONTEXT => -2147217401

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_PARAMETER => -2147217400

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_NOT_AVAILABLE => -2147217399

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_CRITICAL_ERROR => -2147217398

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_STREAM => -2147217397

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_NOT_SUPPORTED => -2147217396

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_SUPERCLASS => -2147217395

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_NAMESPACE => -2147217394

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_OBJECT => -2147217393

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_CLASS => -2147217392

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_PROVIDER_NOT_FOUND => -2147217391

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_PROVIDER_REGISTRATION => -2147217390

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_PROVIDER_LOAD_FAILURE => -2147217389

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INITIALIZATION_FAILURE => -2147217388

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_TRANSPORT_FAILURE => -2147217387

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_OPERATION => -2147217386

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_QUERY => -2147217385

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_QUERY_TYPE => -2147217384

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_ALREADY_EXISTS => -2147217383

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_OVERRIDE_NOT_ALLOWED => -2147217382

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_PROPAGATED_QUALIFIER => -2147217381

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_PROPAGATED_PROPERTY => -2147217380

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_UNEXPECTED => -2147217379

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_ILLEGAL_OPERATION => -2147217378

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_CANNOT_BE_KEY => -2147217377

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INCOMPLETE_CLASS => -2147217376

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_SYNTAX => -2147217375

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_NONDECORATED_OBJECT => -2147217374

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_READ_ONLY => -2147217373

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_PROVIDER_NOT_CAPABLE => -2147217372

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_CLASS_HAS_CHILDREN => -2147217371

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_CLASS_HAS_INSTANCES => -2147217370

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_QUERY_NOT_IMPLEMENTED => -2147217369

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_ILLEGAL_NULL => -2147217368

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_QUALIFIER_TYPE => -2147217367

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_PROPERTY_TYPE => -2147217366

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_VALUE_OUT_OF_RANGE => -2147217365

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_CANNOT_BE_SINGLETON => -2147217364

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_CIM_TYPE => -2147217363

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_METHOD => -2147217362

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_METHOD_PARAMETERS => -2147217361

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_SYSTEM_PROPERTY => -2147217360

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_PROPERTY => -2147217359

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_CALL_CANCELLED => -2147217358

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_SHUTTING_DOWN => -2147217357

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_PROPAGATED_METHOD => -2147217356

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_UNSUPPORTED_PARAMETER => -2147217355

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_MISSING_PARAMETER_ID => -2147217354

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_PARAMETER_ID => -2147217353

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_NONCONSECUTIVE_PARAMETER_IDS => -2147217352

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_PARAMETER_ID_ON_RETVAL => -2147217351

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_OBJECT_PATH => -2147217350

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_OUT_OF_DISK_SPACE => -2147217349

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_BUFFER_TOO_SMALL => -2147217348

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_UNSUPPORTED_PUT_EXTENSION => -2147217347

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_UNKNOWN_OBJECT_TYPE => -2147217346

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_UNKNOWN_PACKET_TYPE => -2147217345

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_MARSHAL_VERSION_MISMATCH => -2147217344

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_MARSHAL_INVALID_SIGNATURE => -2147217343

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_QUALIFIER => -2147217342

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_DUPLICATE_PARAMETER => -2147217341

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_TOO_MUCH_DATA => -2147217340

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_SERVER_TOO_BUSY => -2147217339

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_FLAVOR => -2147217338

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_CIRCULAR_REFERENCE => -2147217337

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_UNSUPPORTED_CLASS_UPDATE => -2147217336

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_CANNOT_CHANGE_KEY_INHERITANCE => -2147217335

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_CANNOT_CHANGE_INDEX_INHERITANCE => -2147217328

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_TOO_MANY_PROPERTIES => -2147217327

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_UPDATE_TYPE_MISMATCH => -2147217326

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_UPDATE_OVERRIDE_NOT_ALLOWED => -2147217325

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_UPDATE_PROPAGATED_METHOD => -2147217324

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_METHOD_NOT_IMPLEMENTED => -2147217323

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_METHOD_DISABLED => -2147217322

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_REFRESHER_BUSY => -2147217321

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_UNPARSABLE_QUERY => -2147217320

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_NOT_EVENT_CLASS => -2147217319

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_MISSING_GROUP_WITHIN => -2147217318

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_MISSING_AGGREGATION_LIST => -2147217317

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_PROPERTY_NOT_AN_OBJECT => -2147217316

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_AGGREGATING_BY_OBJECT => -2147217315

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_UNINTERPRETABLE_PROVIDER_QUERY => -2147217313

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_BACKUP_RESTORE_WINMGMT_RUNNING => -2147217312

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_QUEUE_OVERFLOW => -2147217311

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_PRIVILEGE_NOT_HELD => -2147217310

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_OPERATOR => -2147217309

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_LOCAL_CREDENTIALS => -2147217308

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_CANNOT_BE_ABSTRACT => -2147217307

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_AMENDED_OBJECT => -2147217306

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_CLIENT_TOO_SLOW => -2147217305

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_NULL_SECURITY_DESCRIPTOR => -2147217304

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_TIMED_OUT => -2147217303

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_ASSOCIATION => -2147217302

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_AMBIGUOUS_OPERATION => -2147217301

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_QUOTA_VIOLATION => -2147217300

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_RESERVED_001 => -2147217299

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_RESERVED_002 => -2147217298

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_UNSUPPORTED_LOCALE => -2147217297

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_HANDLE_OUT_OF_DATE => -2147217296

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_CONNECTION_FAILED => -2147217295

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_HANDLE_REQUEST => -2147217294

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_PROPERTY_NAME_TOO_WIDE => -2147217293

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_CLASS_NAME_TOO_WIDE => -2147217292

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_METHOD_NAME_TOO_WIDE => -2147217291

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_QUALIFIER_NAME_TOO_WIDE => -2147217290

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_RERUN_COMMAND => -2147217289

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_DATABASE_VER_MISMATCH => -2147217288

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_VETO_DELETE => -2147217287

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_VETO_PUT => -2147217286

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_INVALID_LOCALE => -2147217280

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_PROVIDER_SUSPENDED => -2147217279

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_SYNCHRONIZATION_REQUIRED => -2147217278

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_NO_SCHEMA => -2147217277

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_PROVIDER_ALREADY_REGISTERED => -2147217276

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_PROVIDER_NOT_REGISTERED => -2147217275

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_FATAL_TRANSPORT_ERROR => -2147217274

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_ENCRYPTED_CONNECTION_REQUIRED => -2147217273

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_PROVIDER_TIMED_OUT => -2147217272

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_NO_KEY => -2147217271

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_E_PROVIDER_DISABLED => -2147217270

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMESS_E_REGISTRATION_TOO_BROAD => -2147213311

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMESS_E_REGISTRATION_TOO_PRECISE => -2147213310

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMESS_E_AUTHZ_NOT_PRIVILEGED => -2147213309

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_EXPECTED_QUALIFIER_NAME => -2147205119

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_EXPECTED_SEMI => -2147205118

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_EXPECTED_OPEN_BRACE => -2147205117

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_EXPECTED_CLOSE_BRACE => -2147205116

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_EXPECTED_CLOSE_BRACKET => -2147205115

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_EXPECTED_CLOSE_PAREN => -2147205114

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_ILLEGAL_CONSTANT_VALUE => -2147205113

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_EXPECTED_TYPE_IDENTIFIER => -2147205112

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_EXPECTED_OPEN_PAREN => -2147205111

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_UNRECOGNIZED_TOKEN => -2147205110

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_UNRECOGNIZED_TYPE => -2147205109

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_EXPECTED_PROPERTY_NAME => -2147205108

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_TYPEDEF_NOT_SUPPORTED => -2147205107

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_UNEXPECTED_ALIAS => -2147205106

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_UNEXPECTED_ARRAY_INIT => -2147205105

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_INVALID_AMENDMENT_SYNTAX => -2147205104

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_INVALID_DUPLICATE_AMENDMENT => -2147205103

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_INVALID_PRAGMA => -2147205102

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_INVALID_NAMESPACE_SYNTAX => -2147205101

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_EXPECTED_CLASS_NAME => -2147205100

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_TYPE_MISMATCH => -2147205099

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_EXPECTED_ALIAS_NAME => -2147205098

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_INVALID_CLASS_DECLARATION => -2147205097

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_INVALID_INSTANCE_DECLARATION => -2147205096

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_EXPECTED_DOLLAR => -2147205095

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_CIMTYPE_QUALIFIER => -2147205094

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_DUPLICATE_PROPERTY => -2147205093

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_INVALID_NAMESPACE_SPECIFICATION => -2147205092

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_OUT_OF_RANGE => -2147205091

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_INVALID_FILE => -2147205090

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_ALIASES_IN_EMBEDDED => -2147205089

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_NULL_ARRAY_ELEM => -2147205088

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_DUPLICATE_QUALIFIER => -2147205087

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_EXPECTED_FLAVOR_TYPE => -2147205086

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_INCOMPATIBLE_FLAVOR_TYPES => -2147205085

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_MULTIPLE_ALIASES => -2147205084

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_INCOMPATIBLE_FLAVOR_TYPES2 => -2147205083

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_NO_ARRAYS_RETURNED => -2147205082

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_MUST_BE_IN_OR_OUT => -2147205081

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_INVALID_FLAGS_SYNTAX => -2147205080

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_EXPECTED_BRACE_OR_BAD_TYPE => -2147205079

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_UNSUPPORTED_CIMV22_QUAL_VALUE => -2147205078

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_UNSUPPORTED_CIMV22_DATA_TYPE => -2147205077

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_INVALID_DELETEINSTANCE_SYNTAX => -2147205076

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_INVALID_QUALIFIER_SYNTAX => -2147205075

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_QUALIFIER_USED_OUTSIDE_SCOPE => -2147205074

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_ERROR_CREATING_TEMP_FILE => -2147205073

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_ERROR_INVALID_INCLUDE_FILE => -2147205072

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEMMOF_E_INVALID_DELETECLASS_SYNTAX => -2147205071
}
