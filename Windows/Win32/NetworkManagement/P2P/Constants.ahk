#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.NetworkManagement.P2P
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global NS_PNRPNAME := 38

/**
 * @type {Integer (UInt32)}
 */
export global NS_PNRPCLOUD := 39

/**
 * @type {Integer (UInt32)}
 */
export global PNRPINFO_HINT := 1

/**
 * @type {Guid}
 */
export global NS_PROVIDER_PNRPNAME := Guid("{03fe89cd-766d-4976-b9c1-bb9bc42c7b4d}")

/**
 * @type {Guid}
 */
export global NS_PROVIDER_PNRPCLOUD := Guid("{03fe89ce-766d-4976-b9c1-bb9bc42c7b4d}")

/**
 * @type {Guid}
 */
export global SVCID_PNRPCLOUD := Guid("{c2239ce6-00c0-4fbf-bad6-18139385a49a}")

/**
 * @type {Guid}
 */
export global SVCID_PNRPNAME_V1 := Guid("{c2239ce5-00c0-4fbf-bad6-18139385a49a}")

/**
 * @type {Guid}
 */
export global SVCID_PNRPNAME_V2 := Guid("{c2239ce7-00c0-4fbf-bad6-18139385a49a}")

/**
 * @type {Integer (UInt32)}
 */
export global PNRP_MAX_ENDPOINT_ADDRESSES := 10

/**
 * @type {String}
 */
export global WSZ_SCOPE_GLOBAL := "GLOBAL"

/**
 * @type {String}
 */
export global WSZ_SCOPE_SITELOCAL := "SITELOCAL"

/**
 * @type {String}
 */
export global WSZ_SCOPE_LINKLOCAL := "LINKLOCAL"

/**
 * @type {Integer (UInt32)}
 */
export global PNRP_MAX_EXTENDED_PAYLOAD_BYTES := 4096

/**
 * @type {String}
 */
export global PEER_PNRP_ALL_LINK_CLOUDS := "PEER_PNRP_ALL_LINKS"

/**
 * @type {Integer (UInt32)}
 */
export global WSA_PNRP_ERROR_BASE := 11500

/**
 * @type {Integer (UInt32)}
 */
export global WSA_PNRP_CLOUD_NOT_FOUND := 11501

/**
 * @type {Integer (UInt32)}
 */
export global WSA_PNRP_CLOUD_DISABLED := 11502

/**
 * @type {Integer (UInt32)}
 */
export global WSA_PNRP_INVALID_IDENTITY := 11503

/**
 * @type {Integer (UInt32)}
 */
export global WSA_PNRP_TOO_MUCH_LOAD := 11504

/**
 * @type {Integer (UInt32)}
 */
export global WSA_PNRP_CLOUD_IS_SEARCH_ONLY := 11505

/**
 * @type {Integer (UInt32)}
 */
export global WSA_PNRP_CLIENT_INVALID_COMPARTMENT_ID := 11506

/**
 * @type {Integer (UInt32)}
 */
export global WSA_PNRP_DUPLICATE_PEER_NAME := 11508

/**
 * @type {Integer (UInt32)}
 */
export global WSA_PNRP_CLOUD_IS_DEAD := 11509

/**
 * @type {Integer (Int32)}
 */
export global PEER_E_CLOUD_NOT_FOUND := -2147013395

/**
 * @type {Integer (Int32)}
 */
export global PEER_E_CLOUD_DISABLED := -2147013394

/**
 * @type {Integer (Int32)}
 */
export global PEER_E_INVALID_IDENTITY := -2147013393

/**
 * @type {Integer (Int32)}
 */
export global PEER_E_TOO_MUCH_LOAD := -2147013392

/**
 * @type {Integer (Int32)}
 */
export global PEER_E_CLOUD_IS_SEARCH_ONLY := -2147013391

/**
 * @type {Integer (Int32)}
 */
export global PEER_E_CLIENT_INVALID_COMPARTMENT_ID := -2147013390

/**
 * @type {Integer (Int32)}
 */
export global PEER_E_DUPLICATE_PEER_NAME := -2147013388

/**
 * @type {Integer (Int32)}
 */
export global PEER_E_CLOUD_IS_DEAD := -2147013387

/**
 * @type {Integer (Int32)}
 */
export global PEER_E_NOT_FOUND := -2147023728

/**
 * @type {Integer (Int32)}
 */
export global PEER_E_DISK_FULL := -2147024784

/**
 * @type {Integer (Int32)}
 */
export global PEER_E_ALREADY_EXISTS := -2147024713

/**
 * @type {Guid}
 */
export global PEER_GROUP_ROLE_ADMIN := Guid("{04387127-aa56-450a-8ce5-4f565c6790f4}")

