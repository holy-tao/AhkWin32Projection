#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }

/**
 * @namespace Windows.Win32.Storage.EnhancedStorage
 */

;@region Constants

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_ENHANCED_STORAGE_SILO := Guid("{3897f6a4-fd35-4bc8-a0b7-5dbba36adafa}")

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_ENHANCED_STORAGE := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_SILO_IS_AUTHENTICATION_SILO := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_SILO_IS_AUTHENTICATION_SILO.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_SILO_IS_AUTHENTICATION_SILO.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_SILO_GET_AUTHENTICATION_STATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_SILO_GET_AUTHENTICATION_STATE.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_SILO_GET_AUTHENTICATION_STATE.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_SILO_ENUMERATE_SILOS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_SILO_ENUMERATE_SILOS.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_SILO_ENUMERATE_SILOS.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_CERT_HOST_CERTIFICATE_AUTHENTICATION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_CERT_HOST_CERTIFICATE_AUTHENTICATION.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_CERT_HOST_CERTIFICATE_AUTHENTICATION.pid := 101

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_CERT_DEVICE_CERTIFICATE_AUTHENTICATION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_CERT_DEVICE_CERTIFICATE_AUTHENTICATION.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_CERT_DEVICE_CERTIFICATE_AUTHENTICATION.pid := 102

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_CERT_ADMIN_CERTIFICATE_AUTHENTICATION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_CERT_ADMIN_CERTIFICATE_AUTHENTICATION.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_CERT_ADMIN_CERTIFICATE_AUTHENTICATION.pid := 103

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_CERT_INITIALIZE_TO_MANUFACTURER_STATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_CERT_INITIALIZE_TO_MANUFACTURER_STATE.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_CERT_INITIALIZE_TO_MANUFACTURER_STATE.pid := 104

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_CERT_GET_CERTIFICATE_COUNT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_CERT_GET_CERTIFICATE_COUNT.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_CERT_GET_CERTIFICATE_COUNT.pid := 105

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_CERT_GET_CERTIFICATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_CERT_GET_CERTIFICATE.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_CERT_GET_CERTIFICATE.pid := 106

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_CERT_SET_CERTIFICATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_CERT_SET_CERTIFICATE.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_CERT_SET_CERTIFICATE.pid := 107

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_CERT_CREATE_CERTIFICATE_REQUEST := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_CERT_CREATE_CERTIFICATE_REQUEST.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_CERT_CREATE_CERTIFICATE_REQUEST.pid := 108

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_CERT_UNAUTHENTICATION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_CERT_UNAUTHENTICATION.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_CERT_UNAUTHENTICATION.pid := 110

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_CERT_GET_SILO_CAPABILITY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_CERT_GET_SILO_CAPABILITY.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_CERT_GET_SILO_CAPABILITY.pid := 111

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_CERT_GET_SILO_CAPABILITIES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_CERT_GET_SILO_CAPABILITIES.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_CERT_GET_SILO_CAPABILITIES.pid := 112

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_CERT_GET_ACT_FRIENDLY_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_CERT_GET_ACT_FRIENDLY_NAME.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_CERT_GET_ACT_FRIENDLY_NAME.pid := 113

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_CERT_GET_SILO_GUID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_CERT_GET_SILO_GUID.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_CERT_GET_SILO_GUID.pid := 114

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_PASSWORD_AUTHORIZE_ACT_ACCESS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_PASSWORD_AUTHORIZE_ACT_ACCESS.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_PASSWORD_AUTHORIZE_ACT_ACCESS.pid := 203

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_PASSWORD_UNAUTHORIZE_ACT_ACCESS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_PASSWORD_UNAUTHORIZE_ACT_ACCESS.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_PASSWORD_UNAUTHORIZE_ACT_ACCESS.pid := 204

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_PASSWORD_QUERY_INFORMATION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_PASSWORD_QUERY_INFORMATION.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_PASSWORD_QUERY_INFORMATION.pid := 205

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_PASSWORD_CONFIG_ADMINISTRATOR := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_PASSWORD_CONFIG_ADMINISTRATOR.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_PASSWORD_CONFIG_ADMINISTRATOR.pid := 206

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_PASSWORD_CREATE_USER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_PASSWORD_CREATE_USER.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_PASSWORD_CREATE_USER.pid := 207

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_PASSWORD_DELETE_USER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_PASSWORD_DELETE_USER.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_PASSWORD_DELETE_USER.pid := 208

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_PASSWORD_CHANGE_PASSWORD := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_PASSWORD_CHANGE_PASSWORD.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_PASSWORD_CHANGE_PASSWORD.pid := 209

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_PASSWORD_INITIALIZE_USER_PASSWORD := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_PASSWORD_INITIALIZE_USER_PASSWORD.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_PASSWORD_INITIALIZE_USER_PASSWORD.pid := 210

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_COMMAND_PASSWORD_START_INITIALIZE_TO_MANUFACTURER_STATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_COMMAND_PASSWORD_START_INITIALIZE_TO_MANUFACTURER_STATE.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_COMMAND_PASSWORD_START_INITIALIZE_TO_MANUFACTURER_STATE.pid := 211

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_AUTHENTICATION_STATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_AUTHENTICATION_STATE.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_AUTHENTICATION_STATE.pid := 1006

/**
 * @type {Integer (UInt32)}
 */
export global ENHANCED_STORAGE_AUTHN_STATE_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global ENHANCED_STORAGE_AUTHN_STATE_NO_AUTHENTICATION_REQUIRED := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENHANCED_STORAGE_AUTHN_STATE_NOT_AUTHENTICATED := 2

/**
 * @type {Integer (UInt32)}
 */
export global ENHANCED_STORAGE_AUTHN_STATE_AUTHENTICATED := 3

/**
 * @type {Integer (UInt32)}
 */
export global ENHANCED_STORAGE_AUTHN_STATE_AUTHENTICATION_DENIED := 2147483649

/**
 * @type {Integer (UInt32)}
 */
export global ENHANCED_STORAGE_AUTHN_STATE_DEVICE_ERROR := 2147483650

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_IS_AUTHENTICATION_SILO := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_IS_AUTHENTICATION_SILO.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_IS_AUTHENTICATION_SILO.pid := 1009

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_TEMPORARY_UNAUTHENTICATION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_TEMPORARY_UNAUTHENTICATION.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_TEMPORARY_UNAUTHENTICATION.pid := 1010

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_MAX_AUTH_FAILURES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_MAX_AUTH_FAILURES.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_MAX_AUTH_FAILURES.pid := 2001

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_PASSWORD := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_PASSWORD.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_PASSWORD.pid := 2004

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_OLD_PASSWORD := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_OLD_PASSWORD.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_OLD_PASSWORD.pid := 2005

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_PASSWORD_INDICATOR := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_PASSWORD_INDICATOR.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_PASSWORD_INDICATOR.pid := 2006

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_NEW_PASSWORD_INDICATOR := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_NEW_PASSWORD_INDICATOR.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_NEW_PASSWORD_INDICATOR.pid := 2007

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_NEW_PASSWORD := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_NEW_PASSWORD.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_NEW_PASSWORD.pid := 2008

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_USER_HINT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_USER_HINT.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_USER_HINT.pid := 2009

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_USER_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_USER_NAME.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_USER_NAME.pid := 2010

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_ADMIN_HINT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_ADMIN_HINT.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_ADMIN_HINT.pid := 2011

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_SILO_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_SILO_NAME.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_SILO_NAME.pid := 2012

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_SILO_FRIENDLYNAME_SPECIFIED := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_SILO_FRIENDLYNAME_SPECIFIED.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_SILO_FRIENDLYNAME_SPECIFIED.pid := 2013

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_PASSWORD_SILO_INFO := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_PASSWORD_SILO_INFO.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_PASSWORD_SILO_INFO.pid := 2014

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_SECURITY_IDENTIFIER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_SECURITY_IDENTIFIER.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_SECURITY_IDENTIFIER.pid := 2015

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_QUERY_SILO_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_QUERY_SILO_TYPE.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_QUERY_SILO_TYPE.pid := 2016

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_QUERY_SILO_RESULTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_QUERY_SILO_RESULTS.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_QUERY_SILO_RESULTS.pid := 2017

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_MAX_CERTIFICATE_COUNT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_MAX_CERTIFICATE_COUNT.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_MAX_CERTIFICATE_COUNT.pid := 3001

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_STORED_CERTIFICATE_COUNT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_STORED_CERTIFICATE_COUNT.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_STORED_CERTIFICATE_COUNT.pid := 3002

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_CERTIFICATE_INDEX := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_CERTIFICATE_INDEX.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_CERTIFICATE_INDEX.pid := 3003

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_CERTIFICATE_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_CERTIFICATE_TYPE.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_CERTIFICATE_TYPE.pid := 3004

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TYPE_EMPTY := 0

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TYPE_ASCm := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TYPE_PCp := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TYPE_ASCh := 3

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TYPE_HCh := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TYPE_SIGNER := 6

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_VALIDATION_POLICY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_VALIDATION_POLICY.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_VALIDATION_POLICY.pid := 3005

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDATION_POLICY_RESERVED := 0

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDATION_POLICY_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDATION_POLICY_BASIC := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDATION_POLICY_EXTENDED := 3

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_NEXT_CERTIFICATE_INDEX := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_NEXT_CERTIFICATE_INDEX.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_NEXT_CERTIFICATE_INDEX.pid := 3006

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_NEXT_CERTIFICATE_OF_TYPE_INDEX := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_NEXT_CERTIFICATE_OF_TYPE_INDEX.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_NEXT_CERTIFICATE_OF_TYPE_INDEX.pid := 3007

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_CERTIFICATE_LENGTH := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_CERTIFICATE_LENGTH.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_CERTIFICATE_LENGTH.pid := 3008

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_CERTIFICATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_CERTIFICATE.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_CERTIFICATE.pid := 3009

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_CERTIFICATE_REQUEST := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_CERTIFICATE_REQUEST.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_CERTIFICATE_REQUEST.pid := 3010

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_CERTIFICATE_CAPABILITY_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_CERTIFICATE_CAPABILITY_TYPE.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_CERTIFICATE_CAPABILITY_TYPE.pid := 3011

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_CERTIFICATE_SILO_CAPABILITY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_CERTIFICATE_SILO_CAPABILITY.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_CERTIFICATE_SILO_CAPABILITY.pid := 3012

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_CERTIFICATE_SILO_CAPABILITIES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_CERTIFICATE_SILO_CAPABILITIES.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_CERTIFICATE_SILO_CAPABILITIES.pid := 3013

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CAPABILITY_HASH_ALG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CAPABILITY_ASYMMETRIC_KEY_CRYPTOGRAPHY := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CAPABILITY_SIGNATURE_ALG := 3

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CAPABILITY_CERTIFICATE_SUPPORT := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CAPABILITY_OPTIONAL_FEATURES := 5

/**
 * @type {Integer (UInt32)}
 */
export global CERT_MAX_CAPABILITY := 255

/**
 * @type {String}
 */
export global CERT_RSA_1024_OID := "1.2.840.113549.1.1.1,1024"

/**
 * @type {String}
 */
export global CERT_RSA_2048_OID := "1.2.840.113549.1.1.1,2048"

/**
 * @type {String}
 */
export global CERT_RSA_3072_OID := "1.2.840.113549.1.1.1,3072"

/**
 * @type {String}
 */
export global CERT_RSASSA_PSS_SHA1_OID := "1.2.840.113549.1.1.10,1.3.14.3.2.26"

/**
 * @type {String}
 */
export global CERT_RSASSA_PSS_SHA256_OID := "1.2.840.113549.1.1.10,2.16.840.1.101.3.4.2.1"

/**
 * @type {String}
 */
export global CERT_RSASSA_PSS_SHA384_OID := "1.2.840.113549.1.1.10,2.16.840.1.101.3.4.2.2"

/**
 * @type {String}
 */
export global CERT_RSASSA_PSS_SHA512_OID := "1.2.840.113549.1.1.10,2.16.840.1.101.3.4.2.3"

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_CERTIFICATE_ACT_FRIENDLY_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_CERTIFICATE_ACT_FRIENDLY_NAME.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_CERTIFICATE_ACT_FRIENDLY_NAME.pid := 3014

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_CERTIFICATE_SILO_GUID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_CERTIFICATE_SILO_GUID.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_CERTIFICATE_SILO_GUID.pid := 3015

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_PROPERTY_SIGNER_CERTIFICATE_INDEX := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_PROPERTY_SIGNER_CERTIFICATE_INDEX.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_PROPERTY_SIGNER_CERTIFICATE_INDEX.pid := 3016

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_CAPABILITY_HASH_ALGS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_CAPABILITY_HASH_ALGS.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_CAPABILITY_HASH_ALGS.pid := 4001

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_CAPABILITY_ASYMMETRIC_KEY_CRYPTOGRAPHY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_CAPABILITY_ASYMMETRIC_KEY_CRYPTOGRAPHY.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_CAPABILITY_ASYMMETRIC_KEY_CRYPTOGRAPHY.pid := 4002

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_CAPABILITY_SIGNING_ALGS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_CAPABILITY_SIGNING_ALGS.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_CAPABILITY_SIGNING_ALGS.pid := 4003

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_CAPABILITY_RENDER_USER_DATA_UNUSABLE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_CAPABILITY_RENDER_USER_DATA_UNUSABLE.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_CAPABILITY_RENDER_USER_DATA_UNUSABLE.pid := 4004

/**
 * @type {PROPERTYKEY}
 */
export global ENHANCED_STORAGE_CAPABILITY_CERTIFICATE_EXTENSION_PARSING := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(ENHANCED_STORAGE_CAPABILITY_CERTIFICATE_EXTENSION_PARSING.fmtid),
    Guid.Ptr, Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}"),
    UInt32, 16)
ENHANCED_STORAGE_CAPABILITY_CERTIFICATE_EXTENSION_PARSING.pid := 4005

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Address_Country := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Address_Country.fmtid),
    Guid.Ptr, Guid("{c07b4199-e1df-4493-b1e1-de5946fb58f8}"),
    UInt32, 16)
PKEY_Address_Country.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Address_CountryCode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Address_CountryCode.fmtid),
    Guid.Ptr, Guid("{c07b4199-e1df-4493-b1e1-de5946fb58f8}"),
    UInt32, 16)
PKEY_Address_CountryCode.pid := 101

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Address_Region := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Address_Region.fmtid),
    Guid.Ptr, Guid("{c07b4199-e1df-4493-b1e1-de5946fb58f8}"),
    UInt32, 16)
PKEY_Address_Region.pid := 102

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Address_RegionCode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Address_RegionCode.fmtid),
    Guid.Ptr, Guid("{c07b4199-e1df-4493-b1e1-de5946fb58f8}"),
    UInt32, 16)
PKEY_Address_RegionCode.pid := 103

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Address_Town := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Address_Town.fmtid),
    Guid.Ptr, Guid("{c07b4199-e1df-4493-b1e1-de5946fb58f8}"),
    UInt32, 16)
PKEY_Address_Town.pid := 104

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Audio_ChannelCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Audio_ChannelCount.fmtid),
    Guid.Ptr, Guid("{64440490-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Audio_ChannelCount.pid := 7

/**
 * @type {Integer (UInt32)}
 */
export global AUDIO_CHANNELCOUNT_MONO := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUDIO_CHANNELCOUNT_STEREO := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Audio_Compression := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Audio_Compression.fmtid),
    Guid.Ptr, Guid("{64440490-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Audio_Compression.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Audio_EncodingBitrate := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Audio_EncodingBitrate.fmtid),
    Guid.Ptr, Guid("{64440490-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Audio_EncodingBitrate.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Audio_Format := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Audio_Format.fmtid),
    Guid.Ptr, Guid("{64440490-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Audio_Format.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Audio_IsVariableBitRate := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Audio_IsVariableBitRate.fmtid),
    Guid.Ptr, Guid("{e6822fee-8c17-4d62-823c-8e9cfcbd1d5c}"),
    UInt32, 16)
PKEY_Audio_IsVariableBitRate.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Audio_PeakValue := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Audio_PeakValue.fmtid),
    Guid.Ptr, Guid("{2579e5d0-1116-4084-bd9a-9b4f7cb4df5e}"),
    UInt32, 16)
PKEY_Audio_PeakValue.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Audio_SampleRate := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Audio_SampleRate.fmtid),
    Guid.Ptr, Guid("{64440490-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Audio_SampleRate.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Audio_SampleSize := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Audio_SampleSize.fmtid),
    Guid.Ptr, Guid("{64440490-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Audio_SampleSize.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Audio_StreamName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Audio_StreamName.fmtid),
    Guid.Ptr, Guid("{64440490-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Audio_StreamName.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Audio_StreamNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Audio_StreamNumber.fmtid),
    Guid.Ptr, Guid("{64440490-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Audio_StreamNumber.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Calendar_Duration := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Calendar_Duration.fmtid),
    Guid.Ptr, Guid("{293ca35a-09aa-4dd2-b180-1fe245728a52}"),
    UInt32, 16)
PKEY_Calendar_Duration.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Calendar_IsOnline := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Calendar_IsOnline.fmtid),
    Guid.Ptr, Guid("{bfee9149-e3e2-49a7-a862-c05988145cec}"),
    UInt32, 16)
PKEY_Calendar_IsOnline.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Calendar_IsRecurring := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Calendar_IsRecurring.fmtid),
    Guid.Ptr, Guid("{315b9c8d-80a9-4ef9-ae16-8e746da51d70}"),
    UInt32, 16)
PKEY_Calendar_IsRecurring.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Calendar_Location := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Calendar_Location.fmtid),
    Guid.Ptr, Guid("{f6272d18-cecc-40b1-b26a-3911717aa7bd}"),
    UInt32, 16)
PKEY_Calendar_Location.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Calendar_OptionalAttendeeAddresses := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Calendar_OptionalAttendeeAddresses.fmtid),
    Guid.Ptr, Guid("{d55bae5a-3892-417a-a649-c6ac5aaaeab3}"),
    UInt32, 16)
PKEY_Calendar_OptionalAttendeeAddresses.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Calendar_OptionalAttendeeNames := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Calendar_OptionalAttendeeNames.fmtid),
    Guid.Ptr, Guid("{09429607-582d-437f-84c3-de93a2b24c3c}"),
    UInt32, 16)
PKEY_Calendar_OptionalAttendeeNames.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Calendar_OrganizerAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Calendar_OrganizerAddress.fmtid),
    Guid.Ptr, Guid("{744c8242-4df5-456c-ab9e-014efb9021e3}"),
    UInt32, 16)
PKEY_Calendar_OrganizerAddress.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Calendar_OrganizerName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Calendar_OrganizerName.fmtid),
    Guid.Ptr, Guid("{aaa660f9-9865-458e-b484-01bc7fe3973e}"),
    UInt32, 16)
PKEY_Calendar_OrganizerName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Calendar_ReminderTime := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Calendar_ReminderTime.fmtid),
    Guid.Ptr, Guid("{72fc5ba4-24f9-4011-9f3f-add27afad818}"),
    UInt32, 16)
PKEY_Calendar_ReminderTime.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Calendar_RequiredAttendeeAddresses := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Calendar_RequiredAttendeeAddresses.fmtid),
    Guid.Ptr, Guid("{0ba7d6c3-568d-4159-ab91-781a91fb71e5}"),
    UInt32, 16)
PKEY_Calendar_RequiredAttendeeAddresses.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Calendar_RequiredAttendeeNames := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Calendar_RequiredAttendeeNames.fmtid),
    Guid.Ptr, Guid("{b33af30b-f552-4584-936c-cb93e5cda29f}"),
    UInt32, 16)
PKEY_Calendar_RequiredAttendeeNames.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Calendar_Resources := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Calendar_Resources.fmtid),
    Guid.Ptr, Guid("{00f58a38-c54b-4c40-8696-97235980eae1}"),
    UInt32, 16)
PKEY_Calendar_Resources.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Calendar_ResponseStatus := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Calendar_ResponseStatus.fmtid),
    Guid.Ptr, Guid("{188c1f91-3c40-4132-9ec5-d8b03b72a8a2}"),
    UInt32, 16)
PKEY_Calendar_ResponseStatus.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Calendar_ShowTimeAs := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Calendar_ShowTimeAs.fmtid),
    Guid.Ptr, Guid("{5bf396d4-5eb2-466f-bde9-2fb3f2361d6e}"),
    UInt32, 16)
PKEY_Calendar_ShowTimeAs.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Calendar_ShowTimeAsText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Calendar_ShowTimeAsText.fmtid),
    Guid.Ptr, Guid("{53da57cf-62c0-45c4-81de-7610bcefd7f5}"),
    UInt32, 16)
PKEY_Calendar_ShowTimeAsText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Communication_AccountName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Communication_AccountName.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_Communication_AccountName.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Communication_DateItemExpires := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Communication_DateItemExpires.fmtid),
    Guid.Ptr, Guid("{428040ac-a177-4c8a-9760-f6f761227f9a}"),
    UInt32, 16)
PKEY_Communication_DateItemExpires.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Communication_Direction := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Communication_Direction.fmtid),
    Guid.Ptr, Guid("{8e531030-b960-4346-ae0d-66bc9a86fb94}"),
    UInt32, 16)
PKEY_Communication_Direction.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Communication_FollowupIconIndex := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Communication_FollowupIconIndex.fmtid),
    Guid.Ptr, Guid("{83a6347e-6fe4-4f40-ba9c-c4865240d1f4}"),
    UInt32, 16)
PKEY_Communication_FollowupIconIndex.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Communication_HeaderItem := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Communication_HeaderItem.fmtid),
    Guid.Ptr, Guid("{c9c34f84-2241-4401-b607-bd20ed75ae7f}"),
    UInt32, 16)
PKEY_Communication_HeaderItem.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Communication_PolicyTag := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Communication_PolicyTag.fmtid),
    Guid.Ptr, Guid("{ec0b4191-ab0b-4c66-90b6-c6637cdebbab}"),
    UInt32, 16)
PKEY_Communication_PolicyTag.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Communication_SecurityFlags := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Communication_SecurityFlags.fmtid),
    Guid.Ptr, Guid("{8619a4b6-9f4d-4429-8c0f-b996ca59e335}"),
    UInt32, 16)
PKEY_Communication_SecurityFlags.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Communication_Suffix := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Communication_Suffix.fmtid),
    Guid.Ptr, Guid("{807b653a-9e91-43ef-8f97-11ce04ee20c5}"),
    UInt32, 16)
PKEY_Communication_Suffix.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Communication_TaskStatus := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Communication_TaskStatus.fmtid),
    Guid.Ptr, Guid("{be1a72c6-9a1d-46b7-afe7-afaf8cef4999}"),
    UInt32, 16)
PKEY_Communication_TaskStatus.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Communication_TaskStatusText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Communication_TaskStatusText.fmtid),
    Guid.Ptr, Guid("{a6744477-c237-475b-a075-54f34498292a}"),
    UInt32, 16)
PKEY_Communication_TaskStatusText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Computer_DecoratedFreeSpace := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Computer_DecoratedFreeSpace.fmtid),
    Guid.Ptr, Guid("{9b174b35-40ff-11d2-a27e-00c04fc30871}"),
    UInt32, 16)
PKEY_Computer_DecoratedFreeSpace.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_AccountPictureDynamicVideo := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_AccountPictureDynamicVideo.fmtid),
    Guid.Ptr, Guid("{0b8bb018-2725-4b44-92ba-7933aeb2dde7}"),
    UInt32, 16)
PKEY_Contact_AccountPictureDynamicVideo.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_AccountPictureLarge := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_AccountPictureLarge.fmtid),
    Guid.Ptr, Guid("{0b8bb018-2725-4b44-92ba-7933aeb2dde7}"),
    UInt32, 16)
PKEY_Contact_AccountPictureLarge.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_AccountPictureSmall := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_AccountPictureSmall.fmtid),
    Guid.Ptr, Guid("{0b8bb018-2725-4b44-92ba-7933aeb2dde7}"),
    UInt32, 16)
PKEY_Contact_AccountPictureSmall.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_Anniversary := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_Anniversary.fmtid),
    Guid.Ptr, Guid("{9ad5badb-cea7-4470-a03d-b84e51b9949e}"),
    UInt32, 16)
PKEY_Contact_Anniversary.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_AssistantName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_AssistantName.fmtid),
    Guid.Ptr, Guid("{cd102c9c-5540-4a88-a6f6-64e4981c8cd1}"),
    UInt32, 16)
PKEY_Contact_AssistantName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_AssistantTelephone := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_AssistantTelephone.fmtid),
    Guid.Ptr, Guid("{9a93244d-a7ad-4ff8-9b99-45ee4cc09af6}"),
    UInt32, 16)
PKEY_Contact_AssistantTelephone.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_Birthday := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_Birthday.fmtid),
    Guid.Ptr, Guid("{176dc63c-2688-4e89-8143-a347800f25e9}"),
    UInt32, 16)
PKEY_Contact_Birthday.pid := 47

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddress.fmtid),
    Guid.Ptr, Guid("{730fb6dd-cf7c-426b-a03f-bd166cc9ee24}"),
    UInt32, 16)
PKEY_Contact_BusinessAddress.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddress1Country := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddress1Country.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_BusinessAddress1Country.pid := 119

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddress1Locality := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddress1Locality.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_BusinessAddress1Locality.pid := 117

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddress1PostalCode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddress1PostalCode.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_BusinessAddress1PostalCode.pid := 120

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddress1Region := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddress1Region.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_BusinessAddress1Region.pid := 118

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddress1Street := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddress1Street.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_BusinessAddress1Street.pid := 116

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddress2Country := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddress2Country.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_BusinessAddress2Country.pid := 124

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddress2Locality := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddress2Locality.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_BusinessAddress2Locality.pid := 122

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddress2PostalCode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddress2PostalCode.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_BusinessAddress2PostalCode.pid := 125

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddress2Region := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddress2Region.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_BusinessAddress2Region.pid := 123

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddress2Street := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddress2Street.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_BusinessAddress2Street.pid := 121

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddress3Country := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddress3Country.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_BusinessAddress3Country.pid := 129

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddress3Locality := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddress3Locality.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_BusinessAddress3Locality.pid := 127

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddress3PostalCode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddress3PostalCode.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_BusinessAddress3PostalCode.pid := 130

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddress3Region := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddress3Region.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_BusinessAddress3Region.pid := 128

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddress3Street := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddress3Street.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_BusinessAddress3Street.pid := 126

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddressCity := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddressCity.fmtid),
    Guid.Ptr, Guid("{402b5934-ec5a-48c3-93e6-85e86a2d934e}"),
    UInt32, 16)
PKEY_Contact_BusinessAddressCity.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddressCountry := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddressCountry.fmtid),
    Guid.Ptr, Guid("{b0b87314-fcf6-4feb-8dff-a50da6af561c}"),
    UInt32, 16)
PKEY_Contact_BusinessAddressCountry.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddressPostalCode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddressPostalCode.fmtid),
    Guid.Ptr, Guid("{e1d4a09e-d758-4cd1-b6ec-34a8b5a73f80}"),
    UInt32, 16)
PKEY_Contact_BusinessAddressPostalCode.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddressPostOfficeBox := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddressPostOfficeBox.fmtid),
    Guid.Ptr, Guid("{bc4e71ce-17f9-48d5-bee9-021df0ea5409}"),
    UInt32, 16)
PKEY_Contact_BusinessAddressPostOfficeBox.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddressState := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddressState.fmtid),
    Guid.Ptr, Guid("{446f787f-10c4-41cb-a6c4-4d0343551597}"),
    UInt32, 16)
PKEY_Contact_BusinessAddressState.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessAddressStreet := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessAddressStreet.fmtid),
    Guid.Ptr, Guid("{ddd1460f-c0bf-4553-8ce4-10433c908fb0}"),
    UInt32, 16)
PKEY_Contact_BusinessAddressStreet.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessEmailAddresses := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessEmailAddresses.fmtid),
    Guid.Ptr, Guid("{f271c659-7e5e-471f-ba25-7f77b286f836}"),
    UInt32, 16)
PKEY_Contact_BusinessEmailAddresses.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessFaxNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessFaxNumber.fmtid),
    Guid.Ptr, Guid("{91eff6f3-2e27-42ca-933e-7c999fbe310b}"),
    UInt32, 16)
PKEY_Contact_BusinessFaxNumber.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessHomePage := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessHomePage.fmtid),
    Guid.Ptr, Guid("{56310920-2491-4919-99ce-eadb06fafdb2}"),
    UInt32, 16)
PKEY_Contact_BusinessHomePage.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_BusinessTelephone := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_BusinessTelephone.fmtid),
    Guid.Ptr, Guid("{6a15e5a0-0a1e-4cd7-bb8c-d2f1b0c929bc}"),
    UInt32, 16)
PKEY_Contact_BusinessTelephone.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_CallbackTelephone := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_CallbackTelephone.fmtid),
    Guid.Ptr, Guid("{bf53d1c3-49e0-4f7f-8567-5a821d8ac542}"),
    UInt32, 16)
PKEY_Contact_CallbackTelephone.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_CarTelephone := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_CarTelephone.fmtid),
    Guid.Ptr, Guid("{8fdc6dea-b929-412b-ba90-397a257465fe}"),
    UInt32, 16)
PKEY_Contact_CarTelephone.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_Children := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_Children.fmtid),
    Guid.Ptr, Guid("{d4729704-8ef1-43ef-9024-2bd381187fd5}"),
    UInt32, 16)
PKEY_Contact_Children.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_CompanyMainTelephone := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_CompanyMainTelephone.fmtid),
    Guid.Ptr, Guid("{8589e481-6040-473d-b171-7fa89c2708ed}"),
    UInt32, 16)
PKEY_Contact_CompanyMainTelephone.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_ConnectedServiceDisplayName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_ConnectedServiceDisplayName.fmtid),
    Guid.Ptr, Guid("{39b77f4f-a104-4863-b395-2db2ad8f7bc1}"),
    UInt32, 16)
PKEY_Contact_ConnectedServiceDisplayName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_ConnectedServiceIdentities := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_ConnectedServiceIdentities.fmtid),
    Guid.Ptr, Guid("{80f41eb8-afc4-4208-aa5f-cce21a627281}"),
    UInt32, 16)
PKEY_Contact_ConnectedServiceIdentities.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_ConnectedServiceName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_ConnectedServiceName.fmtid),
    Guid.Ptr, Guid("{b5c84c9e-5927-46b5-a3cc-933c21b78469}"),
    UInt32, 16)
