#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MQERROR{

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR => -1072824319

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_PROPERTY => -1072824318

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_QUEUE_NOT_FOUND => -1072824317

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_QUEUE_NOT_ACTIVE => -1072824316

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_QUEUE_EXISTS => -1072824315

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_INVALID_PARAMETER => -1072824314

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_INVALID_HANDLE => -1072824313

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_OPERATION_CANCELLED => -1072824312

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_SHARING_VIOLATION => -1072824311

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_SERVICE_NOT_AVAILABLE => -1072824309

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_MACHINE_NOT_FOUND => -1072824307

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_SORT => -1072824304

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_USER => -1072824303

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_NO_DS => -1072824301

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_QUEUE_PATHNAME => -1072824300

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_PROPERTY_VALUE => -1072824296

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_PROPERTY_VT => -1072824295

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_BUFFER_OVERFLOW => -1072824294

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_IO_TIMEOUT => -1072824293

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_CURSOR_ACTION => -1072824292

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_MESSAGE_ALREADY_RECEIVED => -1072824291

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_FORMATNAME => -1072824290

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_FORMATNAME_BUFFER_TOO_SMALL => -1072824289

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_UNSUPPORTED_FORMATNAME_OPERATION => -1072824288

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_SECURITY_DESCRIPTOR => -1072824287

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_SENDERID_BUFFER_TOO_SMALL => -1072824286

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_SECURITY_DESCRIPTOR_TOO_SMALL => -1072824285

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANNOT_IMPERSONATE_CLIENT => -1072824284

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ACCESS_DENIED => -1072824283

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_PRIVILEGE_NOT_HELD => -1072824282

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_INSUFFICIENT_RESOURCES => -1072824281

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_USER_BUFFER_TOO_SMALL => -1072824280

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_MESSAGE_STORAGE_FAILED => -1072824278

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_SENDER_CERT_BUFFER_TOO_SMALL => -1072824277

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_INVALID_CERTIFICATE => -1072824276

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CORRUPTED_INTERNAL_CERTIFICATE => -1072824275

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_INTERNAL_USER_CERT_EXIST => -1072824274

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_NO_INTERNAL_USER_CERT => -1072824273

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CORRUPTED_SECURITY_DATA => -1072824272

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CORRUPTED_PERSONAL_CERT_STORE => -1072824271

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_COMPUTER_DOES_NOT_SUPPORT_ENCRYPTION => -1072824269

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_BAD_SECURITY_CONTEXT => -1072824267

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_COULD_NOT_GET_USER_SID => -1072824266

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_COULD_NOT_GET_ACCOUNT_INFO => -1072824265

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_MQCOLUMNS => -1072824264

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_PROPID => -1072824263

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_RELATION => -1072824262

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_PROPERTY_SIZE => -1072824261

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_RESTRICTION_PROPID => -1072824260

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_MQQUEUEPROPS => -1072824259

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_PROPERTY_NOTALLOWED => -1072824258

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_INSUFFICIENT_PROPERTIES => -1072824257

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_MACHINE_EXISTS => -1072824256

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_MQQMPROPS => -1072824255

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_DS_IS_FULL => -1072824254

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_DS_ERROR => -1072824253

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_INVALID_OWNER => -1072824252

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_UNSUPPORTED_ACCESS_MODE => -1072824251

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_RESULT_BUFFER_TOO_SMALL => -1072824250

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_DELETE_CN_IN_USE => -1072824248

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_NO_RESPONSE_FROM_OBJECT_SERVER => -1072824247

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_OBJECT_SERVER_NOT_AVAILABLE => -1072824246

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_QUEUE_NOT_AVAILABLE => -1072824245

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_DTC_CONNECT => -1072824244

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_TRANSACTION_IMPORT => -1072824242

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_TRANSACTION_USAGE => -1072824240

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_TRANSACTION_SEQUENCE => -1072824239

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_MISSING_CONNECTOR_TYPE => -1072824235

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_STALE_HANDLE => -1072824234

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_TRANSACTION_ENLIST => -1072824232

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_QUEUE_DELETED => -1072824230

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_CONTEXT => -1072824229

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_SORT_PROPID => -1072824228

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_LABEL_TOO_LONG => -1072824227

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_LABEL_BUFFER_TOO_SMALL => -1072824226

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_MQIS_SERVER_EMPTY => -1072824225

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_MQIS_READONLY_MODE => -1072824224

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_SYMM_KEY_BUFFER_TOO_SMALL => -1072824223

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_SIGNATURE_BUFFER_TOO_SMALL => -1072824222

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_PROV_NAME_BUFFER_TOO_SMALL => -1072824221

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_OPERATION => -1072824220

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_WRITE_NOT_ALLOWED => -1072824219

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_WKS_CANT_SERVE_CLIENT => -1072824218

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_DEPEND_WKS_LICENSE_OVERFLOW => -1072824217

    /**
     * @type {Integer (Int32)}
     */
    static MQ_CORRUPTED_QUEUE_WAS_DELETED => -1072824216

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_REMOTE_MACHINE_NOT_AVAILABLE => -1072824215

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_UNSUPPORTED_OPERATION => -1072824214

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ENCRYPTION_PROVIDER_NOT_SUPPORTED => -1072824213

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANNOT_SET_CRYPTO_SEC_DESCR => -1072824212

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CERTIFICATE_NOT_PROVIDED => -1072824211

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_Q_DNS_PROPERTY_NOT_SUPPORTED => -1072824210

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANT_CREATE_CERT_STORE => -1072824209

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANNOT_CREATE_CERT_STORE => -1072824209

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANT_OPEN_CERT_STORE => -1072824208

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANNOT_OPEN_CERT_STORE => -1072824208

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_ENTERPRISE_OPERATION => -1072824207

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANNOT_GRANT_ADD_GUID => -1072824206

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANNOT_LOAD_MSMQOCM => -1072824205

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_NO_ENTRY_POINT_MSMQOCM => -1072824204

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_NO_MSMQ_SERVERS_ON_DC => -1072824203

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANNOT_JOIN_DOMAIN => -1072824202

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANNOT_CREATE_ON_GC => -1072824201

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_GUID_NOT_MATCHING => -1072824200

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_PUBLIC_KEY_NOT_FOUND => -1072824199

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_PUBLIC_KEY_DOES_NOT_EXIST => -1072824198

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_ILLEGAL_MQPRIVATEPROPS => -1072824197

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_NO_GC_IN_DOMAIN => -1072824196

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_NO_MSMQ_SERVERS_ON_GC => -1072824195

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANNOT_GET_DN => -1072824194

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANNOT_HASH_DATA_EX => -1072824193

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANNOT_SIGN_DATA_EX => -1072824192

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANNOT_CREATE_HASH_EX => -1072824191

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_FAIL_VERIFY_SIGNATURE_EX => -1072824190

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANNOT_DELETE_PSC_OBJECTS => -1072824189

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_NO_MQUSER_OU => -1072824188

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANNOT_LOAD_MQAD => -1072824187

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANNOT_LOAD_MQDSSRV => -1072824186

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_PROPERTIES_CONFLICT => -1072824185

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_MESSAGE_NOT_FOUND => -1072824184

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANT_RESOLVE_SITES => -1072824183

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_NOT_SUPPORTED_BY_DEPENDENT_CLIENTS => -1072824182

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_OPERATION_NOT_SUPPORTED_BY_REMOTE_COMPUTER => -1072824181

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_NOT_A_CORRECT_OBJECT_CLASS => -1072824180

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_MULTI_SORT_KEYS => -1072824179

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_GC_NEEDED => -1072824178

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_DS_BIND_ROOT_FOREST => -1072824177

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_DS_LOCAL_USER => -1072824176

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_Q_ADS_PROPERTY_NOT_SUPPORTED => -1072824175

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_BAD_XML_FORMAT => -1072824174

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_UNSUPPORTED_CLASS => -1072824173

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_UNINITIALIZED_OBJECT => -1072824172

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANNOT_CREATE_PSC_OBJECTS => -1072824171

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ERROR_CANNOT_UPDATE_PSC_OBJECTS => -1072824170
}
