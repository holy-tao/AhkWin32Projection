#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_ROOT_ELEMENT_EXPECTED := -2147220992

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_DEVICE_ELEMENT_EXPECTED := -2147220991

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_SERVICE_ELEMENT_EXPECTED := -2147220990

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_SERVICE_NODE_INCOMPLETE := -2147220989

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_DEVICE_NODE_INCOMPLETE := -2147220988

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_ICON_ELEMENT_EXPECTED := -2147220987

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_ICON_NODE_INCOMPLETE := -2147220986

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_INVALID_ACTION := -2147220985

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_INVALID_ARGUMENTS := -2147220984

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_OUT_OF_SYNC := -2147220983

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_ACTION_REQUEST_FAILED := -2147220976

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_TRANSPORT_ERROR := -2147220975

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_VARIABLE_VALUE_UNKNOWN := -2147220974

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_INVALID_VARIABLE := -2147220973

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_DEVICE_ERROR := -2147220972

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_PROTOCOL_ERROR := -2147220971

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_ERROR_PROCESSING_RESPONSE := -2147220970

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_DEVICE_TIMEOUT := -2147220969

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_INVALID_DOCUMENT := -2147220224

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_EVENT_SUBSCRIPTION_FAILED := -2147220223

/**
 * @type {Integer (UInt32)}
 */
export global FAULT_INVALID_ACTION := 401

/**
 * @type {Integer (UInt32)}
 */
export global FAULT_INVALID_ARG := 402

/**
 * @type {Integer (UInt32)}
 */
export global FAULT_INVALID_SEQUENCE_NUMBER := 403

/**
 * @type {Integer (UInt32)}
 */
export global FAULT_INVALID_VARIABLE := 404

/**
 * @type {Integer (UInt32)}
 */
export global FAULT_DEVICE_INTERNAL_ERROR := 501

/**
 * @type {Integer (UInt32)}
 */
export global FAULT_ACTION_SPECIFIC_BASE := 600

/**
 * @type {Integer (UInt32)}
 */
export global FAULT_ACTION_SPECIFIC_MAX := 899

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_ACTION_SPECIFIC_BASE := -2147220736

/**
 * @type {Integer (UInt32)}
 */
export global UPNP_ADDRESSFAMILY_IPv4 := 1

/**
 * @type {Integer (UInt32)}
 */
export global UPNP_ADDRESSFAMILY_IPv6 := 2

/**
 * @type {Integer (UInt32)}
 */
export global UPNP_ADDRESSFAMILY_BOTH := 3

/**
 * @type {Integer (UInt32)}
 */
export global UPNP_SERVICE_DELAY_SCPD_AND_SUBSCRIPTION := 1

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_REQUIRED_ELEMENT_ERROR := -2147180512

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_DUPLICATE_NOT_ALLOWED := -2147180511

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_DUPLICATE_SERVICE_ID := -2147180510

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_INVALID_DESCRIPTION := -2147180509

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_INVALID_SERVICE := -2147180508

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_INVALID_ICON := -2147180507

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_INVALID_XML := -2147180506

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_INVALID_ROOT_NAMESPACE := -2147180505

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_SUFFIX_TOO_LONG := -2147180504

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_URLBASE_PRESENT := -2147180503

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_VALUE_TOO_LONG := -2147180496

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_DEVICE_RUNNING := -2147180495

/**
 * @type {Integer (Int32)}
 */
export global UPNP_E_DEVICE_NOTREGISTERED := -2147180494

/**
 * @type {String}
 */
export global REMOTE_ADDRESS_VALUE_NAME := "RemoteAddress"

/**
 * @type {String}
 */
export global ADDRESS_FAMILY_VALUE_NAME := "AddressFamily"
;@endregion Constants