PKEY_Contact_ConnectedServiceName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_ConnectedServiceSupportedActions := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_ConnectedServiceSupportedActions.fmtid),
    Guid.Ptr, Guid("{a19fb7a9-024b-4371-a8bf-4d29c3e4e9c9}"),
    UInt32, 16)
PKEY_Contact_ConnectedServiceSupportedActions.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_DataSuppliers := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_DataSuppliers.fmtid),
    Guid.Ptr, Guid("{9660c283-fc3a-4a08-a096-eed3aac46da2}"),
    UInt32, 16)
PKEY_Contact_DataSuppliers.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_Department := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_Department.fmtid),
    Guid.Ptr, Guid("{fc9f7306-ff8f-4d49-9fb6-3ffe5c0951ec}"),
    UInt32, 16)
PKEY_Contact_Department.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_DisplayBusinessPhoneNumbers := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_DisplayBusinessPhoneNumbers.fmtid),
    Guid.Ptr, Guid("{364028da-d895-41fe-a584-302b1bb70a76}"),
    UInt32, 16)
PKEY_Contact_DisplayBusinessPhoneNumbers.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_DisplayHomePhoneNumbers := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_DisplayHomePhoneNumbers.fmtid),
    Guid.Ptr, Guid("{5068bcdf-d697-4d85-8c53-1f1cdab01763}"),
    UInt32, 16)
PKEY_Contact_DisplayHomePhoneNumbers.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_DisplayMobilePhoneNumbers := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_DisplayMobilePhoneNumbers.fmtid),
    Guid.Ptr, Guid("{9cb0c358-9d7a-46b1-b466-dcc6f1a3d93d}"),
    UInt32, 16)
PKEY_Contact_DisplayMobilePhoneNumbers.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_DisplayOtherPhoneNumbers := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_DisplayOtherPhoneNumbers.fmtid),
    Guid.Ptr, Guid("{03089873-8ee8-4191-bd60-d31f72b7900b}"),
    UInt32, 16)
PKEY_Contact_DisplayOtherPhoneNumbers.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_EmailAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_EmailAddress.fmtid),
    Guid.Ptr, Guid("{f8fa7fa3-d12b-4785-8a4e-691a94f7a3e7}"),
    UInt32, 16)
PKEY_Contact_EmailAddress.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_EmailAddress2 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_EmailAddress2.fmtid),
    Guid.Ptr, Guid("{38965063-edc8-4268-8491-b7723172cf29}"),
    UInt32, 16)
PKEY_Contact_EmailAddress2.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_EmailAddress3 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_EmailAddress3.fmtid),
    Guid.Ptr, Guid("{644d37b4-e1b3-4bad-b099-7e7c04966aca}"),
    UInt32, 16)
PKEY_Contact_EmailAddress3.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_EmailAddresses := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_EmailAddresses.fmtid),
    Guid.Ptr, Guid("{84d8f337-981d-44b3-9615-c7596dba17e3}"),
    UInt32, 16)
PKEY_Contact_EmailAddresses.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_EmailName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_EmailName.fmtid),
    Guid.Ptr, Guid("{cc6f4f24-6083-4bd4-8754-674d0de87ab8}"),
    UInt32, 16)
PKEY_Contact_EmailName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_FileAsName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_FileAsName.fmtid),
    Guid.Ptr, Guid("{f1a24aa7-9ca7-40f6-89ec-97def9ffe8db}"),
    UInt32, 16)
PKEY_Contact_FileAsName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_FirstName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_FirstName.fmtid),
    Guid.Ptr, Guid("{14977844-6b49-4aad-a714-a4513bf60460}"),
    UInt32, 16)
PKEY_Contact_FirstName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_FullName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_FullName.fmtid),
    Guid.Ptr, Guid("{635e9051-50a5-4ba2-b9db-4ed056c77296}"),
    UInt32, 16)
PKEY_Contact_FullName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_Gender := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_Gender.fmtid),
    Guid.Ptr, Guid("{3c8cee58-d4f0-4cf9-b756-4e5d24447bcd}"),
    UInt32, 16)
PKEY_Contact_Gender.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_GenderValue := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_GenderValue.fmtid),
    Guid.Ptr, Guid("{3c8cee58-d4f0-4cf9-b756-4e5d24447bcd}"),
    UInt32, 16)
PKEY_Contact_GenderValue.pid := 101

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_Hobbies := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_Hobbies.fmtid),
    Guid.Ptr, Guid("{5dc2253f-5e11-4adf-9cfe-910dd01e3e70}"),
    UInt32, 16)
PKEY_Contact_Hobbies.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddress.fmtid),
    Guid.Ptr, Guid("{98f98354-617a-46b8-8560-5b1b64bf1f89}"),
    UInt32, 16)
PKEY_Contact_HomeAddress.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddress1Country := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddress1Country.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_HomeAddress1Country.pid := 104

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddress1Locality := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddress1Locality.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_HomeAddress1Locality.pid := 102

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddress1PostalCode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddress1PostalCode.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_HomeAddress1PostalCode.pid := 105

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddress1Region := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddress1Region.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_HomeAddress1Region.pid := 103

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddress1Street := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddress1Street.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_HomeAddress1Street.pid := 101

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddress2Country := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddress2Country.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_HomeAddress2Country.pid := 109

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddress2Locality := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddress2Locality.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_HomeAddress2Locality.pid := 107

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddress2PostalCode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddress2PostalCode.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_HomeAddress2PostalCode.pid := 110

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddress2Region := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddress2Region.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_HomeAddress2Region.pid := 108

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddress2Street := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddress2Street.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_HomeAddress2Street.pid := 106

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddress3Country := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddress3Country.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_HomeAddress3Country.pid := 114

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddress3Locality := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddress3Locality.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_HomeAddress3Locality.pid := 112

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddress3PostalCode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddress3PostalCode.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_HomeAddress3PostalCode.pid := 115

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddress3Region := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddress3Region.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_HomeAddress3Region.pid := 113

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddress3Street := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddress3Street.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_HomeAddress3Street.pid := 111

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddressCity := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddressCity.fmtid),
    Guid.Ptr, Guid("{176dc63c-2688-4e89-8143-a347800f25e9}"),
    UInt32, 16)
PKEY_Contact_HomeAddressCity.pid := 65

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddressCountry := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddressCountry.fmtid),
    Guid.Ptr, Guid("{08a65aa1-f4c9-43dd-9ddf-a33d8e7ead85}"),
    UInt32, 16)
PKEY_Contact_HomeAddressCountry.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddressPostalCode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddressPostalCode.fmtid),
    Guid.Ptr, Guid("{8afcc170-8a46-4b53-9eee-90bae7151e62}"),
    UInt32, 16)
PKEY_Contact_HomeAddressPostalCode.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddressPostOfficeBox := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddressPostOfficeBox.fmtid),
    Guid.Ptr, Guid("{7b9f6399-0a3f-4b12-89bd-4adc51c918af}"),
    UInt32, 16)
PKEY_Contact_HomeAddressPostOfficeBox.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddressState := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddressState.fmtid),
    Guid.Ptr, Guid("{c89a23d0-7d6d-4eb8-87d4-776a82d493e5}"),
    UInt32, 16)
PKEY_Contact_HomeAddressState.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeAddressStreet := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeAddressStreet.fmtid),
    Guid.Ptr, Guid("{0adef160-db3f-4308-9a21-06237b16fa2a}"),
    UInt32, 16)
PKEY_Contact_HomeAddressStreet.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeEmailAddresses := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeEmailAddresses.fmtid),
    Guid.Ptr, Guid("{56c90e9d-9d46-4963-886f-2e1cd9a694ef}"),
    UInt32, 16)
PKEY_Contact_HomeEmailAddresses.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeFaxNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeFaxNumber.fmtid),
    Guid.Ptr, Guid("{660e04d6-81ab-4977-a09f-82313113ab26}"),
    UInt32, 16)
PKEY_Contact_HomeFaxNumber.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_HomeTelephone := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_HomeTelephone.fmtid),
    Guid.Ptr, Guid("{176dc63c-2688-4e89-8143-a347800f25e9}"),
    UInt32, 16)
PKEY_Contact_HomeTelephone.pid := 20

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_IMAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_IMAddress.fmtid),
    Guid.Ptr, Guid("{d68dbd8a-3374-4b81-9972-3ec30682db3d}"),
    UInt32, 16)
PKEY_Contact_IMAddress.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_Initials := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_Initials.fmtid),
    Guid.Ptr, Guid("{f3d8f40d-50cb-44a2-9718-40cb9119495d}"),
    UInt32, 16)
PKEY_Contact_Initials.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JA_CompanyNamePhonetic := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JA_CompanyNamePhonetic.fmtid),
    Guid.Ptr, Guid("{897b3694-fe9e-43e6-8066-260f590c0100}"),
    UInt32, 16)
PKEY_Contact_JA_CompanyNamePhonetic.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JA_FirstNamePhonetic := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JA_FirstNamePhonetic.fmtid),
    Guid.Ptr, Guid("{897b3694-fe9e-43e6-8066-260f590c0100}"),
    UInt32, 16)
PKEY_Contact_JA_FirstNamePhonetic.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JA_LastNamePhonetic := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JA_LastNamePhonetic.fmtid),
    Guid.Ptr, Guid("{897b3694-fe9e-43e6-8066-260f590c0100}"),
    UInt32, 16)
PKEY_Contact_JA_LastNamePhonetic.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo1CompanyAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo1CompanyAddress.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo1CompanyAddress.pid := 120

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo1CompanyName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo1CompanyName.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo1CompanyName.pid := 102

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo1Department := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo1Department.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo1Department.pid := 106

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo1Manager := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo1Manager.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo1Manager.pid := 105

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo1OfficeLocation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo1OfficeLocation.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo1OfficeLocation.pid := 104

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo1Title := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo1Title.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo1Title.pid := 103

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo1YomiCompanyName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo1YomiCompanyName.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo1YomiCompanyName.pid := 101

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo2CompanyAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo2CompanyAddress.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo2CompanyAddress.pid := 121

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo2CompanyName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo2CompanyName.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo2CompanyName.pid := 108

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo2Department := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo2Department.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo2Department.pid := 113

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo2Manager := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo2Manager.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo2Manager.pid := 112

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo2OfficeLocation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo2OfficeLocation.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo2OfficeLocation.pid := 110

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo2Title := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo2Title.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo2Title.pid := 109

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo2YomiCompanyName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo2YomiCompanyName.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo2YomiCompanyName.pid := 107

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo3CompanyAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo3CompanyAddress.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo3CompanyAddress.pid := 123

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo3CompanyName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo3CompanyName.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo3CompanyName.pid := 115

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo3Department := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo3Department.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo3Department.pid := 119

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo3Manager := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo3Manager.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo3Manager.pid := 118

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo3OfficeLocation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo3OfficeLocation.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo3OfficeLocation.pid := 117

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo3Title := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo3Title.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo3Title.pid := 116

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobInfo3YomiCompanyName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobInfo3YomiCompanyName.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_JobInfo3YomiCompanyName.pid := 114

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_JobTitle := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_JobTitle.fmtid),
    Guid.Ptr, Guid("{176dc63c-2688-4e89-8143-a347800f25e9}"),
    UInt32, 16)
PKEY_Contact_JobTitle.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_Label := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_Label.fmtid),
    Guid.Ptr, Guid("{97b0ad89-df49-49cc-834e-660974fd755b}"),
    UInt32, 16)
PKEY_Contact_Label.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_LastName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_LastName.fmtid),
    Guid.Ptr, Guid("{8f367200-c270-457c-b1d4-e07c5bcd90c7}"),
    UInt32, 16)
PKEY_Contact_LastName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_MailingAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_MailingAddress.fmtid),
    Guid.Ptr, Guid("{c0ac206a-827e-4650-95ae-77e2bb74fcc9}"),
    UInt32, 16)
PKEY_Contact_MailingAddress.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_MiddleName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_MiddleName.fmtid),
    Guid.Ptr, Guid("{176dc63c-2688-4e89-8143-a347800f25e9}"),
    UInt32, 16)
PKEY_Contact_MiddleName.pid := 71

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_MobileTelephone := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_MobileTelephone.fmtid),
    Guid.Ptr, Guid("{176dc63c-2688-4e89-8143-a347800f25e9}"),
    UInt32, 16)
PKEY_Contact_MobileTelephone.pid := 35

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_NickName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_NickName.fmtid),
    Guid.Ptr, Guid("{176dc63c-2688-4e89-8143-a347800f25e9}"),
    UInt32, 16)
PKEY_Contact_NickName.pid := 74

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OfficeLocation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OfficeLocation.fmtid),
    Guid.Ptr, Guid("{176dc63c-2688-4e89-8143-a347800f25e9}"),
    UInt32, 16)
PKEY_Contact_OfficeLocation.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddress.fmtid),
    Guid.Ptr, Guid("{508161fa-313b-43d5-83a1-c1accf68622c}"),
    UInt32, 16)
PKEY_Contact_OtherAddress.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddress1Country := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddress1Country.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_OtherAddress1Country.pid := 134

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddress1Locality := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddress1Locality.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_OtherAddress1Locality.pid := 132

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddress1PostalCode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddress1PostalCode.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_OtherAddress1PostalCode.pid := 135

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddress1Region := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddress1Region.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_OtherAddress1Region.pid := 133

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddress1Street := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddress1Street.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_OtherAddress1Street.pid := 131

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddress2Country := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddress2Country.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_OtherAddress2Country.pid := 139

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddress2Locality := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddress2Locality.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_OtherAddress2Locality.pid := 137

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddress2PostalCode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddress2PostalCode.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_OtherAddress2PostalCode.pid := 140

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddress2Region := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddress2Region.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_OtherAddress2Region.pid := 138

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddress2Street := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddress2Street.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_OtherAddress2Street.pid := 136

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddress3Country := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddress3Country.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_OtherAddress3Country.pid := 144

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddress3Locality := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddress3Locality.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_OtherAddress3Locality.pid := 142

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddress3PostalCode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddress3PostalCode.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_OtherAddress3PostalCode.pid := 145

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddress3Region := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddress3Region.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_OtherAddress3Region.pid := 143

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddress3Street := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddress3Street.fmtid),
    Guid.Ptr, Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}"),
    UInt32, 16)
PKEY_Contact_OtherAddress3Street.pid := 141

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddressCity := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddressCity.fmtid),
    Guid.Ptr, Guid("{6e682923-7f7b-4f0c-a337-cfca296687bf}"),
    UInt32, 16)
PKEY_Contact_OtherAddressCity.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddressCountry := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddressCountry.fmtid),
    Guid.Ptr, Guid("{8f167568-0aae-4322-8ed9-6055b7b0e398}"),
    UInt32, 16)
PKEY_Contact_OtherAddressCountry.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddressPostalCode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddressPostalCode.fmtid),
    Guid.Ptr, Guid("{95c656c1-2abf-4148-9ed3-9ec602e3b7cd}"),
    UInt32, 16)
PKEY_Contact_OtherAddressPostalCode.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddressPostOfficeBox := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddressPostOfficeBox.fmtid),
    Guid.Ptr, Guid("{8b26ea41-058f-43f6-aecc-4035681ce977}"),
    UInt32, 16)
PKEY_Contact_OtherAddressPostOfficeBox.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddressState := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddressState.fmtid),
    Guid.Ptr, Guid("{71b377d6-e570-425f-a170-809fae73e54e}"),
    UInt32, 16)
PKEY_Contact_OtherAddressState.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherAddressStreet := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherAddressStreet.fmtid),
    Guid.Ptr, Guid("{ff962609-b7d6-4999-862d-95180d529aea}"),
    UInt32, 16)
PKEY_Contact_OtherAddressStreet.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_OtherEmailAddresses := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_OtherEmailAddresses.fmtid),
    Guid.Ptr, Guid("{11d6336b-38c4-4ec9-84d6-eb38d0b150af}"),
    UInt32, 16)
PKEY_Contact_OtherEmailAddresses.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_PagerTelephone := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_PagerTelephone.fmtid),
    Guid.Ptr, Guid("{d6304e01-f8f5-4f45-8b15-d024a6296789}"),
    UInt32, 16)
PKEY_Contact_PagerTelephone.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_PersonalTitle := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_PersonalTitle.fmtid),
    Guid.Ptr, Guid("{176dc63c-2688-4e89-8143-a347800f25e9}"),
    UInt32, 16)
PKEY_Contact_PersonalTitle.pid := 69

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_PhoneNumbersCanonical := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_PhoneNumbersCanonical.fmtid),
    Guid.Ptr, Guid("{d042d2a1-927e-40b5-a503-6edbd42a517e}"),
    UInt32, 16)
PKEY_Contact_PhoneNumbersCanonical.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_Prefix := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_Prefix.fmtid),
    Guid.Ptr, Guid("{176dc63c-2688-4e89-8143-a347800f25e9}"),
    UInt32, 16)
PKEY_Contact_Prefix.pid := 75

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_PrimaryAddressCity := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_PrimaryAddressCity.fmtid),
    Guid.Ptr, Guid("{c8ea94f0-a9e3-4969-a94b-9c62a95324e0}"),
    UInt32, 16)
PKEY_Contact_PrimaryAddressCity.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_PrimaryAddressCountry := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_PrimaryAddressCountry.fmtid),
    Guid.Ptr, Guid("{e53d799d-0f3f-466e-b2ff-74634a3cb7a4}"),
    UInt32, 16)
PKEY_Contact_PrimaryAddressCountry.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_PrimaryAddressPostalCode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_PrimaryAddressPostalCode.fmtid),
    Guid.Ptr, Guid("{18bbd425-ecfd-46ef-b612-7b4a6034eda0}"),
    UInt32, 16)
PKEY_Contact_PrimaryAddressPostalCode.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_PrimaryAddressPostOfficeBox := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_PrimaryAddressPostOfficeBox.fmtid),
    Guid.Ptr, Guid("{de5ef3c7-46e1-484e-9999-62c5308394c1}"),
    UInt32, 16)
PKEY_Contact_PrimaryAddressPostOfficeBox.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_PrimaryAddressState := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_PrimaryAddressState.fmtid),
    Guid.Ptr, Guid("{f1176dfe-7138-4640-8b4c-ae375dc70a6d}"),
    UInt32, 16)
PKEY_Contact_PrimaryAddressState.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_PrimaryAddressStreet := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_PrimaryAddressStreet.fmtid),
    Guid.Ptr, Guid("{63c25b20-96be-488f-8788-c09c407ad812}"),
    UInt32, 16)
PKEY_Contact_PrimaryAddressStreet.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_PrimaryEmailAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_PrimaryEmailAddress.fmtid),
    Guid.Ptr, Guid("{176dc63c-2688-4e89-8143-a347800f25e9}"),
    UInt32, 16)
PKEY_Contact_PrimaryEmailAddress.pid := 48

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_PrimaryTelephone := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_PrimaryTelephone.fmtid),
    Guid.Ptr, Guid("{176dc63c-2688-4e89-8143-a347800f25e9}"),
    UInt32, 16)
PKEY_Contact_PrimaryTelephone.pid := 25

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_Profession := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_Profession.fmtid),
    Guid.Ptr, Guid("{7268af55-1ce4-4f6e-a41f-b6e4ef10e4a9}"),
    UInt32, 16)
PKEY_Contact_Profession.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_SpouseName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_SpouseName.fmtid),
    Guid.Ptr, Guid("{9d2408b6-3167-422b-82b0-f583b7a7cfe3}"),
    UInt32, 16)
PKEY_Contact_SpouseName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_Suffix := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_Suffix.fmtid),
    Guid.Ptr, Guid("{176dc63c-2688-4e89-8143-a347800f25e9}"),
    UInt32, 16)
PKEY_Contact_Suffix.pid := 73

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_TelexNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_TelexNumber.fmtid),
    Guid.Ptr, Guid("{c554493c-c1f7-40c1-a76c-ef8c0614003e}"),
    UInt32, 16)
PKEY_Contact_TelexNumber.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_TTYTDDTelephone := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_TTYTDDTelephone.fmtid),
    Guid.Ptr, Guid("{aaf16bac-2b55-45e6-9f6d-415eb94910df}"),
    UInt32, 16)
PKEY_Contact_TTYTDDTelephone.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_WebPage := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_WebPage.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_Contact_WebPage.pid := 18

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_Webpage2 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_Webpage2.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_Webpage2.pid := 124

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Contact_Webpage3 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Contact_Webpage3.fmtid),
    Guid.Ptr, Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}"),
    UInt32, 16)
PKEY_Contact_Webpage3.pid := 125

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AcquisitionID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AcquisitionID.fmtid),
    Guid.Ptr, Guid("{65a98875-3c80-40ab-abbc-efdaf77dbee2}"),
    UInt32, 16)
PKEY_AcquisitionID.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ApplicationDefinedProperties := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ApplicationDefinedProperties.fmtid),
    Guid.Ptr, Guid("{cdbfc167-337e-41d8-af7c-8c09205429c7}"),
    UInt32, 16)
PKEY_ApplicationDefinedProperties.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ApplicationName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ApplicationName.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_ApplicationName.pid := 18

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AppZoneIdentifier := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AppZoneIdentifier.fmtid),
    Guid.Ptr, Guid("{502cfeab-47eb-459c-b960-e6d8728f7701}"),
    UInt32, 16)
PKEY_AppZoneIdentifier.pid := 102

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Author := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Author.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_Author.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CachedFileUpdaterContentIdForConflictResolution := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CachedFileUpdaterContentIdForConflictResolution.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_CachedFileUpdaterContentIdForConflictResolution.pid := 114

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CachedFileUpdaterContentIdForStream := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CachedFileUpdaterContentIdForStream.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_CachedFileUpdaterContentIdForStream.pid := 113

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Capacity := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Capacity.fmtid),
    Guid.Ptr, Guid("{9b174b35-40ff-11d2-a27e-00c04fc30871}"),
    UInt32, 16)
PKEY_Capacity.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Category := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Category.fmtid),
    Guid.Ptr, Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}"),
    UInt32, 16)
PKEY_Category.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Comment := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Comment.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_Comment.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Company := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Company.fmtid),
    Guid.Ptr, Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}"),
    UInt32, 16)
PKEY_Company.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ComputerName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ComputerName.fmtid),
    Guid.Ptr, Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}"),
    UInt32, 16)
PKEY_ComputerName.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ContainedItems := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ContainedItems.fmtid),
    Guid.Ptr, Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}"),
    UInt32, 16)
PKEY_ContainedItems.pid := 29

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ContentId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ContentId.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_ContentId.pid := 132

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ContentStatus := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ContentStatus.fmtid),
    Guid.Ptr, Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}"),
    UInt32, 16)
PKEY_ContentStatus.pid := 27

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ContentType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ContentType.fmtid),
    Guid.Ptr, Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}"),
    UInt32, 16)
PKEY_ContentType.pid := 26

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ContentUri := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ContentUri.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_ContentUri.pid := 131

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Copyright := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Copyright.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Copyright.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CreatorAppId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CreatorAppId.fmtid),
    Guid.Ptr, Guid("{c2ea046e-033c-4e91-bd5b-d4942f6bbe49}"),
    UInt32, 16)
PKEY_CreatorAppId.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CreatorOpenWithUIOptions := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CreatorOpenWithUIOptions.fmtid),
    Guid.Ptr, Guid("{c2ea046e-033c-4e91-bd5b-d4942f6bbe49}"),
    UInt32, 16)
PKEY_CreatorOpenWithUIOptions.pid := 3

/**
 * @type {Integer (UInt32)}
 */
export global CREATOROPENWITHUIOPTION_HIDDEN := 0

/**
 * @type {Integer (UInt32)}
 */
export global CREATOROPENWITHUIOPTION_VISIBLE := 1

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DataObjectFormat := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DataObjectFormat.fmtid),
    Guid.Ptr, Guid("{1e81a3f8-a30f-4247-b9ee-1d0368a9425c}"),
    UInt32, 16)
PKEY_DataObjectFormat.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DateAccessed := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DateAccessed.fmtid),
    Guid.Ptr, Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}"),
    UInt32, 16)
PKEY_DateAccessed.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DateAcquired := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DateAcquired.fmtid),
    Guid.Ptr, Guid("{2cbaa8f5-d81f-47ca-b17a-f8d822300131}"),
    UInt32, 16)
PKEY_DateAcquired.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DateArchived := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DateArchived.fmtid),
    Guid.Ptr, Guid("{43f8d7b7-a444-4f87-9383-52271c9b915c}"),
    UInt32, 16)
PKEY_DateArchived.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DateCompleted := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DateCompleted.fmtid),
    Guid.Ptr, Guid("{72fab781-acda-43e5-b155-b2434f85e678}"),
    UInt32, 16)
PKEY_DateCompleted.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DateCreated := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DateCreated.fmtid),
    Guid.Ptr, Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}"),
    UInt32, 16)
PKEY_DateCreated.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DateImported := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DateImported.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_DateImported.pid := 18258

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DateModified := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DateModified.fmtid),
    Guid.Ptr, Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}"),
    UInt32, 16)
PKEY_DateModified.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DefaultSaveLocationDisplay := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DefaultSaveLocationDisplay.fmtid),
    Guid.Ptr, Guid("{5d76b67f-9b3d-44bb-b6ae-25da4f638a67}"),
    UInt32, 16)
PKEY_DefaultSaveLocationDisplay.pid := 10

/**
 * @type {Integer (UInt32)}
 */
export global ISDEFAULTSAVE_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global ISDEFAULTSAVE_OWNER := 1

/**
 * @type {Integer (UInt32)}
 */
export global ISDEFAULTSAVE_NONOWNER := 2

/**
 * @type {Integer (UInt32)}
 */
export global ISDEFAULTSAVE_BOTH := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DueDate := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DueDate.fmtid),
    Guid.Ptr, Guid("{3f8472b5-e0af-4db2-8071-c53fe76ae7ce}"),
    UInt32, 16)
PKEY_DueDate.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_EndDate := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_EndDate.fmtid),
    Guid.Ptr, Guid("{c75faa05-96fd-49e7-9cb4-9f601082d553}"),
    UInt32, 16)
PKEY_EndDate.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ExpandoProperties := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ExpandoProperties.fmtid),
    Guid.Ptr, Guid("{6fa20de6-d11c-4d9d-a154-64317628c12d}"),
    UInt32, 16)
PKEY_ExpandoProperties.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FileAllocationSize := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FileAllocationSize.fmtid),
    Guid.Ptr, Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}"),
    UInt32, 16)
PKEY_FileAllocationSize.pid := 18

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FileAttributes := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FileAttributes.fmtid),
    Guid.Ptr, Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}"),
    UInt32, 16)
PKEY_FileAttributes.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FileCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FileCount.fmtid),
    Guid.Ptr, Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}"),
    UInt32, 16)
PKEY_FileCount.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FileDescription := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FileDescription.fmtid),
    Guid.Ptr, Guid("{0cef7d53-fa64-11d1-a203-0000f81fedee}"),
    UInt32, 16)
PKEY_FileDescription.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FileExtension := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FileExtension.fmtid),
    Guid.Ptr, Guid("{e4f10a3c-49e6-405d-8288-a23bd4eeaa6c}"),
    UInt32, 16)
PKEY_FileExtension.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FileFRN := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FileFRN.fmtid),
    Guid.Ptr, Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}"),
    UInt32, 16)
PKEY_FileFRN.pid := 21

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FileName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FileName.fmtid),
    Guid.Ptr, Guid("{41cf5ae0-f75a-4806-bd87-59c7d9248eb9}"),
    UInt32, 16)
PKEY_FileName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FileOfflineAvailabilityStatus := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FileOfflineAvailabilityStatus.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_FileOfflineAvailabilityStatus.pid := 100

/**
 * @type {Integer (UInt32)}
 */
export global FILEOFFLINEAVAILABILITYSTATUS_NOTAVAILABLEOFFLINE := 0

/**
 * @type {Integer (UInt32)}
 */
export global FILEOFFLINEAVAILABILITYSTATUS_PARTIAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILEOFFLINEAVAILABILITYSTATUS_COMPLETE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILEOFFLINEAVAILABILITYSTATUS_COMPLETE_PINNED := 3

/**
 * @type {Integer (UInt32)}
 */
export global FILEOFFLINEAVAILABILITYSTATUS_EXCLUDED := 4

/**
 * @type {Integer (UInt32)}
 */
export global FILEOFFLINEAVAILABILITYSTATUS_FOLDER_EMPTY := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FileOwner := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FileOwner.fmtid),
    Guid.Ptr, Guid("{9b174b34-40ff-11d2-a27e-00c04fc30871}"),
    UInt32, 16)
PKEY_FileOwner.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FilePlaceholderStatus := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FilePlaceholderStatus.fmtid),
    Guid.Ptr, Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}"),
    UInt32, 16)
PKEY_FilePlaceholderStatus.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FileVersion := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FileVersion.fmtid),
    Guid.Ptr, Guid("{0cef7d53-fa64-11d1-a203-0000f81fedee}"),
    UInt32, 16)
PKEY_FileVersion.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FindData := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FindData.fmtid),
    Guid.Ptr, Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}"),
    UInt32, 16)
PKEY_FindData.pid := 0

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FlagColor := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FlagColor.fmtid),
    Guid.Ptr, Guid("{67df94de-0ca7-4d6f-b792-053a3e4f03cf}"),
    UInt32, 16)
PKEY_FlagColor.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FlagColorText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FlagColorText.fmtid),
    Guid.Ptr, Guid("{45eae747-8e2a-40ae-8cbf-ca52aba6152a}"),
    UInt32, 16)
PKEY_FlagColorText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FlagStatus := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FlagStatus.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_FlagStatus.pid := 12

/**
 * @type {Integer (Int32)}
 */
export global FLAGSTATUS_NOTFLAGGED := 0

/**
 * @type {Integer (Int32)}
 */
export global FLAGSTATUS_COMPLETED := 1

/**
 * @type {Integer (Int32)}
 */
export global FLAGSTATUS_FOLLOWUP := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FlagStatusText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FlagStatusText.fmtid),
    Guid.Ptr, Guid("{dc54fd2e-189d-4871-aa01-08c2f57a4abc}"),
    UInt32, 16)
PKEY_FlagStatusText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FolderKind := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FolderKind.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_FolderKind.pid := 101

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FolderNameDisplay := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FolderNameDisplay.fmtid),
    Guid.Ptr, Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}"),
    UInt32, 16)
PKEY_FolderNameDisplay.pid := 25

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FreeSpace := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FreeSpace.fmtid),
    Guid.Ptr, Guid("{9b174b35-40ff-11d2-a27e-00c04fc30871}"),
    UInt32, 16)
