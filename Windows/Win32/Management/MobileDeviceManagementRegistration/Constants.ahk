#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Management.MobileDeviceManagementRegistration
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_DEVICE_MESSAGE_FORMAT_ERROR := -2145910783

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_DEVICE_AUTHENTICATION_ERROR := -2145910782

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_DEVICE_AUTHORIZATION_ERROR := -2145910781

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_DEVICE_CERTIFICATEREQUEST_ERROR := -2145910780

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_DEVICE_CONFIGMGRSERVER_ERROR := -2145910779

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_DEVICE_INTERNALSERVICE_ERROR := -2145910778

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_DEVICE_INVALIDSECURITY_ERROR := -2145910777

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_DEVICE_UNKNOWN_ERROR := -2145910776

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_ENROLLMENT_IN_PROGRESS := -2145910775

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_DEVICE_ALREADY_ENROLLED := -2145910774

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_DISCOVERY_SEC_CERT_DATE_INVALID := -2145910771

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_PASSWORD_NEEDED := -2145910770

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_WAB_ERROR := -2145910769

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_CONNECTIVITY := -2145910768

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_INVALIDSSLCERT := -2145910766

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_DEVICECAPREACHED := -2145910765

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_DEVICENOTSUPPORTED := -2145910764

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_NOT_SUPPORTED := -2145910763

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_NOTELIGIBLETORENEW := -2145910762

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_INMAINTENANCE := -2145910761

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_USER_LICENSE := -2145910760

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_ENROLLMENTDATAINVALID := -2145910759

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_INSECUREREDIRECT := -2145910758

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_PLATFORM_WRONG_STATE := -2145910757

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_PLATFORM_LICENSE_ERROR := -2145910756

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_PLATFORM_UNKNOWN_ERROR := -2145910755

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_PROV_CSP_CERTSTORE := -2145910754

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_PROV_CSP_W7 := -2145910753

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_PROV_CSP_DMCLIENT := -2145910752

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_PROV_CSP_PFW := -2145910751

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_PROV_CSP_MISC := -2145910750

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_PROV_UNKNOWN := -2145910749

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_PROV_SSLCERTNOTFOUND := -2145910748

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_PROV_CSP_APPMGMT := -2145910747

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_DEVICE_MANAGEMENT_BLOCKED := -2145910746

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_CERTPOLICY_PRIVATEKEYCREATION_FAILED := -2145910745

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_CERTAUTH_FAILED_TO_FIND_CERT := -2145910744

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_EMPTY_MESSAGE := -2145910743

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_USER_CANCELLED := -2145910736

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_MDM_NOT_CONFIGURED := -2145910735

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_CUSTOMSERVERERROR := -2145910734

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_SERVER429 := -2145910733

/**
 * @type {Integer (UInt32)}
 */
export global MDM_REGISTRATION_FACILITY_CODE := 25

/**
 * @type {Integer (UInt32)}
 */
export global DEVICE_ENROLLER_FACILITY_CODE := 24

/**
 * @type {Integer (Int32)}
 */
export global MREGISTER_E_DEVICE_MESSAGE_FORMAT_ERROR := -2145845247

/**
 * @type {Integer (Int32)}
 */
export global MREGISTER_E_DEVICE_AUTHENTICATION_ERROR := -2145845246

/**
 * @type {Integer (Int32)}
 */
export global MREGISTER_E_DEVICE_AUTHORIZATION_ERROR := -2145845245

/**
 * @type {Integer (Int32)}
 */
export global MREGISTER_E_DEVICE_CERTIFCATEREQUEST_ERROR := -2145845244

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_DEVICE_CERTIFCATEREQUEST_ERROR := -2145910780

/**
 * @type {Integer (Int32)}
 */
export global MREGISTER_E_DEVICE_CONFIGMGRSERVER_ERROR := -2145845243

/**
 * @type {Integer (Int32)}
 */
export global MREGISTER_E_DEVICE_INTERNALSERVICE_ERROR := -2145845242

/**
 * @type {Integer (Int32)}
 */
export global MREGISTER_E_DEVICE_INVALIDSECURITY_ERROR := -2145845241

/**
 * @type {Integer (Int32)}
 */
export global MREGISTER_E_DEVICE_UNKNOWN_ERROR := -2145845240

/**
 * @type {Integer (Int32)}
 */
export global MREGISTER_E_REGISTRATION_IN_PROGRESS := -2145845239

/**
 * @type {Integer (Int32)}
 */
export global MREGISTER_E_DEVICE_ALREADY_REGISTERED := -2145845238

/**
 * @type {Integer (Int32)}
 */
export global MREGISTER_E_DEVICE_NOT_REGISTERED := -2145845237

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_DEVICE_NOT_ENROLLED := -2145910773

/**
 * @type {Integer (Int32)}
 */
export global MREGISTER_E_DISCOVERY_REDIRECTED := -2145845236

/**
 * @type {Integer (Int32)}
 */
export global MREGISTER_E_DEVICE_NOT_AD_REGISTERED_ERROR := -2145845235

/**
 * @type {Integer (Int32)}
 */
export global MREGISTER_E_DISCOVERY_FAILED := -2145845234

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_NOTSUPPORTED := -2145910763

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_USERLICENSE := -2145910760

/**
 * @type {Integer (Int32)}
 */
export global MENROLL_E_USER_CANCELED := -2145910742

/**
 * @type {Integer (UInt32)}
 */
export global DEVICEREGISTRATIONTYPE_MDM_ONLY := 0

/**
 * @type {Integer (UInt32)}
 */
export global DEVICEREGISTRATIONTYPE_MAM := 5

/**
 * @type {Integer (UInt32)}
 */
export global DEVICEREGISTRATIONTYPE_MDM_DEVICEWIDE_WITH_AAD := 6

/**
 * @type {Integer (UInt32)}
 */
export global DEVICEREGISTRATIONTYPE_MDM_USERSPECIFIC_WITH_AAD := 13
;@endregion Constants