/**
 * @type {Guid}
 */
export global PEER_GROUP_ROLE_MEMBER := Guid("{f12dc4c7-0857-4ca0-93fc-b1bb19a3d8c2}")

/**
 * @type {Guid}
 */
export global PEER_GROUP_ROLE_INVITING_MEMBER := Guid("{4370fd89-dc18-4cfb-8dbf-9853a8a9f905}")

/**
 * @type {Guid}
 */
export global PEER_COLLAB_OBJECTID_USER_PICTURE := Guid("{dd15f41f-fc4e-4922-b035-4c06a754d01d}")

/**
 * @type {Integer (UInt32)}
 */
export global FACILITY_DRT := 98

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_TIMEOUT := -2141057023

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_INVALID_KEY_SIZE := -2141057022

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_INVALID_CERT_CHAIN := -2141057020

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_INVALID_MESSAGE := -2141057019

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_NO_MORE := -2141057018

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_INVALID_MAX_ADDRESSES := -2141057017

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_SEARCH_IN_PROGRESS := -2141057016

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_INVALID_KEY := -2141057015

/**
 * @type {Integer (Int32)}
 */
export global DRT_S_RETRY := 6426640

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_INVALID_MAX_ENDPOINTS := -2141057007

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_INVALID_SEARCH_RANGE := -2141057006

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_INVALID_PORT := -2141052928

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_INVALID_TRANSPORT_PROVIDER := -2141052927

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_INVALID_SECURITY_PROVIDER := -2141052926

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_STILL_IN_USE := -2141052925

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_INVALID_BOOTSTRAP_PROVIDER := -2141052924

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_INVALID_ADDRESS := -2141052923

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_INVALID_SCOPE := -2141052922

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_TRANSPORT_SHUTTING_DOWN := -2141052921

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_NO_ADDRESSES_AVAILABLE := -2141052920

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_DUPLICATE_KEY := -2141052919

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_TRANSPORTPROVIDER_IN_USE := -2141052918

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_TRANSPORTPROVIDER_NOT_ATTACHED := -2141052917

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_SECURITYPROVIDER_IN_USE := -2141052916

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_SECURITYPROVIDER_NOT_ATTACHED := -2141052915

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_BOOTSTRAPPROVIDER_IN_USE := -2141052914

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_BOOTSTRAPPROVIDER_NOT_ATTACHED := -2141052913

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_TRANSPORT_ALREADY_BOUND := -2141052671

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_TRANSPORT_NOT_BOUND := -2141052670

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_TRANSPORT_UNEXPECTED := -2141052669

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_TRANSPORT_INVALID_ARGUMENT := -2141052668

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_TRANSPORT_NO_DEST_ADDRESSES := -2141052667

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_TRANSPORT_EXECUTING_CALLBACK := -2141052666

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_TRANSPORT_ALREADY_EXISTS_FOR_SCOPE := -2141052665

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_INVALID_SETTINGS := -2141052664

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_INVALID_SEARCH_INFO := -2141052663

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_FAULTED := -2141052662

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_TRANSPORT_STILL_BOUND := -2141052661

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_INSUFFICIENT_BUFFER := -2141052660

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_INVALID_INSTANCE_PREFIX := -2141052659

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_INVALID_SECURITY_MODE := -2141052658

/**
 * @type {Integer (Int32)}
 */
export global DRT_E_CAPABILITY_MISMATCH := -2141052657

/**
 * @type {Integer (UInt32)}
 */
export global DRT_PAYLOAD_REVOKED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRT_MIN_ROUTING_ADDRESSES := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRT_MAX_ROUTING_ADDRESSES := 20

/**
 * @type {Integer (UInt32)}
 */
export global DRT_MAX_PAYLOAD_SIZE := 5120

/**
 * @type {Integer (UInt32)}
 */
export global DRT_MAX_INSTANCE_PREFIX_LEN := 128

/**
 * @type {Integer (UInt32)}
 */
export global DRT_LINK_LOCAL_ISATAP_SCOPEID := 4294967295

/**
 * @type {Integer (Int32)}
 */
export global PEERDIST_PUBLICATION_OPTIONS_VERSION_1 := 1

/**
 * @type {Integer (Int32)}
 */
export global PEERDIST_PUBLICATION_OPTIONS_VERSION := 2

/**
 * @type {Integer (Int32)}
 */
export global PEERDIST_PUBLICATION_OPTIONS_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global PEERDIST_READ_TIMEOUT_LOCAL_CACHE_ONLY := 0

/**
 * @type {Integer (UInt32)}
 */
export global PEERDIST_READ_TIMEOUT_DEFAULT := 4294967294
;@endregion Constants