PKEY_FreeSpace.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FullText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FullText.fmtid),
    Guid.Ptr, Guid("{1e3ee840-bc2b-476c-8237-2acd1a839b22}"),
    UInt32, 16)
PKEY_FullText.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_HighKeywords := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_HighKeywords.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_HighKeywords.pid := 24

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Identity := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Identity.fmtid),
    Guid.Ptr, Guid("{a26f4afc-7346-4299-be47-eb1ae613139f}"),
    UInt32, 16)
PKEY_Identity.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Identity_Blob := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Identity_Blob.fmtid),
    Guid.Ptr, Guid("{8c3b93a4-baed-1a83-9a32-102ee313f6eb}"),
    UInt32, 16)
PKEY_Identity_Blob.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Identity_DisplayName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Identity_DisplayName.fmtid),
    Guid.Ptr, Guid("{7d683fc9-d155-45a8-bb1f-89d19bcb792f}"),
    UInt32, 16)
PKEY_Identity_DisplayName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Identity_InternetSid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Identity_InternetSid.fmtid),
    Guid.Ptr, Guid("{6d6d5d49-265d-4688-9f4e-1fdd33e7cc83}"),
    UInt32, 16)
PKEY_Identity_InternetSid.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Identity_IsMeIdentity := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Identity_IsMeIdentity.fmtid),
    Guid.Ptr, Guid("{a4108708-09df-4377-9dfc-6d99986d5a67}"),
    UInt32, 16)
PKEY_Identity_IsMeIdentity.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Identity_KeyProviderContext := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Identity_KeyProviderContext.fmtid),
    Guid.Ptr, Guid("{a26f4afc-7346-4299-be47-eb1ae613139f}"),
    UInt32, 16)
PKEY_Identity_KeyProviderContext.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Identity_KeyProviderName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Identity_KeyProviderName.fmtid),
    Guid.Ptr, Guid("{a26f4afc-7346-4299-be47-eb1ae613139f}"),
    UInt32, 16)
PKEY_Identity_KeyProviderName.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Identity_LogonStatusString := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Identity_LogonStatusString.fmtid),
    Guid.Ptr, Guid("{f18dedf3-337f-42c0-9e03-cee08708a8c3}"),
    UInt32, 16)
PKEY_Identity_LogonStatusString.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Identity_PrimaryEmailAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Identity_PrimaryEmailAddress.fmtid),
    Guid.Ptr, Guid("{fcc16823-baed-4f24-9b32-a0982117f7fa}"),
    UInt32, 16)
PKEY_Identity_PrimaryEmailAddress.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Identity_PrimarySid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Identity_PrimarySid.fmtid),
    Guid.Ptr, Guid("{2b1b801e-c0c1-4987-9ec5-72fa89814787}"),
    UInt32, 16)
PKEY_Identity_PrimarySid.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Identity_ProviderData := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Identity_ProviderData.fmtid),
    Guid.Ptr, Guid("{a8a74b92-361b-4e9a-b722-7c4a7330a312}"),
    UInt32, 16)
PKEY_Identity_ProviderData.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Identity_ProviderID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Identity_ProviderID.fmtid),
    Guid.Ptr, Guid("{74a7de49-fa11-4d3d-a006-db7e08675916}"),
    UInt32, 16)
PKEY_Identity_ProviderID.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Identity_QualifiedUserName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Identity_QualifiedUserName.fmtid),
    Guid.Ptr, Guid("{da520e51-f4e9-4739-ac82-02e0a95c9030}"),
    UInt32, 16)
PKEY_Identity_QualifiedUserName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Identity_UniqueID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Identity_UniqueID.fmtid),
    Guid.Ptr, Guid("{e55fc3b0-2b60-4220-918e-b21e8bf16016}"),
    UInt32, 16)
PKEY_Identity_UniqueID.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Identity_UserName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Identity_UserName.fmtid),
    Guid.Ptr, Guid("{c4322503-78ca-49c6-9acc-a68e2afd7b6b}"),
    UInt32, 16)
PKEY_Identity_UserName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_IdentityProvider_Name := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_IdentityProvider_Name.fmtid),
    Guid.Ptr, Guid("{b96eff7b-35ca-4a35-8607-29e3a54c46ea}"),
    UInt32, 16)
PKEY_IdentityProvider_Name.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_IdentityProvider_Picture := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_IdentityProvider_Picture.fmtid),
    Guid.Ptr, Guid("{2425166f-5642-4864-992f-98fd98f294c3}"),
    UInt32, 16)
PKEY_IdentityProvider_Picture.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ImageParsingName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ImageParsingName.fmtid),
    Guid.Ptr, Guid("{d7750ee0-c6a4-48ec-b53e-b87b52e6d073}"),
    UInt32, 16)
PKEY_ImageParsingName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Importance := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Importance.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_Importance.pid := 11

/**
 * @type {Integer (Int32)}
 */
export global IMPORTANCE_LOW_MIN := 0

/**
 * @type {Integer (Int32)}
 */
export global IMPORTANCE_LOW_SET := 1

/**
 * @type {Integer (Int32)}
 */
export global IMPORTANCE_LOW_MAX := 1

/**
 * @type {Integer (Int32)}
 */
export global IMPORTANCE_NORMAL_MIN := 2

/**
 * @type {Integer (Int32)}
 */
export global IMPORTANCE_NORMAL_SET := 3

/**
 * @type {Integer (Int32)}
 */
export global IMPORTANCE_NORMAL_MAX := 4

/**
 * @type {Integer (Int32)}
 */
export global IMPORTANCE_HIGH_MIN := 5

/**
 * @type {Integer (Int32)}
 */
export global IMPORTANCE_HIGH_SET := 5

/**
 * @type {Integer (Int32)}
 */
export global IMPORTANCE_HIGH_MAX := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ImportanceText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ImportanceText.fmtid),
    Guid.Ptr, Guid("{a3b29791-7713-4e1d-bb40-17db85f01831}"),
    UInt32, 16)
PKEY_ImportanceText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_IsAttachment := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_IsAttachment.fmtid),
    Guid.Ptr, Guid("{f23f425c-71a1-4fa8-922f-678ea4a60408}"),
    UInt32, 16)
PKEY_IsAttachment.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_IsDefaultNonOwnerSaveLocation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_IsDefaultNonOwnerSaveLocation.fmtid),
    Guid.Ptr, Guid("{5d76b67f-9b3d-44bb-b6ae-25da4f638a67}"),
    UInt32, 16)
PKEY_IsDefaultNonOwnerSaveLocation.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_IsDefaultSaveLocation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_IsDefaultSaveLocation.fmtid),
    Guid.Ptr, Guid("{5d76b67f-9b3d-44bb-b6ae-25da4f638a67}"),
    UInt32, 16)
PKEY_IsDefaultSaveLocation.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_IsDeleted := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_IsDeleted.fmtid),
    Guid.Ptr, Guid("{5cda5fc8-33ee-4ff3-9094-ae7bd8868c4d}"),
    UInt32, 16)
PKEY_IsDeleted.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_IsEncrypted := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_IsEncrypted.fmtid),
    Guid.Ptr, Guid("{90e5e14e-648b-4826-b2aa-acaf790e3513}"),
    UInt32, 16)
PKEY_IsEncrypted.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_IsFlagged := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_IsFlagged.fmtid),
    Guid.Ptr, Guid("{5da84765-e3ff-4278-86b0-a27967fbdd03}"),
    UInt32, 16)
PKEY_IsFlagged.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_IsFlaggedComplete := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_IsFlaggedComplete.fmtid),
    Guid.Ptr, Guid("{a6f360d2-55f9-48de-b909-620e090a647c}"),
    UInt32, 16)
PKEY_IsFlaggedComplete.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_IsIncomplete := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_IsIncomplete.fmtid),
    Guid.Ptr, Guid("{346c8bd1-2e6a-4c45-89a4-61b78e8e700f}"),
    UInt32, 16)
PKEY_IsIncomplete.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_IsLocationSupported := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_IsLocationSupported.fmtid),
    Guid.Ptr, Guid("{5d76b67f-9b3d-44bb-b6ae-25da4f638a67}"),
    UInt32, 16)
PKEY_IsLocationSupported.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_IsPinnedToNameSpaceTree := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_IsPinnedToNameSpaceTree.fmtid),
    Guid.Ptr, Guid("{5d76b67f-9b3d-44bb-b6ae-25da4f638a67}"),
    UInt32, 16)
PKEY_IsPinnedToNameSpaceTree.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_IsRead := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_IsRead.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_IsRead.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_IsSearchOnlyItem := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_IsSearchOnlyItem.fmtid),
    Guid.Ptr, Guid("{5d76b67f-9b3d-44bb-b6ae-25da4f638a67}"),
    UInt32, 16)
PKEY_IsSearchOnlyItem.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_IsSendToTarget := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_IsSendToTarget.fmtid),
    Guid.Ptr, Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}"),
    UInt32, 16)
PKEY_IsSendToTarget.pid := 33

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_IsShared := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_IsShared.fmtid),
    Guid.Ptr, Guid("{ef884c5b-2bfe-41bb-aae5-76eedf4f9902}"),
    UInt32, 16)
PKEY_IsShared.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ItemAuthors := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ItemAuthors.fmtid),
    Guid.Ptr, Guid("{d0a04f0a-462a-48a4-bb2f-3706e88dbd7d}"),
    UInt32, 16)
PKEY_ItemAuthors.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ItemClassType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ItemClassType.fmtid),
    Guid.Ptr, Guid("{048658ad-2db8-41a4-bbb6-ac1ef1207eb1}"),
    UInt32, 16)
PKEY_ItemClassType.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ItemDate := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ItemDate.fmtid),
    Guid.Ptr, Guid("{f7db74b4-4287-4103-afba-f1b13dcd75cf}"),
    UInt32, 16)
PKEY_ItemDate.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ItemFolderNameDisplay := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ItemFolderNameDisplay.fmtid),
    Guid.Ptr, Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}"),
    UInt32, 16)
PKEY_ItemFolderNameDisplay.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ItemFolderPathDisplay := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ItemFolderPathDisplay.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_ItemFolderPathDisplay.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ItemFolderPathDisplayNarrow := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ItemFolderPathDisplayNarrow.fmtid),
    Guid.Ptr, Guid("{dabd30ed-0043-4789-a7f8-d013a4736622}"),
    UInt32, 16)
PKEY_ItemFolderPathDisplayNarrow.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ItemName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ItemName.fmtid),
    Guid.Ptr, Guid("{6b8da074-3b5c-43bc-886f-0a2cdce00b6f}"),
    UInt32, 16)
PKEY_ItemName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ItemNameDisplay := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ItemNameDisplay.fmtid),
    Guid.Ptr, Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}"),
    UInt32, 16)
PKEY_ItemNameDisplay.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ItemNameDisplayWithoutExtension := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ItemNameDisplayWithoutExtension.fmtid),
    Guid.Ptr, Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}"),
    UInt32, 16)
PKEY_ItemNameDisplayWithoutExtension.pid := 24

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ItemNamePrefix := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ItemNamePrefix.fmtid),
    Guid.Ptr, Guid("{d7313ff1-a77a-401c-8c99-3dbdd68add36}"),
    UInt32, 16)
PKEY_ItemNamePrefix.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ItemNameSortOverride := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ItemNameSortOverride.fmtid),
    Guid.Ptr, Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}"),
    UInt32, 16)
PKEY_ItemNameSortOverride.pid := 23

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ItemParticipants := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ItemParticipants.fmtid),
    Guid.Ptr, Guid("{d4d0aa16-9948-41a4-aa85-d97ff9646993}"),
    UInt32, 16)
PKEY_ItemParticipants.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ItemPathDisplay := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ItemPathDisplay.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_ItemPathDisplay.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ItemPathDisplayNarrow := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ItemPathDisplayNarrow.fmtid),
    Guid.Ptr, Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}"),
    UInt32, 16)
PKEY_ItemPathDisplayNarrow.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ItemSubType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ItemSubType.fmtid),
    Guid.Ptr, Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}"),
    UInt32, 16)
PKEY_ItemSubType.pid := 37

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ItemType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ItemType.fmtid),
    Guid.Ptr, Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}"),
    UInt32, 16)
PKEY_ItemType.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ItemTypeText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ItemTypeText.fmtid),
    Guid.Ptr, Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}"),
    UInt32, 16)
PKEY_ItemTypeText.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ItemUrl := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ItemUrl.fmtid),
    Guid.Ptr, Guid("{49691c90-7e17-101a-a91c-08002b2ecda9}"),
    UInt32, 16)
PKEY_ItemUrl.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Keywords := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Keywords.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_Keywords.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Kind := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Kind.fmtid),
    Guid.Ptr, Guid("{1e3ee840-bc2b-476c-8237-2acd1a839b22}"),
    UInt32, 16)
PKEY_Kind.pid := 3

/**
 * @type {String}
 */
export global KIND_CALENDAR := "calendar"

/**
 * @type {String}
 */
export global KIND_COMMUNICATION := "communication"

/**
 * @type {String}
 */
export global KIND_CONTACT := "contact"

/**
 * @type {String}
 */
export global KIND_DOCUMENT := "document"

/**
 * @type {String}
 */
export global KIND_EMAIL := "email"

/**
 * @type {String}
 */
export global KIND_FEED := "feed"

/**
 * @type {String}
 */
export global KIND_FOLDER := "folder"

/**
 * @type {String}
 */
export global KIND_GAME := "game"

/**
 * @type {String}
 */
export global KIND_INSTANTMESSAGE := "instantmessage"

/**
 * @type {String}
 */
export global KIND_JOURNAL := "journal"

/**
 * @type {String}
 */
export global KIND_LINK := "link"

/**
 * @type {String}
 */
export global KIND_MOVIE := "movie"

/**
 * @type {String}
 */
export global KIND_MUSIC := "music"

/**
 * @type {String}
 */
export global KIND_NOTE := "note"

/**
 * @type {String}
 */
export global KIND_PICTURE := "picture"

/**
 * @type {String}
 */
export global KIND_PLAYLIST := "playlist"

/**
 * @type {String}
 */
export global KIND_PROGRAM := "program"

/**
 * @type {String}
 */
export global KIND_RECORDEDTV := "recordedtv"

/**
 * @type {String}
 */
export global KIND_SEARCHFOLDER := "searchfolder"

/**
 * @type {String}
 */
export global KIND_TASK := "task"

/**
 * @type {String}
 */
export global KIND_VIDEO := "video"

/**
 * @type {String}
 */
export global KIND_WEBHISTORY := "webhistory"

/**
 * @type {String}
 */
export global KIND_UNKNOWN := "unknown"

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_KindText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_KindText.fmtid),
    Guid.Ptr, Guid("{f04bef95-c585-4197-a2b7-df46fdc9ee6d}"),
    UInt32, 16)
PKEY_KindText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Language := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Language.fmtid),
    Guid.Ptr, Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}"),
    UInt32, 16)
PKEY_Language.pid := 28

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_LastSyncError := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_LastSyncError.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_LastSyncError.pid := 107

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_LastSyncWarning := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_LastSyncWarning.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_LastSyncWarning.pid := 128

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_LastWriterPackageFamilyName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_LastWriterPackageFamilyName.fmtid),
    Guid.Ptr, Guid("{502cfeab-47eb-459c-b960-e6d8728f7701}"),
    UInt32, 16)
PKEY_LastWriterPackageFamilyName.pid := 101

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_LowKeywords := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_LowKeywords.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_LowKeywords.pid := 25

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MediumKeywords := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MediumKeywords.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_MediumKeywords.pid := 26

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MileageInformation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MileageInformation.fmtid),
    Guid.Ptr, Guid("{fdf84370-031a-4add-9e91-0d775f1c6605}"),
    UInt32, 16)
PKEY_MileageInformation.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MIMEType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MIMEType.fmtid),
    Guid.Ptr, Guid("{0b63e350-9ccc-11d0-bcdb-00805fccce04}"),
    UInt32, 16)
PKEY_MIMEType.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Null := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Null.fmtid),
    Guid.Ptr, Guid("{00000000-0000-0000-0000-000000000000}"),
    UInt32, 16)
PKEY_Null.pid := 0

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_OfflineAvailability := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_OfflineAvailability.fmtid),
    Guid.Ptr, Guid("{a94688b6-7d9f-4570-a648-e3dfc0ab2b3f}"),
    UInt32, 16)
PKEY_OfflineAvailability.pid := 100

/**
 * @type {Integer (UInt32)}
 */
export global OFFLINEAVAILABILITY_NOT_AVAILABLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global OFFLINEAVAILABILITY_AVAILABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global OFFLINEAVAILABILITY_ALWAYS_AVAILABLE := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_OfflineStatus := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_OfflineStatus.fmtid),
    Guid.Ptr, Guid("{6d24888f-4718-4bda-afed-ea0fb4386cd8}"),
    UInt32, 16)
PKEY_OfflineStatus.pid := 100

/**
 * @type {Integer (UInt32)}
 */
export global OFFLINESTATUS_ONLINE := 0

/**
 * @type {Integer (UInt32)}
 */
export global OFFLINESTATUS_OFFLINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global OFFLINESTATUS_OFFLINE_FORCED := 2

/**
 * @type {Integer (UInt32)}
 */
export global OFFLINESTATUS_OFFLINE_SLOW := 3

/**
 * @type {Integer (UInt32)}
 */
export global OFFLINESTATUS_OFFLINE_ERROR := 4

/**
 * @type {Integer (UInt32)}
 */
export global OFFLINESTATUS_OFFLINE_ITEM_VERSION_CONFLICT := 5

/**
 * @type {Integer (UInt32)}
 */
export global OFFLINESTATUS_OFFLINE_SUSPENDED := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_OriginalFileName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_OriginalFileName.fmtid),
    Guid.Ptr, Guid("{0cef7d53-fa64-11d1-a203-0000f81fedee}"),
    UInt32, 16)
PKEY_OriginalFileName.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_OwnerSID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_OwnerSID.fmtid),
    Guid.Ptr, Guid("{5d76b67f-9b3d-44bb-b6ae-25da4f638a67}"),
    UInt32, 16)
PKEY_OwnerSID.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ParentalRating := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ParentalRating.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_ParentalRating.pid := 21

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ParentalRatingReason := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ParentalRatingReason.fmtid),
    Guid.Ptr, Guid("{10984e0a-f9f2-4321-b7ef-baf195af4319}"),
    UInt32, 16)
PKEY_ParentalRatingReason.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ParentalRatingsOrganization := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ParentalRatingsOrganization.fmtid),
    Guid.Ptr, Guid("{a7fe0840-1344-46f0-8d37-52ed712a4bf9}"),
    UInt32, 16)
PKEY_ParentalRatingsOrganization.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ParsingBindContext := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ParsingBindContext.fmtid),
    Guid.Ptr, Guid("{dfb9a04d-362f-4ca3-b30b-0254b17b5b84}"),
    UInt32, 16)
PKEY_ParsingBindContext.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ParsingName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ParsingName.fmtid),
    Guid.Ptr, Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}"),
    UInt32, 16)
PKEY_ParsingName.pid := 24

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ParsingPath := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ParsingPath.fmtid),
    Guid.Ptr, Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}"),
    UInt32, 16)
PKEY_ParsingPath.pid := 30

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PerceivedType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PerceivedType.fmtid),
    Guid.Ptr, Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}"),
    UInt32, 16)
PKEY_PerceivedType.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PercentFull := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PercentFull.fmtid),
    Guid.Ptr, Guid("{9b174b35-40ff-11d2-a27e-00c04fc30871}"),
    UInt32, 16)
PKEY_PercentFull.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Priority := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Priority.fmtid),
    Guid.Ptr, Guid("{9c1fcf74-2d97-41ba-b4ae-cb2e3661a6e4}"),
    UInt32, 16)
PKEY_Priority.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PriorityText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PriorityText.fmtid),
    Guid.Ptr, Guid("{d98be98b-b86b-4095-bf52-9d23b2e0a752}"),
    UInt32, 16)
PKEY_PriorityText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Project := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Project.fmtid),
    Guid.Ptr, Guid("{39a7f922-477c-48de-8bc8-b28441e342e3}"),
    UInt32, 16)
PKEY_Project.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ProviderItemID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ProviderItemID.fmtid),
    Guid.Ptr, Guid("{f21d9941-81f0-471a-adee-4e74b49217ed}"),
    UInt32, 16)
PKEY_ProviderItemID.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Rating := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Rating.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Rating.pid := 9

/**
 * @type {Integer (UInt32)}
 */
export global RATING_ONE_STAR_MIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global RATING_ONE_STAR_SET := 1

/**
 * @type {Integer (UInt32)}
 */
export global RATING_ONE_STAR_MAX := 12

/**
 * @type {Integer (UInt32)}
 */
export global RATING_TWO_STARS_MIN := 13

/**
 * @type {Integer (UInt32)}
 */
export global RATING_TWO_STARS_SET := 25

/**
 * @type {Integer (UInt32)}
 */
export global RATING_TWO_STARS_MAX := 37

/**
 * @type {Integer (UInt32)}
 */
export global RATING_THREE_STARS_MIN := 38

/**
 * @type {Integer (UInt32)}
 */
export global RATING_THREE_STARS_SET := 50

/**
 * @type {Integer (UInt32)}
 */
export global RATING_THREE_STARS_MAX := 62

/**
 * @type {Integer (UInt32)}
 */
export global RATING_FOUR_STARS_MIN := 63

/**
 * @type {Integer (UInt32)}
 */
export global RATING_FOUR_STARS_SET := 75

/**
 * @type {Integer (UInt32)}
 */
export global RATING_FOUR_STARS_MAX := 87

/**
 * @type {Integer (UInt32)}
 */
export global RATING_FIVE_STARS_MIN := 88

/**
 * @type {Integer (UInt32)}
 */
export global RATING_FIVE_STARS_SET := 99

/**
 * @type {Integer (UInt32)}
 */
export global RATING_FIVE_STARS_MAX := 99

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_RatingText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_RatingText.fmtid),
    Guid.Ptr, Guid("{90197ca7-fd8f-4e8c-9da3-b57e1e609295}"),
    UInt32, 16)
PKEY_RatingText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_RemoteConflictingFile := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_RemoteConflictingFile.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_RemoteConflictingFile.pid := 115

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Security_AllowedEnterpriseDataProtectionIdentities := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Security_AllowedEnterpriseDataProtectionIdentities.fmtid),
    Guid.Ptr, Guid("{38d43380-d418-4830-84d5-46935a81c5c6}"),
    UInt32, 16)
PKEY_Security_AllowedEnterpriseDataProtectionIdentities.pid := 32

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Security_EncryptionOwners := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Security_EncryptionOwners.fmtid),
    Guid.Ptr, Guid("{5f5aff6a-37e5-4780-97ea-80c7565cf535}"),
    UInt32, 16)
PKEY_Security_EncryptionOwners.pid := 34

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Security_EncryptionOwnersDisplay := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Security_EncryptionOwnersDisplay.fmtid),
    Guid.Ptr, Guid("{de621b8f-e125-43a3-a32d-5665446d632a}"),
    UInt32, 16)
PKEY_Security_EncryptionOwnersDisplay.pid := 25

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Sensitivity := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Sensitivity.fmtid),
    Guid.Ptr, Guid("{f8d3f6ac-4874-42cb-be59-ab454b30716a}"),
    UInt32, 16)
PKEY_Sensitivity.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_SensitivityText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_SensitivityText.fmtid),
    Guid.Ptr, Guid("{d0c7f054-3f72-4725-8527-129a577cb269}"),
    UInt32, 16)
PKEY_SensitivityText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_SFGAOFlags := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_SFGAOFlags.fmtid),
    Guid.Ptr, Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}"),
    UInt32, 16)
PKEY_SFGAOFlags.pid := 25

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_SharedWith := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_SharedWith.fmtid),
    Guid.Ptr, Guid("{ef884c5b-2bfe-41bb-aae5-76eedf4f9902}"),
    UInt32, 16)
PKEY_SharedWith.pid := 200

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ShareUserRating := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ShareUserRating.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_ShareUserRating.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_SharingStatus := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_SharingStatus.fmtid),
    Guid.Ptr, Guid("{ef884c5b-2bfe-41bb-aae5-76eedf4f9902}"),
    UInt32, 16)
PKEY_SharingStatus.pid := 300

/**
 * @type {Integer (UInt32)}
 */
export global SHARINGSTATUS_NOTSHARED := 0

/**
 * @type {Integer (UInt32)}
 */
export global SHARINGSTATUS_SHARED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SHARINGSTATUS_PRIVATE := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Shell_OmitFromView := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Shell_OmitFromView.fmtid),
    Guid.Ptr, Guid("{de35258c-c695-4cbc-b982-38b0ad24ced0}"),
    UInt32, 16)
PKEY_Shell_OmitFromView.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_SimpleRating := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_SimpleRating.fmtid),
    Guid.Ptr, Guid("{a09f084e-ad41-489f-8076-aa5be3082bca}"),
    UInt32, 16)
PKEY_SimpleRating.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Size := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Size.fmtid),
    Guid.Ptr, Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}"),
    UInt32, 16)
PKEY_Size.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_SoftwareUsed := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_SoftwareUsed.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_SoftwareUsed.pid := 305

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_SourceItem := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_SourceItem.fmtid),
    Guid.Ptr, Guid("{668cdfa5-7a1b-4323-ae4b-e527393a1d81}"),
    UInt32, 16)
PKEY_SourceItem.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_SourcePackageFamilyName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_SourcePackageFamilyName.fmtid),
    Guid.Ptr, Guid("{ffae9db7-1c8d-43ff-818c-84403aa3732d}"),
    UInt32, 16)
PKEY_SourcePackageFamilyName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StartDate := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StartDate.fmtid),
    Guid.Ptr, Guid("{48fd6ec8-8a12-4cdf-a03e-4ec5a511edde}"),
    UInt32, 16)
PKEY_StartDate.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Status := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Status.fmtid),
    Guid.Ptr, Guid("{000214a1-0000-0000-c000-000000000046}"),
    UInt32, 16)
PKEY_Status.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderCallerVersionInformation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderCallerVersionInformation.fmtid),
    Guid.Ptr, Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}"),
    UInt32, 16)
PKEY_StorageProviderCallerVersionInformation.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderCustomPrimaryIcon := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderCustomPrimaryIcon.fmtid),
    Guid.Ptr, Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}"),
    UInt32, 16)
PKEY_StorageProviderCustomPrimaryIcon.pid := 12

/**
 * @type {Integer (UInt32)}
 */
export global STORAGEPROVIDERCUSTOM_ICON_PHONE := 0

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderError := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderError.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_StorageProviderError.pid := 109

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderFileChecksum := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderFileChecksum.fmtid),
    Guid.Ptr, Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}"),
    UInt32, 16)
PKEY_StorageProviderFileChecksum.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderFileCreatedBy := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderFileCreatedBy.fmtid),
    Guid.Ptr, Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}"),
    UInt32, 16)
PKEY_StorageProviderFileCreatedBy.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderFileDateShared := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderFileDateShared.fmtid),
    Guid.Ptr, Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}"),
    UInt32, 16)
PKEY_StorageProviderFileDateShared.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderFileFlags := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderFileFlags.fmtid),
    Guid.Ptr, Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}"),
    UInt32, 16)
PKEY_StorageProviderFileFlags.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderFileHasConflict := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderFileHasConflict.fmtid),
    Guid.Ptr, Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}"),
    UInt32, 16)
PKEY_StorageProviderFileHasConflict.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderFileIdentifier := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderFileIdentifier.fmtid),
    Guid.Ptr, Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}"),
    UInt32, 16)
PKEY_StorageProviderFileIdentifier.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderFileModifiedBy := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderFileModifiedBy.fmtid),
    Guid.Ptr, Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}"),
    UInt32, 16)
PKEY_StorageProviderFileModifiedBy.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderFileRemoteLocation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderFileRemoteLocation.fmtid),
    Guid.Ptr, Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}"),
    UInt32, 16)
PKEY_StorageProviderFileRemoteLocation.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderFileRemoteUri := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderFileRemoteUri.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_StorageProviderFileRemoteUri.pid := 112

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderFileSharedBy := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderFileSharedBy.fmtid),
    Guid.Ptr, Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}"),
    UInt32, 16)
PKEY_StorageProviderFileSharedBy.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderFileVersion := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderFileVersion.fmtid),
    Guid.Ptr, Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}"),
    UInt32, 16)
PKEY_StorageProviderFileVersion.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderFileVersionWaterline := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderFileVersionWaterline.fmtid),
    Guid.Ptr, Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}"),
    UInt32, 16)
PKEY_StorageProviderFileVersionWaterline.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderFullyQualifiedId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderFullyQualifiedId.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_StorageProviderFullyQualifiedId.pid := 119

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderId.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_StorageProviderId.pid := 108

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderShareStatuses := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderShareStatuses.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_StorageProviderShareStatuses.pid := 111

/**
 * @type {String}
 */
export global STORAGE_PROVIDER_SHARE_STATUS_PRIVATE := "Private"

/**
 * @type {String}
 */
export global STORAGE_PROVIDER_SHARE_STATUS_SHARED := "Shared"

/**
 * @type {String}
 */
export global STORAGE_PROVIDER_SHARE_STATUS_PUBLIC := "Public"

/**
 * @type {String}
 */
export global STORAGE_PROVIDER_SHARE_STATUS_GROUP := "Group"

/**
 * @type {String}
 */
export global STORAGE_PROVIDER_SHARE_STATUS_OWNER := "Owner"

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderSharingStatus := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderSharingStatus.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_StorageProviderSharingStatus.pid := 117

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_PROVIDER_SHARINGSTATUS_NOTSHARED := 0

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_PROVIDER_SHARINGSTATUS_SHARED := 1

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_PROVIDER_SHARINGSTATUS_PRIVATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_PROVIDER_SHARINGSTATUS_PUBLIC := 3

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_PROVIDER_SHARINGSTATUS_SHARED_OWNED := 4

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_PROVIDER_SHARINGSTATUS_SHARED_COOWNED := 5

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_PROVIDER_SHARINGSTATUS_PUBLIC_OWNED := 6

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_PROVIDER_SHARINGSTATUS_PUBLIC_COOWNED := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderStatus := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderStatus.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_StorageProviderStatus.pid := 110

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderUserAccountKind := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderUserAccountKind.fmtid),
    Guid.Ptr, Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}"),
    UInt32, 16)
PKEY_StorageProviderUserAccountKind.pid := 17

/**
 * @type {Integer (UInt32)}
 */
export global STORAGEPROVIDERUSERACCOUNTKIND_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global STORAGEPROVIDERUSERACCOUNTKIND_CONSUMER := 1

/**
 * @type {Integer (UInt32)}
 */
export global STORAGEPROVIDERUSERACCOUNTKIND_BUSINESS := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderUserId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderUserId.fmtid),
    Guid.Ptr, Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}"),
    UInt32, 16)
PKEY_StorageProviderUserId.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Subject := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Subject.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_Subject.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_SyncTransferStatus := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_SyncTransferStatus.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_SyncTransferStatus.pid := 103

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Thumbnail := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Thumbnail.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_Thumbnail.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ThumbnailCacheId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ThumbnailCacheId.fmtid),
    Guid.Ptr, Guid("{446d16b1-8dad-4870-a748-402ea43d788c}"),
    UInt32, 16)
PKEY_ThumbnailCacheId.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ThumbnailStream := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ThumbnailStream.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_ThumbnailStream.pid := 27

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Title := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Title.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_Title.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_TitleSortOverride := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_TitleSortOverride.fmtid),
    Guid.Ptr, Guid("{f0f7984d-222e-4ad2-82ab-1dd8ea40e57e}"),
    UInt32, 16)
PKEY_TitleSortOverride.pid := 300

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_TotalFileSize := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_TotalFileSize.fmtid),
    Guid.Ptr, Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}"),
    UInt32, 16)
PKEY_TotalFileSize.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Trademarks := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Trademarks.fmtid),
    Guid.Ptr, Guid("{0cef7d53-fa64-11d1-a203-0000f81fedee}"),
    UInt32, 16)
PKEY_Trademarks.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_TransferOrder := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_TransferOrder.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_TransferOrder.pid := 106

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_TransferPosition := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_TransferPosition.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_TransferPosition.pid := 104

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_TransferSize := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_TransferSize.fmtid),
    Guid.Ptr, Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}"),
    UInt32, 16)
PKEY_TransferSize.pid := 105

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_VolumeId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_VolumeId.fmtid),
    Guid.Ptr, Guid("{446d16b1-8dad-4870-a748-402ea43d788c}"),
    UInt32, 16)
PKEY_VolumeId.pid := 104

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ZoneIdentifier := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ZoneIdentifier.fmtid),
    Guid.Ptr, Guid("{502cfeab-47eb-459c-b960-e6d8728f7701}"),
    UInt32, 16)
PKEY_ZoneIdentifier.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_PrinterURL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_PrinterURL.fmtid),
    Guid.Ptr, Guid("{0b48f35a-be6e-4f17-b108-3c4073d1669a}"),
    UInt32, 16)
PKEY_Device_PrinterURL.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Bluetooth_DeviceAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Bluetooth_DeviceAddress.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
PKEY_DeviceInterface_Bluetooth_DeviceAddress.pid := 1

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Bluetooth_Flags := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Bluetooth_Flags.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
PKEY_DeviceInterface_Bluetooth_Flags.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Bluetooth_LastConnectedTime := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Bluetooth_LastConnectedTime.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
PKEY_DeviceInterface_Bluetooth_LastConnectedTime.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Bluetooth_Manufacturer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Bluetooth_Manufacturer.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
PKEY_DeviceInterface_Bluetooth_Manufacturer.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Bluetooth_ModelNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Bluetooth_ModelNumber.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
PKEY_DeviceInterface_Bluetooth_ModelNumber.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Bluetooth_ProductId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Bluetooth_ProductId.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
PKEY_DeviceInterface_Bluetooth_ProductId.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Bluetooth_ProductVersion := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Bluetooth_ProductVersion.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
PKEY_DeviceInterface_Bluetooth_ProductVersion.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Bluetooth_ServiceGuid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Bluetooth_ServiceGuid.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
PKEY_DeviceInterface_Bluetooth_ServiceGuid.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Bluetooth_VendorId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Bluetooth_VendorId.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
PKEY_DeviceInterface_Bluetooth_VendorId.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Bluetooth_VendorIdSource := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Bluetooth_VendorIdSource.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
PKEY_DeviceInterface_Bluetooth_VendorIdSource.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Hid_IsReadOnly := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Hid_IsReadOnly.fmtid),
    Guid.Ptr, Guid("{cbf38310-4a17-4310-a1eb-247f0b67593b}"),
    UInt32, 16)
PKEY_DeviceInterface_Hid_IsReadOnly.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Hid_ProductId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Hid_ProductId.fmtid),
    Guid.Ptr, Guid("{cbf38310-4a17-4310-a1eb-247f0b67593b}"),
    UInt32, 16)
PKEY_DeviceInterface_Hid_ProductId.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Hid_UsageId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Hid_UsageId.fmtid),
    Guid.Ptr, Guid("{cbf38310-4a17-4310-a1eb-247f0b67593b}"),
    UInt32, 16)
PKEY_DeviceInterface_Hid_UsageId.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Hid_UsagePage := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Hid_UsagePage.fmtid),
    Guid.Ptr, Guid("{cbf38310-4a17-4310-a1eb-247f0b67593b}"),
    UInt32, 16)
PKEY_DeviceInterface_Hid_UsagePage.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Hid_VendorId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Hid_VendorId.fmtid),
    Guid.Ptr, Guid("{cbf38310-4a17-4310-a1eb-247f0b67593b}"),
    UInt32, 16)
PKEY_DeviceInterface_Hid_VendorId.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Hid_VersionNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Hid_VersionNumber.fmtid),
    Guid.Ptr, Guid("{cbf38310-4a17-4310-a1eb-247f0b67593b}"),
    UInt32, 16)
PKEY_DeviceInterface_Hid_VersionNumber.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_PrinterDriverDirectory := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_PrinterDriverDirectory.fmtid),
    Guid.Ptr, Guid("{847c66de-b8d6-4af9-abc3-6f4f926bc039}"),
    UInt32, 16)
PKEY_DeviceInterface_PrinterDriverDirectory.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_PrinterDriverName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_PrinterDriverName.fmtid),
    Guid.Ptr, Guid("{afc47170-14f5-498c-8f30-b0d19be449c6}"),
    UInt32, 16)
PKEY_DeviceInterface_PrinterDriverName.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_PrinterEnumerationFlag := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_PrinterEnumerationFlag.fmtid),
    Guid.Ptr, Guid("{a00742a1-cd8c-4b37-95ab-70755587767a}"),
    UInt32, 16)
PKEY_DeviceInterface_PrinterEnumerationFlag.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_PrinterName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_PrinterName.fmtid),
    Guid.Ptr, Guid("{0a7b84ef-0c27-463f-84ef-06c5070001be}"),
    UInt32, 16)
PKEY_DeviceInterface_PrinterName.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_PrinterPortName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_PrinterPortName.fmtid),
    Guid.Ptr, Guid("{eec7b761-6f94-41b1-949f-c729720dd13c}"),
    UInt32, 16)
PKEY_DeviceInterface_PrinterPortName.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Proximity_SupportsNfc := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Proximity_SupportsNfc.fmtid),
    Guid.Ptr, Guid("{fb3842cd-9e2a-4f83-8fcc-4b0761139ae9}"),
    UInt32, 16)
PKEY_DeviceInterface_Proximity_SupportsNfc.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Serial_PortName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Serial_PortName.fmtid),
    Guid.Ptr, Guid("{4c6bf15c-4c03-4aac-91f5-64c0f852bcf4}"),
    UInt32, 16)
PKEY_DeviceInterface_Serial_PortName.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Serial_UsbProductId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Serial_UsbProductId.fmtid),
    Guid.Ptr, Guid("{4c6bf15c-4c03-4aac-91f5-64c0f852bcf4}"),
    UInt32, 16)
PKEY_DeviceInterface_Serial_UsbProductId.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Serial_UsbVendorId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Serial_UsbVendorId.fmtid),
    Guid.Ptr, Guid("{4c6bf15c-4c03-4aac-91f5-64c0f852bcf4}"),
    UInt32, 16)
PKEY_DeviceInterface_Serial_UsbVendorId.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_WinUsb_DeviceInterfaceClasses := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_WinUsb_DeviceInterfaceClasses.fmtid),
    Guid.Ptr, Guid("{95e127b5-79cc-4e83-9c9e-8422187b3e0e}"),
    UInt32, 16)
PKEY_DeviceInterface_WinUsb_DeviceInterfaceClasses.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_WinUsb_UsbClass := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_WinUsb_UsbClass.fmtid),
    Guid.Ptr, Guid("{95e127b5-79cc-4e83-9c9e-8422187b3e0e}"),
    UInt32, 16)
PKEY_DeviceInterface_WinUsb_UsbClass.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_WinUsb_UsbProductId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_WinUsb_UsbProductId.fmtid),
    Guid.Ptr, Guid("{95e127b5-79cc-4e83-9c9e-8422187b3e0e}"),
    UInt32, 16)
PKEY_DeviceInterface_WinUsb_UsbProductId.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_WinUsb_UsbProtocol := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_WinUsb_UsbProtocol.fmtid),
    Guid.Ptr, Guid("{95e127b5-79cc-4e83-9c9e-8422187b3e0e}"),
    UInt32, 16)
PKEY_DeviceInterface_WinUsb_UsbProtocol.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_WinUsb_UsbSubClass := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_WinUsb_UsbSubClass.fmtid),
    Guid.Ptr, Guid("{95e127b5-79cc-4e83-9c9e-8422187b3e0e}"),
    UInt32, 16)
PKEY_DeviceInterface_WinUsb_UsbSubClass.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_WinUsb_UsbVendorId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_WinUsb_UsbVendorId.fmtid),
    Guid.Ptr, Guid("{95e127b5-79cc-4e83-9c9e-8422187b3e0e}"),
    UInt32, 16)
PKEY_DeviceInterface_WinUsb_UsbVendorId.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_AepId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_AepId.fmtid),
    Guid.Ptr, Guid("{3b2ce006-5e61-4fde-bab8-9b8aac9b26df}"),
    UInt32, 16)
PKEY_Devices_Aep_AepId.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Bluetooth_Cod_Major := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Bluetooth_Cod_Major.fmtid),
    Guid.Ptr, Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}"),
    UInt32, 16)
PKEY_Devices_Aep_Bluetooth_Cod_Major.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Bluetooth_Cod_Minor := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Bluetooth_Cod_Minor.fmtid),
    Guid.Ptr, Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}"),
    UInt32, 16)
PKEY_Devices_Aep_Bluetooth_Cod_Minor.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Bluetooth_Cod_Services_Audio := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Bluetooth_Cod_Services_Audio.fmtid),
    Guid.Ptr, Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}"),
    UInt32, 16)
PKEY_Devices_Aep_Bluetooth_Cod_Services_Audio.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Bluetooth_Cod_Services_Capturing := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Bluetooth_Cod_Services_Capturing.fmtid),
    Guid.Ptr, Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}"),
    UInt32, 16)
PKEY_Devices_Aep_Bluetooth_Cod_Services_Capturing.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Bluetooth_Cod_Services_Information := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Bluetooth_Cod_Services_Information.fmtid),
    Guid.Ptr, Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}"),
    UInt32, 16)
PKEY_Devices_Aep_Bluetooth_Cod_Services_Information.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Bluetooth_Cod_Services_LimitedDiscovery := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Bluetooth_Cod_Services_LimitedDiscovery.fmtid),
    Guid.Ptr, Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}"),
    UInt32, 16)
PKEY_Devices_Aep_Bluetooth_Cod_Services_LimitedDiscovery.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Bluetooth_Cod_Services_Networking := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Bluetooth_Cod_Services_Networking.fmtid),
    Guid.Ptr, Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}"),
    UInt32, 16)
PKEY_Devices_Aep_Bluetooth_Cod_Services_Networking.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Bluetooth_Cod_Services_ObjectXfer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Bluetooth_Cod_Services_ObjectXfer.fmtid),
    Guid.Ptr, Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}"),
    UInt32, 16)
PKEY_Devices_Aep_Bluetooth_Cod_Services_ObjectXfer.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Bluetooth_Cod_Services_Positioning := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Bluetooth_Cod_Services_Positioning.fmtid),
    Guid.Ptr, Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}"),
    UInt32, 16)
PKEY_Devices_Aep_Bluetooth_Cod_Services_Positioning.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Bluetooth_Cod_Services_Rendering := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Bluetooth_Cod_Services_Rendering.fmtid),
    Guid.Ptr, Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}"),
    UInt32, 16)
PKEY_Devices_Aep_Bluetooth_Cod_Services_Rendering.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Bluetooth_Cod_Services_Telephony := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Bluetooth_Cod_Services_Telephony.fmtid),
    Guid.Ptr, Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}"),
    UInt32, 16)
PKEY_Devices_Aep_Bluetooth_Cod_Services_Telephony.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Bluetooth_LastSeenTime := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Bluetooth_LastSeenTime.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
PKEY_Devices_Aep_Bluetooth_LastSeenTime.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Bluetooth_Le_AddressType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Bluetooth_Le_AddressType.fmtid),
    Guid.Ptr, Guid("{995ef0b0-7eb3-4a8b-b9ce-068bb3f4af69}"),
    UInt32, 16)
PKEY_Devices_Aep_Bluetooth_Le_AddressType.pid := 4

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_ADDRESS_TYPE_PUBLIC := 0

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_ADDRESS_TYPE_RANDOM := 1

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Bluetooth_Le_Appearance := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Bluetooth_Le_Appearance.fmtid),
    Guid.Ptr, Guid("{995ef0b0-7eb3-4a8b-b9ce-068bb3f4af69}"),
    UInt32, 16)
PKEY_Devices_Aep_Bluetooth_Le_Appearance.pid := 1

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Bluetooth_Le_Appearance_Category := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Bluetooth_Le_Appearance_Category.fmtid),
    Guid.Ptr, Guid("{995ef0b0-7eb3-4a8b-b9ce-068bb3f4af69}"),
    UInt32, 16)
PKEY_Devices_Aep_Bluetooth_Le_Appearance_Category.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Bluetooth_Le_Appearance_Subcategory := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Bluetooth_Le_Appearance_Subcategory.fmtid),
    Guid.Ptr, Guid("{995ef0b0-7eb3-4a8b-b9ce-068bb3f4af69}"),
    UInt32, 16)
PKEY_Devices_Aep_Bluetooth_Le_Appearance_Subcategory.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Bluetooth_Le_IsCallControlClient := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Bluetooth_Le_IsCallControlClient.fmtid),
    Guid.Ptr, Guid("{995ef0b0-7eb3-4a8b-b9ce-068bb3f4af69}"),
    UInt32, 16)
PKEY_Devices_Aep_Bluetooth_Le_IsCallControlClient.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Bluetooth_Le_IsConnectable := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Bluetooth_Le_IsConnectable.fmtid),
    Guid.Ptr, Guid("{995ef0b0-7eb3-4a8b-b9ce-068bb3f4af69}"),
    UInt32, 16)
PKEY_Devices_Aep_Bluetooth_Le_IsConnectable.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_CanPair := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_CanPair.fmtid),
    Guid.Ptr, Guid("{e7c3fb29-caa7-4f47-8c8b-be59b330d4c5}"),
    UInt32, 16)
PKEY_Devices_Aep_CanPair.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Category := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Category.fmtid),
    Guid.Ptr, Guid("{a35996ab-11cf-4935-8b61-a6761081ecdf}"),
    UInt32, 16)
PKEY_Devices_Aep_Category.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_ContainerId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_ContainerId.fmtid),
    Guid.Ptr, Guid("{e7c3fb29-caa7-4f47-8c8b-be59b330d4c5}"),
    UInt32, 16)
PKEY_Devices_Aep_ContainerId.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_DeviceAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_DeviceAddress.fmtid),
    Guid.Ptr, Guid("{a35996ab-11cf-4935-8b61-a6761081ecdf}"),
    UInt32, 16)
PKEY_Devices_Aep_DeviceAddress.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_IsConnected := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_IsConnected.fmtid),
    Guid.Ptr, Guid("{a35996ab-11cf-4935-8b61-a6761081ecdf}"),
    UInt32, 16)
PKEY_Devices_Aep_IsConnected.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_IsPaired := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_IsPaired.fmtid),
    Guid.Ptr, Guid("{a35996ab-11cf-4935-8b61-a6761081ecdf}"),
    UInt32, 16)
PKEY_Devices_Aep_IsPaired.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_IsPresent := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_IsPresent.fmtid),
    Guid.Ptr, Guid("{a35996ab-11cf-4935-8b61-a6761081ecdf}"),
    UInt32, 16)
PKEY_Devices_Aep_IsPresent.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_Manufacturer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_Manufacturer.fmtid),
    Guid.Ptr, Guid("{a35996ab-11cf-4935-8b61-a6761081ecdf}"),
    UInt32, 16)
PKEY_Devices_Aep_Manufacturer.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_ModelId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_ModelId.fmtid),
    Guid.Ptr, Guid("{a35996ab-11cf-4935-8b61-a6761081ecdf}"),
    UInt32, 16)
PKEY_Devices_Aep_ModelId.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_ModelName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_ModelName.fmtid),
    Guid.Ptr, Guid("{a35996ab-11cf-4935-8b61-a6761081ecdf}"),
    UInt32, 16)
PKEY_Devices_Aep_ModelName.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_PointOfService_ConnectionTypes := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_PointOfService_ConnectionTypes.fmtid),
    Guid.Ptr, Guid("{d4bf61b3-442e-4ada-882d-fa7b70c832d9}"),
    UInt32, 16)
PKEY_Devices_Aep_PointOfService_ConnectionTypes.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_ProtocolId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_ProtocolId.fmtid),
    Guid.Ptr, Guid("{3b2ce006-5e61-4fde-bab8-9b8aac9b26df}"),
    UInt32, 16)
PKEY_Devices_Aep_ProtocolId.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Aep_SignalStrength := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Aep_SignalStrength.fmtid),
    Guid.Ptr, Guid("{a35996ab-11cf-4935-8b61-a6761081ecdf}"),
    UInt32, 16)
PKEY_Devices_Aep_SignalStrength.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_CanPair := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_CanPair.fmtid),
    Guid.Ptr, Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}"),
    UInt32, 16)
PKEY_Devices_AepContainer_CanPair.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_Categories := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_Categories.fmtid),
    Guid.Ptr, Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}"),
    UInt32, 16)
PKEY_Devices_AepContainer_Categories.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_Children := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_Children.fmtid),
    Guid.Ptr, Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}"),
    UInt32, 16)
PKEY_Devices_AepContainer_Children.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_ContainerId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_ContainerId.fmtid),
    Guid.Ptr, Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}"),
    UInt32, 16)
PKEY_Devices_AepContainer_ContainerId.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_DialProtocol_InstalledApplications := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_DialProtocol_InstalledApplications.fmtid),
    Guid.Ptr, Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}"),
    UInt32, 16)
PKEY_Devices_AepContainer_DialProtocol_InstalledApplications.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_IsPaired := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_IsPaired.fmtid),
    Guid.Ptr, Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}"),
    UInt32, 16)
PKEY_Devices_AepContainer_IsPaired.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_IsPresent := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_IsPresent.fmtid),
    Guid.Ptr, Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}"),
    UInt32, 16)
PKEY_Devices_AepContainer_IsPresent.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_Manufacturer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_Manufacturer.fmtid),
    Guid.Ptr, Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}"),
    UInt32, 16)
PKEY_Devices_AepContainer_Manufacturer.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_ModelIds := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_ModelIds.fmtid),
    Guid.Ptr, Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}"),
    UInt32, 16)
PKEY_Devices_AepContainer_ModelIds.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_ModelName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_ModelName.fmtid),
    Guid.Ptr, Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}"),
    UInt32, 16)
PKEY_Devices_AepContainer_ModelName.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_ProtocolIds := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_ProtocolIds.fmtid),
    Guid.Ptr, Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}"),
    UInt32, 16)
PKEY_Devices_AepContainer_ProtocolIds.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_SupportedUriSchemes := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_SupportedUriSchemes.fmtid),
    Guid.Ptr, Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}"),
    UInt32, 16)
PKEY_Devices_AepContainer_SupportedUriSchemes.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_SupportsAudio := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_SupportsAudio.fmtid),
    Guid.Ptr, Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}"),
    UInt32, 16)
PKEY_Devices_AepContainer_SupportsAudio.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_SupportsCapturing := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_SupportsCapturing.fmtid),
    Guid.Ptr, Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}"),
    UInt32, 16)
PKEY_Devices_AepContainer_SupportsCapturing.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_SupportsImages := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_SupportsImages.fmtid),
    Guid.Ptr, Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}"),
    UInt32, 16)
PKEY_Devices_AepContainer_SupportsImages.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_SupportsInformation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_SupportsInformation.fmtid),
    Guid.Ptr, Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}"),
    UInt32, 16)
PKEY_Devices_AepContainer_SupportsInformation.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_SupportsLimitedDiscovery := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_SupportsLimitedDiscovery.fmtid),
    Guid.Ptr, Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}"),
    UInt32, 16)
PKEY_Devices_AepContainer_SupportsLimitedDiscovery.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_SupportsNetworking := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_SupportsNetworking.fmtid),
    Guid.Ptr, Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}"),
    UInt32, 16)
PKEY_Devices_AepContainer_SupportsNetworking.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_SupportsObjectTransfer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_SupportsObjectTransfer.fmtid),
    Guid.Ptr, Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}"),
    UInt32, 16)
PKEY_Devices_AepContainer_SupportsObjectTransfer.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_SupportsPositioning := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_SupportsPositioning.fmtid),
    Guid.Ptr, Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}"),
    UInt32, 16)
PKEY_Devices_AepContainer_SupportsPositioning.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_SupportsRendering := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_SupportsRendering.fmtid),
    Guid.Ptr, Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}"),
    UInt32, 16)
PKEY_Devices_AepContainer_SupportsRendering.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_SupportsTelephony := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_SupportsTelephony.fmtid),
    Guid.Ptr, Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}"),
    UInt32, 16)
PKEY_Devices_AepContainer_SupportsTelephony.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepContainer_SupportsVideo := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepContainer_SupportsVideo.fmtid),
    Guid.Ptr, Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}"),
    UInt32, 16)
PKEY_Devices_AepContainer_SupportsVideo.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepService_AepId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepService_AepId.fmtid),
    Guid.Ptr, Guid("{c9c141a9-1b4c-4f17-a9d1-f298538cadb8}"),
    UInt32, 16)
PKEY_Devices_AepService_AepId.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepService_Bluetooth_CacheMode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepService_Bluetooth_CacheMode.fmtid),
    Guid.Ptr, Guid("{9744311e-7951-4b2e-b6f0-ecb293cac119}"),
    UInt32, 16)
PKEY_Devices_AepService_Bluetooth_CacheMode.pid := 5

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_CACHE_MODE_CACHED := 0

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_CACHED_MODE_UNCACHED := 1

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepService_Bluetooth_ServiceGuid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepService_Bluetooth_ServiceGuid.fmtid),
    Guid.Ptr, Guid("{a399aac7-c265-474e-b073-ffce57721716}"),
    UInt32, 16)
PKEY_Devices_AepService_Bluetooth_ServiceGuid.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepService_Bluetooth_TargetDevice := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepService_Bluetooth_TargetDevice.fmtid),
    Guid.Ptr, Guid("{9744311e-7951-4b2e-b6f0-ecb293cac119}"),
    UInt32, 16)
PKEY_Devices_AepService_Bluetooth_TargetDevice.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepService_ContainerId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepService_ContainerId.fmtid),
    Guid.Ptr, Guid("{71724756-3e74-4432-9b59-e7b2f668a593}"),
    UInt32, 16)
PKEY_Devices_AepService_ContainerId.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepService_FriendlyName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepService_FriendlyName.fmtid),
    Guid.Ptr, Guid("{71724756-3e74-4432-9b59-e7b2f668a593}"),
    UInt32, 16)
PKEY_Devices_AepService_FriendlyName.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepService_IoT_ServiceInterfaces := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepService_IoT_ServiceInterfaces.fmtid),
    Guid.Ptr, Guid("{79d94e82-4d79-45aa-821a-74858b4e4ca6}"),
    UInt32, 16)
PKEY_Devices_AepService_IoT_ServiceInterfaces.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepService_ParentAepIsPaired := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepService_ParentAepIsPaired.fmtid),
    Guid.Ptr, Guid("{c9c141a9-1b4c-4f17-a9d1-f298538cadb8}"),
    UInt32, 16)
PKEY_Devices_AepService_ParentAepIsPaired.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepService_ProtocolId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepService_ProtocolId.fmtid),
    Guid.Ptr, Guid("{c9c141a9-1b4c-4f17-a9d1-f298538cadb8}"),
    UInt32, 16)
PKEY_Devices_AepService_ProtocolId.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepService_ServiceClassId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepService_ServiceClassId.fmtid),
    Guid.Ptr, Guid("{71724756-3e74-4432-9b59-e7b2f668a593}"),
    UInt32, 16)
PKEY_Devices_AepService_ServiceClassId.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AepService_ServiceId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AepService_ServiceId.fmtid),
    Guid.Ptr, Guid("{c9c141a9-1b4c-4f17-a9d1-f298538cadb8}"),
    UInt32, 16)
PKEY_Devices_AepService_ServiceId.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AppPackageFamilyName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AppPackageFamilyName.fmtid),
    Guid.Ptr, Guid("{51236583-0c4a-4fe8-b81f-166aec13f510}"),
    UInt32, 16)
PKEY_Devices_AppPackageFamilyName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AudioDevice_Microphone_EqCoefficientsDb := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AudioDevice_Microphone_EqCoefficientsDb.fmtid),
    Guid.Ptr, Guid("{8943b373-388c-4395-b557-bc6dbaffafdb}"),
    UInt32, 16)
PKEY_Devices_AudioDevice_Microphone_EqCoefficientsDb.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AudioDevice_Microphone_IsFarField := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AudioDevice_Microphone_IsFarField.fmtid),
    Guid.Ptr, Guid("{8943b373-388c-4395-b557-bc6dbaffafdb}"),
    UInt32, 16)
PKEY_Devices_AudioDevice_Microphone_IsFarField.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AudioDevice_Microphone_SensitivityInDbfs := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AudioDevice_Microphone_SensitivityInDbfs.fmtid),
    Guid.Ptr, Guid("{8943b373-388c-4395-b557-bc6dbaffafdb}"),
    UInt32, 16)
PKEY_Devices_AudioDevice_Microphone_SensitivityInDbfs.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AudioDevice_Microphone_SensitivityInDbfs2 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AudioDevice_Microphone_SensitivityInDbfs2.fmtid),
    Guid.Ptr, Guid("{8943b373-388c-4395-b557-bc6dbaffafdb}"),
    UInt32, 16)
PKEY_Devices_AudioDevice_Microphone_SensitivityInDbfs2.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AudioDevice_Microphone_SignalToNoiseRatioInDb := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AudioDevice_Microphone_SignalToNoiseRatioInDb.fmtid),
    Guid.Ptr, Guid("{8943b373-388c-4395-b557-bc6dbaffafdb}"),
    UInt32, 16)
PKEY_Devices_AudioDevice_Microphone_SignalToNoiseRatioInDb.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AudioDevice_RawProcessingSupported := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AudioDevice_RawProcessingSupported.fmtid),
    Guid.Ptr, Guid("{8943b373-388c-4395-b557-bc6dbaffafdb}"),
    UInt32, 16)
PKEY_Devices_AudioDevice_RawProcessingSupported.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_AudioDevice_SpeechProcessingSupported := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_AudioDevice_SpeechProcessingSupported.fmtid),
    Guid.Ptr, Guid("{fb1de864-e06d-47f4-82a6-8a0aef44493c}"),
    UInt32, 16)
PKEY_Devices_AudioDevice_SpeechProcessingSupported.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_BatteryLife := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_BatteryLife.fmtid),
    Guid.Ptr, Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}"),
    UInt32, 16)
PKEY_Devices_BatteryLife.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_BatteryPlusCharging := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_BatteryPlusCharging.fmtid),
    Guid.Ptr, Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}"),
    UInt32, 16)
PKEY_Devices_BatteryPlusCharging.pid := 22

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_BatteryPlusChargingText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_BatteryPlusChargingText.fmtid),
    Guid.Ptr, Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}"),
    UInt32, 16)
PKEY_Devices_BatteryPlusChargingText.pid := 23

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Category := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Category.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Devices_Category.pid := 91

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_CategoryGroup := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_CategoryGroup.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Devices_CategoryGroup.pid := 94

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_CategoryIds := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_CategoryIds.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Devices_CategoryIds.pid := 90

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_CategoryPlural := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_CategoryPlural.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Devices_CategoryPlural.pid := 92

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_ChallengeAep := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_ChallengeAep.fmtid),
    Guid.Ptr, Guid("{0774315e-b714-48ec-8de8-8125c077ac11}"),
    UInt32, 16)
PKEY_Devices_ChallengeAep.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_ChargingState := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_ChargingState.fmtid),
    Guid.Ptr, Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}"),
    UInt32, 16)
PKEY_Devices_ChargingState.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Children := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Children.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
PKEY_Devices_Children.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_ClassGuid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_ClassGuid.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Devices_ClassGuid.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_CompatibleIds := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_CompatibleIds.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Devices_CompatibleIds.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Connected := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Connected.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Devices_Connected.pid := 55

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_ContainerId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_ContainerId.fmtid),
    Guid.Ptr, Guid("{8c7ed206-3f8a-4827-b3ab-ae9e1faefc6c}"),
    UInt32, 16)
PKEY_Devices_ContainerId.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_DefaultTooltip := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_DefaultTooltip.fmtid),
    Guid.Ptr, Guid("{880f70a2-6082-47ac-8aab-a739d1a300c3}"),
    UInt32, 16)
PKEY_Devices_DefaultTooltip.pid := 153

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_DeviceCapabilities := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_DeviceCapabilities.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Devices_DeviceCapabilities.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_DeviceCharacteristics := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_DeviceCharacteristics.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Devices_DeviceCharacteristics.pid := 29

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_DeviceDescription1 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_DeviceDescription1.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Devices_DeviceDescription1.pid := 81

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_DeviceDescription2 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_DeviceDescription2.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Devices_DeviceDescription2.pid := 82

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_DeviceHasProblem := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_DeviceHasProblem.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
PKEY_Devices_DeviceHasProblem.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_DeviceInstanceId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_DeviceInstanceId.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Devices_DeviceInstanceId.pid := 256

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_DeviceManufacturer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_DeviceManufacturer.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Devices_DeviceManufacturer.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_DevObjectType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_DevObjectType.fmtid),
    Guid.Ptr, Guid("{13673f42-a3d6-49f6-b4da-ae46e0c5237c}"),
    UInt32, 16)
PKEY_Devices_DevObjectType.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_DialProtocol_InstalledApplications := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_DialProtocol_InstalledApplications.fmtid),
    Guid.Ptr, Guid("{6845cc72-1b71-48c3-af86-b09171a19b14}"),
    UInt32, 16)
PKEY_Devices_DialProtocol_InstalledApplications.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_DiscoveryMethod := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_DiscoveryMethod.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Devices_DiscoveryMethod.pid := 52

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Dnssd_Domain := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Dnssd_Domain.fmtid),
    Guid.Ptr, Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}"),
    UInt32, 16)
PKEY_Devices_Dnssd_Domain.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Dnssd_FullName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Dnssd_FullName.fmtid),
    Guid.Ptr, Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}"),
    UInt32, 16)
PKEY_Devices_Dnssd_FullName.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Dnssd_HostName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Dnssd_HostName.fmtid),
    Guid.Ptr, Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}"),
    UInt32, 16)
PKEY_Devices_Dnssd_HostName.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Dnssd_InstanceName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Dnssd_InstanceName.fmtid),
    Guid.Ptr, Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}"),
    UInt32, 16)
PKEY_Devices_Dnssd_InstanceName.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Dnssd_NetworkAdapterId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Dnssd_NetworkAdapterId.fmtid),
    Guid.Ptr, Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}"),
    UInt32, 16)
PKEY_Devices_Dnssd_NetworkAdapterId.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Dnssd_PortNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Dnssd_PortNumber.fmtid),
    Guid.Ptr, Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}"),
    UInt32, 16)
PKEY_Devices_Dnssd_PortNumber.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Dnssd_Priority := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Dnssd_Priority.fmtid),
    Guid.Ptr, Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}"),
    UInt32, 16)
PKEY_Devices_Dnssd_Priority.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Dnssd_ServiceName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Dnssd_ServiceName.fmtid),
    Guid.Ptr, Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}"),
    UInt32, 16)
PKEY_Devices_Dnssd_ServiceName.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Dnssd_TextAttributes := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Dnssd_TextAttributes.fmtid),
    Guid.Ptr, Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}"),
    UInt32, 16)
PKEY_Devices_Dnssd_TextAttributes.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Dnssd_Ttl := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Dnssd_Ttl.fmtid),
    Guid.Ptr, Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}"),
    UInt32, 16)
PKEY_Devices_Dnssd_Ttl.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Dnssd_Weight := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Dnssd_Weight.fmtid),
    Guid.Ptr, Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}"),
    UInt32, 16)
PKEY_Devices_Dnssd_Weight.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_FriendlyName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_FriendlyName.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_Devices_FriendlyName.pid := 12288

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_FunctionPaths := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_FunctionPaths.fmtid),
    Guid.Ptr, Guid("{d08dd4c0-3a9e-462e-8290-7b636b2576b9}"),
    UInt32, 16)
PKEY_Devices_FunctionPaths.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_GlyphIcon := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_GlyphIcon.fmtid),
    Guid.Ptr, Guid("{51236583-0c4a-4fe8-b81f-166aec13f510}"),
    UInt32, 16)
PKEY_Devices_GlyphIcon.pid := 123

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_HardwareIds := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_HardwareIds.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Devices_HardwareIds.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Icon := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Icon.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Devices_Icon.pid := 57

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_InLocalMachineContainer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_InLocalMachineContainer.fmtid),
    Guid.Ptr, Guid("{8c7ed206-3f8a-4827-b3ab-ae9e1faefc6c}"),
    UInt32, 16)
PKEY_Devices_InLocalMachineContainer.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_InterfaceClassGuid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_InterfaceClassGuid.fmtid),
    Guid.Ptr, Guid("{026e516e-b814-414b-83cd-856d6fef4822}"),
    UInt32, 16)
PKEY_Devices_InterfaceClassGuid.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_InterfaceEnabled := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_InterfaceEnabled.fmtid),
    Guid.Ptr, Guid("{026e516e-b814-414b-83cd-856d6fef4822}"),
    UInt32, 16)
PKEY_Devices_InterfaceEnabled.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_InterfacePaths := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_InterfacePaths.fmtid),
    Guid.Ptr, Guid("{d08dd4c0-3a9e-462e-8290-7b636b2576b9}"),
    UInt32, 16)
PKEY_Devices_InterfacePaths.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_IpAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_IpAddress.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_Devices_IpAddress.pid := 12297

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_IsDefault := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_IsDefault.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Devices_IsDefault.pid := 86

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_IsNetworkConnected := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_IsNetworkConnected.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Devices_IsNetworkConnected.pid := 85

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_IsShared := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_IsShared.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Devices_IsShared.pid := 84

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_IsSoftwareInstalling := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_IsSoftwareInstalling.fmtid),
    Guid.Ptr, Guid("{83da6326-97a6-4088-9453-a1923f573b29}"),
    UInt32, 16)
PKEY_Devices_IsSoftwareInstalling.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_LaunchDeviceStageFromExplorer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_LaunchDeviceStageFromExplorer.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Devices_LaunchDeviceStageFromExplorer.pid := 77

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_LocalMachine := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_LocalMachine.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Devices_LocalMachine.pid := 70

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_LocationPaths := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_LocationPaths.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Devices_LocationPaths.pid := 37

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Manufacturer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Manufacturer.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_Devices_Manufacturer.pid := 8192

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_MetadataPath := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_MetadataPath.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Devices_MetadataPath.pid := 71

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_MicrophoneArray_Geometry := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_MicrophoneArray_Geometry.fmtid),
    Guid.Ptr, Guid("{a1829ea2-27eb-459e-935d-b2fad7b07762}"),
    UInt32, 16)
PKEY_Devices_MicrophoneArray_Geometry.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_MissedCalls := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_MissedCalls.fmtid),
    Guid.Ptr, Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}"),
    UInt32, 16)
PKEY_Devices_MissedCalls.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_ModelId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_ModelId.fmtid),
    Guid.Ptr, Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}"),
    UInt32, 16)
PKEY_Devices_ModelId.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_ModelName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_ModelName.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_Devices_ModelName.pid := 8194

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_ModelNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_ModelNumber.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_Devices_ModelNumber.pid := 8195

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_NetworkedTooltip := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_NetworkedTooltip.fmtid),
    Guid.Ptr, Guid("{880f70a2-6082-47ac-8aab-a739d1a300c3}"),
    UInt32, 16)
PKEY_Devices_NetworkedTooltip.pid := 152

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_NetworkName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_NetworkName.fmtid),
    Guid.Ptr, Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}"),
    UInt32, 16)
PKEY_Devices_NetworkName.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_NetworkType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_NetworkType.fmtid),
    Guid.Ptr, Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}"),
    UInt32, 16)
PKEY_Devices_NetworkType.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_NewPictures := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_NewPictures.fmtid),
    Guid.Ptr, Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}"),
    UInt32, 16)
PKEY_Devices_NewPictures.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Notification := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Notification.fmtid),
    Guid.Ptr, Guid("{06704b0c-e830-4c81-9178-91e4e95a80a0}"),
    UInt32, 16)
PKEY_Devices_Notification.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Notifications_LowBattery := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Notifications_LowBattery.fmtid),
    Guid.Ptr, Guid("{c4c07f2b-8524-4e66-ae3a-a6235f103beb}"),
    UInt32, 16)
PKEY_Devices_Notifications_LowBattery.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Notifications_MissedCall := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Notifications_MissedCall.fmtid),
    Guid.Ptr, Guid("{6614ef48-4efe-4424-9eda-c79f404edf3e}"),
    UInt32, 16)
PKEY_Devices_Notifications_MissedCall.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Notifications_NewMessage := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Notifications_NewMessage.fmtid),
    Guid.Ptr, Guid("{2be9260a-2012-4742-a555-f41b638b7dcb}"),
    UInt32, 16)
PKEY_Devices_Notifications_NewMessage.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Notifications_NewVoicemail := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Notifications_NewVoicemail.fmtid),
    Guid.Ptr, Guid("{59569556-0a08-4212-95b9-fae2ad6413db}"),
    UInt32, 16)
PKEY_Devices_Notifications_NewVoicemail.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Notifications_StorageFull := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Notifications_StorageFull.fmtid),
    Guid.Ptr, Guid("{a0e00ee1-f0c7-4d41-b8e7-26a7bd8d38b0}"),
    UInt32, 16)
PKEY_Devices_Notifications_StorageFull.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Notifications_StorageFullLinkText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Notifications_StorageFullLinkText.fmtid),
    Guid.Ptr, Guid("{a0e00ee1-f0c7-4d41-b8e7-26a7bd8d38b0}"),
    UInt32, 16)
PKEY_Devices_Notifications_StorageFullLinkText.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_NotificationStore := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_NotificationStore.fmtid),
    Guid.Ptr, Guid("{06704b0c-e830-4c81-9178-91e4e95a80a0}"),
    UInt32, 16)
PKEY_Devices_NotificationStore.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_NotWorkingProperly := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_NotWorkingProperly.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Devices_NotWorkingProperly.pid := 83

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Paired := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Paired.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Devices_Paired.pid := 56

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Panel_PanelGroup := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Panel_PanelGroup.fmtid),
    Guid.Ptr, Guid("{8dbc9c86-97a9-4bff-9bc6-bfe95d3e6dad}"),
    UInt32, 16)
PKEY_Devices_Panel_PanelGroup.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Panel_PanelId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Panel_PanelId.fmtid),
    Guid.Ptr, Guid("{8dbc9c86-97a9-4bff-9bc6-bfe95d3e6dad}"),
    UInt32, 16)
PKEY_Devices_Panel_PanelId.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Parent := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Parent.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
PKEY_Devices_Parent.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_PhoneLineTransportDevice_Connected := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_PhoneLineTransportDevice_Connected.fmtid),
    Guid.Ptr, Guid("{aecf2fe8-1d00-4fee-8a6d-a70d719b772b}"),
    UInt32, 16)
PKEY_Devices_PhoneLineTransportDevice_Connected.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_PhysicalDeviceLocation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_PhysicalDeviceLocation.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
PKEY_Devices_PhysicalDeviceLocation.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_PlaybackPositionPercent := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_PlaybackPositionPercent.fmtid),
    Guid.Ptr, Guid("{3633de59-6825-4381-a49b-9f6ba13a1471}"),
    UInt32, 16)
PKEY_Devices_PlaybackPositionPercent.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_PlaybackState := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_PlaybackState.fmtid),
    Guid.Ptr, Guid("{3633de59-6825-4381-a49b-9f6ba13a1471}"),
    UInt32, 16)
PKEY_Devices_PlaybackState.pid := 2

/**
 * @type {Integer (UInt32)}
 */
export global PLAYBACKSTATE_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global PLAYBACKSTATE_STOPPED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PLAYBACKSTATE_PLAYING := 2

/**
 * @type {Integer (UInt32)}
 */
export global PLAYBACKSTATE_TRANSITIONING := 3

/**
 * @type {Integer (UInt32)}
 */
export global PLAYBACKSTATE_PAUSED := 4

/**
 * @type {Integer (UInt32)}
 */
export global PLAYBACKSTATE_RECORDINGPAUSED := 5

/**
 * @type {Integer (UInt32)}
 */
export global PLAYBACKSTATE_RECORDING := 6

/**
 * @type {Integer (UInt32)}
 */
export global PLAYBACKSTATE_NOMEDIA := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_PlaybackTitle := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_PlaybackTitle.fmtid),
    Guid.Ptr, Guid("{3633de59-6825-4381-a49b-9f6ba13a1471}"),
    UInt32, 16)
PKEY_Devices_PlaybackTitle.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Present := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Present.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
PKEY_Devices_Present.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_PresentationUrl := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_PresentationUrl.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_Devices_PresentationUrl.pid := 8198

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_PrimaryCategory := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_PrimaryCategory.fmtid),
    Guid.Ptr, Guid("{d08dd4c0-3a9e-462e-8290-7b636b2576b9}"),
    UInt32, 16)
PKEY_Devices_PrimaryCategory.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_RemainingDuration := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_RemainingDuration.fmtid),
    Guid.Ptr, Guid("{3633de59-6825-4381-a49b-9f6ba13a1471}"),
    UInt32, 16)
PKEY_Devices_RemainingDuration.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_RestrictedInterface := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_RestrictedInterface.fmtid),
    Guid.Ptr, Guid("{026e516e-b814-414b-83cd-856d6fef4822}"),
    UInt32, 16)
PKEY_Devices_RestrictedInterface.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Roaming := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Roaming.fmtid),
    Guid.Ptr, Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}"),
    UInt32, 16)
PKEY_Devices_Roaming.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_SafeRemovalRequired := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_SafeRemovalRequired.fmtid),
    Guid.Ptr, Guid("{afd97640-86a3-4210-b67c-289c41aabe55}"),
    UInt32, 16)
PKEY_Devices_SafeRemovalRequired.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_SchematicName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_SchematicName.fmtid),
    Guid.Ptr, Guid("{026e516e-b814-414b-83cd-856d6fef4822}"),
    UInt32, 16)
PKEY_Devices_SchematicName.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_ServiceAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_ServiceAddress.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_Devices_ServiceAddress.pid := 16384

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_ServiceId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_ServiceId.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_Devices_ServiceId.pid := 16385

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_SharedTooltip := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_SharedTooltip.fmtid),
    Guid.Ptr, Guid("{880f70a2-6082-47ac-8aab-a739d1a300c3}"),
    UInt32, 16)
PKEY_Devices_SharedTooltip.pid := 151

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_SignalStrength := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_SignalStrength.fmtid),
    Guid.Ptr, Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}"),
    UInt32, 16)
PKEY_Devices_SignalStrength.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_SmartCards_ReaderKind := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_SmartCards_ReaderKind.fmtid),
    Guid.Ptr, Guid("{d6b5b883-18bd-4b4d-b2ec-9e38affeda82}"),
    UInt32, 16)
PKEY_Devices_SmartCards_ReaderKind.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Status := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Status.fmtid),
    Guid.Ptr, Guid("{d08dd4c0-3a9e-462e-8290-7b636b2576b9}"),
    UInt32, 16)
PKEY_Devices_Status.pid := 259

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Status1 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Status1.fmtid),
    Guid.Ptr, Guid("{d08dd4c0-3a9e-462e-8290-7b636b2576b9}"),
    UInt32, 16)
PKEY_Devices_Status1.pid := 257

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Status2 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Status2.fmtid),
    Guid.Ptr, Guid("{d08dd4c0-3a9e-462e-8290-7b636b2576b9}"),
    UInt32, 16)
PKEY_Devices_Status2.pid := 258

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_StorageCapacity := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_StorageCapacity.fmtid),
    Guid.Ptr, Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}"),
    UInt32, 16)
PKEY_Devices_StorageCapacity.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_StorageFreeSpace := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_StorageFreeSpace.fmtid),
    Guid.Ptr, Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}"),
    UInt32, 16)
PKEY_Devices_StorageFreeSpace.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_StorageFreeSpacePercent := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_StorageFreeSpacePercent.fmtid),
    Guid.Ptr, Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}"),
    UInt32, 16)
PKEY_Devices_StorageFreeSpacePercent.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_TextMessages := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_TextMessages.fmtid),
    Guid.Ptr, Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}"),
    UInt32, 16)
PKEY_Devices_TextMessages.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Voicemail := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Voicemail.fmtid),
    Guid.Ptr, Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}"),
    UInt32, 16)
PKEY_Devices_Voicemail.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiaDeviceType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiaDeviceType.fmtid),
    Guid.Ptr, Guid("{6bdd1fc6-810f-11d0-bec7-08002be2092f}"),
    UInt32, 16)
PKEY_Devices_WiaDeviceType.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFi_InterfaceGuid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFi_InterfaceGuid.fmtid),
    Guid.Ptr, Guid("{ef1167eb-cbfc-4341-a568-a7c91a68982c}"),
    UInt32, 16)
PKEY_Devices_WiFi_InterfaceGuid.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFiDirect_DeviceAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFiDirect_DeviceAddress.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
PKEY_Devices_WiFiDirect_DeviceAddress.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFiDirect_GroupId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFiDirect_GroupId.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
PKEY_Devices_WiFiDirect_GroupId.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFiDirect_InformationElements := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFiDirect_InformationElements.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
PKEY_Devices_WiFiDirect_InformationElements.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFiDirect_InterfaceAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFiDirect_InterfaceAddress.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
PKEY_Devices_WiFiDirect_InterfaceAddress.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFiDirect_InterfaceGuid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFiDirect_InterfaceGuid.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
PKEY_Devices_WiFiDirect_InterfaceGuid.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFiDirect_IsConnected := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFiDirect_IsConnected.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
PKEY_Devices_WiFiDirect_IsConnected.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFiDirect_IsLegacyDevice := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFiDirect_IsLegacyDevice.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
PKEY_Devices_WiFiDirect_IsLegacyDevice.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFiDirect_IsMiracastLcpSupported := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFiDirect_IsMiracastLcpSupported.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
PKEY_Devices_WiFiDirect_IsMiracastLcpSupported.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFiDirect_IsVisible := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFiDirect_IsVisible.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
PKEY_Devices_WiFiDirect_IsVisible.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFiDirect_MiracastVersion := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFiDirect_MiracastVersion.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
PKEY_Devices_WiFiDirect_MiracastVersion.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFiDirect_Services := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFiDirect_Services.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
PKEY_Devices_WiFiDirect_Services.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFiDirect_SupportedChannelList := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFiDirect_SupportedChannelList.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
PKEY_Devices_WiFiDirect_SupportedChannelList.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFiDirectServices_AdvertisementId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFiDirectServices_AdvertisementId.fmtid),
    Guid.Ptr, Guid("{31b37743-7c5e-4005-93e6-e953f92b82e9}"),
    UInt32, 16)
PKEY_Devices_WiFiDirectServices_AdvertisementId.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFiDirectServices_RequestServiceInformation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFiDirectServices_RequestServiceInformation.fmtid),
    Guid.Ptr, Guid("{31b37743-7c5e-4005-93e6-e953f92b82e9}"),
    UInt32, 16)
PKEY_Devices_WiFiDirectServices_RequestServiceInformation.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFiDirectServices_ServiceAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFiDirectServices_ServiceAddress.fmtid),
    Guid.Ptr, Guid("{31b37743-7c5e-4005-93e6-e953f92b82e9}"),
    UInt32, 16)
PKEY_Devices_WiFiDirectServices_ServiceAddress.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFiDirectServices_ServiceConfigMethods := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFiDirectServices_ServiceConfigMethods.fmtid),
    Guid.Ptr, Guid("{31b37743-7c5e-4005-93e6-e953f92b82e9}"),
    UInt32, 16)
PKEY_Devices_WiFiDirectServices_ServiceConfigMethods.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFiDirectServices_ServiceInformation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFiDirectServices_ServiceInformation.fmtid),
    Guid.Ptr, Guid("{31b37743-7c5e-4005-93e6-e953f92b82e9}"),
    UInt32, 16)
PKEY_Devices_WiFiDirectServices_ServiceInformation.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WiFiDirectServices_ServiceName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WiFiDirectServices_ServiceName.fmtid),
    Guid.Ptr, Guid("{31b37743-7c5e-4005-93e6-e953f92b82e9}"),
    UInt32, 16)
PKEY_Devices_WiFiDirectServices_ServiceName.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_WinPhone8CameraFlags := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_WinPhone8CameraFlags.fmtid),
    Guid.Ptr, Guid("{b7b4d61c-5a64-4187-a52e-b1539f359099}"),
    UInt32, 16)
PKEY_Devices_WinPhone8CameraFlags.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Devices_Wwan_InterfaceGuid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Devices_Wwan_InterfaceGuid.fmtid),
    Guid.Ptr, Guid("{ff1167eb-cbfc-4341-a568-a7c91a68982c}"),
    UInt32, 16)
PKEY_Devices_Wwan_InterfaceGuid.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Storage_Portable := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Storage_Portable.fmtid),
    Guid.Ptr, Guid("{4d1ebee8-0803-4774-9842-b77db50265e9}"),
    UInt32, 16)
PKEY_Storage_Portable.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Storage_RemovableMedia := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Storage_RemovableMedia.fmtid),
    Guid.Ptr, Guid("{4d1ebee8-0803-4774-9842-b77db50265e9}"),
    UInt32, 16)
PKEY_Storage_RemovableMedia.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Storage_SystemCritical := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Storage_SystemCritical.fmtid),
    Guid.Ptr, Guid("{4d1ebee8-0803-4774-9842-b77db50265e9}"),
    UInt32, 16)
PKEY_Storage_SystemCritical.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_ByteCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_ByteCount.fmtid),
    Guid.Ptr, Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}"),
    UInt32, 16)
PKEY_Document_ByteCount.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_CharacterCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_CharacterCount.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_Document_CharacterCount.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_ClientID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_ClientID.fmtid),
    Guid.Ptr, Guid("{276d7bb0-5b34-4fb0-aa4b-158ed12a1809}"),
    UInt32, 16)
PKEY_Document_ClientID.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_Contributor := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_Contributor.fmtid),
    Guid.Ptr, Guid("{f334115e-da1b-4509-9b3d-119504dc7abb}"),
    UInt32, 16)
PKEY_Document_Contributor.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_DateCreated := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_DateCreated.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_Document_DateCreated.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_DatePrinted := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_DatePrinted.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_Document_DatePrinted.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_DateSaved := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_DateSaved.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_Document_DateSaved.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_Division := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_Division.fmtid),
    Guid.Ptr, Guid("{1e005ee6-bf27-428b-b01c-79676acd2870}"),
    UInt32, 16)
PKEY_Document_Division.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_DocumentID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_DocumentID.fmtid),
    Guid.Ptr, Guid("{e08805c8-e395-40df-80d2-54f0d6c43154}"),
    UInt32, 16)
PKEY_Document_DocumentID.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_HiddenSlideCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_HiddenSlideCount.fmtid),
    Guid.Ptr, Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}"),
    UInt32, 16)
PKEY_Document_HiddenSlideCount.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_LastAuthor := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_LastAuthor.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_Document_LastAuthor.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_LineCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_LineCount.fmtid),
    Guid.Ptr, Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}"),
    UInt32, 16)
PKEY_Document_LineCount.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_Manager := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_Manager.fmtid),
    Guid.Ptr, Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}"),
    UInt32, 16)
PKEY_Document_Manager.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_MultimediaClipCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_MultimediaClipCount.fmtid),
    Guid.Ptr, Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}"),
    UInt32, 16)
PKEY_Document_MultimediaClipCount.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_NoteCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_NoteCount.fmtid),
    Guid.Ptr, Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}"),
    UInt32, 16)
PKEY_Document_NoteCount.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_PageCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_PageCount.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_Document_PageCount.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_ParagraphCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_ParagraphCount.fmtid),
    Guid.Ptr, Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}"),
    UInt32, 16)
PKEY_Document_ParagraphCount.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_PresentationFormat := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_PresentationFormat.fmtid),
    Guid.Ptr, Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}"),
    UInt32, 16)
PKEY_Document_PresentationFormat.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_RevisionNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_RevisionNumber.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_Document_RevisionNumber.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_Security := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_Security.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_Document_Security.pid := 19

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_SlideCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_SlideCount.fmtid),
    Guid.Ptr, Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}"),
    UInt32, 16)
PKEY_Document_SlideCount.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_Template := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_Template.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_Document_Template.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_TotalEditingTime := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_TotalEditingTime.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_Document_TotalEditingTime.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_Version := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_Version.fmtid),
    Guid.Ptr, Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}"),
    UInt32, 16)
PKEY_Document_Version.pid := 29

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Document_WordCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Document_WordCount.fmtid),
    Guid.Ptr, Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}"),
    UInt32, 16)
PKEY_Document_WordCount.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DRM_DatePlayExpires := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DRM_DatePlayExpires.fmtid),
    Guid.Ptr, Guid("{aeac19e4-89ae-4508-b9b7-bb867abee2ed}"),
    UInt32, 16)
PKEY_DRM_DatePlayExpires.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DRM_DatePlayStarts := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DRM_DatePlayStarts.fmtid),
    Guid.Ptr, Guid("{aeac19e4-89ae-4508-b9b7-bb867abee2ed}"),
    UInt32, 16)
PKEY_DRM_DatePlayStarts.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DRM_Description := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DRM_Description.fmtid),
    Guid.Ptr, Guid("{aeac19e4-89ae-4508-b9b7-bb867abee2ed}"),
    UInt32, 16)
PKEY_DRM_Description.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DRM_IsDisabled := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DRM_IsDisabled.fmtid),
    Guid.Ptr, Guid("{aeac19e4-89ae-4508-b9b7-bb867abee2ed}"),
    UInt32, 16)
PKEY_DRM_IsDisabled.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DRM_IsProtected := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DRM_IsProtected.fmtid),
    Guid.Ptr, Guid("{aeac19e4-89ae-4508-b9b7-bb867abee2ed}"),
    UInt32, 16)
PKEY_DRM_IsProtected.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DRM_PlayCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DRM_PlayCount.fmtid),
    Guid.Ptr, Guid("{aeac19e4-89ae-4508-b9b7-bb867abee2ed}"),
    UInt32, 16)
PKEY_DRM_PlayCount.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_Altitude := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_Altitude.fmtid),
    Guid.Ptr, Guid("{827edb4f-5b73-44a7-891d-fdffabea35ca}"),
    UInt32, 16)
PKEY_GPS_Altitude.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_AltitudeDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_AltitudeDenominator.fmtid),
    Guid.Ptr, Guid("{78342dcb-e358-4145-ae9a-6bfe4e0f9f51}"),
    UInt32, 16)
PKEY_GPS_AltitudeDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_AltitudeNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_AltitudeNumerator.fmtid),
    Guid.Ptr, Guid("{2dad1eb7-816d-40d3-9ec3-c9773be2aade}"),
    UInt32, 16)
PKEY_GPS_AltitudeNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_AltitudeRef := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_AltitudeRef.fmtid),
    Guid.Ptr, Guid("{46ac629d-75ea-4515-867f-6dc4321c5844}"),
    UInt32, 16)
PKEY_GPS_AltitudeRef.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_AreaInformation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_AreaInformation.fmtid),
    Guid.Ptr, Guid("{972e333e-ac7e-49f1-8adf-a70d07a9bcab}"),
    UInt32, 16)
PKEY_GPS_AreaInformation.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_Date := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_Date.fmtid),
    Guid.Ptr, Guid("{3602c812-0f3b-45f0-85ad-603468d69423}"),
    UInt32, 16)
PKEY_GPS_Date.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DestBearing := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DestBearing.fmtid),
    Guid.Ptr, Guid("{c66d4b3c-e888-47cc-b99f-9dca3ee34dea}"),
    UInt32, 16)
PKEY_GPS_DestBearing.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DestBearingDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DestBearingDenominator.fmtid),
    Guid.Ptr, Guid("{7abcf4f8-7c3f-4988-ac91-8d2c2e97eca5}"),
    UInt32, 16)
PKEY_GPS_DestBearingDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DestBearingNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DestBearingNumerator.fmtid),
    Guid.Ptr, Guid("{ba3b1da9-86ee-4b5d-a2a4-a271a429f0cf}"),
    UInt32, 16)
PKEY_GPS_DestBearingNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DestBearingRef := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DestBearingRef.fmtid),
    Guid.Ptr, Guid("{9ab84393-2a0f-4b75-bb22-7279786977cb}"),
    UInt32, 16)
PKEY_GPS_DestBearingRef.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DestDistance := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DestDistance.fmtid),
    Guid.Ptr, Guid("{a93eae04-6804-4f24-ac81-09b266452118}"),
    UInt32, 16)
PKEY_GPS_DestDistance.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DestDistanceDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DestDistanceDenominator.fmtid),
    Guid.Ptr, Guid("{9bc2c99b-ac71-4127-9d1c-2596d0d7dcb7}"),
    UInt32, 16)
PKEY_GPS_DestDistanceDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DestDistanceNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DestDistanceNumerator.fmtid),
    Guid.Ptr, Guid("{2bda47da-08c6-4fe1-80bc-a72fc517c5d0}"),
    UInt32, 16)
PKEY_GPS_DestDistanceNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DestDistanceRef := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DestDistanceRef.fmtid),
    Guid.Ptr, Guid("{ed4df2d3-8695-450b-856f-f5c1c53acb66}"),
    UInt32, 16)
PKEY_GPS_DestDistanceRef.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DestLatitude := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DestLatitude.fmtid),
    Guid.Ptr, Guid("{9d1d7cc5-5c39-451c-86b3-928e2d18cc47}"),
    UInt32, 16)
PKEY_GPS_DestLatitude.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DestLatitudeDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DestLatitudeDenominator.fmtid),
    Guid.Ptr, Guid("{3a372292-7fca-49a7-99d5-e47bb2d4e7ab}"),
    UInt32, 16)
PKEY_GPS_DestLatitudeDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DestLatitudeNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DestLatitudeNumerator.fmtid),
    Guid.Ptr, Guid("{ecf4b6f6-d5a6-433c-bb92-4076650fc890}"),
    UInt32, 16)
PKEY_GPS_DestLatitudeNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DestLatitudeRef := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DestLatitudeRef.fmtid),
    Guid.Ptr, Guid("{cea820b9-ce61-4885-a128-005d9087c192}"),
    UInt32, 16)
PKEY_GPS_DestLatitudeRef.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DestLongitude := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DestLongitude.fmtid),
    Guid.Ptr, Guid("{47a96261-cb4c-4807-8ad3-40b9d9dbc6bc}"),
    UInt32, 16)
PKEY_GPS_DestLongitude.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DestLongitudeDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DestLongitudeDenominator.fmtid),
    Guid.Ptr, Guid("{425d69e5-48ad-4900-8d80-6eb6b8d0ac86}"),
    UInt32, 16)
PKEY_GPS_DestLongitudeDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DestLongitudeNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DestLongitudeNumerator.fmtid),
    Guid.Ptr, Guid("{a3250282-fb6d-48d5-9a89-dbcace75cccf}"),
    UInt32, 16)
PKEY_GPS_DestLongitudeNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DestLongitudeRef := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DestLongitudeRef.fmtid),
    Guid.Ptr, Guid("{182c1ea6-7c1c-4083-ab4b-ac6c9f4ed128}"),
    UInt32, 16)
PKEY_GPS_DestLongitudeRef.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_Differential := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_Differential.fmtid),
    Guid.Ptr, Guid("{aaf4ee25-bd3b-4dd7-bfc4-47f77bb00f6d}"),
    UInt32, 16)
PKEY_GPS_Differential.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DOP := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DOP.fmtid),
    Guid.Ptr, Guid("{0cf8fb02-1837-42f1-a697-a7017aa289b9}"),
    UInt32, 16)
PKEY_GPS_DOP.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DOPDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DOPDenominator.fmtid),
    Guid.Ptr, Guid("{a0be94c5-50ba-487b-bd35-0654be8881ed}"),
    UInt32, 16)
PKEY_GPS_DOPDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_DOPNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_DOPNumerator.fmtid),
    Guid.Ptr, Guid("{47166b16-364f-4aa0-9f31-e2ab3df449c3}"),
    UInt32, 16)
PKEY_GPS_DOPNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_ImgDirection := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_ImgDirection.fmtid),
    Guid.Ptr, Guid("{16473c91-d017-4ed9-ba4d-b6baa55dbcf8}"),
    UInt32, 16)
PKEY_GPS_ImgDirection.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_ImgDirectionDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_ImgDirectionDenominator.fmtid),
    Guid.Ptr, Guid("{10b24595-41a2-4e20-93c2-5761c1395f32}"),
    UInt32, 16)
PKEY_GPS_ImgDirectionDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_ImgDirectionNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_ImgDirectionNumerator.fmtid),
    Guid.Ptr, Guid("{dc5877c7-225f-45f7-bac7-e81334b6130a}"),
    UInt32, 16)
PKEY_GPS_ImgDirectionNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_ImgDirectionRef := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_ImgDirectionRef.fmtid),
    Guid.Ptr, Guid("{a4aaa5b7-1ad0-445f-811a-0f8f6e67f6b5}"),
    UInt32, 16)
PKEY_GPS_ImgDirectionRef.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_Latitude := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_Latitude.fmtid),
    Guid.Ptr, Guid("{8727cfff-4868-4ec6-ad5b-81b98521d1ab}"),
    UInt32, 16)
PKEY_GPS_Latitude.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_LatitudeDecimal := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_LatitudeDecimal.fmtid),
    Guid.Ptr, Guid("{0f55cde2-4f49-450d-92c1-dcd16301b1b7}"),
    UInt32, 16)
PKEY_GPS_LatitudeDecimal.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_LatitudeDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_LatitudeDenominator.fmtid),
    Guid.Ptr, Guid("{16e634ee-2bff-497b-bd8a-4341ad39eeb9}"),
    UInt32, 16)
PKEY_GPS_LatitudeDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_LatitudeNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_LatitudeNumerator.fmtid),
    Guid.Ptr, Guid("{7ddaaad1-ccc8-41ae-b750-b2cb8031aea2}"),
    UInt32, 16)
PKEY_GPS_LatitudeNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_LatitudeRef := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_LatitudeRef.fmtid),
    Guid.Ptr, Guid("{029c0252-5b86-46c7-aca0-2769ffc8e3d4}"),
    UInt32, 16)
PKEY_GPS_LatitudeRef.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_Longitude := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_Longitude.fmtid),
    Guid.Ptr, Guid("{c4c4dbb2-b593-466b-bbda-d03d27d5e43a}"),
    UInt32, 16)
PKEY_GPS_Longitude.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_LongitudeDecimal := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_LongitudeDecimal.fmtid),
    Guid.Ptr, Guid("{4679c1b5-844d-4590-baf5-f322231f1b81}"),
    UInt32, 16)
PKEY_GPS_LongitudeDecimal.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_LongitudeDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_LongitudeDenominator.fmtid),
    Guid.Ptr, Guid("{be6e176c-4534-4d2c-ace5-31dedac1606b}"),
    UInt32, 16)
PKEY_GPS_LongitudeDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_LongitudeNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_LongitudeNumerator.fmtid),
    Guid.Ptr, Guid("{02b0f689-a914-4e45-821d-1dda452ed2c4}"),
    UInt32, 16)
PKEY_GPS_LongitudeNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_LongitudeRef := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_LongitudeRef.fmtid),
    Guid.Ptr, Guid("{33dcf22b-28d5-464c-8035-1ee9efd25278}"),
    UInt32, 16)
PKEY_GPS_LongitudeRef.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_MapDatum := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_MapDatum.fmtid),
    Guid.Ptr, Guid("{2ca2dae6-eddc-407d-bef1-773942abfa95}"),
    UInt32, 16)
PKEY_GPS_MapDatum.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_MeasureMode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_MeasureMode.fmtid),
    Guid.Ptr, Guid("{a015ed5d-aaea-4d58-8a86-3c586920ea0b}"),
    UInt32, 16)
PKEY_GPS_MeasureMode.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_ProcessingMethod := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_ProcessingMethod.fmtid),
    Guid.Ptr, Guid("{59d49e61-840f-4aa9-a939-e2099b7f6399}"),
    UInt32, 16)
PKEY_GPS_ProcessingMethod.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_Satellites := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_Satellites.fmtid),
    Guid.Ptr, Guid("{467ee575-1f25-4557-ad4e-b8b58b0d9c15}"),
    UInt32, 16)
PKEY_GPS_Satellites.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_Speed := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_Speed.fmtid),
    Guid.Ptr, Guid("{da5d0862-6e76-4e1b-babd-70021bd25494}"),
    UInt32, 16)
PKEY_GPS_Speed.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_SpeedDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_SpeedDenominator.fmtid),
    Guid.Ptr, Guid("{7d122d5a-ae5e-4335-8841-d71e7ce72f53}"),
    UInt32, 16)
PKEY_GPS_SpeedDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_SpeedNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_SpeedNumerator.fmtid),
    Guid.Ptr, Guid("{acc9ce3d-c213-4942-8b48-6d0820f21c6d}"),
    UInt32, 16)
PKEY_GPS_SpeedNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_SpeedRef := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_SpeedRef.fmtid),
    Guid.Ptr, Guid("{ecf7f4c9-544f-4d6d-9d98-8ad79adaf453}"),
    UInt32, 16)
PKEY_GPS_SpeedRef.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_Status := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_Status.fmtid),
    Guid.Ptr, Guid("{125491f4-818f-46b2-91b5-d537753617b2}"),
    UInt32, 16)
PKEY_GPS_Status.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_Track := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_Track.fmtid),
    Guid.Ptr, Guid("{76c09943-7c33-49e3-9e7e-cdba872cfada}"),
    UInt32, 16)
PKEY_GPS_Track.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_TrackDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_TrackDenominator.fmtid),
    Guid.Ptr, Guid("{c8d1920c-01f6-40c0-ac86-2f3a4ad00770}"),
    UInt32, 16)
PKEY_GPS_TrackDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_TrackNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_TrackNumerator.fmtid),
    Guid.Ptr, Guid("{702926f4-44a6-43e1-ae71-45627116893b}"),
    UInt32, 16)
PKEY_GPS_TrackNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_TrackRef := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_TrackRef.fmtid),
    Guid.Ptr, Guid("{35dbe6fe-44c3-4400-aaae-d2c799c407e8}"),
    UInt32, 16)
PKEY_GPS_TrackRef.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_GPS_VersionID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_GPS_VersionID.fmtid),
    Guid.Ptr, Guid("{22704da4-c6b2-4a99-8e56-f16df8c92599}"),
    UInt32, 16)
PKEY_GPS_VersionID.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_History_VisitCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_History_VisitCount.fmtid),
    Guid.Ptr, Guid("{5cbf2787-48cf-4208-b90e-ee5e5d420294}"),
    UInt32, 16)
PKEY_History_VisitCount.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Image_BitDepth := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Image_BitDepth.fmtid),
    Guid.Ptr, Guid("{6444048f-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Image_BitDepth.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Image_ColorSpace := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Image_ColorSpace.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Image_ColorSpace.pid := 40961

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Image_CompressedBitsPerPixel := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Image_CompressedBitsPerPixel.fmtid),
    Guid.Ptr, Guid("{364b6fa9-37ab-482a-be2b-ae02f60d4318}"),
    UInt32, 16)
PKEY_Image_CompressedBitsPerPixel.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Image_CompressedBitsPerPixelDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Image_CompressedBitsPerPixelDenominator.fmtid),
    Guid.Ptr, Guid("{1f8844e1-24ad-4508-9dfd-5326a415ce02}"),
    UInt32, 16)
PKEY_Image_CompressedBitsPerPixelDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Image_CompressedBitsPerPixelNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Image_CompressedBitsPerPixelNumerator.fmtid),
    Guid.Ptr, Guid("{d21a7148-d32c-4624-8900-277210f79c0f}"),
    UInt32, 16)
PKEY_Image_CompressedBitsPerPixelNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Image_Compression := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Image_Compression.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Image_Compression.pid := 259

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Image_CompressionText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Image_CompressionText.fmtid),
    Guid.Ptr, Guid("{3f08e66f-2f44-4bb9-a682-ac35d2562322}"),
    UInt32, 16)
PKEY_Image_CompressionText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Image_Dimensions := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Image_Dimensions.fmtid),
    Guid.Ptr, Guid("{6444048f-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Image_Dimensions.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Image_HorizontalResolution := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Image_HorizontalResolution.fmtid),
    Guid.Ptr, Guid("{6444048f-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Image_HorizontalResolution.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Image_HorizontalSize := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Image_HorizontalSize.fmtid),
    Guid.Ptr, Guid("{6444048f-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Image_HorizontalSize.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Image_ImageID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Image_ImageID.fmtid),
    Guid.Ptr, Guid("{10dabe05-32aa-4c29-bf1a-63e2d220587f}"),
    UInt32, 16)
PKEY_Image_ImageID.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Image_ResolutionUnit := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Image_ResolutionUnit.fmtid),
    Guid.Ptr, Guid("{19b51fa6-1f92-4a5c-ab48-7df0abd67444}"),
    UInt32, 16)
PKEY_Image_ResolutionUnit.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Image_VerticalResolution := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Image_VerticalResolution.fmtid),
    Guid.Ptr, Guid("{6444048f-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Image_VerticalResolution.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Image_VerticalSize := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Image_VerticalSize.fmtid),
    Guid.Ptr, Guid("{6444048f-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Image_VerticalSize.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Journal_Contacts := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Journal_Contacts.fmtid),
    Guid.Ptr, Guid("{dea7c82c-1d89-4a66-9427-a4e3debabcb1}"),
    UInt32, 16)
PKEY_Journal_Contacts.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Journal_EntryType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Journal_EntryType.fmtid),
    Guid.Ptr, Guid("{95beb1fc-326d-4644-b396-cd3ed90e6ddf}"),
    UInt32, 16)
PKEY_Journal_EntryType.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_LayoutPattern_ContentViewModeForBrowse := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_LayoutPattern_ContentViewModeForBrowse.fmtid),
    Guid.Ptr, Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}"),
    UInt32, 16)
PKEY_LayoutPattern_ContentViewModeForBrowse.pid := 500

/**
 * @type {String}
 */
export global LAYOUTPATTERN_CVMFB_ALPHA := "alpha"

/**
 * @type {String}
 */
export global LAYOUTPATTERN_CVMFB_BETA := "beta"

/**
 * @type {String}
 */
export global LAYOUTPATTERN_CVMFB_GAMMA := "gamma"

/**
 * @type {String}
 */
export global LAYOUTPATTERN_CVMFB_DELTA := "delta"

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_LayoutPattern_ContentViewModeForSearch := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_LayoutPattern_ContentViewModeForSearch.fmtid),
    Guid.Ptr, Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}"),
    UInt32, 16)
PKEY_LayoutPattern_ContentViewModeForSearch.pid := 501

/**
 * @type {String}
 */
export global LAYOUTPATTERN_CVMFS_ALPHA := "alpha"

/**
 * @type {String}
 */
export global LAYOUTPATTERN_CVMFS_BETA := "beta"

/**
 * @type {String}
 */
export global LAYOUTPATTERN_CVMFS_GAMMA := "gamma"

/**
 * @type {String}
 */
export global LAYOUTPATTERN_CVMFS_DELTA := "delta"

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_History_SelectionCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_History_SelectionCount.fmtid),
    Guid.Ptr, Guid("{1ce0d6bc-536c-4600-b0dd-7e0c66b350d5}"),
    UInt32, 16)
PKEY_History_SelectionCount.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_History_TargetUrlHostName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_History_TargetUrlHostName.fmtid),
    Guid.Ptr, Guid("{1ce0d6bc-536c-4600-b0dd-7e0c66b350d5}"),
    UInt32, 16)
PKEY_History_TargetUrlHostName.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Link_Arguments := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Link_Arguments.fmtid),
    Guid.Ptr, Guid("{436f2667-14e2-4feb-b30a-146c53b5b674}"),
    UInt32, 16)
PKEY_Link_Arguments.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Link_Comment := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Link_Comment.fmtid),
    Guid.Ptr, Guid("{b9b4b3fc-2b51-4a42-b5d8-324146afcf25}"),
    UInt32, 16)
PKEY_Link_Comment.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Link_DateVisited := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Link_DateVisited.fmtid),
    Guid.Ptr, Guid("{5cbf2787-48cf-4208-b90e-ee5e5d420294}"),
    UInt32, 16)
PKEY_Link_DateVisited.pid := 23

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Link_Description := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Link_Description.fmtid),
    Guid.Ptr, Guid("{5cbf2787-48cf-4208-b90e-ee5e5d420294}"),
    UInt32, 16)
PKEY_Link_Description.pid := 21

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Link_FeedItemLocalId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Link_FeedItemLocalId.fmtid),
    Guid.Ptr, Guid("{8a2f99f9-3c37-465d-a8d7-69777a246d0c}"),
    UInt32, 16)
PKEY_Link_FeedItemLocalId.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Link_Status := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Link_Status.fmtid),
    Guid.Ptr, Guid("{b9b4b3fc-2b51-4a42-b5d8-324146afcf25}"),
    UInt32, 16)
PKEY_Link_Status.pid := 3

/**
 * @type {Integer (Int32)}
 */
export global LINK_STATUS_RESOLVED := 1

/**
 * @type {Integer (Int32)}
 */
export global LINK_STATUS_BROKEN := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Link_TargetExtension := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Link_TargetExtension.fmtid),
    Guid.Ptr, Guid("{7a7d76f4-b630-4bd7-95ff-37cc51a975c9}"),
    UInt32, 16)
PKEY_Link_TargetExtension.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Link_TargetParsingPath := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Link_TargetParsingPath.fmtid),
    Guid.Ptr, Guid("{b9b4b3fc-2b51-4a42-b5d8-324146afcf25}"),
    UInt32, 16)
PKEY_Link_TargetParsingPath.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Link_TargetSFGAOFlags := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Link_TargetSFGAOFlags.fmtid),
    Guid.Ptr, Guid("{b9b4b3fc-2b51-4a42-b5d8-324146afcf25}"),
    UInt32, 16)
PKEY_Link_TargetSFGAOFlags.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Link_TargetUrlHostName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Link_TargetUrlHostName.fmtid),
    Guid.Ptr, Guid("{8a2f99f9-3c37-465d-a8d7-69777a246d0c}"),
    UInt32, 16)
PKEY_Link_TargetUrlHostName.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Link_TargetUrlPath := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Link_TargetUrlPath.fmtid),
    Guid.Ptr, Guid("{8a2f99f9-3c37-465d-a8d7-69777a246d0c}"),
    UInt32, 16)
PKEY_Link_TargetUrlPath.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_AuthorUrl := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_AuthorUrl.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_AuthorUrl.pid := 32

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_AverageLevel := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_AverageLevel.fmtid),
    Guid.Ptr, Guid("{09edd5b6-b301-43c5-9990-d00302effd46}"),
    UInt32, 16)
PKEY_Media_AverageLevel.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_ClassPrimaryID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_ClassPrimaryID.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_ClassPrimaryID.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_ClassSecondaryID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_ClassSecondaryID.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_ClassSecondaryID.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_CollectionGroupID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_CollectionGroupID.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_CollectionGroupID.pid := 24

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_CollectionID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_CollectionID.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_CollectionID.pid := 25

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_ContentDistributor := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_ContentDistributor.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_ContentDistributor.pid := 18

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_ContentID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_ContentID.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_ContentID.pid := 26

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_CreatorApplication := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_CreatorApplication.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_CreatorApplication.pid := 27

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_CreatorApplicationVersion := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_CreatorApplicationVersion.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_CreatorApplicationVersion.pid := 28

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_DateEncoded := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_DateEncoded.fmtid),
    Guid.Ptr, Guid("{2e4b640d-5019-46d8-8881-55414cc5caa0}"),
    UInt32, 16)
PKEY_Media_DateEncoded.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_DateReleased := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_DateReleased.fmtid),
    Guid.Ptr, Guid("{de41cc29-6971-4290-b472-f59f2e2f31e2}"),
    UInt32, 16)
PKEY_Media_DateReleased.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_DlnaProfileID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_DlnaProfileID.fmtid),
    Guid.Ptr, Guid("{cfa31b45-525d-4998-bb44-3f7d81542fa4}"),
    UInt32, 16)
PKEY_Media_DlnaProfileID.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_Duration := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_Duration.fmtid),
    Guid.Ptr, Guid("{64440490-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_Duration.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_DVDID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_DVDID.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_DVDID.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_EncodedBy := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_EncodedBy.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_EncodedBy.pid := 36

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_EncodingSettings := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_EncodingSettings.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_EncodingSettings.pid := 37

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_EpisodeNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_EpisodeNumber.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_EpisodeNumber.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_FrameCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_FrameCount.fmtid),
    Guid.Ptr, Guid("{6444048f-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_FrameCount.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_MCDI := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_MCDI.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_MCDI.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_MetadataContentProvider := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_MetadataContentProvider.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_MetadataContentProvider.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_Producer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_Producer.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_Producer.pid := 22

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_PromotionUrl := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_PromotionUrl.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_PromotionUrl.pid := 33

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_ProtectionType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_ProtectionType.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_ProtectionType.pid := 38

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_ProviderRating := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_ProviderRating.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_ProviderRating.pid := 39

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_ProviderStyle := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_ProviderStyle.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_ProviderStyle.pid := 40

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_Publisher := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_Publisher.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_Publisher.pid := 30

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_SeasonNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_SeasonNumber.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_SeasonNumber.pid := 101

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_SeriesName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_SeriesName.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_SeriesName.pid := 42

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_SubscriptionContentId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_SubscriptionContentId.fmtid),
    Guid.Ptr, Guid("{9aebae7a-9644-487d-a92c-657585ed751a}"),
    UInt32, 16)
PKEY_Media_SubscriptionContentId.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_SubTitle := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_SubTitle.fmtid),
    Guid.Ptr, Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}"),
    UInt32, 16)
PKEY_Media_SubTitle.pid := 38

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_ThumbnailLargePath := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_ThumbnailLargePath.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_ThumbnailLargePath.pid := 47

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_ThumbnailLargeUri := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_ThumbnailLargeUri.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_ThumbnailLargeUri.pid := 48

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_ThumbnailSmallPath := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_ThumbnailSmallPath.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_ThumbnailSmallPath.pid := 49

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_ThumbnailSmallUri := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_ThumbnailSmallUri.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_ThumbnailSmallUri.pid := 50

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_UniqueFileIdentifier := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_UniqueFileIdentifier.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_UniqueFileIdentifier.pid := 35

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_UserNoAutoInfo := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_UserNoAutoInfo.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_UserNoAutoInfo.pid := 41

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_UserWebUrl := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_UserWebUrl.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_UserWebUrl.pid := 34

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_Writer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_Writer.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Media_Writer.pid := 23

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Media_Year := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Media_Year.fmtid),
    Guid.Ptr, Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}"),
    UInt32, 16)
PKEY_Media_Year.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_AttachmentContents := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_AttachmentContents.fmtid),
    Guid.Ptr, Guid("{3143bf7c-80a8-4854-8880-e2e40189bdd0}"),
    UInt32, 16)
PKEY_Message_AttachmentContents.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_AttachmentNames := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_AttachmentNames.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_Message_AttachmentNames.pid := 21

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_BccAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_BccAddress.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_Message_BccAddress.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_BccName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_BccName.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_Message_BccName.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_CcAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_CcAddress.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_Message_CcAddress.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_CcName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_CcName.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_Message_CcName.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_ConversationID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_ConversationID.fmtid),
    Guid.Ptr, Guid("{dc8f80bd-af1e-4289-85b6-3dfc1b493992}"),
    UInt32, 16)
PKEY_Message_ConversationID.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_ConversationIndex := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_ConversationIndex.fmtid),
    Guid.Ptr, Guid("{dc8f80bd-af1e-4289-85b6-3dfc1b493992}"),
    UInt32, 16)
PKEY_Message_ConversationIndex.pid := 101

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_DateReceived := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_DateReceived.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_Message_DateReceived.pid := 20

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_DateSent := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_DateSent.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_Message_DateSent.pid := 19

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_Flags := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_Flags.fmtid),
    Guid.Ptr, Guid("{a82d9ee7-ca67-4312-965e-226bcea85023}"),
    UInt32, 16)
PKEY_Message_Flags.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_FromAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_FromAddress.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_Message_FromAddress.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_FromName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_FromName.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_Message_FromName.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_HasAttachments := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_HasAttachments.fmtid),
    Guid.Ptr, Guid("{9c1fcf74-2d97-41ba-b4ae-cb2e3661a6e4}"),
    UInt32, 16)
PKEY_Message_HasAttachments.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_IsFwdOrReply := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_IsFwdOrReply.fmtid),
    Guid.Ptr, Guid("{9a9bc088-4f6d-469e-9919-e705412040f9}"),
    UInt32, 16)
PKEY_Message_IsFwdOrReply.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_MessageClass := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_MessageClass.fmtid),
    Guid.Ptr, Guid("{cd9ed458-08ce-418f-a70e-f912c7bb9c5c}"),
    UInt32, 16)
PKEY_Message_MessageClass.pid := 103

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_Participants := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_Participants.fmtid),
    Guid.Ptr, Guid("{1a9ba605-8e7c-4d11-ad7d-a50ada18ba1b}"),
    UInt32, 16)
PKEY_Message_Participants.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_ProofInProgress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_ProofInProgress.fmtid),
    Guid.Ptr, Guid("{9098f33c-9a7d-48a8-8de5-2e1227a64e91}"),
    UInt32, 16)
PKEY_Message_ProofInProgress.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_SenderAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_SenderAddress.fmtid),
    Guid.Ptr, Guid("{0be1c8e7-1981-4676-ae14-fdd78f05a6e7}"),
    UInt32, 16)
PKEY_Message_SenderAddress.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_SenderName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_SenderName.fmtid),
    Guid.Ptr, Guid("{0da41cfa-d224-4a18-ae2f-596158db4b3a}"),
    UInt32, 16)
PKEY_Message_SenderName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_Store := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_Store.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_Message_Store.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_ToAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_ToAddress.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_Message_ToAddress.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_ToDoFlags := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_ToDoFlags.fmtid),
    Guid.Ptr, Guid("{1f856a9f-6900-4aba-9505-2d5f1b4d66cb}"),
    UInt32, 16)
PKEY_Message_ToDoFlags.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_ToDoTitle := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_ToDoTitle.fmtid),
    Guid.Ptr, Guid("{bccc8a3c-8cef-42e5-9b1c-c69079398bc7}"),
    UInt32, 16)
PKEY_Message_ToDoTitle.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Message_ToName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Message_ToName.fmtid),
    Guid.Ptr, Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}"),
    UInt32, 16)
PKEY_Message_ToName.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MsGraph_ActivityType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MsGraph_ActivityType.fmtid),
    Guid.Ptr, Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}"),
    UInt32, 16)
PKEY_MsGraph_ActivityType.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MsGraph_CompositeId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MsGraph_CompositeId.fmtid),
    Guid.Ptr, Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}"),
    UInt32, 16)
PKEY_MsGraph_CompositeId.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MsGraph_DateLastShared := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MsGraph_DateLastShared.fmtid),
    Guid.Ptr, Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}"),
    UInt32, 16)
PKEY_MsGraph_DateLastShared.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MsGraph_DriveId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MsGraph_DriveId.fmtid),
    Guid.Ptr, Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}"),
    UInt32, 16)
PKEY_MsGraph_DriveId.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MsGraph_GraphFileType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MsGraph_GraphFileType.fmtid),
    Guid.Ptr, Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}"),
    UInt32, 16)
PKEY_MsGraph_GraphFileType.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MsGraph_IconUrl := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MsGraph_IconUrl.fmtid),
    Guid.Ptr, Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}"),
    UInt32, 16)
PKEY_MsGraph_IconUrl.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MsGraph_ItemId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MsGraph_ItemId.fmtid),
    Guid.Ptr, Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}"),
    UInt32, 16)
PKEY_MsGraph_ItemId.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MsGraph_PrimaryActivityActorDisplayName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MsGraph_PrimaryActivityActorDisplayName.fmtid),
    Guid.Ptr, Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}"),
    UInt32, 16)
PKEY_MsGraph_PrimaryActivityActorDisplayName.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MsGraph_PrimaryActivityActorUpn := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MsGraph_PrimaryActivityActorUpn.fmtid),
    Guid.Ptr, Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}"),
    UInt32, 16)
PKEY_MsGraph_PrimaryActivityActorUpn.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MsGraph_RecommendationReason := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MsGraph_RecommendationReason.fmtid),
    Guid.Ptr, Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}"),
    UInt32, 16)
PKEY_MsGraph_RecommendationReason.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MsGraph_RecommendationReferenceId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MsGraph_RecommendationReferenceId.fmtid),
    Guid.Ptr, Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}"),
    UInt32, 16)
PKEY_MsGraph_RecommendationReferenceId.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MsGraph_RecommendationResultSourceId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MsGraph_RecommendationResultSourceId.fmtid),
    Guid.Ptr, Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}"),
    UInt32, 16)
PKEY_MsGraph_RecommendationResultSourceId.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MsGraph_SharedByEmail := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MsGraph_SharedByEmail.fmtid),
    Guid.Ptr, Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}"),
    UInt32, 16)
PKEY_MsGraph_SharedByEmail.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MsGraph_SharedByName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MsGraph_SharedByName.fmtid),
    Guid.Ptr, Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}"),
    UInt32, 16)
PKEY_MsGraph_SharedByName.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MsGraph_WebAccountId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MsGraph_WebAccountId.fmtid),
    Guid.Ptr, Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}"),
    UInt32, 16)
PKEY_MsGraph_WebAccountId.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_AlbumArtist := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_AlbumArtist.fmtid),
    Guid.Ptr, Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}"),
    UInt32, 16)
PKEY_Music_AlbumArtist.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_AlbumArtistSortOverride := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_AlbumArtistSortOverride.fmtid),
    Guid.Ptr, Guid("{f1fdb4af-f78c-466c-bb05-56e92db0b8ec}"),
    UInt32, 16)
PKEY_Music_AlbumArtistSortOverride.pid := 103

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_AlbumID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_AlbumID.fmtid),
    Guid.Ptr, Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}"),
    UInt32, 16)
PKEY_Music_AlbumID.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_AlbumTitle := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_AlbumTitle.fmtid),
    Guid.Ptr, Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}"),
    UInt32, 16)
PKEY_Music_AlbumTitle.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_AlbumTitleSortOverride := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_AlbumTitleSortOverride.fmtid),
    Guid.Ptr, Guid("{13eb7ffc-ec89-4346-b19d-ccc6f1784223}"),
    UInt32, 16)
PKEY_Music_AlbumTitleSortOverride.pid := 101

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_Artist := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_Artist.fmtid),
    Guid.Ptr, Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}"),
    UInt32, 16)
PKEY_Music_Artist.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_ArtistSortOverride := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_ArtistSortOverride.fmtid),
    Guid.Ptr, Guid("{deeb2db5-0696-4ce0-94fe-a01f77a45fb5}"),
    UInt32, 16)
PKEY_Music_ArtistSortOverride.pid := 102

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_BeatsPerMinute := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_BeatsPerMinute.fmtid),
    Guid.Ptr, Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}"),
    UInt32, 16)
PKEY_Music_BeatsPerMinute.pid := 35

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_Composer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_Composer.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Music_Composer.pid := 19

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_ComposerSortOverride := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_ComposerSortOverride.fmtid),
    Guid.Ptr, Guid("{00bc20a3-bd48-4085-872c-a88d77f5097e}"),
    UInt32, 16)
PKEY_Music_ComposerSortOverride.pid := 105

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_Conductor := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_Conductor.fmtid),
    Guid.Ptr, Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}"),
    UInt32, 16)
PKEY_Music_Conductor.pid := 36

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_ContentGroupDescription := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_ContentGroupDescription.fmtid),
    Guid.Ptr, Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}"),
    UInt32, 16)
PKEY_Music_ContentGroupDescription.pid := 33

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_DiscNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_DiscNumber.fmtid),
    Guid.Ptr, Guid("{6afe7437-9bcd-49c7-80fe-4a5c65fa5874}"),
    UInt32, 16)
PKEY_Music_DiscNumber.pid := 104

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_DisplayArtist := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_DisplayArtist.fmtid),
    Guid.Ptr, Guid("{fd122953-fa93-4ef7-92c3-04c946b2f7c8}"),
    UInt32, 16)
PKEY_Music_DisplayArtist.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_Genre := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_Genre.fmtid),
    Guid.Ptr, Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}"),
    UInt32, 16)
PKEY_Music_Genre.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_InitialKey := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_InitialKey.fmtid),
    Guid.Ptr, Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}"),
    UInt32, 16)
PKEY_Music_InitialKey.pid := 34

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_IsCompilation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_IsCompilation.fmtid),
    Guid.Ptr, Guid("{c449d5cb-9ea4-4809-82e8-af9d59ded6d1}"),
    UInt32, 16)
PKEY_Music_IsCompilation.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_Lyrics := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_Lyrics.fmtid),
    Guid.Ptr, Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}"),
    UInt32, 16)
PKEY_Music_Lyrics.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_Mood := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_Mood.fmtid),
    Guid.Ptr, Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}"),
    UInt32, 16)
PKEY_Music_Mood.pid := 39

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_PartOfSet := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_PartOfSet.fmtid),
    Guid.Ptr, Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}"),
    UInt32, 16)
PKEY_Music_PartOfSet.pid := 37

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_Period := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_Period.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Music_Period.pid := 31

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_SynchronizedLyrics := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_SynchronizedLyrics.fmtid),
    Guid.Ptr, Guid("{6b223b6a-162e-4aa9-b39f-05d678fc6d77}"),
    UInt32, 16)
PKEY_Music_SynchronizedLyrics.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Music_TrackNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Music_TrackNumber.fmtid),
    Guid.Ptr, Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}"),
    UInt32, 16)
PKEY_Music_TrackNumber.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Note_Color := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Note_Color.fmtid),
    Guid.Ptr, Guid("{4776cafa-bce4-4cb1-a23e-265e76d8eb11}"),
    UInt32, 16)
PKEY_Note_Color.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Note_ColorText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Note_ColorText.fmtid),
    Guid.Ptr, Guid("{46b4e8de-cdb2-440d-885c-1658eb65b914}"),
    UInt32, 16)
PKEY_Note_ColorText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_Aperture := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_Aperture.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_Aperture.pid := 37378

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ApertureDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ApertureDenominator.fmtid),
    Guid.Ptr, Guid("{e1a9a38b-6685-46bd-875e-570dc7ad7320}"),
    UInt32, 16)
PKEY_Photo_ApertureDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ApertureNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ApertureNumerator.fmtid),
    Guid.Ptr, Guid("{0337ecec-39fb-4581-a0bd-4c4cc51e9914}"),
    UInt32, 16)
PKEY_Photo_ApertureNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_Brightness := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_Brightness.fmtid),
    Guid.Ptr, Guid("{1a701bf6-478c-4361-83ab-3701bb053c58}"),
    UInt32, 16)
PKEY_Photo_Brightness.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_BrightnessDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_BrightnessDenominator.fmtid),
    Guid.Ptr, Guid("{6ebe6946-2321-440a-90f0-c043efd32476}"),
    UInt32, 16)
PKEY_Photo_BrightnessDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_BrightnessNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_BrightnessNumerator.fmtid),
    Guid.Ptr, Guid("{9e7d118f-b314-45a0-8cfb-d654b917c9e9}"),
    UInt32, 16)
PKEY_Photo_BrightnessNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_CameraManufacturer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_CameraManufacturer.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_CameraManufacturer.pid := 271

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_CameraModel := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_CameraModel.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_CameraModel.pid := 272

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_CameraSerialNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_CameraSerialNumber.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_CameraSerialNumber.pid := 273

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_Contrast := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_Contrast.fmtid),
    Guid.Ptr, Guid("{2a785ba9-8d23-4ded-82e6-60a350c86a10}"),
    UInt32, 16)
PKEY_Photo_Contrast.pid := 100

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_CONTRAST_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_CONTRAST_SOFT := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_CONTRAST_HARD := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ContrastText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ContrastText.fmtid),
    Guid.Ptr, Guid("{59dde9f2-5253-40ea-9a8b-479e96c6249a}"),
    UInt32, 16)
PKEY_Photo_ContrastText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_DateTaken := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_DateTaken.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_DateTaken.pid := 36867

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_DigitalZoom := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_DigitalZoom.fmtid),
    Guid.Ptr, Guid("{f85bf840-a925-4bc2-b0c4-8e36b598679e}"),
    UInt32, 16)
PKEY_Photo_DigitalZoom.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_DigitalZoomDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_DigitalZoomDenominator.fmtid),
    Guid.Ptr, Guid("{745baf0e-e5c1-4cfb-8a1b-d031a0a52393}"),
    UInt32, 16)
PKEY_Photo_DigitalZoomDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_DigitalZoomNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_DigitalZoomNumerator.fmtid),
    Guid.Ptr, Guid("{16cbb924-6500-473b-a5be-f1599bcbe413}"),
    UInt32, 16)
PKEY_Photo_DigitalZoomNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_Event := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_Event.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_Event.pid := 18248

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_EXIFVersion := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_EXIFVersion.fmtid),
    Guid.Ptr, Guid("{d35f743a-eb2e-47f2-a286-844132cb1427}"),
    UInt32, 16)
PKEY_Photo_EXIFVersion.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ExposureBias := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ExposureBias.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_ExposureBias.pid := 37380

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ExposureBiasDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ExposureBiasDenominator.fmtid),
    Guid.Ptr, Guid("{ab205e50-04b7-461c-a18c-2f233836e627}"),
    UInt32, 16)
PKEY_Photo_ExposureBiasDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ExposureBiasNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ExposureBiasNumerator.fmtid),
    Guid.Ptr, Guid("{738bf284-1d87-420b-92cf-5834bf6ef9ed}"),
    UInt32, 16)
PKEY_Photo_ExposureBiasNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ExposureIndex := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ExposureIndex.fmtid),
    Guid.Ptr, Guid("{967b5af8-995a-46ed-9e11-35b3c5b9782d}"),
    UInt32, 16)
PKEY_Photo_ExposureIndex.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ExposureIndexDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ExposureIndexDenominator.fmtid),
    Guid.Ptr, Guid("{93112f89-c28b-492f-8a9d-4be2062cee8a}"),
    UInt32, 16)
PKEY_Photo_ExposureIndexDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ExposureIndexNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ExposureIndexNumerator.fmtid),
    Guid.Ptr, Guid("{cdedcf30-8919-44df-8f4c-4eb2ffdb8d89}"),
    UInt32, 16)
PKEY_Photo_ExposureIndexNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ExposureProgram := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ExposureProgram.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_ExposureProgram.pid := 34850

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_EXPOSUREPROGRAM_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_EXPOSUREPROGRAM_MANUAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_EXPOSUREPROGRAM_NORMAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_EXPOSUREPROGRAM_APERTURE := 3

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_EXPOSUREPROGRAM_SHUTTER := 4

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_EXPOSUREPROGRAM_CREATIVE := 5

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_EXPOSUREPROGRAM_ACTION := 6

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_EXPOSUREPROGRAM_PORTRAIT := 7

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_EXPOSUREPROGRAM_LANDSCAPE := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ExposureProgramText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ExposureProgramText.fmtid),
    Guid.Ptr, Guid("{fec690b7-5f30-4646-ae47-4caafba884a3}"),
    UInt32, 16)
PKEY_Photo_ExposureProgramText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ExposureTime := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ExposureTime.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_ExposureTime.pid := 33434

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ExposureTimeDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ExposureTimeDenominator.fmtid),
    Guid.Ptr, Guid("{55e98597-ad16-42e0-b624-21599a199838}"),
    UInt32, 16)
PKEY_Photo_ExposureTimeDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ExposureTimeNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ExposureTimeNumerator.fmtid),
    Guid.Ptr, Guid("{257e44e2-9031-4323-ac38-85c552871b2e}"),
    UInt32, 16)
PKEY_Photo_ExposureTimeNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_Flash := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_Flash.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_Flash.pid := 37385

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_FLASH := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_WITHOUTSTROBE := 5

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_WITHSTROBE := 7

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_FLASH_COMPULSORY := 9

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_FLASH_COMPULSORY_NORETURNLIGHT := 13

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_FLASH_COMPULSORY_RETURNLIGHT := 15

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_NONE_COMPULSORY := 16

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_NONE_AUTO := 24

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_FLASH_AUTO := 25

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_FLASH_AUTO_NORETURNLIGHT := 29

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_FLASH_AUTO_RETURNLIGHT := 31

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_NOFUNCTION := 32

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_FLASH_REDEYE := 65

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_FLASH_REDEYE_NORETURNLIGHT := 69

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_FLASH_REDEYE_RETURNLIGHT := 71

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_FLASH_COMPULSORY_REDEYE := 73

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_FLASH_COMPULSORY_REDEYE_NORETURNLIGHT := 77

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_FLASH_COMPULSORY_REDEYE_RETURNLIGHT := 79

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_FLASH_AUTO_REDEYE := 89

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_FLASH_AUTO_REDEYE_NORETURNLIGHT := 93

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_FLASH_FLASH_AUTO_REDEYE_RETURNLIGHT := 95

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FlashEnergy := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FlashEnergy.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_FlashEnergy.pid := 41483

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FlashEnergyDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FlashEnergyDenominator.fmtid),
    Guid.Ptr, Guid("{d7b61c70-6323-49cd-a5fc-c84277162c97}"),
    UInt32, 16)
PKEY_Photo_FlashEnergyDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FlashEnergyNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FlashEnergyNumerator.fmtid),
    Guid.Ptr, Guid("{fcad3d3d-0858-400f-aaa3-2f66cce2a6bc}"),
    UInt32, 16)
PKEY_Photo_FlashEnergyNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FlashManufacturer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FlashManufacturer.fmtid),
    Guid.Ptr, Guid("{aabaf6c9-e0c5-4719-8585-57b103e584fe}"),
    UInt32, 16)
PKEY_Photo_FlashManufacturer.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FlashModel := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FlashModel.fmtid),
    Guid.Ptr, Guid("{fe83bb35-4d1a-42e2-916b-06f3e1af719e}"),
    UInt32, 16)
PKEY_Photo_FlashModel.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FlashText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FlashText.fmtid),
    Guid.Ptr, Guid("{6b8b68f6-200b-47ea-8d25-d8050f57339f}"),
    UInt32, 16)
PKEY_Photo_FlashText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FNumber.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_FNumber.pid := 33437

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FNumberDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FNumberDenominator.fmtid),
    Guid.Ptr, Guid("{e92a2496-223b-4463-a4e3-30eabba79d80}"),
    UInt32, 16)
PKEY_Photo_FNumberDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FNumberNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FNumberNumerator.fmtid),
    Guid.Ptr, Guid("{1b97738a-fdfc-462f-9d93-1957e08be90c}"),
    UInt32, 16)
PKEY_Photo_FNumberNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FocalLength := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FocalLength.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_FocalLength.pid := 37386

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FocalLengthDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FocalLengthDenominator.fmtid),
    Guid.Ptr, Guid("{305bc615-dca1-44a5-9fd4-10c0ba79412e}"),
    UInt32, 16)
PKEY_Photo_FocalLengthDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FocalLengthInFilm := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FocalLengthInFilm.fmtid),
    Guid.Ptr, Guid("{a0e74609-b84d-4f49-b860-462bd9971f98}"),
    UInt32, 16)
PKEY_Photo_FocalLengthInFilm.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FocalLengthNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FocalLengthNumerator.fmtid),
    Guid.Ptr, Guid("{776b6b3b-1e3d-4b0c-9a0e-8fbaf2a8492a}"),
    UInt32, 16)
PKEY_Photo_FocalLengthNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FocalPlaneXResolution := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FocalPlaneXResolution.fmtid),
    Guid.Ptr, Guid("{cfc08d97-c6f7-4484-89dd-ebef4356fe76}"),
    UInt32, 16)
PKEY_Photo_FocalPlaneXResolution.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FocalPlaneXResolutionDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FocalPlaneXResolutionDenominator.fmtid),
    Guid.Ptr, Guid("{0933f3f5-4786-4f46-a8e8-d64dd37fa521}"),
    UInt32, 16)
PKEY_Photo_FocalPlaneXResolutionDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FocalPlaneXResolutionNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FocalPlaneXResolutionNumerator.fmtid),
    Guid.Ptr, Guid("{dccb10af-b4e2-4b88-95f9-031b4d5ab490}"),
    UInt32, 16)
PKEY_Photo_FocalPlaneXResolutionNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FocalPlaneYResolution := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FocalPlaneYResolution.fmtid),
    Guid.Ptr, Guid("{4fffe4d0-914f-4ac4-8d6f-c9c61de169b1}"),
    UInt32, 16)
PKEY_Photo_FocalPlaneYResolution.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FocalPlaneYResolutionDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FocalPlaneYResolutionDenominator.fmtid),
    Guid.Ptr, Guid("{1d6179a6-a876-4031-b013-3347b2b64dc8}"),
    UInt32, 16)
PKEY_Photo_FocalPlaneYResolutionDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_FocalPlaneYResolutionNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_FocalPlaneYResolutionNumerator.fmtid),
    Guid.Ptr, Guid("{a2e541c5-4440-4ba8-867e-75cfc06828cd}"),
    UInt32, 16)
PKEY_Photo_FocalPlaneYResolutionNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_GainControl := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_GainControl.fmtid),
    Guid.Ptr, Guid("{fa304789-00c7-4d80-904a-1e4dcc7265aa}"),
    UInt32, 16)
PKEY_Photo_GainControl.pid := 100

/**
 * @type {Float}
 */
export global PHOTO_GAINCONTROL_NONE := 0

/**
 * @type {Float}
 */
export global PHOTO_GAINCONTROL_LOWGAINUP := 1

/**
 * @type {Float}
 */
export global PHOTO_GAINCONTROL_HIGHGAINUP := 2

/**
 * @type {Float}
 */
export global PHOTO_GAINCONTROL_LOWGAINDOWN := 3

/**
 * @type {Float}
 */
export global PHOTO_GAINCONTROL_HIGHGAINDOWN := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_GainControlDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_GainControlDenominator.fmtid),
    Guid.Ptr, Guid("{42864dfd-9da4-4f77-bded-4aad7b256735}"),
    UInt32, 16)
PKEY_Photo_GainControlDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_GainControlNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_GainControlNumerator.fmtid),
    Guid.Ptr, Guid("{8e8ecf7c-b7b8-4eb8-a63f-0ee715c96f9e}"),
    UInt32, 16)
PKEY_Photo_GainControlNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_GainControlText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_GainControlText.fmtid),
    Guid.Ptr, Guid("{c06238b2-0bf9-4279-a723-25856715cb9d}"),
    UInt32, 16)
PKEY_Photo_GainControlText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ISOSpeed := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ISOSpeed.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_ISOSpeed.pid := 34855

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_LensManufacturer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_LensManufacturer.fmtid),
    Guid.Ptr, Guid("{e6ddcaf7-29c5-4f0a-9a68-d19412ec7090}"),
    UInt32, 16)
PKEY_Photo_LensManufacturer.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_LensModel := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_LensModel.fmtid),
    Guid.Ptr, Guid("{e1277516-2b5f-4869-89b1-2e585bd38b7a}"),
    UInt32, 16)
PKEY_Photo_LensModel.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_LightSource := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_LightSource.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_LightSource.pid := 37384

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_LIGHTSOURCE_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_LIGHTSOURCE_DAYLIGHT := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_LIGHTSOURCE_FLUORESCENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_LIGHTSOURCE_TUNGSTEN := 3

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_LIGHTSOURCE_STANDARD_A := 17

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_LIGHTSOURCE_STANDARD_B := 18

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_LIGHTSOURCE_STANDARD_C := 19

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_LIGHTSOURCE_D55 := 20

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_LIGHTSOURCE_D65 := 21

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_LIGHTSOURCE_D75 := 22

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_MakerNote := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_MakerNote.fmtid),
    Guid.Ptr, Guid("{fa303353-b659-4052-85e9-bcac79549b84}"),
    UInt32, 16)
PKEY_Photo_MakerNote.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_MakerNoteOffset := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_MakerNoteOffset.fmtid),
    Guid.Ptr, Guid("{813f4124-34e6-4d17-ab3e-6b1f3c2247a1}"),
    UInt32, 16)
PKEY_Photo_MakerNoteOffset.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_MaxAperture := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_MaxAperture.fmtid),
    Guid.Ptr, Guid("{08f6d7c2-e3f2-44fc-af1e-5aa5c81a2d3e}"),
    UInt32, 16)
PKEY_Photo_MaxAperture.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_MaxApertureDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_MaxApertureDenominator.fmtid),
    Guid.Ptr, Guid("{c77724d4-601f-46c5-9b89-c53f93bceb77}"),
    UInt32, 16)
PKEY_Photo_MaxApertureDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_MaxApertureNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_MaxApertureNumerator.fmtid),
    Guid.Ptr, Guid("{c107e191-a459-44c5-9ae6-b952ad4b906d}"),
    UInt32, 16)
PKEY_Photo_MaxApertureNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_MeteringMode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_MeteringMode.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_MeteringMode.pid := 37383

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_MeteringModeText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_MeteringModeText.fmtid),
    Guid.Ptr, Guid("{f628fd8c-7ba8-465a-a65b-c5aa79263a9e}"),
    UInt32, 16)
PKEY_Photo_MeteringModeText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_Orientation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_Orientation.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_Orientation.pid := 274

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_OrientationText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_OrientationText.fmtid),
    Guid.Ptr, Guid("{a9ea193c-c511-498a-a06b-58e2776dcc28}"),
    UInt32, 16)
PKEY_Photo_OrientationText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_PeopleNames := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_PeopleNames.fmtid),
    Guid.Ptr, Guid("{e8309b6e-084c-49b4-b1fc-90a80331b638}"),
    UInt32, 16)
PKEY_Photo_PeopleNames.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_PhotometricInterpretation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_PhotometricInterpretation.fmtid),
    Guid.Ptr, Guid("{341796f1-1df9-4b1c-a564-91bdefa43877}"),
    UInt32, 16)
PKEY_Photo_PhotometricInterpretation.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_PhotometricInterpretationText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_PhotometricInterpretationText.fmtid),
    Guid.Ptr, Guid("{821437d6-9eab-4765-a589-3b1cbbd22a61}"),
    UInt32, 16)
PKEY_Photo_PhotometricInterpretationText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ProgramMode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ProgramMode.fmtid),
    Guid.Ptr, Guid("{6d217f6d-3f6a-4825-b470-5f03ca2fbe9b}"),
    UInt32, 16)
PKEY_Photo_ProgramMode.pid := 100

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_PROGRAMMODE_NOTDEFINED := 0

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_PROGRAMMODE_MANUAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_PROGRAMMODE_NORMAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_PROGRAMMODE_APERTURE := 3

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_PROGRAMMODE_SHUTTER := 4

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_PROGRAMMODE_CREATIVE := 5

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_PROGRAMMODE_ACTION := 6

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_PROGRAMMODE_PORTRAIT := 7

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_PROGRAMMODE_LANDSCAPE := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ProgramModeText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ProgramModeText.fmtid),
    Guid.Ptr, Guid("{7fe3aa27-2648-42f3-89b0-454e5cb150c3}"),
    UInt32, 16)
PKEY_Photo_ProgramModeText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_RelatedSoundFile := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_RelatedSoundFile.fmtid),
    Guid.Ptr, Guid("{318a6b45-087f-4dc2-b8cc-05359551fc9e}"),
    UInt32, 16)
PKEY_Photo_RelatedSoundFile.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_Saturation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_Saturation.fmtid),
    Guid.Ptr, Guid("{49237325-a95a-4f67-b211-816b2d45d2e0}"),
    UInt32, 16)
PKEY_Photo_Saturation.pid := 100

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_SATURATION_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_SATURATION_LOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_SATURATION_HIGH := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_SaturationText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_SaturationText.fmtid),
    Guid.Ptr, Guid("{61478c08-b600-4a84-bbe4-e99c45f0a072}"),
    UInt32, 16)
PKEY_Photo_SaturationText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_Sharpness := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_Sharpness.fmtid),
    Guid.Ptr, Guid("{fc6976db-8349-4970-ae97-b3c5316a08f0}"),
    UInt32, 16)
PKEY_Photo_Sharpness.pid := 100

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_SHARPNESS_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_SHARPNESS_SOFT := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_SHARPNESS_HARD := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_SharpnessText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_SharpnessText.fmtid),
    Guid.Ptr, Guid("{51ec3f47-dd50-421d-8769-334f50424b1e}"),
    UInt32, 16)
PKEY_Photo_SharpnessText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ShutterSpeed := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ShutterSpeed.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_ShutterSpeed.pid := 37377

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ShutterSpeedDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ShutterSpeedDenominator.fmtid),
    Guid.Ptr, Guid("{e13d8975-81c7-4948-ae3f-37cae11e8ff7}"),
    UInt32, 16)
PKEY_Photo_ShutterSpeedDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_ShutterSpeedNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_ShutterSpeedNumerator.fmtid),
    Guid.Ptr, Guid("{16ea4042-d6f4-4bca-8349-7c78d30fb333}"),
    UInt32, 16)
PKEY_Photo_ShutterSpeedNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_SubjectDistance := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_SubjectDistance.fmtid),
    Guid.Ptr, Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}"),
    UInt32, 16)
PKEY_Photo_SubjectDistance.pid := 37382

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_SubjectDistanceDenominator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_SubjectDistanceDenominator.fmtid),
    Guid.Ptr, Guid("{0c840a88-b043-466d-9766-d4b26da3fa77}"),
    UInt32, 16)
PKEY_Photo_SubjectDistanceDenominator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_SubjectDistanceNumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_SubjectDistanceNumerator.fmtid),
    Guid.Ptr, Guid("{8af4961c-f526-43e5-aa81-db768219178d}"),
    UInt32, 16)
PKEY_Photo_SubjectDistanceNumerator.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_TagViewAggregate := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_TagViewAggregate.fmtid),
    Guid.Ptr, Guid("{b812f15d-c2d8-4bbf-bacd-79744346113f}"),
    UInt32, 16)
PKEY_Photo_TagViewAggregate.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_TranscodedForSync := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_TranscodedForSync.fmtid),
    Guid.Ptr, Guid("{9a8ebb75-6458-4e82-bacb-35c0095b03bb}"),
    UInt32, 16)
PKEY_Photo_TranscodedForSync.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_WhiteBalance := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_WhiteBalance.fmtid),
    Guid.Ptr, Guid("{ee3d3d8a-5381-4cfa-b13b-aaf66b5f4ec9}"),
    UInt32, 16)
PKEY_Photo_WhiteBalance.pid := 100

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_WHITEBALANCE_AUTO := 0

/**
 * @type {Integer (UInt32)}
 */
export global PHOTO_WHITEBALANCE_MANUAL := 1

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Photo_WhiteBalanceText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Photo_WhiteBalanceText.fmtid),
    Guid.Ptr, Guid("{6336b95e-c7a7-426d-86fd-7ae3d39c84b4}"),
    UInt32, 16)
PKEY_Photo_WhiteBalanceText.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_Advanced := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_Advanced.fmtid),
    Guid.Ptr, Guid("{900a403b-097b-4b95-8ae2-071fdaeeb118}"),
    UInt32, 16)
PKEY_PropGroup_Advanced.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_Audio := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_Audio.fmtid),
    Guid.Ptr, Guid("{2804d469-788f-48aa-8570-71b9c187e138}"),
    UInt32, 16)
PKEY_PropGroup_Audio.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_Calendar := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_Calendar.fmtid),
    Guid.Ptr, Guid("{9973d2b5-bfd8-438a-ba94-5349b293181a}"),
    UInt32, 16)
PKEY_PropGroup_Calendar.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_Camera := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_Camera.fmtid),
    Guid.Ptr, Guid("{de00de32-547e-4981-ad4b-542f2e9007d8}"),
    UInt32, 16)
PKEY_PropGroup_Camera.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_Contact := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_Contact.fmtid),
    Guid.Ptr, Guid("{df975fd3-250a-4004-858f-34e29a3e37aa}"),
    UInt32, 16)
PKEY_PropGroup_Contact.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_Content := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_Content.fmtid),
    Guid.Ptr, Guid("{d0dab0ba-368a-4050-a882-6c010fd19a4f}"),
    UInt32, 16)
PKEY_PropGroup_Content.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_Description := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_Description.fmtid),
    Guid.Ptr, Guid("{8969b275-9475-4e00-a887-ff93b8b41e44}"),
    UInt32, 16)
PKEY_PropGroup_Description.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_FileSystem := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_FileSystem.fmtid),
    Guid.Ptr, Guid("{e3a7d2c1-80fc-4b40-8f34-30ea111bdc2e}"),
    UInt32, 16)
PKEY_PropGroup_FileSystem.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_General := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_General.fmtid),
    Guid.Ptr, Guid("{cc301630-b192-4c22-b372-9f4c6d338e07}"),
    UInt32, 16)
PKEY_PropGroup_General.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_GPS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_GPS.fmtid),
    Guid.Ptr, Guid("{f3713ada-90e3-4e11-aae5-fdc17685b9be}"),
    UInt32, 16)
PKEY_PropGroup_GPS.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_Image := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_Image.fmtid),
    Guid.Ptr, Guid("{e3690a87-0fa8-4a2a-9a9f-fce8827055ac}"),
    UInt32, 16)
PKEY_PropGroup_Image.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_Media := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_Media.fmtid),
    Guid.Ptr, Guid("{61872cf7-6b5e-4b4b-ac2d-59da84459248}"),
    UInt32, 16)
PKEY_PropGroup_Media.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_MediaAdvanced := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_MediaAdvanced.fmtid),
    Guid.Ptr, Guid("{8859a284-de7e-4642-99ba-d431d044b1ec}"),
    UInt32, 16)
PKEY_PropGroup_MediaAdvanced.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_Message := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_Message.fmtid),
    Guid.Ptr, Guid("{7fd7259d-16b4-4135-9f97-7c96ecd2fa9e}"),
    UInt32, 16)
PKEY_PropGroup_Message.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_Music := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_Music.fmtid),
    Guid.Ptr, Guid("{68dd6094-7216-40f1-a029-43fe7127043f}"),
    UInt32, 16)
PKEY_PropGroup_Music.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_Origin := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_Origin.fmtid),
    Guid.Ptr, Guid("{2598d2fb-5569-4367-95df-5cd3a177e1a5}"),
    UInt32, 16)
PKEY_PropGroup_Origin.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_PhotoAdvanced := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_PhotoAdvanced.fmtid),
    Guid.Ptr, Guid("{0cb2bf5a-9ee7-4a86-8222-f01e07fdadaf}"),
    UInt32, 16)
PKEY_PropGroup_PhotoAdvanced.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_RecordedTV := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_RecordedTV.fmtid),
    Guid.Ptr, Guid("{e7b33238-6584-4170-a5c0-ac25efd9da56}"),
    UInt32, 16)
PKEY_PropGroup_RecordedTV.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropGroup_Video := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropGroup_Video.fmtid),
    Guid.Ptr, Guid("{bebe0920-7671-4c54-a3eb-49fddfc191ee}"),
    UInt32, 16)
PKEY_PropGroup_Video.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_InfoTipText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_InfoTipText.fmtid),
    Guid.Ptr, Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}"),
    UInt32, 16)
PKEY_InfoTipText.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropList_ConflictPrompt := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropList_ConflictPrompt.fmtid),
    Guid.Ptr, Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}"),
    UInt32, 16)
PKEY_PropList_ConflictPrompt.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropList_ContentViewModeForBrowse := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropList_ContentViewModeForBrowse.fmtid),
    Guid.Ptr, Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}"),
    UInt32, 16)
PKEY_PropList_ContentViewModeForBrowse.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropList_ContentViewModeForSearch := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropList_ContentViewModeForSearch.fmtid),
    Guid.Ptr, Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}"),
    UInt32, 16)
PKEY_PropList_ContentViewModeForSearch.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropList_ExtendedTileInfo := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropList_ExtendedTileInfo.fmtid),
    Guid.Ptr, Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}"),
    UInt32, 16)
PKEY_PropList_ExtendedTileInfo.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropList_FileOperationPrompt := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropList_FileOperationPrompt.fmtid),
    Guid.Ptr, Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}"),
    UInt32, 16)
PKEY_PropList_FileOperationPrompt.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropList_FullDetails := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropList_FullDetails.fmtid),
    Guid.Ptr, Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}"),
    UInt32, 16)
PKEY_PropList_FullDetails.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropList_InfoTip := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropList_InfoTip.fmtid),
    Guid.Ptr, Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}"),
    UInt32, 16)
PKEY_PropList_InfoTip.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropList_NonPersonal := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropList_NonPersonal.fmtid),
    Guid.Ptr, Guid("{49d1091f-082e-493f-b23f-d2308aa9668c}"),
    UInt32, 16)
PKEY_PropList_NonPersonal.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropList_PreviewDetails := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropList_PreviewDetails.fmtid),
    Guid.Ptr, Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}"),
    UInt32, 16)
PKEY_PropList_PreviewDetails.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropList_PreviewTitle := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropList_PreviewTitle.fmtid),
    Guid.Ptr, Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}"),
    UInt32, 16)
PKEY_PropList_PreviewTitle.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropList_QuickTip := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropList_QuickTip.fmtid),
    Guid.Ptr, Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}"),
    UInt32, 16)
PKEY_PropList_QuickTip.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropList_TileInfo := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropList_TileInfo.fmtid),
    Guid.Ptr, Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}"),
    UInt32, 16)
PKEY_PropList_TileInfo.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PropList_XPDetailsPanel := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PropList_XPDetailsPanel.fmtid),
    Guid.Ptr, Guid("{f2275480-f782-4291-bd94-f13693513aec}"),
    UInt32, 16)
PKEY_PropList_XPDetailsPanel.pid := 0

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_RecordedTV_ChannelNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_RecordedTV_ChannelNumber.fmtid),
    Guid.Ptr, Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}"),
    UInt32, 16)
PKEY_RecordedTV_ChannelNumber.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_RecordedTV_Credits := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_RecordedTV_Credits.fmtid),
    Guid.Ptr, Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}"),
    UInt32, 16)
PKEY_RecordedTV_Credits.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_RecordedTV_DateContentExpires := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_RecordedTV_DateContentExpires.fmtid),
    Guid.Ptr, Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}"),
    UInt32, 16)
PKEY_RecordedTV_DateContentExpires.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_RecordedTV_EpisodeName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_RecordedTV_EpisodeName.fmtid),
    Guid.Ptr, Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}"),
    UInt32, 16)
PKEY_RecordedTV_EpisodeName.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_RecordedTV_IsATSCContent := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_RecordedTV_IsATSCContent.fmtid),
    Guid.Ptr, Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}"),
    UInt32, 16)
PKEY_RecordedTV_IsATSCContent.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_RecordedTV_IsClosedCaptioningAvailable := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_RecordedTV_IsClosedCaptioningAvailable.fmtid),
    Guid.Ptr, Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}"),
    UInt32, 16)
PKEY_RecordedTV_IsClosedCaptioningAvailable.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_RecordedTV_IsDTVContent := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_RecordedTV_IsDTVContent.fmtid),
    Guid.Ptr, Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}"),
    UInt32, 16)
PKEY_RecordedTV_IsDTVContent.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_RecordedTV_IsHDContent := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_RecordedTV_IsHDContent.fmtid),
    Guid.Ptr, Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}"),
    UInt32, 16)
PKEY_RecordedTV_IsHDContent.pid := 18

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_RecordedTV_IsRepeatBroadcast := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_RecordedTV_IsRepeatBroadcast.fmtid),
    Guid.Ptr, Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}"),
    UInt32, 16)
PKEY_RecordedTV_IsRepeatBroadcast.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_RecordedTV_IsSAP := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_RecordedTV_IsSAP.fmtid),
    Guid.Ptr, Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}"),
    UInt32, 16)
PKEY_RecordedTV_IsSAP.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_RecordedTV_NetworkAffiliation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_RecordedTV_NetworkAffiliation.fmtid),
    Guid.Ptr, Guid("{2c53c813-fb63-4e22-a1ab-0b331ca1e273}"),
    UInt32, 16)
PKEY_RecordedTV_NetworkAffiliation.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_RecordedTV_OriginalBroadcastDate := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_RecordedTV_OriginalBroadcastDate.fmtid),
    Guid.Ptr, Guid("{4684fe97-8765-4842-9c13-f006447b178c}"),
    UInt32, 16)
PKEY_RecordedTV_OriginalBroadcastDate.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_RecordedTV_ProgramDescription := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_RecordedTV_ProgramDescription.fmtid),
    Guid.Ptr, Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}"),
    UInt32, 16)
PKEY_RecordedTV_ProgramDescription.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_RecordedTV_RecordingTime := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_RecordedTV_RecordingTime.fmtid),
    Guid.Ptr, Guid("{a5477f61-7a82-4eca-9dde-98b69b2479b3}"),
    UInt32, 16)
PKEY_RecordedTV_RecordingTime.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_RecordedTV_StationCallSign := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_RecordedTV_StationCallSign.fmtid),
    Guid.Ptr, Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}"),
    UInt32, 16)
PKEY_RecordedTV_StationCallSign.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_RecordedTV_StationName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_RecordedTV_StationName.fmtid),
    Guid.Ptr, Guid("{1b5439e7-eba1-4af8-bdd7-7af1d4549493}"),
    UInt32, 16)
PKEY_RecordedTV_StationName.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_LocationEmptyString := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_LocationEmptyString.fmtid),
    Guid.Ptr, Guid("{62d2d9ab-8b64-498d-b865-402d4796f865}"),
    UInt32, 16)
PKEY_LocationEmptyString.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_AutoCategory := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_AutoCategory.fmtid),
    Guid.Ptr, Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}"),
    UInt32, 16)
PKEY_Search_AutoCategory.pid := 31

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_AutoSummary := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_AutoSummary.fmtid),
    Guid.Ptr, Guid("{560c36c0-503a-11cf-baa1-00004c752a9a}"),
    UInt32, 16)
PKEY_Search_AutoSummary.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_ContainerHash := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_ContainerHash.fmtid),
    Guid.Ptr, Guid("{bceee283-35df-4d53-826a-f36a3eefc6be}"),
    UInt32, 16)
PKEY_Search_ContainerHash.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_Contents := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_Contents.fmtid),
    Guid.Ptr, Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}"),
    UInt32, 16)
PKEY_Search_Contents.pid := 19

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_EntryID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_EntryID.fmtid),
    Guid.Ptr, Guid("{49691c90-7e17-101a-a91c-08002b2ecda9}"),
    UInt32, 16)
PKEY_Search_EntryID.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_ExtendedProperties := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_ExtendedProperties.fmtid),
    Guid.Ptr, Guid("{7b03b546-fa4f-4a52-a2fe-03d5311e5865}"),
    UInt32, 16)
PKEY_Search_ExtendedProperties.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_GatherTime := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_GatherTime.fmtid),
    Guid.Ptr, Guid("{0b63e350-9ccc-11d0-bcdb-00805fccce04}"),
    UInt32, 16)
PKEY_Search_GatherTime.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_HitCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_HitCount.fmtid),
    Guid.Ptr, Guid("{49691c90-7e17-101a-a91c-08002b2ecda9}"),
    UInt32, 16)
PKEY_Search_HitCount.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_IsClosedDirectory := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_IsClosedDirectory.fmtid),
    Guid.Ptr, Guid("{0b63e343-9ccc-11d0-bcdb-00805fccce04}"),
    UInt32, 16)
PKEY_Search_IsClosedDirectory.pid := 23

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_IsFullyContained := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_IsFullyContained.fmtid),
    Guid.Ptr, Guid("{0b63e343-9ccc-11d0-bcdb-00805fccce04}"),
    UInt32, 16)
PKEY_Search_IsFullyContained.pid := 24

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_MatchKind := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_MatchKind.fmtid),
    Guid.Ptr, Guid("{49691c90-7e17-101a-a91c-08002b2ecda9}"),
    UInt32, 16)
PKEY_Search_MatchKind.pid := 29

/**
 * @type {Integer (Int32)}
 */
export global MATCH_KIND_LEXICAL := 1

/**
 * @type {Integer (Int32)}
 */
export global MATCH_KIND_SEMANTIC := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_MatchTags := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_MatchTags.fmtid),
    Guid.Ptr, Guid("{49691c90-7e17-101a-a91c-08002b2ecda9}"),
    UInt32, 16)
PKEY_Search_MatchTags.pid := 30

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_OcrContent := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_OcrContent.fmtid),
    Guid.Ptr, Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}"),
    UInt32, 16)
PKEY_Search_OcrContent.pid := 28

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_QueryFocusedSummary := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_QueryFocusedSummary.fmtid),
    Guid.Ptr, Guid("{560c36c0-503a-11cf-baa1-00004c752a9a}"),
    UInt32, 16)
PKEY_Search_QueryFocusedSummary.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_QueryFocusedSummaryWithFallback := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_QueryFocusedSummaryWithFallback.fmtid),
    Guid.Ptr, Guid("{560c36c0-503a-11cf-baa1-00004c752a9a}"),
    UInt32, 16)
PKEY_Search_QueryFocusedSummaryWithFallback.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_QueryPropertyHits := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_QueryPropertyHits.fmtid),
    Guid.Ptr, Guid("{49691c90-7e17-101a-a91c-08002b2ecda9}"),
    UInt32, 16)
PKEY_Search_QueryPropertyHits.pid := 21

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_Rank := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_Rank.fmtid),
    Guid.Ptr, Guid("{49691c90-7e17-101a-a91c-08002b2ecda9}"),
    UInt32, 16)
PKEY_Search_Rank.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_Store := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_Store.fmtid),
    Guid.Ptr, Guid("{a06992b3-8caf-4ed7-a547-b259e32ac9fc}"),
    UInt32, 16)
PKEY_Search_Store.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_UrlToIndex := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_UrlToIndex.fmtid),
    Guid.Ptr, Guid("{0b63e343-9ccc-11d0-bcdb-00805fccce04}"),
    UInt32, 16)
PKEY_Search_UrlToIndex.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Search_UrlToIndexWithModificationTime := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Search_UrlToIndexWithModificationTime.fmtid),
    Guid.Ptr, Guid("{0b63e343-9ccc-11d0-bcdb-00805fccce04}"),
    UInt32, 16)
PKEY_Search_UrlToIndexWithModificationTime.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Supplemental_Album := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Supplemental_Album.fmtid),
    Guid.Ptr, Guid("{0c73b141-39d6-4653-a683-cab291eaf95b}"),
    UInt32, 16)
PKEY_Supplemental_Album.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Supplemental_AlbumID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Supplemental_AlbumID.fmtid),
    Guid.Ptr, Guid("{0c73b141-39d6-4653-a683-cab291eaf95b}"),
    UInt32, 16)
PKEY_Supplemental_AlbumID.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Supplemental_Location := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Supplemental_Location.fmtid),
    Guid.Ptr, Guid("{0c73b141-39d6-4653-a683-cab291eaf95b}"),
    UInt32, 16)
PKEY_Supplemental_Location.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Supplemental_Person := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Supplemental_Person.fmtid),
    Guid.Ptr, Guid("{0c73b141-39d6-4653-a683-cab291eaf95b}"),
    UInt32, 16)
PKEY_Supplemental_Person.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Supplemental_ResourceId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Supplemental_ResourceId.fmtid),
    Guid.Ptr, Guid("{0c73b141-39d6-4653-a683-cab291eaf95b}"),
    UInt32, 16)
PKEY_Supplemental_ResourceId.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Supplemental_Tag := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Supplemental_Tag.fmtid),
    Guid.Ptr, Guid("{0c73b141-39d6-4653-a683-cab291eaf95b}"),
    UInt32, 16)
PKEY_Supplemental_Tag.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ActivityDate := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ActivityDate.fmtid),
    Guid.Ptr, Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}"),
    UInt32, 16)
PKEY_ActivityDate.pid := 23

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ActivityIcon := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ActivityIcon.fmtid),
    Guid.Ptr, Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}"),
    UInt32, 16)
PKEY_ActivityIcon.pid := 24

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_ActivityInfo := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_ActivityInfo.fmtid),
    Guid.Ptr, Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}"),
    UInt32, 16)
PKEY_ActivityInfo.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DescriptionID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DescriptionID.fmtid),
    Guid.Ptr, Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}"),
    UInt32, 16)
PKEY_DescriptionID.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Home_Grouping := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Home_Grouping.fmtid),
    Guid.Ptr, Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}"),
    UInt32, 16)
PKEY_Home_Grouping.pid := 2

/**
 * @type {Integer (UInt32)}
 */
export global HOMEGROUPING_UNSPECIFIED := 0

/**
 * @type {Integer (UInt32)}
 */
export global HOMEGROUPING_FREQUENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global HOMEGROUPING_PINNED := 2

/**
 * @type {Integer (UInt32)}
 */
export global HOMEGROUPING_RECENT := 3

/**
 * @type {Integer (UInt32)}
 */
export global HOMEGROUPING_RECOMMENDATIONS := 4

/**
 * @type {Integer (UInt32)}
 */
export global HOMEGROUPING_SHARED := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Home_IsPinned := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Home_IsPinned.fmtid),
    Guid.Ptr, Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}"),
    UInt32, 16)
PKEY_Home_IsPinned.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Home_ItemFolderPathDisplay := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Home_ItemFolderPathDisplay.fmtid),
    Guid.Ptr, Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}"),
    UInt32, 16)
PKEY_Home_ItemFolderPathDisplay.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Home_RecommendationActivityDate := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Home_RecommendationActivityDate.fmtid),
    Guid.Ptr, Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}"),
    UInt32, 16)
PKEY_Home_RecommendationActivityDate.pid := 22

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Home_RecommendationProviderSource := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Home_RecommendationProviderSource.fmtid),
    Guid.Ptr, Guid("{5ca9b1cb-c69f-404b-abc6-fd336793a6a7}"),
    UInt32, 16)
PKEY_Home_RecommendationProviderSource.pid := 22

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Home_RecommendationReasonIcon := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Home_RecommendationReasonIcon.fmtid),
    Guid.Ptr, Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}"),
    UInt32, 16)
PKEY_Home_RecommendationReasonIcon.pid := 21

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Home_Recommended := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Home_Recommended.fmtid),
    Guid.Ptr, Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}"),
    UInt32, 16)
PKEY_Home_Recommended.pid := 20

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_InternalName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_InternalName.fmtid),
    Guid.Ptr, Guid("{0cef7d53-fa64-11d1-a203-0000f81fedee}"),
    UInt32, 16)
PKEY_InternalName.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_LibraryLocationsCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_LibraryLocationsCount.fmtid),
    Guid.Ptr, Guid("{908696c7-8f87-44f2-80ed-a8c1c6894575}"),
    UInt32, 16)
PKEY_LibraryLocationsCount.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Link_TargetSFGAOFlagsStrings := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Link_TargetSFGAOFlagsStrings.fmtid),
    Guid.Ptr, Guid("{d6942081-d53b-443d-ad47-5e059d9cd27a}"),
    UInt32, 16)
PKEY_Link_TargetSFGAOFlagsStrings.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Link_TargetUrl := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Link_TargetUrl.fmtid),
    Guid.Ptr, Guid("{5cbf2787-48cf-4208-b90e-ee5e5d420294}"),
    UInt32, 16)
PKEY_Link_TargetUrl.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_NamespaceCLSID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_NamespaceCLSID.fmtid),
    Guid.Ptr, Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}"),
    UInt32, 16)
PKEY_NamespaceCLSID.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Shell_CopilotKeyProviderFastPathMessage := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Shell_CopilotKeyProviderFastPathMessage.fmtid),
    Guid.Ptr, Guid("{38652bca-4329-4e74-86f9-39cf29345eea}"),
    UInt32, 16)
PKEY_Shell_CopilotKeyProviderFastPathMessage.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Shell_SFGAOFlagsStrings := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Shell_SFGAOFlagsStrings.fmtid),
    Guid.Ptr, Guid("{d6942081-d53b-443d-ad47-5e059d9cd27a}"),
    UInt32, 16)
PKEY_Shell_SFGAOFlagsStrings.pid := 2

/**
 * @type {String}
 */
export global SFGAOSTR_FILESYS := "filesys"

/**
 * @type {String}
 */
export global SFGAOSTR_FILEANC := "fileanc"

/**
 * @type {String}
 */
export global SFGAOSTR_STORAGEANC := "storageanc"

/**
 * @type {String}
 */
export global SFGAOSTR_STREAM := "stream"

/**
 * @type {String}
 */
export global SFGAOSTR_LINK := "link"

/**
 * @type {String}
 */
export global SFGAOSTR_HIDDEN := "hidden"

/**
 * @type {String}
 */
export global SFGAOSTR_SUPERHIDDEN := "superhidden"

/**
 * @type {String}
 */
export global SFGAOSTR_FOLDER := "folder"

/**
 * @type {String}
 */
export global SFGAOSTR_NONENUM := "nonenum"

/**
 * @type {String}
 */
export global SFGAOSTR_BROWSABLE := "browsable"

/**
 * @type {String}
 */
export global SFGAOSTR_SYSTEM := "system"

/**
 * @type {String}
 */
export global SFGAOSTR_PLACEHOLDER := "placeholder"

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StatusBarSelectedItemCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StatusBarSelectedItemCount.fmtid),
    Guid.Ptr, Guid("{26dc287c-6e3d-4bd3-b2b0-6a26ba2e346d}"),
    UInt32, 16)
PKEY_StatusBarSelectedItemCount.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StatusBarViewItemCount := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StatusBarViewItemCount.fmtid),
    Guid.Ptr, Guid("{26dc287c-6e3d-4bd3-b2b0-6a26ba2e346d}"),
    UInt32, 16)
PKEY_StatusBarViewItemCount.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderState := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderState.fmtid),
    Guid.Ptr, Guid("{e77e90df-6271-4f5b-834f-2dd1f245dda4}"),
    UInt32, 16)
PKEY_StorageProviderState.pid := 3

/**
 * @type {Integer (UInt32)}
 */
export global STORAGEPROVIDERSTATE_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global STORAGEPROVIDERSTATE_SPARSE := 1

/**
 * @type {Integer (UInt32)}
 */
export global STORAGEPROVIDERSTATE_IN_SYNC := 2

/**
 * @type {Integer (UInt32)}
 */
export global STORAGEPROVIDERSTATE_PINNED := 3

/**
 * @type {Integer (UInt32)}
 */
export global STORAGEPROVIDERSTATE_PENDING_UPLOAD := 4

/**
 * @type {Integer (UInt32)}
 */
export global STORAGEPROVIDERSTATE_PENDING_DOWNLOAD := 5

/**
 * @type {Integer (UInt32)}
 */
export global STORAGEPROVIDERSTATE_TRANSFERRING := 6

/**
 * @type {Integer (UInt32)}
 */
export global STORAGEPROVIDERSTATE_ERROR := 7

/**
 * @type {Integer (UInt32)}
 */
export global STORAGEPROVIDERSTATE_WARNING := 8

/**
 * @type {Integer (UInt32)}
 */
export global STORAGEPROVIDERSTATE_EXCLUDED := 9

/**
 * @type {Integer (UInt32)}
 */
export global STORAGEPROVIDERSTATE_PENDING_UNSPECIFIED := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_StorageProviderTransferProgress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_StorageProviderTransferProgress.fmtid),
    Guid.Ptr, Guid("{e77e90df-6271-4f5b-834f-2dd1f245dda4}"),
    UInt32, 16)
PKEY_StorageProviderTransferProgress.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WebAccountID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WebAccountID.fmtid),
    Guid.Ptr, Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}"),
    UInt32, 16)
PKEY_WebAccountID.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AppUserModel_ExcludeFromShowInNewInstall := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AppUserModel_ExcludeFromShowInNewInstall.fmtid),
    Guid.Ptr, Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}"),
    UInt32, 16)
PKEY_AppUserModel_ExcludeFromShowInNewInstall.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AppUserModel_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AppUserModel_ID.fmtid),
    Guid.Ptr, Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}"),
    UInt32, 16)
PKEY_AppUserModel_ID.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AppUserModel_IsDestListSeparator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AppUserModel_IsDestListSeparator.fmtid),
    Guid.Ptr, Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}"),
    UInt32, 16)
PKEY_AppUserModel_IsDestListSeparator.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AppUserModel_IsDualMode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AppUserModel_IsDualMode.fmtid),
    Guid.Ptr, Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}"),
    UInt32, 16)
PKEY_AppUserModel_IsDualMode.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AppUserModel_PreventPinning := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AppUserModel_PreventPinning.fmtid),
    Guid.Ptr, Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}"),
    UInt32, 16)
PKEY_AppUserModel_PreventPinning.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AppUserModel_RelaunchCommand := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AppUserModel_RelaunchCommand.fmtid),
    Guid.Ptr, Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}"),
    UInt32, 16)
PKEY_AppUserModel_RelaunchCommand.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AppUserModel_RelaunchDisplayNameResource := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AppUserModel_RelaunchDisplayNameResource.fmtid),
    Guid.Ptr, Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}"),
    UInt32, 16)
PKEY_AppUserModel_RelaunchDisplayNameResource.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AppUserModel_RelaunchIconResource := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AppUserModel_RelaunchIconResource.fmtid),
    Guid.Ptr, Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}"),
    UInt32, 16)
PKEY_AppUserModel_RelaunchIconResource.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AppUserModel_SettingsCommand := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AppUserModel_SettingsCommand.fmtid),
    Guid.Ptr, Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}"),
    UInt32, 16)
PKEY_AppUserModel_SettingsCommand.pid := 38

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AppUserModel_StartPinOption := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AppUserModel_StartPinOption.fmtid),
    Guid.Ptr, Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}"),
    UInt32, 16)
PKEY_AppUserModel_StartPinOption.pid := 12

/**
 * @type {Integer (UInt32)}
 */
export global APPUSERMODEL_STARTPINOPTION_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global APPUSERMODEL_STARTPINOPTION_NOPINONINSTALL := 1

/**
 * @type {Integer (UInt32)}
 */
export global APPUSERMODEL_STARTPINOPTION_USERPINNED := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AppUserModel_ToastActivatorCLSID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AppUserModel_ToastActivatorCLSID.fmtid),
    Guid.Ptr, Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}"),
    UInt32, 16)
PKEY_AppUserModel_ToastActivatorCLSID.pid := 26

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AppUserModel_UninstallCommand := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AppUserModel_UninstallCommand.fmtid),
    Guid.Ptr, Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}"),
    UInt32, 16)
PKEY_AppUserModel_UninstallCommand.pid := 37

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AppUserModel_VisualElementsManifestHintPath := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AppUserModel_VisualElementsManifestHintPath.fmtid),
    Guid.Ptr, Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}"),
    UInt32, 16)
PKEY_AppUserModel_VisualElementsManifestHintPath.pid := 31

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_EdgeGesture_DisableTouchWhenFullscreen := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_EdgeGesture_DisableTouchWhenFullscreen.fmtid),
    Guid.Ptr, Guid("{32ce38b2-2c9a-41b1-9bc5-b3784394aa44}"),
    UInt32, 16)
PKEY_EdgeGesture_DisableTouchWhenFullscreen.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Software_DateLastUsed := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Software_DateLastUsed.fmtid),
    Guid.Ptr, Guid("{841e4f90-ff59-4d16-8947-e81bbffab36d}"),
    UInt32, 16)
PKEY_Software_DateLastUsed.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Software_ProductName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Software_ProductName.fmtid),
    Guid.Ptr, Guid("{0cef7d53-fa64-11d1-a203-0000f81fedee}"),
    UInt32, 16)
PKEY_Software_ProductName.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Sync_Comments := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Sync_Comments.fmtid),
    Guid.Ptr, Guid("{7bd5533e-af15-44db-b8c8-bd6624e1d032}"),
    UInt32, 16)
PKEY_Sync_Comments.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Sync_ConflictDescription := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Sync_ConflictDescription.fmtid),
    Guid.Ptr, Guid("{ce50c159-2fb8-41fd-be68-d3e042e274bc}"),
    UInt32, 16)
PKEY_Sync_ConflictDescription.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Sync_ConflictFirstLocation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Sync_ConflictFirstLocation.fmtid),
    Guid.Ptr, Guid("{ce50c159-2fb8-41fd-be68-d3e042e274bc}"),
    UInt32, 16)
PKEY_Sync_ConflictFirstLocation.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Sync_ConflictSecondLocation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Sync_ConflictSecondLocation.fmtid),
    Guid.Ptr, Guid("{ce50c159-2fb8-41fd-be68-d3e042e274bc}"),
    UInt32, 16)
PKEY_Sync_ConflictSecondLocation.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Sync_HandlerCollectionID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Sync_HandlerCollectionID.fmtid),
    Guid.Ptr, Guid("{7bd5533e-af15-44db-b8c8-bd6624e1d032}"),
    UInt32, 16)
PKEY_Sync_HandlerCollectionID.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Sync_HandlerID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Sync_HandlerID.fmtid),
    Guid.Ptr, Guid("{7bd5533e-af15-44db-b8c8-bd6624e1d032}"),
    UInt32, 16)
PKEY_Sync_HandlerID.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Sync_HandlerName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Sync_HandlerName.fmtid),
    Guid.Ptr, Guid("{ce50c159-2fb8-41fd-be68-d3e042e274bc}"),
    UInt32, 16)
PKEY_Sync_HandlerName.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Sync_HandlerType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Sync_HandlerType.fmtid),
    Guid.Ptr, Guid("{7bd5533e-af15-44db-b8c8-bd6624e1d032}"),
    UInt32, 16)
PKEY_Sync_HandlerType.pid := 8

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_HANDLERTYPE_OTHER := 0

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_HANDLERTYPE_PROGRAMS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_HANDLERTYPE_DEVICES := 2

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_HANDLERTYPE_FOLDERS := 3

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_HANDLERTYPE_WEBSERVICES := 4

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_HANDLERTYPE_COMPUTERS := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Sync_HandlerTypeLabel := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Sync_HandlerTypeLabel.fmtid),
    Guid.Ptr, Guid("{7bd5533e-af15-44db-b8c8-bd6624e1d032}"),
    UInt32, 16)
PKEY_Sync_HandlerTypeLabel.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Sync_ItemID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Sync_ItemID.fmtid),
    Guid.Ptr, Guid("{7bd5533e-af15-44db-b8c8-bd6624e1d032}"),
    UInt32, 16)
PKEY_Sync_ItemID.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Sync_ItemName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Sync_ItemName.fmtid),
    Guid.Ptr, Guid("{ce50c159-2fb8-41fd-be68-d3e042e274bc}"),
    UInt32, 16)
PKEY_Sync_ItemName.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Sync_ProgressPercentage := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Sync_ProgressPercentage.fmtid),
    Guid.Ptr, Guid("{7bd5533e-af15-44db-b8c8-bd6624e1d032}"),
    UInt32, 16)
PKEY_Sync_ProgressPercentage.pid := 23

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Sync_State := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Sync_State.fmtid),
    Guid.Ptr, Guid("{7bd5533e-af15-44db-b8c8-bd6624e1d032}"),
    UInt32, 16)
PKEY_Sync_State.pid := 24

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_STATE_NOTSETUP := 0

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_STATE_SYNCNOTRUN := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_STATE_IDLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_STATE_ERROR := 3

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_STATE_PENDING := 4

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_STATE_SYNCING := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Sync_Status := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Sync_Status.fmtid),
    Guid.Ptr, Guid("{7bd5533e-af15-44db-b8c8-bd6624e1d032}"),
    UInt32, 16)
PKEY_Sync_Status.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Task_BillingInformation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Task_BillingInformation.fmtid),
    Guid.Ptr, Guid("{d37d52c6-261c-4303-82b3-08b926ac6f12}"),
    UInt32, 16)
PKEY_Task_BillingInformation.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Task_CompletionStatus := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Task_CompletionStatus.fmtid),
    Guid.Ptr, Guid("{084d8a0a-e6d5-40de-bf1f-c8820e7c877c}"),
    UInt32, 16)
PKEY_Task_CompletionStatus.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Task_Owner := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Task_Owner.fmtid),
    Guid.Ptr, Guid("{08c7cc5f-60f2-4494-ad75-55e3e0b5add0}"),
    UInt32, 16)
PKEY_Task_Owner.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Video_Compression := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Video_Compression.fmtid),
    Guid.Ptr, Guid("{64440491-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Video_Compression.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Video_Director := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Video_Director.fmtid),
    Guid.Ptr, Guid("{64440492-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Video_Director.pid := 20

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Video_EncodingBitrate := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Video_EncodingBitrate.fmtid),
    Guid.Ptr, Guid("{64440491-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Video_EncodingBitrate.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Video_FourCC := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Video_FourCC.fmtid),
    Guid.Ptr, Guid("{64440491-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Video_FourCC.pid := 44

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Video_FrameHeight := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Video_FrameHeight.fmtid),
    Guid.Ptr, Guid("{64440491-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Video_FrameHeight.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Video_FrameRate := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Video_FrameRate.fmtid),
    Guid.Ptr, Guid("{64440491-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Video_FrameRate.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Video_FrameWidth := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Video_FrameWidth.fmtid),
    Guid.Ptr, Guid("{64440491-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Video_FrameWidth.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Video_HorizontalAspectRatio := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Video_HorizontalAspectRatio.fmtid),
    Guid.Ptr, Guid("{64440491-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Video_HorizontalAspectRatio.pid := 42

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Video_IsSpherical := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Video_IsSpherical.fmtid),
    Guid.Ptr, Guid("{64440491-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Video_IsSpherical.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Video_IsStereo := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Video_IsStereo.fmtid),
    Guid.Ptr, Guid("{64440491-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Video_IsStereo.pid := 98

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Video_Orientation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Video_Orientation.fmtid),
    Guid.Ptr, Guid("{64440491-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Video_Orientation.pid := 99

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Video_SampleSize := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Video_SampleSize.fmtid),
    Guid.Ptr, Guid("{64440491-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Video_SampleSize.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Video_StreamName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Video_StreamName.fmtid),
    Guid.Ptr, Guid("{64440491-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Video_StreamName.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Video_StreamNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Video_StreamNumber.fmtid),
    Guid.Ptr, Guid("{64440491-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Video_StreamNumber.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Video_TotalBitrate := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Video_TotalBitrate.fmtid),
    Guid.Ptr, Guid("{64440491-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Video_TotalBitrate.pid := 43

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Video_TranscodedForSync := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Video_TranscodedForSync.fmtid),
    Guid.Ptr, Guid("{64440491-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Video_TranscodedForSync.pid := 46

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Video_VerticalAspectRatio := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Video_VerticalAspectRatio.fmtid),
    Guid.Ptr, Guid("{64440491-4c8b-11d1-8b70-080036b11a03}"),
    UInt32, 16)
PKEY_Video_VerticalAspectRatio.pid := 45

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Volume_FileSystem := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Volume_FileSystem.fmtid),
    Guid.Ptr, Guid("{9b174b35-40ff-11d2-a27e-00c04fc30871}"),
    UInt32, 16)
PKEY_Volume_FileSystem.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Volume_IsMappedDrive := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Volume_IsMappedDrive.fmtid),
    Guid.Ptr, Guid("{149c0b69-2c2d-48fc-808f-d318d78c4636}"),
    UInt32, 16)
PKEY_Volume_IsMappedDrive.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Volume_IsRoot := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Volume_IsRoot.fmtid),
    Guid.Ptr, Guid("{9b174b35-40ff-11d2-a27e-00c04fc30871}"),
    UInt32, 16)
PKEY_Volume_IsRoot.pid := 10

/**
 * @type {Integer (UInt32)}
 */
export global ACT_AUTHORIZE_ON_RESUME := 1

/**
 * @type {Integer (UInt32)}
 */
export global ACT_AUTHORIZE_ON_SESSION_UNLOCK := 2

/**
 * @type {Integer (UInt32)}
 */
export global ACT_UNAUTHORIZE_ON_SUSPEND := 1

/**
 * @type {Integer (UInt32)}
 */
export global ACT_UNAUTHORIZE_ON_SESSION_LOCK := 2

/**
 * @type {Integer (UInt32)}
 */
export global ES_RESERVED_COM_ERROR_START := 0

/**
 * @type {Integer (UInt32)}
 */
export global ES_RESERVED_COM_ERROR_END := 511

/**
 * @type {Integer (UInt32)}
 */
export global ES_GENERAL_ERROR_START := 512

/**
 * @type {Integer (UInt32)}
 */
export global ES_GENERAL_ERROR_END := 1023

/**
 * @type {Integer (UInt32)}
 */
export global ES_AUTHN_ERROR_START := 1024

/**
 * @type {Integer (UInt32)}
 */
export global ES_AUTHN_ERROR_END := 1279

/**
 * @type {Integer (UInt32)}
 */
export global ES_RESERVED_SILO_ERROR_START := 1280

/**
 * @type {Integer (UInt32)}
 */
export global ES_RESERVED_SILO_ERROR_END := 4095

/**
 * @type {Integer (UInt32)}
 */
export global ES_PW_SILO_ERROR_START := 4352

/**
 * @type {Integer (UInt32)}
 */
export global ES_PW_SILO_ERROR_END := 4607

/**
 * @type {Integer (UInt32)}
 */
export global ES_RESERVED_SILO_SPECIFIC_ERROR_START := 4608

/**
 * @type {Integer (UInt32)}
 */
export global ES_RESERVED_SILO_SPECIFIC_ERROR_END := 49151

/**
 * @type {Integer (UInt32)}
 */
export global ES_VENDOR_ERROR_START := 49152

/**
 * @type {Integer (UInt32)}
 */
export global ES_VENDOR_ERROR_END := 65535

/**
 * @type {Integer (UInt32)}
 */
export global FACILITY_ENHANCED_STORAGE := 4

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_INVALID_RESPONSE := 3221488128

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_UNPROVISIONED_HARDWARE := 3221488132

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_UNSUPPORTED_HARDWARE := 3221488133

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_INCOMPLETE_COMMAND := 3221488134

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_BAD_SEQUENCE := 3221488135

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_NO_PROBE := 3221488136

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_INVALID_SILO := 3221488137

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_INVALID_CAPABILITY := 3221488138

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_GROUP_POLICY_FORBIDDEN_USE := 3221488139

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_GROUP_POLICY_FORBIDDEN_OPERATION := 3221488140

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_INVALID_PARAM_COMBINATION := 3221488141

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_INVALID_PARAM_LENGTH := 3221488142

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_INCONSISTENT_PARAM_LENGTH := 3221488143

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_NO_AUTHENTICATION_REQUIRED := 3221488640

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_INVALID_FIELD_IDENTIFIER := 3221491968

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_CHALLENGE_MISMATCH := 3221491969

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_CHALLENGE_SIZE_MISMATCH := 3221491970

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_FRIENDLY_NAME_TOO_LONG := 3221491971

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_SILO_NAME_TOO_LONG := 3221491972

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_PASSWORD_TOO_LONG := 3221491973

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_PASSWORD_HINT_TOO_LONG := 3221491974

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_OTHER_SECURITY_PROTOCOL_ACTIVE := 3221491975

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_DEVICE_DIGEST_MISSING := 3221491976

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_NOT_AUTHORIZED_UNEXPECTED := 3221491977

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_AUTHORIZED_UNEXPECTED := 3221491978

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_PROVISIONED_UNEXPECTED := 3221491979

/**
 * @type {Integer (UInt32)}
 */
export global ES_E_UNKNOWN_DIGEST_ALGORITHM := 3221491980
;@endregion Constants
