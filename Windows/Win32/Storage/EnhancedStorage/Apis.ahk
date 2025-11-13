#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk

/**
 * @namespace Windows.Win32.Storage.EnhancedStorage
 * @version v4.0.30319
 */
class EnhancedStorage {

;@region Constants

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_ENHANCED_STORAGE_SILO => Guid("{3897f6a4-fd35-4bc8-a0b7-5dbba36adafa}")

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_ENHANCED_STORAGE => Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_SILO_IS_AUTHENTICATION_SILO {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_SILO_GET_AUTHENTICATION_STATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_SILO_ENUMERATE_SILOS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_CERT_HOST_CERTIFICATE_AUTHENTICATION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 101
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_CERT_DEVICE_CERTIFICATE_AUTHENTICATION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 102
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_CERT_ADMIN_CERTIFICATE_AUTHENTICATION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 103
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_CERT_INITIALIZE_TO_MANUFACTURER_STATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 104
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_CERT_GET_CERTIFICATE_COUNT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 105
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_CERT_GET_CERTIFICATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 106
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_CERT_SET_CERTIFICATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 107
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_CERT_CREATE_CERTIFICATE_REQUEST {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 108
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_CERT_UNAUTHENTICATION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 110
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_CERT_GET_SILO_CAPABILITY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 111
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_CERT_GET_SILO_CAPABILITIES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 112
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_CERT_GET_ACT_FRIENDLY_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 113
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_CERT_GET_SILO_GUID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 114
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_PASSWORD_AUTHORIZE_ACT_ACCESS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 203
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_PASSWORD_UNAUTHORIZE_ACT_ACCESS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 204
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_PASSWORD_QUERY_INFORMATION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 205
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_PASSWORD_CONFIG_ADMINISTRATOR {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 206
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_PASSWORD_CREATE_USER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 207
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_PASSWORD_DELETE_USER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 208
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_PASSWORD_CHANGE_PASSWORD {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 209
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_PASSWORD_INITIALIZE_USER_PASSWORD {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 210
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_COMMAND_PASSWORD_START_INITIALIZE_TO_MANUFACTURER_STATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 211
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_AUTHENTICATION_STATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1006
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static ENHANCED_STORAGE_AUTHN_STATE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ENHANCED_STORAGE_AUTHN_STATE_NO_AUTHENTICATION_REQUIRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENHANCED_STORAGE_AUTHN_STATE_NOT_AUTHENTICATED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ENHANCED_STORAGE_AUTHN_STATE_AUTHENTICATED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ENHANCED_STORAGE_AUTHN_STATE_AUTHENTICATION_DENIED => 2147483649

    /**
     * @type {Integer (UInt32)}
     */
    static ENHANCED_STORAGE_AUTHN_STATE_DEVICE_ERROR => 2147483650

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_IS_AUTHENTICATION_SILO {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1009
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_TEMPORARY_UNAUTHENTICATION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1010
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_MAX_AUTH_FAILURES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_PASSWORD {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2004
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_OLD_PASSWORD {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2005
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_PASSWORD_INDICATOR {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2006
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_NEW_PASSWORD_INDICATOR {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2007
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_NEW_PASSWORD {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2008
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_USER_HINT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2009
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_USER_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2010
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_ADMIN_HINT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2011
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_SILO_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2012
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_SILO_FRIENDLYNAME_SPECIFIED {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2013
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_PASSWORD_SILO_INFO {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2014
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_SECURITY_IDENTIFIER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2015
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_QUERY_SILO_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2016
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_QUERY_SILO_RESULTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2017
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_MAX_CERTIFICATE_COUNT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_STORED_CERTIFICATE_COUNT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3002
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_CERTIFICATE_INDEX {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3003
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_CERTIFICATE_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3004
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_TYPE_EMPTY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_TYPE_ASCm => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_TYPE_PCp => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_TYPE_ASCh => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_TYPE_HCh => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_TYPE_SIGNER => 6

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_VALIDATION_POLICY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3005
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_VALIDATION_POLICY_RESERVED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_VALIDATION_POLICY_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_VALIDATION_POLICY_BASIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_VALIDATION_POLICY_EXTENDED => 3

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_NEXT_CERTIFICATE_INDEX {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3006
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_NEXT_CERTIFICATE_OF_TYPE_INDEX {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3007
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_CERTIFICATE_LENGTH {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3008
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_CERTIFICATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3009
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_CERTIFICATE_REQUEST {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3010
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_CERTIFICATE_CAPABILITY_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3011
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_CERTIFICATE_SILO_CAPABILITY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3012
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_CERTIFICATE_SILO_CAPABILITIES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3013
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CAPABILITY_HASH_ALG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CAPABILITY_ASYMMETRIC_KEY_CRYPTOGRAPHY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CAPABILITY_SIGNATURE_ALG => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CAPABILITY_CERTIFICATE_SUPPORT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CAPABILITY_OPTIONAL_FEATURES => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_MAX_CAPABILITY => 255

    /**
     * @type {String}
     */
    static CERT_RSA_1024_OID => "1.2.840.113549.1.1.1,1024"

    /**
     * @type {String}
     */
    static CERT_RSA_2048_OID => "1.2.840.113549.1.1.1,2048"

    /**
     * @type {String}
     */
    static CERT_RSA_3072_OID => "1.2.840.113549.1.1.1,3072"

    /**
     * @type {String}
     */
    static CERT_RSASSA_PSS_SHA1_OID => "1.2.840.113549.1.1.10,1.3.14.3.2.26"

    /**
     * @type {String}
     */
    static CERT_RSASSA_PSS_SHA256_OID => "1.2.840.113549.1.1.10,2.16.840.1.101.3.4.2.1"

    /**
     * @type {String}
     */
    static CERT_RSASSA_PSS_SHA384_OID => "1.2.840.113549.1.1.10,2.16.840.1.101.3.4.2.2"

    /**
     * @type {String}
     */
    static CERT_RSASSA_PSS_SHA512_OID => "1.2.840.113549.1.1.10,2.16.840.1.101.3.4.2.3"

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_CERTIFICATE_ACT_FRIENDLY_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3014
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_CERTIFICATE_SILO_GUID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3015
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_PROPERTY_SIGNER_CERTIFICATE_INDEX {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3016
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_CAPABILITY_HASH_ALGS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_CAPABILITY_ASYMMETRIC_KEY_CRYPTOGRAPHY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4002
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_CAPABILITY_SIGNING_ALGS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4003
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_CAPABILITY_RENDER_USER_DATA_UNUSABLE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4004
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static ENHANCED_STORAGE_CAPABILITY_CERTIFICATE_EXTENSION_PARSING {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91248166-b832-4ad4-baa4-7ca0b6b2798c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4005
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Address_Country {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c07b4199-e1df-4493-b1e1-de5946fb58f8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Address_CountryCode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c07b4199-e1df-4493-b1e1-de5946fb58f8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 101
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Address_Region {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c07b4199-e1df-4493-b1e1-de5946fb58f8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 102
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Address_RegionCode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c07b4199-e1df-4493-b1e1-de5946fb58f8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 103
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Address_Town {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c07b4199-e1df-4493-b1e1-de5946fb58f8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 104
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Audio_ChannelCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440490-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIO_CHANNELCOUNT_MONO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIO_CHANNELCOUNT_STEREO => 2

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Audio_Compression {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440490-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Audio_EncodingBitrate {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440490-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Audio_Format {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440490-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Audio_IsVariableBitRate {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e6822fee-8c17-4d62-823c-8e9cfcbd1d5c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Audio_PeakValue {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2579e5d0-1116-4084-bd9a-9b4f7cb4df5e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Audio_SampleRate {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440490-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Audio_SampleSize {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440490-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Audio_StreamName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440490-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Audio_StreamNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440490-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Calendar_Duration {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{293ca35a-09aa-4dd2-b180-1fe245728a52}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Calendar_IsOnline {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bfee9149-e3e2-49a7-a862-c05988145cec}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Calendar_IsRecurring {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{315b9c8d-80a9-4ef9-ae16-8e746da51d70}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Calendar_Location {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f6272d18-cecc-40b1-b26a-3911717aa7bd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Calendar_OptionalAttendeeAddresses {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d55bae5a-3892-417a-a649-c6ac5aaaeab3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Calendar_OptionalAttendeeNames {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{09429607-582d-437f-84c3-de93a2b24c3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Calendar_OrganizerAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{744c8242-4df5-456c-ab9e-014efb9021e3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Calendar_OrganizerName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{aaa660f9-9865-458e-b484-01bc7fe3973e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Calendar_ReminderTime {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{72fc5ba4-24f9-4011-9f3f-add27afad818}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Calendar_RequiredAttendeeAddresses {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0ba7d6c3-568d-4159-ab91-781a91fb71e5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Calendar_RequiredAttendeeNames {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b33af30b-f552-4584-936c-cb93e5cda29f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Calendar_Resources {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f58a38-c54b-4c40-8696-97235980eae1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Calendar_ResponseStatus {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{188c1f91-3c40-4132-9ec5-d8b03b72a8a2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Calendar_ShowTimeAs {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5bf396d4-5eb2-466f-bde9-2fb3f2361d6e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Calendar_ShowTimeAsText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{53da57cf-62c0-45c4-81de-7610bcefd7f5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Communication_AccountName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Communication_DateItemExpires {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{428040ac-a177-4c8a-9760-f6f761227f9a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Communication_Direction {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8e531030-b960-4346-ae0d-66bc9a86fb94}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Communication_FollowupIconIndex {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{83a6347e-6fe4-4f40-ba9c-c4865240d1f4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Communication_HeaderItem {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9c34f84-2241-4401-b607-bd20ed75ae7f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Communication_PolicyTag {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ec0b4191-ab0b-4c66-90b6-c6637cdebbab}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Communication_SecurityFlags {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8619a4b6-9f4d-4429-8c0f-b996ca59e335}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Communication_Suffix {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{807b653a-9e91-43ef-8f97-11ce04ee20c5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Communication_TaskStatus {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{be1a72c6-9a1d-46b7-afe7-afaf8cef4999}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Communication_TaskStatusText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a6744477-c237-475b-a075-54f34498292a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Computer_DecoratedFreeSpace {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9b174b35-40ff-11d2-a27e-00c04fc30871}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_AccountPictureDynamicVideo {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0b8bb018-2725-4b44-92ba-7933aeb2dde7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_AccountPictureLarge {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0b8bb018-2725-4b44-92ba-7933aeb2dde7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_AccountPictureSmall {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0b8bb018-2725-4b44-92ba-7933aeb2dde7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_Anniversary {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9ad5badb-cea7-4470-a03d-b84e51b9949e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_AssistantName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cd102c9c-5540-4a88-a6f6-64e4981c8cd1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_AssistantTelephone {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9a93244d-a7ad-4ff8-9b99-45ee4cc09af6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_Birthday {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{176dc63c-2688-4e89-8143-a347800f25e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 47
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{730fb6dd-cf7c-426b-a03f-bd166cc9ee24}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddress1Country {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 119
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddress1Locality {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 117
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddress1PostalCode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 120
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddress1Region {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 118
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddress1Street {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 116
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddress2Country {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 124
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddress2Locality {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 122
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddress2PostalCode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 125
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddress2Region {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 123
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddress2Street {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 121
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddress3Country {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 129
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddress3Locality {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 127
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddress3PostalCode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 130
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddress3Region {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 128
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddress3Street {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 126
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddressCity {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{402b5934-ec5a-48c3-93e6-85e86a2d934e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddressCountry {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b0b87314-fcf6-4feb-8dff-a50da6af561c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddressPostalCode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e1d4a09e-d758-4cd1-b6ec-34a8b5a73f80}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddressPostOfficeBox {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bc4e71ce-17f9-48d5-bee9-021df0ea5409}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddressState {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{446f787f-10c4-41cb-a6c4-4d0343551597}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessAddressStreet {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ddd1460f-c0bf-4553-8ce4-10433c908fb0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessEmailAddresses {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f271c659-7e5e-471f-ba25-7f77b286f836}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessFaxNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{91eff6f3-2e27-42ca-933e-7c999fbe310b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessHomePage {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{56310920-2491-4919-99ce-eadb06fafdb2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_BusinessTelephone {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6a15e5a0-0a1e-4cd7-bb8c-d2f1b0c929bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_CallbackTelephone {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bf53d1c3-49e0-4f7f-8567-5a821d8ac542}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_CarTelephone {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8fdc6dea-b929-412b-ba90-397a257465fe}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_Children {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d4729704-8ef1-43ef-9024-2bd381187fd5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_CompanyMainTelephone {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8589e481-6040-473d-b171-7fa89c2708ed}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_ConnectedServiceDisplayName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{39b77f4f-a104-4863-b395-2db2ad8f7bc1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_ConnectedServiceIdentities {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{80f41eb8-afc4-4208-aa5f-cce21a627281}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_ConnectedServiceName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b5c84c9e-5927-46b5-a3cc-933c21b78469}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_ConnectedServiceSupportedActions {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a19fb7a9-024b-4371-a8bf-4d29c3e4e9c9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_DataSuppliers {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9660c283-fc3a-4a08-a096-eed3aac46da2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_Department {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fc9f7306-ff8f-4d49-9fb6-3ffe5c0951ec}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_DisplayBusinessPhoneNumbers {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{364028da-d895-41fe-a584-302b1bb70a76}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_DisplayHomePhoneNumbers {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5068bcdf-d697-4d85-8c53-1f1cdab01763}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_DisplayMobilePhoneNumbers {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9cb0c358-9d7a-46b1-b466-dcc6f1a3d93d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_DisplayOtherPhoneNumbers {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{03089873-8ee8-4191-bd60-d31f72b7900b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_EmailAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f8fa7fa3-d12b-4785-8a4e-691a94f7a3e7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_EmailAddress2 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{38965063-edc8-4268-8491-b7723172cf29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_EmailAddress3 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{644d37b4-e1b3-4bad-b099-7e7c04966aca}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_EmailAddresses {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{84d8f337-981d-44b3-9615-c7596dba17e3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_EmailName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cc6f4f24-6083-4bd4-8754-674d0de87ab8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_FileAsName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f1a24aa7-9ca7-40f6-89ec-97def9ffe8db}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_FirstName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14977844-6b49-4aad-a714-a4513bf60460}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_FullName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{635e9051-50a5-4ba2-b9db-4ed056c77296}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_Gender {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3c8cee58-d4f0-4cf9-b756-4e5d24447bcd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_GenderValue {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3c8cee58-d4f0-4cf9-b756-4e5d24447bcd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 101
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_Hobbies {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5dc2253f-5e11-4adf-9cfe-910dd01e3e70}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{98f98354-617a-46b8-8560-5b1b64bf1f89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddress1Country {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 104
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddress1Locality {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 102
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddress1PostalCode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 105
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddress1Region {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 103
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddress1Street {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 101
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddress2Country {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 109
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddress2Locality {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 107
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddress2PostalCode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 110
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddress2Region {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 108
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddress2Street {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 106
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddress3Country {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 114
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddress3Locality {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 112
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddress3PostalCode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 115
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddress3Region {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 113
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddress3Street {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 111
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddressCity {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{176dc63c-2688-4e89-8143-a347800f25e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 65
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddressCountry {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{08a65aa1-f4c9-43dd-9ddf-a33d8e7ead85}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddressPostalCode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8afcc170-8a46-4b53-9eee-90bae7151e62}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddressPostOfficeBox {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7b9f6399-0a3f-4b12-89bd-4adc51c918af}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddressState {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c89a23d0-7d6d-4eb8-87d4-776a82d493e5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeAddressStreet {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0adef160-db3f-4308-9a21-06237b16fa2a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeEmailAddresses {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{56c90e9d-9d46-4963-886f-2e1cd9a694ef}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeFaxNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{660e04d6-81ab-4977-a09f-82313113ab26}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_HomeTelephone {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{176dc63c-2688-4e89-8143-a347800f25e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_IMAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d68dbd8a-3374-4b81-9972-3ec30682db3d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_Initials {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f3d8f40d-50cb-44a2-9718-40cb9119495d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JA_CompanyNamePhonetic {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{897b3694-fe9e-43e6-8066-260f590c0100}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JA_FirstNamePhonetic {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{897b3694-fe9e-43e6-8066-260f590c0100}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JA_LastNamePhonetic {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{897b3694-fe9e-43e6-8066-260f590c0100}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo1CompanyAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 120
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo1CompanyName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 102
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo1Department {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 106
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo1Manager {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 105
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo1OfficeLocation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 104
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo1Title {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 103
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo1YomiCompanyName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 101
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo2CompanyAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 121
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo2CompanyName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 108
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo2Department {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 113
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo2Manager {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 112
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo2OfficeLocation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 110
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo2Title {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 109
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo2YomiCompanyName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 107
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo3CompanyAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 123
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo3CompanyName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 115
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo3Department {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 119
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo3Manager {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 118
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo3OfficeLocation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 117
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo3Title {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 116
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobInfo3YomiCompanyName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 114
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_JobTitle {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{176dc63c-2688-4e89-8143-a347800f25e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_Label {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{97b0ad89-df49-49cc-834e-660974fd755b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_LastName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8f367200-c270-457c-b1d4-e07c5bcd90c7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_MailingAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c0ac206a-827e-4650-95ae-77e2bb74fcc9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_MiddleName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{176dc63c-2688-4e89-8143-a347800f25e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 71
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_MobileTelephone {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{176dc63c-2688-4e89-8143-a347800f25e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 35
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_NickName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{176dc63c-2688-4e89-8143-a347800f25e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 74
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OfficeLocation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{176dc63c-2688-4e89-8143-a347800f25e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{508161fa-313b-43d5-83a1-c1accf68622c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddress1Country {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 134
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddress1Locality {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 132
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddress1PostalCode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 135
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddress1Region {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 133
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddress1Street {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 131
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddress2Country {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 139
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddress2Locality {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 137
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddress2PostalCode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 140
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddress2Region {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 138
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddress2Street {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 136
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddress3Country {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 144
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddress3Locality {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 142
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddress3PostalCode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 145
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddress3Region {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 143
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddress3Street {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7b6f596-d678-4bc1-b05f-0203d27e8aa1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 141
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddressCity {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6e682923-7f7b-4f0c-a337-cfca296687bf}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddressCountry {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8f167568-0aae-4322-8ed9-6055b7b0e398}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddressPostalCode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{95c656c1-2abf-4148-9ed3-9ec602e3b7cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddressPostOfficeBox {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8b26ea41-058f-43f6-aecc-4035681ce977}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddressState {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{71b377d6-e570-425f-a170-809fae73e54e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherAddressStreet {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ff962609-b7d6-4999-862d-95180d529aea}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_OtherEmailAddresses {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{11d6336b-38c4-4ec9-84d6-eb38d0b150af}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_PagerTelephone {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d6304e01-f8f5-4f45-8b15-d024a6296789}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_PersonalTitle {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{176dc63c-2688-4e89-8143-a347800f25e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 69
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_PhoneNumbersCanonical {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d042d2a1-927e-40b5-a503-6edbd42a517e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_Prefix {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{176dc63c-2688-4e89-8143-a347800f25e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 75
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_PrimaryAddressCity {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c8ea94f0-a9e3-4969-a94b-9c62a95324e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_PrimaryAddressCountry {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e53d799d-0f3f-466e-b2ff-74634a3cb7a4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_PrimaryAddressPostalCode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{18bbd425-ecfd-46ef-b612-7b4a6034eda0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_PrimaryAddressPostOfficeBox {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{de5ef3c7-46e1-484e-9999-62c5308394c1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_PrimaryAddressState {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f1176dfe-7138-4640-8b4c-ae375dc70a6d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_PrimaryAddressStreet {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{63c25b20-96be-488f-8788-c09c407ad812}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_PrimaryEmailAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{176dc63c-2688-4e89-8143-a347800f25e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 48
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_PrimaryTelephone {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{176dc63c-2688-4e89-8143-a347800f25e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 25
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_Profession {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7268af55-1ce4-4f6e-a41f-b6e4ef10e4a9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_SpouseName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9d2408b6-3167-422b-82b0-f583b7a7cfe3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_Suffix {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{176dc63c-2688-4e89-8143-a347800f25e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 73
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_TelexNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c554493c-c1f7-40c1-a76c-ef8c0614003e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_TTYTDDTelephone {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{aaf16bac-2b55-45e6-9f6d-415eb94910df}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_WebPage {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_Webpage2 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 124
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Contact_Webpage3 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00f63dd8-22bd-4a5d-ba34-5cb0b9bdcb03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 125
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_AcquisitionID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{65a98875-3c80-40ab-abbc-efdaf77dbee2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ApplicationDefinedProperties {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cdbfc167-337e-41d8-af7c-8c09205429c7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ApplicationName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_AppZoneIdentifier {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{502cfeab-47eb-459c-b960-e6d8728f7701}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 102
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Author {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CachedFileUpdaterContentIdForConflictResolution {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 114
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CachedFileUpdaterContentIdForStream {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 113
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Capacity {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9b174b35-40ff-11d2-a27e-00c04fc30871}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Category {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Comment {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Company {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ComputerName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ContainedItems {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 29
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ContentId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 132
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ContentStatus {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 27
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ContentType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 26
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ContentUri {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 131
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Copyright {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CreatorAppId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c2ea046e-033c-4e91-bd5b-d4942f6bbe49}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CreatorOpenWithUIOptions {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c2ea046e-033c-4e91-bd5b-d4942f6bbe49}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static CREATOROPENWITHUIOPTION_HIDDEN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CREATOROPENWITHUIOPTION_VISIBLE => 1

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DataObjectFormat {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1e81a3f8-a30f-4247-b9ee-1d0368a9425c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DateAccessed {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DateAcquired {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2cbaa8f5-d81f-47ca-b17a-f8d822300131}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DateArchived {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{43f8d7b7-a444-4f87-9383-52271c9b915c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DateCompleted {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{72fab781-acda-43e5-b155-b2434f85e678}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DateCreated {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DateImported {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18258
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DateModified {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DefaultSaveLocationDisplay {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5d76b67f-9b3d-44bb-b6ae-25da4f638a67}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static ISDEFAULTSAVE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ISDEFAULTSAVE_OWNER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ISDEFAULTSAVE_NONOWNER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ISDEFAULTSAVE_BOTH => 3

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DueDate {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3f8472b5-e0af-4db2-8071-c53fe76ae7ce}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_EndDate {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c75faa05-96fd-49e7-9cb4-9f601082d553}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ExpandoProperties {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6fa20de6-d11c-4d9d-a154-64317628c12d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FileAllocationSize {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FileAttributes {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FileCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FileDescription {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cef7d53-fa64-11d1-a203-0000f81fedee}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FileExtension {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e4f10a3c-49e6-405d-8288-a23bd4eeaa6c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FileFRN {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 21
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FileName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{41cf5ae0-f75a-4806-bd87-59c7d9248eb9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FileOfflineAvailabilityStatus {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static FILEOFFLINEAVAILABILITYSTATUS_NOTAVAILABLEOFFLINE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILEOFFLINEAVAILABILITYSTATUS_PARTIAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILEOFFLINEAVAILABILITYSTATUS_COMPLETE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILEOFFLINEAVAILABILITYSTATUS_COMPLETE_PINNED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILEOFFLINEAVAILABILITYSTATUS_EXCLUDED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILEOFFLINEAVAILABILITYSTATUS_FOLDER_EMPTY => 5

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FileOwner {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9b174b34-40ff-11d2-a27e-00c04fc30871}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FilePlaceholderStatus {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FileVersion {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cef7d53-fa64-11d1-a203-0000f81fedee}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FindData {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 0
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FlagColor {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{67df94de-0ca7-4d6f-b792-053a3e4f03cf}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FlagColorText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{45eae747-8e2a-40ae-8cbf-ca52aba6152a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FlagStatus {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {Integer (Int32)}
     */
    static FLAGSTATUS_NOTFLAGGED => 0

    /**
     * @type {Integer (Int32)}
     */
    static FLAGSTATUS_COMPLETED => 1

    /**
     * @type {Integer (Int32)}
     */
    static FLAGSTATUS_FOLLOWUP => 2

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FlagStatusText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{dc54fd2e-189d-4871-aa01-08c2f57a4abc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FolderKind {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 101
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FolderNameDisplay {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 25
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FreeSpace {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9b174b35-40ff-11d2-a27e-00c04fc30871}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FullText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1e3ee840-bc2b-476c-8237-2acd1a839b22}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_HighKeywords {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Identity {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a26f4afc-7346-4299-be47-eb1ae613139f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Identity_Blob {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8c3b93a4-baed-1a83-9a32-102ee313f6eb}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Identity_DisplayName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7d683fc9-d155-45a8-bb1f-89d19bcb792f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Identity_InternetSid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6d6d5d49-265d-4688-9f4e-1fdd33e7cc83}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Identity_IsMeIdentity {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a4108708-09df-4377-9dfc-6d99986d5a67}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Identity_KeyProviderContext {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a26f4afc-7346-4299-be47-eb1ae613139f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Identity_KeyProviderName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a26f4afc-7346-4299-be47-eb1ae613139f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Identity_LogonStatusString {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f18dedf3-337f-42c0-9e03-cee08708a8c3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Identity_PrimaryEmailAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fcc16823-baed-4f24-9b32-a0982117f7fa}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Identity_PrimarySid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2b1b801e-c0c1-4987-9ec5-72fa89814787}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Identity_ProviderData {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a8a74b92-361b-4e9a-b722-7c4a7330a312}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Identity_ProviderID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{74a7de49-fa11-4d3d-a006-db7e08675916}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Identity_QualifiedUserName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{da520e51-f4e9-4739-ac82-02e0a95c9030}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Identity_UniqueID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e55fc3b0-2b60-4220-918e-b21e8bf16016}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Identity_UserName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c4322503-78ca-49c6-9acc-a68e2afd7b6b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_IdentityProvider_Name {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b96eff7b-35ca-4a35-8607-29e3a54c46ea}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_IdentityProvider_Picture {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2425166f-5642-4864-992f-98fd98f294c3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ImageParsingName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d7750ee0-c6a4-48ec-b53e-b87b52e6d073}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Importance {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {Integer (Int32)}
     */
    static IMPORTANCE_LOW_MIN => 0

    /**
     * @type {Integer (Int32)}
     */
    static IMPORTANCE_LOW_SET => 1

    /**
     * @type {Integer (Int32)}
     */
    static IMPORTANCE_LOW_MAX => 1

    /**
     * @type {Integer (Int32)}
     */
    static IMPORTANCE_NORMAL_MIN => 2

    /**
     * @type {Integer (Int32)}
     */
    static IMPORTANCE_NORMAL_SET => 3

    /**
     * @type {Integer (Int32)}
     */
    static IMPORTANCE_NORMAL_MAX => 4

    /**
     * @type {Integer (Int32)}
     */
    static IMPORTANCE_HIGH_MIN => 5

    /**
     * @type {Integer (Int32)}
     */
    static IMPORTANCE_HIGH_SET => 5

    /**
     * @type {Integer (Int32)}
     */
    static IMPORTANCE_HIGH_MAX => 5

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ImportanceText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a3b29791-7713-4e1d-bb40-17db85f01831}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_IsAttachment {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f23f425c-71a1-4fa8-922f-678ea4a60408}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_IsDefaultNonOwnerSaveLocation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5d76b67f-9b3d-44bb-b6ae-25da4f638a67}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_IsDefaultSaveLocation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5d76b67f-9b3d-44bb-b6ae-25da4f638a67}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_IsDeleted {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5cda5fc8-33ee-4ff3-9094-ae7bd8868c4d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_IsEncrypted {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{90e5e14e-648b-4826-b2aa-acaf790e3513}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_IsFlagged {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5da84765-e3ff-4278-86b0-a27967fbdd03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_IsFlaggedComplete {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a6f360d2-55f9-48de-b909-620e090a647c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_IsIncomplete {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{346c8bd1-2e6a-4c45-89a4-61b78e8e700f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_IsLocationSupported {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5d76b67f-9b3d-44bb-b6ae-25da4f638a67}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_IsPinnedToNameSpaceTree {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5d76b67f-9b3d-44bb-b6ae-25da4f638a67}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_IsRead {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_IsSearchOnlyItem {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5d76b67f-9b3d-44bb-b6ae-25da4f638a67}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_IsSendToTarget {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 33
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_IsShared {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef884c5b-2bfe-41bb-aae5-76eedf4f9902}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ItemAuthors {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d0a04f0a-462a-48a4-bb2f-3706e88dbd7d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ItemClassType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{048658ad-2db8-41a4-bbb6-ac1ef1207eb1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ItemDate {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f7db74b4-4287-4103-afba-f1b13dcd75cf}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ItemFolderNameDisplay {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ItemFolderPathDisplay {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ItemFolderPathDisplayNarrow {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{dabd30ed-0043-4789-a7f8-d013a4736622}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ItemName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6b8da074-3b5c-43bc-886f-0a2cdce00b6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ItemNameDisplay {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ItemNameDisplayWithoutExtension {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ItemNamePrefix {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d7313ff1-a77a-401c-8c99-3dbdd68add36}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ItemNameSortOverride {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 23
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ItemParticipants {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d4d0aa16-9948-41a4-aa85-d97ff9646993}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ItemPathDisplay {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ItemPathDisplayNarrow {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ItemSubType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 37
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ItemType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ItemTypeText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ItemUrl {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49691c90-7e17-101a-a91c-08002b2ecda9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Keywords {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Kind {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1e3ee840-bc2b-476c-8237-2acd1a839b22}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {String}
     */
    static KIND_CALENDAR => "calendar"

    /**
     * @type {String}
     */
    static KIND_COMMUNICATION => "communication"

    /**
     * @type {String}
     */
    static KIND_CONTACT => "contact"

    /**
     * @type {String}
     */
    static KIND_DOCUMENT => "document"

    /**
     * @type {String}
     */
    static KIND_EMAIL => "email"

    /**
     * @type {String}
     */
    static KIND_FEED => "feed"

    /**
     * @type {String}
     */
    static KIND_FOLDER => "folder"

    /**
     * @type {String}
     */
    static KIND_GAME => "game"

    /**
     * @type {String}
     */
    static KIND_INSTANTMESSAGE => "instantmessage"

    /**
     * @type {String}
     */
    static KIND_JOURNAL => "journal"

    /**
     * @type {String}
     */
    static KIND_LINK => "link"

    /**
     * @type {String}
     */
    static KIND_MOVIE => "movie"

    /**
     * @type {String}
     */
    static KIND_MUSIC => "music"

    /**
     * @type {String}
     */
    static KIND_NOTE => "note"

    /**
     * @type {String}
     */
    static KIND_PICTURE => "picture"

    /**
     * @type {String}
     */
    static KIND_PLAYLIST => "playlist"

    /**
     * @type {String}
     */
    static KIND_PROGRAM => "program"

    /**
     * @type {String}
     */
    static KIND_RECORDEDTV => "recordedtv"

    /**
     * @type {String}
     */
    static KIND_SEARCHFOLDER => "searchfolder"

    /**
     * @type {String}
     */
    static KIND_TASK => "task"

    /**
     * @type {String}
     */
    static KIND_VIDEO => "video"

    /**
     * @type {String}
     */
    static KIND_WEBHISTORY => "webhistory"

    /**
     * @type {String}
     */
    static KIND_UNKNOWN => "unknown"

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_KindText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f04bef95-c585-4197-a2b7-df46fdc9ee6d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Language {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 28
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_LastSyncError {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 107
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_LastSyncWarning {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 128
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_LastWriterPackageFamilyName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{502cfeab-47eb-459c-b960-e6d8728f7701}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 101
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_LowKeywords {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 25
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MediumKeywords {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 26
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MileageInformation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fdf84370-031a-4add-9e91-0d775f1c6605}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MIMEType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0b63e350-9ccc-11d0-bcdb-00805fccce04}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Null {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00000000-0000-0000-0000-000000000000}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 0
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_OfflineAvailability {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a94688b6-7d9f-4570-a648-e3dfc0ab2b3f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEAVAILABILITY_NOT_AVAILABLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEAVAILABILITY_AVAILABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEAVAILABILITY_ALWAYS_AVAILABLE => 2

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_OfflineStatus {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6d24888f-4718-4bda-afed-ea0fb4386cd8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINESTATUS_ONLINE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINESTATUS_OFFLINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINESTATUS_OFFLINE_FORCED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINESTATUS_OFFLINE_SLOW => 3

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINESTATUS_OFFLINE_ERROR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINESTATUS_OFFLINE_ITEM_VERSION_CONFLICT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINESTATUS_OFFLINE_SUSPENDED => 6

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_OriginalFileName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cef7d53-fa64-11d1-a203-0000f81fedee}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_OwnerSID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5d76b67f-9b3d-44bb-b6ae-25da4f638a67}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ParentalRating {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 21
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ParentalRatingReason {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{10984e0a-f9f2-4321-b7ef-baf195af4319}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ParentalRatingsOrganization {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a7fe0840-1344-46f0-8d37-52ed712a4bf9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ParsingBindContext {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{dfb9a04d-362f-4ca3-b30b-0254b17b5b84}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ParsingName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ParsingPath {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 30
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PerceivedType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PercentFull {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9b174b35-40ff-11d2-a27e-00c04fc30871}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Priority {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9c1fcf74-2d97-41ba-b4ae-cb2e3661a6e4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PriorityText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d98be98b-b86b-4095-bf52-9d23b2e0a752}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Project {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{39a7f922-477c-48de-8bc8-b28441e342e3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ProviderItemID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f21d9941-81f0-471a-adee-4e74b49217ed}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Rating {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_ONE_STAR_MIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_ONE_STAR_SET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_ONE_STAR_MAX => 12

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_TWO_STARS_MIN => 13

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_TWO_STARS_SET => 25

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_TWO_STARS_MAX => 37

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_THREE_STARS_MIN => 38

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_THREE_STARS_SET => 50

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_THREE_STARS_MAX => 62

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_FOUR_STARS_MIN => 63

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_FOUR_STARS_SET => 75

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_FOUR_STARS_MAX => 87

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_FIVE_STARS_MIN => 88

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_FIVE_STARS_SET => 99

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_FIVE_STARS_MAX => 99

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_RatingText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{90197ca7-fd8f-4e8c-9da3-b57e1e609295}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_RemoteConflictingFile {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 115
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Security_AllowedEnterpriseDataProtectionIdentities {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{38d43380-d418-4830-84d5-46935a81c5c6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 32
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Security_EncryptionOwners {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5f5aff6a-37e5-4780-97ea-80c7565cf535}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 34
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Security_EncryptionOwnersDisplay {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{de621b8f-e125-43a3-a32d-5665446d632a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 25
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Sensitivity {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f8d3f6ac-4874-42cb-be59-ab454b30716a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_SensitivityText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d0c7f054-3f72-4725-8527-129a577cb269}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_SFGAOFlags {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 25
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_SharedWith {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef884c5b-2bfe-41bb-aae5-76eedf4f9902}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 200
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ShareUserRating {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_SharingStatus {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef884c5b-2bfe-41bb-aae5-76eedf4f9902}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 300
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static SHARINGSTATUS_NOTSHARED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SHARINGSTATUS_SHARED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SHARINGSTATUS_PRIVATE => 2

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Shell_OmitFromView {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{de35258c-c695-4cbc-b982-38b0ad24ced0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_SimpleRating {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a09f084e-ad41-489f-8076-aa5be3082bca}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Size {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_SoftwareUsed {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 305
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_SourceItem {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{668cdfa5-7a1b-4323-ae4b-e527393a1d81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_SourcePackageFamilyName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ffae9db7-1c8d-43ff-818c-84403aa3732d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StartDate {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{48fd6ec8-8a12-4cdf-a03e-4ec5a511edde}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Status {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{000214a1-0000-0000-c000-000000000046}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderCallerVersionInformation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderCustomPrimaryIcon {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERCUSTOM_ICON_PHONE => 0

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderError {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 109
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderFileChecksum {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderFileCreatedBy {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderFileDateShared {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderFileFlags {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderFileHasConflict {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderFileIdentifier {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderFileModifiedBy {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderFileRemoteLocation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderFileRemoteUri {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 112
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderFileSharedBy {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderFileVersion {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderFileVersionWaterline {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderFullyQualifiedId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 119
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 108
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderShareStatuses {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 111
            return value
        }
    }

    /**
     * @type {String}
     */
    static STORAGE_PROVIDER_SHARE_STATUS_PRIVATE => "Private"

    /**
     * @type {String}
     */
    static STORAGE_PROVIDER_SHARE_STATUS_SHARED => "Shared"

    /**
     * @type {String}
     */
    static STORAGE_PROVIDER_SHARE_STATUS_PUBLIC => "Public"

    /**
     * @type {String}
     */
    static STORAGE_PROVIDER_SHARE_STATUS_GROUP => "Group"

    /**
     * @type {String}
     */
    static STORAGE_PROVIDER_SHARE_STATUS_OWNER => "Owner"

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderSharingStatus {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 117
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROVIDER_SHARINGSTATUS_NOTSHARED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROVIDER_SHARINGSTATUS_SHARED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROVIDER_SHARINGSTATUS_PRIVATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROVIDER_SHARINGSTATUS_PUBLIC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROVIDER_SHARINGSTATUS_SHARED_OWNED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROVIDER_SHARINGSTATUS_SHARED_COOWNED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROVIDER_SHARINGSTATUS_PUBLIC_OWNED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROVIDER_SHARINGSTATUS_PUBLIC_COOWNED => 7

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderStatus {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 110
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderUserId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b2f9b9d6-fec4-4dd5-94d7-8957488c807b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Subject {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_SyncTransferStatus {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 103
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Thumbnail {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ThumbnailCacheId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{446d16b1-8dad-4870-a748-402ea43d788c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ThumbnailStream {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 27
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Title {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_TitleSortOverride {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f0f7984d-222e-4ad2-82ab-1dd8ea40e57e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 300
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_TotalFileSize {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Trademarks {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cef7d53-fa64-11d1-a203-0000f81fedee}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_TransferOrder {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 106
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_TransferPosition {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 104
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_TransferSize {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fceff153-e839-4cf3-a9e7-ea22832094b8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 105
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_VolumeId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{446d16b1-8dad-4870-a748-402ea43d788c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 104
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ZoneIdentifier {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{502cfeab-47eb-459c-b960-e6d8728f7701}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_PrinterURL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0b48f35a-be6e-4f17-b108-3c4073d1669a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Bluetooth_DeviceAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Bluetooth_Flags {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Bluetooth_LastConnectedTime {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Bluetooth_Manufacturer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Bluetooth_ModelNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Bluetooth_ProductId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Bluetooth_ProductVersion {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Bluetooth_ServiceGuid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Bluetooth_VendorId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Bluetooth_VendorIdSource {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Hid_IsReadOnly {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cbf38310-4a17-4310-a1eb-247f0b67593b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Hid_ProductId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cbf38310-4a17-4310-a1eb-247f0b67593b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Hid_UsageId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cbf38310-4a17-4310-a1eb-247f0b67593b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Hid_UsagePage {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cbf38310-4a17-4310-a1eb-247f0b67593b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Hid_VendorId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cbf38310-4a17-4310-a1eb-247f0b67593b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Hid_VersionNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cbf38310-4a17-4310-a1eb-247f0b67593b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_PrinterDriverDirectory {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{847c66de-b8d6-4af9-abc3-6f4f926bc039}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_PrinterDriverName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{afc47170-14f5-498c-8f30-b0d19be449c6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_PrinterEnumerationFlag {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a00742a1-cd8c-4b37-95ab-70755587767a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_PrinterName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0a7b84ef-0c27-463f-84ef-06c5070001be}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_PrinterPortName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{eec7b761-6f94-41b1-949f-c729720dd13c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Proximity_SupportsNfc {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fb3842cd-9e2a-4f83-8fcc-4b0761139ae9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Serial_PortName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4c6bf15c-4c03-4aac-91f5-64c0f852bcf4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Serial_UsbProductId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4c6bf15c-4c03-4aac-91f5-64c0f852bcf4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Serial_UsbVendorId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4c6bf15c-4c03-4aac-91f5-64c0f852bcf4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_WinUsb_DeviceInterfaceClasses {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{95e127b5-79cc-4e83-9c9e-8422187b3e0e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_WinUsb_UsbClass {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{95e127b5-79cc-4e83-9c9e-8422187b3e0e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_WinUsb_UsbProductId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{95e127b5-79cc-4e83-9c9e-8422187b3e0e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_WinUsb_UsbProtocol {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{95e127b5-79cc-4e83-9c9e-8422187b3e0e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_WinUsb_UsbSubClass {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{95e127b5-79cc-4e83-9c9e-8422187b3e0e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_WinUsb_UsbVendorId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{95e127b5-79cc-4e83-9c9e-8422187b3e0e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_AepId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3b2ce006-5e61-4fde-bab8-9b8aac9b26df}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Bluetooth_Cod_Major {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Bluetooth_Cod_Minor {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Bluetooth_Cod_Services_Audio {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Bluetooth_Cod_Services_Capturing {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Bluetooth_Cod_Services_Information {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Bluetooth_Cod_Services_LimitedDiscovery {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Bluetooth_Cod_Services_Networking {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Bluetooth_Cod_Services_ObjectXfer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Bluetooth_Cod_Services_Positioning {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Bluetooth_Cod_Services_Rendering {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Bluetooth_Cod_Services_Telephony {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5fbd34cd-561a-412e-ba98-478a6b0fef1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Bluetooth_LastSeenTime {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Bluetooth_Le_AddressType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{995ef0b0-7eb3-4a8b-b9ce-068bb3f4af69}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_ADDRESS_TYPE_PUBLIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_ADDRESS_TYPE_RANDOM => 1

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Bluetooth_Le_Appearance {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{995ef0b0-7eb3-4a8b-b9ce-068bb3f4af69}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Bluetooth_Le_Appearance_Category {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{995ef0b0-7eb3-4a8b-b9ce-068bb3f4af69}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Bluetooth_Le_Appearance_Subcategory {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{995ef0b0-7eb3-4a8b-b9ce-068bb3f4af69}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Bluetooth_Le_IsCallControlClient {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{995ef0b0-7eb3-4a8b-b9ce-068bb3f4af69}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Bluetooth_Le_IsConnectable {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{995ef0b0-7eb3-4a8b-b9ce-068bb3f4af69}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_CanPair {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e7c3fb29-caa7-4f47-8c8b-be59b330d4c5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Category {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a35996ab-11cf-4935-8b61-a6761081ecdf}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_ContainerId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e7c3fb29-caa7-4f47-8c8b-be59b330d4c5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_DeviceAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a35996ab-11cf-4935-8b61-a6761081ecdf}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_IsConnected {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a35996ab-11cf-4935-8b61-a6761081ecdf}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_IsPaired {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a35996ab-11cf-4935-8b61-a6761081ecdf}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_IsPresent {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a35996ab-11cf-4935-8b61-a6761081ecdf}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_Manufacturer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a35996ab-11cf-4935-8b61-a6761081ecdf}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_ModelId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a35996ab-11cf-4935-8b61-a6761081ecdf}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_ModelName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a35996ab-11cf-4935-8b61-a6761081ecdf}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_PointOfService_ConnectionTypes {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d4bf61b3-442e-4ada-882d-fa7b70c832d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_ProtocolId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3b2ce006-5e61-4fde-bab8-9b8aac9b26df}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Aep_SignalStrength {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a35996ab-11cf-4935-8b61-a6761081ecdf}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_CanPair {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_Categories {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_Children {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_ContainerId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_DialProtocol_InstalledApplications {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_IsPaired {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_IsPresent {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_Manufacturer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_ModelIds {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_ModelName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_ProtocolIds {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0bba1ede-7566-4f47-90ec-25fc567ced2a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_SupportedUriSchemes {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_SupportsAudio {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_SupportsCapturing {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_SupportsImages {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_SupportsInformation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_SupportsLimitedDiscovery {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_SupportsNetworking {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_SupportsObjectTransfer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_SupportsPositioning {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_SupportsRendering {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_SupportsTelephony {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepContainer_SupportsVideo {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6af55d45-38db-4495-acb0-d4728a3b8314}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepService_AepId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9c141a9-1b4c-4f17-a9d1-f298538cadb8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepService_Bluetooth_CacheMode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9744311e-7951-4b2e-b6f0-ecb293cac119}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_CACHE_MODE_CACHED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_CACHED_MODE_UNCACHED => 1

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepService_Bluetooth_ServiceGuid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a399aac7-c265-474e-b073-ffce57721716}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepService_Bluetooth_TargetDevice {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9744311e-7951-4b2e-b6f0-ecb293cac119}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepService_ContainerId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{71724756-3e74-4432-9b59-e7b2f668a593}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepService_FriendlyName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{71724756-3e74-4432-9b59-e7b2f668a593}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepService_IoT_ServiceInterfaces {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{79d94e82-4d79-45aa-821a-74858b4e4ca6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepService_ParentAepIsPaired {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9c141a9-1b4c-4f17-a9d1-f298538cadb8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepService_ProtocolId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9c141a9-1b4c-4f17-a9d1-f298538cadb8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepService_ServiceClassId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{71724756-3e74-4432-9b59-e7b2f668a593}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AepService_ServiceId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9c141a9-1b4c-4f17-a9d1-f298538cadb8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AppPackageFamilyName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{51236583-0c4a-4fe8-b81f-166aec13f510}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AudioDevice_Microphone_EqCoefficientsDb {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8943b373-388c-4395-b557-bc6dbaffafdb}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AudioDevice_Microphone_IsFarField {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8943b373-388c-4395-b557-bc6dbaffafdb}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AudioDevice_Microphone_SensitivityInDbfs {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8943b373-388c-4395-b557-bc6dbaffafdb}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AudioDevice_Microphone_SensitivityInDbfs2 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8943b373-388c-4395-b557-bc6dbaffafdb}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AudioDevice_Microphone_SignalToNoiseRatioInDb {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8943b373-388c-4395-b557-bc6dbaffafdb}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AudioDevice_RawProcessingSupported {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8943b373-388c-4395-b557-bc6dbaffafdb}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_AudioDevice_SpeechProcessingSupported {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fb1de864-e06d-47f4-82a6-8a0aef44493c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_BatteryLife {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_BatteryPlusCharging {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 22
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_BatteryPlusChargingText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 23
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Category {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 91
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_CategoryGroup {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 94
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_CategoryIds {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 90
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_CategoryPlural {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 92
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_ChallengeAep {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0774315e-b714-48ec-8de8-8125c077ac11}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_ChargingState {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Children {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_ClassGuid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_CompatibleIds {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Connected {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 55
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_ContainerId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8c7ed206-3f8a-4827-b3ab-ae9e1faefc6c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_DefaultTooltip {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{880f70a2-6082-47ac-8aab-a739d1a300c3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 153
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_DeviceCapabilities {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_DeviceCharacteristics {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 29
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_DeviceDescription1 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 81
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_DeviceDescription2 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 82
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_DeviceHasProblem {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_DeviceInstanceId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 256
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_DeviceManufacturer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_DevObjectType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{13673f42-a3d6-49f6-b4da-ae46e0c5237c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_DialProtocol_InstalledApplications {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6845cc72-1b71-48c3-af86-b09171a19b14}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_DiscoveryMethod {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 52
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Dnssd_Domain {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Dnssd_FullName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Dnssd_HostName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Dnssd_InstanceName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Dnssd_NetworkAdapterId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Dnssd_PortNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Dnssd_Priority {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Dnssd_ServiceName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Dnssd_TextAttributes {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Dnssd_Ttl {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Dnssd_Weight {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bf79c0ab-bb74-4cee-b070-470b5ae202ea}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_FriendlyName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12288
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_FunctionPaths {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d08dd4c0-3a9e-462e-8290-7b636b2576b9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_GlyphIcon {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{51236583-0c4a-4fe8-b81f-166aec13f510}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 123
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_HardwareIds {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Icon {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 57
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_InLocalMachineContainer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8c7ed206-3f8a-4827-b3ab-ae9e1faefc6c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_InterfaceClassGuid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{026e516e-b814-414b-83cd-856d6fef4822}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_InterfaceEnabled {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{026e516e-b814-414b-83cd-856d6fef4822}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_InterfacePaths {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d08dd4c0-3a9e-462e-8290-7b636b2576b9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_IpAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12297
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_IsDefault {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 86
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_IsNetworkConnected {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 85
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_IsShared {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 84
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_IsSoftwareInstalling {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{83da6326-97a6-4088-9453-a1923f573b29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_LaunchDeviceStageFromExplorer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 77
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_LocalMachine {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 70
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_LocationPaths {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 37
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Manufacturer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8192
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_MetadataPath {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 71
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_MicrophoneArray_Geometry {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a1829ea2-27eb-459e-935d-b2fad7b07762}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_MissedCalls {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_ModelId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_ModelName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8194
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_ModelNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8195
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_NetworkedTooltip {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{880f70a2-6082-47ac-8aab-a739d1a300c3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 152
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_NetworkName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_NetworkType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_NewPictures {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Notification {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{06704b0c-e830-4c81-9178-91e4e95a80a0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Notifications_LowBattery {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c4c07f2b-8524-4e66-ae3a-a6235f103beb}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Notifications_MissedCall {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6614ef48-4efe-4424-9eda-c79f404edf3e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Notifications_NewMessage {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2be9260a-2012-4742-a555-f41b638b7dcb}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Notifications_NewVoicemail {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{59569556-0a08-4212-95b9-fae2ad6413db}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Notifications_StorageFull {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a0e00ee1-f0c7-4d41-b8e7-26a7bd8d38b0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Notifications_StorageFullLinkText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a0e00ee1-f0c7-4d41-b8e7-26a7bd8d38b0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_NotificationStore {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{06704b0c-e830-4c81-9178-91e4e95a80a0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_NotWorkingProperly {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 83
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Paired {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 56
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Panel_PanelGroup {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8dbc9c86-97a9-4bff-9bc6-bfe95d3e6dad}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Panel_PanelId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8dbc9c86-97a9-4bff-9bc6-bfe95d3e6dad}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Parent {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_PhoneLineTransportDevice_Connected {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{aecf2fe8-1d00-4fee-8a6d-a70d719b772b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_PhysicalDeviceLocation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_PlaybackPositionPercent {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3633de59-6825-4381-a49b-9f6ba13a1471}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_PlaybackState {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3633de59-6825-4381-a49b-9f6ba13a1471}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static PLAYBACKSTATE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PLAYBACKSTATE_STOPPED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PLAYBACKSTATE_PLAYING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PLAYBACKSTATE_TRANSITIONING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PLAYBACKSTATE_PAUSED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PLAYBACKSTATE_RECORDINGPAUSED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PLAYBACKSTATE_RECORDING => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PLAYBACKSTATE_NOMEDIA => 7

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_PlaybackTitle {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3633de59-6825-4381-a49b-9f6ba13a1471}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Present {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_PresentationUrl {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8198
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_PrimaryCategory {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d08dd4c0-3a9e-462e-8290-7b636b2576b9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_RemainingDuration {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3633de59-6825-4381-a49b-9f6ba13a1471}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_RestrictedInterface {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{026e516e-b814-414b-83cd-856d6fef4822}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Roaming {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_SafeRemovalRequired {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{afd97640-86a3-4210-b67c-289c41aabe55}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_SchematicName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{026e516e-b814-414b-83cd-856d6fef4822}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_ServiceAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16384
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_ServiceId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16385
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_SharedTooltip {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{880f70a2-6082-47ac-8aab-a739d1a300c3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 151
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_SignalStrength {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_SmartCards_ReaderKind {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d6b5b883-18bd-4b4d-b2ec-9e38affeda82}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Status {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d08dd4c0-3a9e-462e-8290-7b636b2576b9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 259
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Status1 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d08dd4c0-3a9e-462e-8290-7b636b2576b9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 257
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Status2 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d08dd4c0-3a9e-462e-8290-7b636b2576b9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 258
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_StorageCapacity {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_StorageFreeSpace {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_StorageFreeSpacePercent {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_TextMessages {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Voicemail {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49cd1f76-5626-4b17-a4e8-18b4aa1a2213}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiaDeviceType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6bdd1fc6-810f-11d0-bec7-08002be2092f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFi_InterfaceGuid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1167eb-cbfc-4341-a568-a7c91a68982c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFiDirect_DeviceAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFiDirect_GroupId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFiDirect_InformationElements {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFiDirect_InterfaceAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFiDirect_InterfaceGuid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFiDirect_IsConnected {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFiDirect_IsLegacyDevice {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFiDirect_IsMiracastLcpSupported {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFiDirect_IsVisible {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFiDirect_MiracastVersion {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFiDirect_Services {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFiDirect_SupportedChannelList {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFiDirectServices_AdvertisementId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{31b37743-7c5e-4005-93e6-e953f92b82e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFiDirectServices_RequestServiceInformation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{31b37743-7c5e-4005-93e6-e953f92b82e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFiDirectServices_ServiceAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{31b37743-7c5e-4005-93e6-e953f92b82e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFiDirectServices_ServiceConfigMethods {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{31b37743-7c5e-4005-93e6-e953f92b82e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFiDirectServices_ServiceInformation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{31b37743-7c5e-4005-93e6-e953f92b82e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WiFiDirectServices_ServiceName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{31b37743-7c5e-4005-93e6-e953f92b82e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_WinPhone8CameraFlags {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b7b4d61c-5a64-4187-a52e-b1539f359099}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Devices_Wwan_InterfaceGuid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ff1167eb-cbfc-4341-a568-a7c91a68982c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Storage_Portable {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d1ebee8-0803-4774-9842-b77db50265e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Storage_RemovableMedia {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d1ebee8-0803-4774-9842-b77db50265e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Storage_SystemCritical {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d1ebee8-0803-4774-9842-b77db50265e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_ByteCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_CharacterCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_ClientID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{276d7bb0-5b34-4fb0-aa4b-158ed12a1809}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_Contributor {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f334115e-da1b-4509-9b3d-119504dc7abb}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_DateCreated {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_DatePrinted {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_DateSaved {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_Division {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1e005ee6-bf27-428b-b01c-79676acd2870}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_DocumentID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e08805c8-e395-40df-80d2-54f0d6c43154}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_HiddenSlideCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_LastAuthor {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_LineCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_Manager {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_MultimediaClipCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_NoteCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_PageCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_ParagraphCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_PresentationFormat {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_RevisionNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_Security {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_SlideCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_Template {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_TotalEditingTime {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_Version {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 29
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Document_WordCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DRM_DatePlayExpires {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{aeac19e4-89ae-4508-b9b7-bb867abee2ed}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DRM_DatePlayStarts {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{aeac19e4-89ae-4508-b9b7-bb867abee2ed}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DRM_Description {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{aeac19e4-89ae-4508-b9b7-bb867abee2ed}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DRM_IsDisabled {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{aeac19e4-89ae-4508-b9b7-bb867abee2ed}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DRM_IsProtected {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{aeac19e4-89ae-4508-b9b7-bb867abee2ed}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DRM_PlayCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{aeac19e4-89ae-4508-b9b7-bb867abee2ed}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_Altitude {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{827edb4f-5b73-44a7-891d-fdffabea35ca}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_AltitudeDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78342dcb-e358-4145-ae9a-6bfe4e0f9f51}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_AltitudeNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2dad1eb7-816d-40d3-9ec3-c9773be2aade}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_AltitudeRef {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{46ac629d-75ea-4515-867f-6dc4321c5844}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_AreaInformation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{972e333e-ac7e-49f1-8adf-a70d07a9bcab}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_Date {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3602c812-0f3b-45f0-85ad-603468d69423}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DestBearing {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c66d4b3c-e888-47cc-b99f-9dca3ee34dea}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DestBearingDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7abcf4f8-7c3f-4988-ac91-8d2c2e97eca5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DestBearingNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ba3b1da9-86ee-4b5d-a2a4-a271a429f0cf}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DestBearingRef {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9ab84393-2a0f-4b75-bb22-7279786977cb}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DestDistance {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a93eae04-6804-4f24-ac81-09b266452118}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DestDistanceDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9bc2c99b-ac71-4127-9d1c-2596d0d7dcb7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DestDistanceNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2bda47da-08c6-4fe1-80bc-a72fc517c5d0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DestDistanceRef {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ed4df2d3-8695-450b-856f-f5c1c53acb66}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DestLatitude {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9d1d7cc5-5c39-451c-86b3-928e2d18cc47}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DestLatitudeDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3a372292-7fca-49a7-99d5-e47bb2d4e7ab}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DestLatitudeNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ecf4b6f6-d5a6-433c-bb92-4076650fc890}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DestLatitudeRef {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cea820b9-ce61-4885-a128-005d9087c192}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DestLongitude {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{47a96261-cb4c-4807-8ad3-40b9d9dbc6bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DestLongitudeDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{425d69e5-48ad-4900-8d80-6eb6b8d0ac86}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DestLongitudeNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a3250282-fb6d-48d5-9a89-dbcace75cccf}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DestLongitudeRef {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{182c1ea6-7c1c-4083-ab4b-ac6c9f4ed128}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_Differential {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{aaf4ee25-bd3b-4dd7-bfc4-47f77bb00f6d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DOP {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cf8fb02-1837-42f1-a697-a7017aa289b9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DOPDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a0be94c5-50ba-487b-bd35-0654be8881ed}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_DOPNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{47166b16-364f-4aa0-9f31-e2ab3df449c3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_ImgDirection {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{16473c91-d017-4ed9-ba4d-b6baa55dbcf8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_ImgDirectionDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{10b24595-41a2-4e20-93c2-5761c1395f32}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_ImgDirectionNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{dc5877c7-225f-45f7-bac7-e81334b6130a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_ImgDirectionRef {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a4aaa5b7-1ad0-445f-811a-0f8f6e67f6b5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_Latitude {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8727cfff-4868-4ec6-ad5b-81b98521d1ab}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_LatitudeDecimal {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0f55cde2-4f49-450d-92c1-dcd16301b1b7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_LatitudeDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{16e634ee-2bff-497b-bd8a-4341ad39eeb9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_LatitudeNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7ddaaad1-ccc8-41ae-b750-b2cb8031aea2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_LatitudeRef {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{029c0252-5b86-46c7-aca0-2769ffc8e3d4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_Longitude {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c4c4dbb2-b593-466b-bbda-d03d27d5e43a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_LongitudeDecimal {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4679c1b5-844d-4590-baf5-f322231f1b81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_LongitudeDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{be6e176c-4534-4d2c-ace5-31dedac1606b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_LongitudeNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{02b0f689-a914-4e45-821d-1dda452ed2c4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_LongitudeRef {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{33dcf22b-28d5-464c-8035-1ee9efd25278}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_MapDatum {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ca2dae6-eddc-407d-bef1-773942abfa95}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_MeasureMode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a015ed5d-aaea-4d58-8a86-3c586920ea0b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_ProcessingMethod {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{59d49e61-840f-4aa9-a939-e2099b7f6399}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_Satellites {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{467ee575-1f25-4557-ad4e-b8b58b0d9c15}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_Speed {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{da5d0862-6e76-4e1b-babd-70021bd25494}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_SpeedDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7d122d5a-ae5e-4335-8841-d71e7ce72f53}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_SpeedNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{acc9ce3d-c213-4942-8b48-6d0820f21c6d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_SpeedRef {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ecf7f4c9-544f-4d6d-9d98-8ad79adaf453}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_Status {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{125491f4-818f-46b2-91b5-d537753617b2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_Track {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{76c09943-7c33-49e3-9e7e-cdba872cfada}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_TrackDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c8d1920c-01f6-40c0-ac86-2f3a4ad00770}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_TrackNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{702926f4-44a6-43e1-ae71-45627116893b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_TrackRef {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{35dbe6fe-44c3-4400-aaae-d2c799c407e8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_GPS_VersionID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{22704da4-c6b2-4a99-8e56-f16df8c92599}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_History_VisitCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5cbf2787-48cf-4208-b90e-ee5e5d420294}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Image_BitDepth {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6444048f-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Image_ColorSpace {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 40961
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Image_CompressedBitsPerPixel {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{364b6fa9-37ab-482a-be2b-ae02f60d4318}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Image_CompressedBitsPerPixelDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1f8844e1-24ad-4508-9dfd-5326a415ce02}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Image_CompressedBitsPerPixelNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d21a7148-d32c-4624-8900-277210f79c0f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Image_Compression {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 259
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Image_CompressionText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3f08e66f-2f44-4bb9-a682-ac35d2562322}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Image_Dimensions {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6444048f-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Image_HorizontalResolution {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6444048f-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Image_HorizontalSize {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6444048f-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Image_ImageID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{10dabe05-32aa-4c29-bf1a-63e2d220587f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Image_ResolutionUnit {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{19b51fa6-1f92-4a5c-ab48-7df0abd67444}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Image_VerticalResolution {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6444048f-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Image_VerticalSize {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6444048f-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Journal_Contacts {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{dea7c82c-1d89-4a66-9427-a4e3debabcb1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Journal_EntryType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{95beb1fc-326d-4644-b396-cd3ed90e6ddf}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_LayoutPattern_ContentViewModeForBrowse {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 500
            return value
        }
    }

    /**
     * @type {String}
     */
    static LAYOUTPATTERN_CVMFB_ALPHA => "alpha"

    /**
     * @type {String}
     */
    static LAYOUTPATTERN_CVMFB_BETA => "beta"

    /**
     * @type {String}
     */
    static LAYOUTPATTERN_CVMFB_GAMMA => "gamma"

    /**
     * @type {String}
     */
    static LAYOUTPATTERN_CVMFB_DELTA => "delta"

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_LayoutPattern_ContentViewModeForSearch {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 501
            return value
        }
    }

    /**
     * @type {String}
     */
    static LAYOUTPATTERN_CVMFS_ALPHA => "alpha"

    /**
     * @type {String}
     */
    static LAYOUTPATTERN_CVMFS_BETA => "beta"

    /**
     * @type {String}
     */
    static LAYOUTPATTERN_CVMFS_GAMMA => "gamma"

    /**
     * @type {String}
     */
    static LAYOUTPATTERN_CVMFS_DELTA => "delta"

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_History_SelectionCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1ce0d6bc-536c-4600-b0dd-7e0c66b350d5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_History_TargetUrlHostName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1ce0d6bc-536c-4600-b0dd-7e0c66b350d5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Link_Arguments {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{436f2667-14e2-4feb-b30a-146c53b5b674}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Link_Comment {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b9b4b3fc-2b51-4a42-b5d8-324146afcf25}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Link_DateVisited {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5cbf2787-48cf-4208-b90e-ee5e5d420294}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 23
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Link_Description {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5cbf2787-48cf-4208-b90e-ee5e5d420294}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 21
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Link_FeedItemLocalId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8a2f99f9-3c37-465d-a8d7-69777a246d0c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Link_Status {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b9b4b3fc-2b51-4a42-b5d8-324146afcf25}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {Integer (Int32)}
     */
    static LINK_STATUS_RESOLVED => 1

    /**
     * @type {Integer (Int32)}
     */
    static LINK_STATUS_BROKEN => 2

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Link_TargetExtension {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7a7d76f4-b630-4bd7-95ff-37cc51a975c9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Link_TargetParsingPath {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b9b4b3fc-2b51-4a42-b5d8-324146afcf25}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Link_TargetSFGAOFlags {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b9b4b3fc-2b51-4a42-b5d8-324146afcf25}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Link_TargetUrlHostName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8a2f99f9-3c37-465d-a8d7-69777a246d0c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Link_TargetUrlPath {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8a2f99f9-3c37-465d-a8d7-69777a246d0c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_AuthorUrl {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 32
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_AverageLevel {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{09edd5b6-b301-43c5-9990-d00302effd46}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_ClassPrimaryID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_ClassSecondaryID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_CollectionGroupID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_CollectionID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 25
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_ContentDistributor {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_ContentID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 26
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_CreatorApplication {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 27
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_CreatorApplicationVersion {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 28
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_DateEncoded {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2e4b640d-5019-46d8-8881-55414cc5caa0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_DateReleased {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{de41cc29-6971-4290-b472-f59f2e2f31e2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_DlnaProfileID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cfa31b45-525d-4998-bb44-3f7d81542fa4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_Duration {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440490-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_DVDID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_EncodedBy {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 36
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_EncodingSettings {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 37
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_EpisodeNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_FrameCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6444048f-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_MCDI {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_MetadataContentProvider {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_Producer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 22
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_PromotionUrl {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 33
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_ProtectionType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 38
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_ProviderRating {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 39
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_ProviderStyle {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 40
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_Publisher {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 30
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_SeasonNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 101
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_SeriesName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 42
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_SubscriptionContentId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9aebae7a-9644-487d-a92c-657585ed751a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_SubTitle {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 38
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_ThumbnailLargePath {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 47
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_ThumbnailLargeUri {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 48
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_ThumbnailSmallPath {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 49
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_ThumbnailSmallUri {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 50
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_UniqueFileIdentifier {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 35
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_UserNoAutoInfo {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 41
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_UserWebUrl {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 34
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_Writer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 23
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Media_Year {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_AttachmentContents {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3143bf7c-80a8-4854-8880-e2e40189bdd0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_AttachmentNames {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 21
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_BccAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_BccName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_CcAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_CcName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_ConversationID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{dc8f80bd-af1e-4289-85b6-3dfc1b493992}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_ConversationIndex {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{dc8f80bd-af1e-4289-85b6-3dfc1b493992}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 101
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_DateReceived {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_DateSent {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_Flags {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a82d9ee7-ca67-4312-965e-226bcea85023}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_FromAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_FromName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_HasAttachments {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9c1fcf74-2d97-41ba-b4ae-cb2e3661a6e4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_IsFwdOrReply {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9a9bc088-4f6d-469e-9919-e705412040f9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_MessageClass {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cd9ed458-08ce-418f-a70e-f912c7bb9c5c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 103
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_Participants {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1a9ba605-8e7c-4d11-ad7d-a50ada18ba1b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_ProofInProgress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9098f33c-9a7d-48a8-8de5-2e1227a64e91}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_SenderAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0be1c8e7-1981-4676-ae14-fdd78f05a6e7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_SenderName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0da41cfa-d224-4a18-ae2f-596158db4b3a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_Store {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_ToAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_ToDoFlags {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1f856a9f-6900-4aba-9505-2d5f1b4d66cb}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_ToDoTitle {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bccc8a3c-8cef-42e5-9b1c-c69079398bc7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Message_ToName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3e0584c-b788-4a5a-bb20-7f5a44c9acdd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MsGraph_ActivityType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MsGraph_CompositeId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MsGraph_DateLastShared {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MsGraph_DriveId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MsGraph_GraphFileType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MsGraph_IconUrl {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MsGraph_ItemId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MsGraph_PrimaryActivityActorDisplayName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MsGraph_PrimaryActivityActorUpn {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MsGraph_RecommendationReason {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MsGraph_RecommendationReferenceId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MsGraph_RecommendationResultSourceId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MsGraph_SharedByEmail {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MsGraph_SharedByName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MsGraph_WebAccountId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4f85567e-fff0-4df5-b1d9-98b314ff0729}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_AlbumArtist {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_AlbumArtistSortOverride {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f1fdb4af-f78c-466c-bb05-56e92db0b8ec}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 103
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_AlbumID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_AlbumTitle {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_AlbumTitleSortOverride {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{13eb7ffc-ec89-4346-b19d-ccc6f1784223}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 101
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_Artist {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_ArtistSortOverride {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{deeb2db5-0696-4ce0-94fe-a01f77a45fb5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 102
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_BeatsPerMinute {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 35
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_Composer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_ComposerSortOverride {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00bc20a3-bd48-4085-872c-a88d77f5097e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 105
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_Conductor {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 36
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_ContentGroupDescription {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 33
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_DiscNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6afe7437-9bcd-49c7-80fe-4a5c65fa5874}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 104
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_DisplayArtist {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fd122953-fa93-4ef7-92c3-04c946b2f7c8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_Genre {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_InitialKey {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 34
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_IsCompilation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c449d5cb-9ea4-4809-82e8-af9d59ded6d1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_Lyrics {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_Mood {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 39
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_PartOfSet {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 37
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_Period {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 31
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_SynchronizedLyrics {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6b223b6a-162e-4aa9-b39f-05d678fc6d77}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Music_TrackNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Note_Color {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4776cafa-bce4-4cb1-a23e-265e76d8eb11}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Note_ColorText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{46b4e8de-cdb2-440d-885c-1658eb65b914}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_Aperture {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 37378
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ApertureDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e1a9a38b-6685-46bd-875e-570dc7ad7320}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ApertureNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0337ecec-39fb-4581-a0bd-4c4cc51e9914}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_Brightness {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1a701bf6-478c-4361-83ab-3701bb053c58}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_BrightnessDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6ebe6946-2321-440a-90f0-c043efd32476}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_BrightnessNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9e7d118f-b314-45a0-8cfb-d654b917c9e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_CameraManufacturer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 271
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_CameraModel {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 272
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_CameraSerialNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 273
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_Contrast {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2a785ba9-8d23-4ded-82e6-60a350c86a10}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_CONTRAST_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_CONTRAST_SOFT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_CONTRAST_HARD => 2

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ContrastText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{59dde9f2-5253-40ea-9a8b-479e96c6249a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_DateTaken {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 36867
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_DigitalZoom {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f85bf840-a925-4bc2-b0c4-8e36b598679e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_DigitalZoomDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{745baf0e-e5c1-4cfb-8a1b-d031a0a52393}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_DigitalZoomNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{16cbb924-6500-473b-a5be-f1599bcbe413}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_Event {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18248
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_EXIFVersion {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d35f743a-eb2e-47f2-a286-844132cb1427}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ExposureBias {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 37380
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ExposureBiasDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ab205e50-04b7-461c-a18c-2f233836e627}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ExposureBiasNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{738bf284-1d87-420b-92cf-5834bf6ef9ed}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ExposureIndex {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{967b5af8-995a-46ed-9e11-35b3c5b9782d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ExposureIndexDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{93112f89-c28b-492f-8a9d-4be2062cee8a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ExposureIndexNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cdedcf30-8919-44df-8f4c-4eb2ffdb8d89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ExposureProgram {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 34850
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_EXPOSUREPROGRAM_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_EXPOSUREPROGRAM_MANUAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_EXPOSUREPROGRAM_NORMAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_EXPOSUREPROGRAM_APERTURE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_EXPOSUREPROGRAM_SHUTTER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_EXPOSUREPROGRAM_CREATIVE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_EXPOSUREPROGRAM_ACTION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_EXPOSUREPROGRAM_PORTRAIT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_EXPOSUREPROGRAM_LANDSCAPE => 8

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ExposureProgramText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fec690b7-5f30-4646-ae47-4caafba884a3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ExposureTime {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 33434
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ExposureTimeDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{55e98597-ad16-42e0-b624-21599a199838}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ExposureTimeNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{257e44e2-9031-4323-ac38-85c552871b2e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_Flash {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 37385
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_WITHOUTSTROBE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_WITHSTROBE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_COMPULSORY => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_COMPULSORY_NORETURNLIGHT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_COMPULSORY_RETURNLIGHT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_NONE_COMPULSORY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_NONE_AUTO => 24

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_AUTO => 25

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_AUTO_NORETURNLIGHT => 29

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_AUTO_RETURNLIGHT => 31

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_NOFUNCTION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_REDEYE => 65

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_REDEYE_NORETURNLIGHT => 69

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_REDEYE_RETURNLIGHT => 71

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_COMPULSORY_REDEYE => 73

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_COMPULSORY_REDEYE_NORETURNLIGHT => 77

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_COMPULSORY_REDEYE_RETURNLIGHT => 79

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_AUTO_REDEYE => 89

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_AUTO_REDEYE_NORETURNLIGHT => 93

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_AUTO_REDEYE_RETURNLIGHT => 95

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FlashEnergy {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 41483
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FlashEnergyDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d7b61c70-6323-49cd-a5fc-c84277162c97}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FlashEnergyNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fcad3d3d-0858-400f-aaa3-2f66cce2a6bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FlashManufacturer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{aabaf6c9-e0c5-4719-8585-57b103e584fe}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FlashModel {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fe83bb35-4d1a-42e2-916b-06f3e1af719e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FlashText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6b8b68f6-200b-47ea-8d25-d8050f57339f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 33437
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FNumberDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e92a2496-223b-4463-a4e3-30eabba79d80}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FNumberNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1b97738a-fdfc-462f-9d93-1957e08be90c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FocalLength {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 37386
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FocalLengthDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{305bc615-dca1-44a5-9fd4-10c0ba79412e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FocalLengthInFilm {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a0e74609-b84d-4f49-b860-462bd9971f98}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FocalLengthNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{776b6b3b-1e3d-4b0c-9a0e-8fbaf2a8492a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FocalPlaneXResolution {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cfc08d97-c6f7-4484-89dd-ebef4356fe76}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FocalPlaneXResolutionDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0933f3f5-4786-4f46-a8e8-d64dd37fa521}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FocalPlaneXResolutionNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{dccb10af-b4e2-4b88-95f9-031b4d5ab490}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FocalPlaneYResolution {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4fffe4d0-914f-4ac4-8d6f-c9c61de169b1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FocalPlaneYResolutionDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1d6179a6-a876-4031-b013-3347b2b64dc8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_FocalPlaneYResolutionNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a2e541c5-4440-4ba8-867e-75cfc06828cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_GainControl {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fa304789-00c7-4d80-904a-1e4dcc7265aa}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {Float}
     */
    static PHOTO_GAINCONTROL_NONE => 0

    /**
     * @type {Float}
     */
    static PHOTO_GAINCONTROL_LOWGAINUP => 1

    /**
     * @type {Float}
     */
    static PHOTO_GAINCONTROL_HIGHGAINUP => 2

    /**
     * @type {Float}
     */
    static PHOTO_GAINCONTROL_LOWGAINDOWN => 3

    /**
     * @type {Float}
     */
    static PHOTO_GAINCONTROL_HIGHGAINDOWN => 4

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_GainControlDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{42864dfd-9da4-4f77-bded-4aad7b256735}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_GainControlNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8e8ecf7c-b7b8-4eb8-a63f-0ee715c96f9e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_GainControlText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c06238b2-0bf9-4279-a723-25856715cb9d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ISOSpeed {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 34855
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_LensManufacturer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e6ddcaf7-29c5-4f0a-9a68-d19412ec7090}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_LensModel {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e1277516-2b5f-4869-89b1-2e585bd38b7a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_LightSource {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 37384
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_DAYLIGHT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_FLUORESCENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_TUNGSTEN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_STANDARD_A => 17

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_STANDARD_B => 18

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_STANDARD_C => 19

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_D55 => 20

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_D65 => 21

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_D75 => 22

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_MakerNote {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fa303353-b659-4052-85e9-bcac79549b84}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_MakerNoteOffset {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{813f4124-34e6-4d17-ab3e-6b1f3c2247a1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_MaxAperture {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{08f6d7c2-e3f2-44fc-af1e-5aa5c81a2d3e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_MaxApertureDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c77724d4-601f-46c5-9b89-c53f93bceb77}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_MaxApertureNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c107e191-a459-44c5-9ae6-b952ad4b906d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_MeteringMode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 37383
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_MeteringModeText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f628fd8c-7ba8-465a-a65b-c5aa79263a9e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_Orientation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 274
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_OrientationText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a9ea193c-c511-498a-a06b-58e2776dcc28}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_PeopleNames {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e8309b6e-084c-49b4-b1fc-90a80331b638}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_PhotometricInterpretation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{341796f1-1df9-4b1c-a564-91bdefa43877}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_PhotometricInterpretationText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{821437d6-9eab-4765-a589-3b1cbbd22a61}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ProgramMode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6d217f6d-3f6a-4825-b470-5f03ca2fbe9b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_PROGRAMMODE_NOTDEFINED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_PROGRAMMODE_MANUAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_PROGRAMMODE_NORMAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_PROGRAMMODE_APERTURE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_PROGRAMMODE_SHUTTER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_PROGRAMMODE_CREATIVE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_PROGRAMMODE_ACTION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_PROGRAMMODE_PORTRAIT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_PROGRAMMODE_LANDSCAPE => 8

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ProgramModeText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7fe3aa27-2648-42f3-89b0-454e5cb150c3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_RelatedSoundFile {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{318a6b45-087f-4dc2-b8cc-05359551fc9e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_Saturation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49237325-a95a-4f67-b211-816b2d45d2e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_SATURATION_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_SATURATION_LOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_SATURATION_HIGH => 2

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_SaturationText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{61478c08-b600-4a84-bbe4-e99c45f0a072}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_Sharpness {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fc6976db-8349-4970-ae97-b3c5316a08f0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_SHARPNESS_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_SHARPNESS_SOFT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_SHARPNESS_HARD => 2

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_SharpnessText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{51ec3f47-dd50-421d-8769-334f50424b1e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ShutterSpeed {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 37377
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ShutterSpeedDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e13d8975-81c7-4948-ae3f-37cae11e8ff7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_ShutterSpeedNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{16ea4042-d6f4-4bca-8349-7c78d30fb333}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_SubjectDistance {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 37382
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_SubjectDistanceDenominator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0c840a88-b043-466d-9766-d4b26da3fa77}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_SubjectDistanceNumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8af4961c-f526-43e5-aa81-db768219178d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_TagViewAggregate {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b812f15d-c2d8-4bbf-bacd-79744346113f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_TranscodedForSync {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9a8ebb75-6458-4e82-bacb-35c0095b03bb}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_WhiteBalance {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ee3d3d8a-5381-4cfa-b13b-aaf66b5f4ec9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_WHITEBALANCE_AUTO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_WHITEBALANCE_MANUAL => 1

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Photo_WhiteBalanceText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6336b95e-c7a7-426d-86fd-7ae3d39c84b4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_Advanced {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{900a403b-097b-4b95-8ae2-071fdaeeb118}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_Audio {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2804d469-788f-48aa-8570-71b9c187e138}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_Calendar {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9973d2b5-bfd8-438a-ba94-5349b293181a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_Camera {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{de00de32-547e-4981-ad4b-542f2e9007d8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_Contact {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{df975fd3-250a-4004-858f-34e29a3e37aa}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_Content {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d0dab0ba-368a-4050-a882-6c010fd19a4f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_Description {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8969b275-9475-4e00-a887-ff93b8b41e44}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_FileSystem {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3a7d2c1-80fc-4b40-8f34-30ea111bdc2e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_General {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cc301630-b192-4c22-b372-9f4c6d338e07}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_GPS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f3713ada-90e3-4e11-aae5-fdc17685b9be}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_Image {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e3690a87-0fa8-4a2a-9a9f-fce8827055ac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_Media {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{61872cf7-6b5e-4b4b-ac2d-59da84459248}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_MediaAdvanced {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8859a284-de7e-4642-99ba-d431d044b1ec}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_Message {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7fd7259d-16b4-4135-9f97-7c96ecd2fa9e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_Music {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{68dd6094-7216-40f1-a029-43fe7127043f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_Origin {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2598d2fb-5569-4367-95df-5cd3a177e1a5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_PhotoAdvanced {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cb2bf5a-9ee7-4a86-8222-f01e07fdadaf}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_RecordedTV {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e7b33238-6584-4170-a5c0-ac25efd9da56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropGroup_Video {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bebe0920-7671-4c54-a3eb-49fddfc191ee}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_InfoTipText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropList_ConflictPrompt {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropList_ContentViewModeForBrowse {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropList_ContentViewModeForSearch {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropList_ExtendedTileInfo {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropList_FileOperationPrompt {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropList_FullDetails {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropList_InfoTip {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropList_NonPersonal {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49d1091f-082e-493f-b23f-d2308aa9668c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropList_PreviewDetails {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropList_PreviewTitle {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropList_QuickTip {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropList_TileInfo {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c9944a21-a406-48fe-8225-aec7e24c211b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PropList_XPDetailsPanel {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f2275480-f782-4291-bd94-f13693513aec}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 0
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_RecordedTV_ChannelNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_RecordedTV_Credits {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_RecordedTV_DateContentExpires {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_RecordedTV_EpisodeName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_RecordedTV_IsATSCContent {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_RecordedTV_IsClosedCaptioningAvailable {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_RecordedTV_IsDTVContent {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_RecordedTV_IsHDContent {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_RecordedTV_IsRepeatBroadcast {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_RecordedTV_IsSAP {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_RecordedTV_NetworkAffiliation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2c53c813-fb63-4e22-a1ab-0b331ca1e273}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_RecordedTV_OriginalBroadcastDate {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4684fe97-8765-4842-9c13-f006447b178c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_RecordedTV_ProgramDescription {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_RecordedTV_RecordingTime {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a5477f61-7a82-4eca-9dde-98b69b2479b3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_RecordedTV_StationCallSign {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6d748de2-8d38-4cc3-ac60-f009b057c557}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_RecordedTV_StationName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1b5439e7-eba1-4af8-bdd7-7af1d4549493}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_LocationEmptyString {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{62d2d9ab-8b64-498d-b865-402d4796f865}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_AutoCategory {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 31
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_AutoSummary {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{560c36c0-503a-11cf-baa1-00004c752a9a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_ContainerHash {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bceee283-35df-4d53-826a-f36a3eefc6be}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_Contents {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_EntryID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49691c90-7e17-101a-a91c-08002b2ecda9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_ExtendedProperties {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7b03b546-fa4f-4a52-a2fe-03d5311e5865}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_GatherTime {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0b63e350-9ccc-11d0-bcdb-00805fccce04}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_HitCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49691c90-7e17-101a-a91c-08002b2ecda9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_IsClosedDirectory {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0b63e343-9ccc-11d0-bcdb-00805fccce04}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 23
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_IsFullyContained {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0b63e343-9ccc-11d0-bcdb-00805fccce04}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_MatchKind {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49691c90-7e17-101a-a91c-08002b2ecda9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 29
            return value
        }
    }

    /**
     * @type {Integer (Int32)}
     */
    static MATCH_KIND_LEXICAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static MATCH_KIND_SEMANTIC => 2

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_MatchTags {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49691c90-7e17-101a-a91c-08002b2ecda9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 30
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_OcrContent {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 28
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_QueryFocusedSummary {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{560c36c0-503a-11cf-baa1-00004c752a9a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_QueryFocusedSummaryWithFallback {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{560c36c0-503a-11cf-baa1-00004c752a9a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_QueryPropertyHits {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49691c90-7e17-101a-a91c-08002b2ecda9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 21
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_Rank {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{49691c90-7e17-101a-a91c-08002b2ecda9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_Store {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a06992b3-8caf-4ed7-a547-b259e32ac9fc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_UrlToIndex {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0b63e343-9ccc-11d0-bcdb-00805fccce04}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Search_UrlToIndexWithModificationTime {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0b63e343-9ccc-11d0-bcdb-00805fccce04}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Supplemental_Album {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0c73b141-39d6-4653-a683-cab291eaf95b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Supplemental_AlbumID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0c73b141-39d6-4653-a683-cab291eaf95b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Supplemental_Location {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0c73b141-39d6-4653-a683-cab291eaf95b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Supplemental_Person {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0c73b141-39d6-4653-a683-cab291eaf95b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Supplemental_ResourceId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0c73b141-39d6-4653-a683-cab291eaf95b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Supplemental_Tag {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0c73b141-39d6-4653-a683-cab291eaf95b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ActivityDate {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 23
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ActivityIcon {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_ActivityInfo {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DescriptionID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Home_Grouping {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static HOMEGROUPING_UNSPECIFIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HOMEGROUPING_FREQUENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HOMEGROUPING_PINNED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HOMEGROUPING_RECENT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static HOMEGROUPING_RECOMMENDATIONS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HOMEGROUPING_SHARED => 5

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Home_IsPinned {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Home_ItemFolderPathDisplay {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Home_RecommendationActivityDate {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 22
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Home_RecommendationProviderSource {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5ca9b1cb-c69f-404b-abc6-fd336793a6a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 22
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Home_RecommendationReasonIcon {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 21
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Home_Recommended {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_InternalName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cef7d53-fa64-11d1-a203-0000f81fedee}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_LibraryLocationsCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{908696c7-8f87-44f2-80ed-a8c1c6894575}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Link_TargetSFGAOFlagsStrings {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d6942081-d53b-443d-ad47-5e059d9cd27a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Link_TargetUrl {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5cbf2787-48cf-4208-b90e-ee5e5d420294}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_NamespaceCLSID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Shell_CopilotKeyProviderFastPathMessage {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{38652bca-4329-4e74-86f9-39cf29345eea}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Shell_SFGAOFlagsStrings {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d6942081-d53b-443d-ad47-5e059d9cd27a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {String}
     */
    static SFGAOSTR_FILESYS => "filesys"

    /**
     * @type {String}
     */
    static SFGAOSTR_FILEANC => "fileanc"

    /**
     * @type {String}
     */
    static SFGAOSTR_STORAGEANC => "storageanc"

    /**
     * @type {String}
     */
    static SFGAOSTR_STREAM => "stream"

    /**
     * @type {String}
     */
    static SFGAOSTR_LINK => "link"

    /**
     * @type {String}
     */
    static SFGAOSTR_HIDDEN => "hidden"

    /**
     * @type {String}
     */
    static SFGAOSTR_SUPERHIDDEN => "superhidden"

    /**
     * @type {String}
     */
    static SFGAOSTR_FOLDER => "folder"

    /**
     * @type {String}
     */
    static SFGAOSTR_NONENUM => "nonenum"

    /**
     * @type {String}
     */
    static SFGAOSTR_BROWSABLE => "browsable"

    /**
     * @type {String}
     */
    static SFGAOSTR_SYSTEM => "system"

    /**
     * @type {String}
     */
    static SFGAOSTR_PLACEHOLDER => "placeholder"

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StatusBarSelectedItemCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{26dc287c-6e3d-4bd3-b2b0-6a26ba2e346d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StatusBarViewItemCount {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{26dc287c-6e3d-4bd3-b2b0-6a26ba2e346d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderState {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e77e90df-6271-4f5b-834f-2dd1f245dda4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_SPARSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_IN_SYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_PINNED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_PENDING_UPLOAD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_PENDING_DOWNLOAD => 5

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_TRANSFERRING => 6

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_ERROR => 7

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_WARNING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_EXCLUDED => 9

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_PENDING_UNSPECIFIED => 10

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_StorageProviderTransferProgress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e77e90df-6271-4f5b-834f-2dd1f245dda4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WebAccountID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{30c8eef4-a832-41e2-ab32-e3c3ca28fd29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_AppUserModel_ExcludeFromShowInNewInstall {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_AppUserModel_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_AppUserModel_IsDestListSeparator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_AppUserModel_IsDualMode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_AppUserModel_PreventPinning {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_AppUserModel_RelaunchCommand {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_AppUserModel_RelaunchDisplayNameResource {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_AppUserModel_RelaunchIconResource {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_AppUserModel_SettingsCommand {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 38
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_AppUserModel_StartPinOption {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static APPUSERMODEL_STARTPINOPTION_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static APPUSERMODEL_STARTPINOPTION_NOPINONINSTALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static APPUSERMODEL_STARTPINOPTION_USERPINNED => 2

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_AppUserModel_ToastActivatorCLSID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 26
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_AppUserModel_UninstallCommand {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 37
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_AppUserModel_VisualElementsManifestHintPath {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9f4c2855-9f79-4b39-a8d0-e1d42de1d5f3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 31
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_EdgeGesture_DisableTouchWhenFullscreen {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{32ce38b2-2c9a-41b1-9bc5-b3784394aa44}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Software_DateLastUsed {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{841e4f90-ff59-4d16-8947-e81bbffab36d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Software_ProductName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cef7d53-fa64-11d1-a203-0000f81fedee}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Sync_Comments {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7bd5533e-af15-44db-b8c8-bd6624e1d032}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Sync_ConflictDescription {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ce50c159-2fb8-41fd-be68-d3e042e274bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Sync_ConflictFirstLocation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ce50c159-2fb8-41fd-be68-d3e042e274bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Sync_ConflictSecondLocation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ce50c159-2fb8-41fd-be68-d3e042e274bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Sync_HandlerCollectionID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7bd5533e-af15-44db-b8c8-bd6624e1d032}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Sync_HandlerID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7bd5533e-af15-44db-b8c8-bd6624e1d032}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Sync_HandlerName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ce50c159-2fb8-41fd-be68-d3e042e274bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Sync_HandlerType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7bd5533e-af15-44db-b8c8-bd6624e1d032}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_HANDLERTYPE_OTHER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_HANDLERTYPE_PROGRAMS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_HANDLERTYPE_DEVICES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_HANDLERTYPE_FOLDERS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_HANDLERTYPE_WEBSERVICES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_HANDLERTYPE_COMPUTERS => 5

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Sync_HandlerTypeLabel {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7bd5533e-af15-44db-b8c8-bd6624e1d032}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Sync_ItemID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7bd5533e-af15-44db-b8c8-bd6624e1d032}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Sync_ItemName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ce50c159-2fb8-41fd-be68-d3e042e274bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Sync_ProgressPercentage {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7bd5533e-af15-44db-b8c8-bd6624e1d032}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 23
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Sync_State {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7bd5533e-af15-44db-b8c8-bd6624e1d032}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_STATE_NOTSETUP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_STATE_SYNCNOTRUN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_STATE_IDLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_STATE_ERROR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_STATE_PENDING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_STATE_SYNCING => 5

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Sync_Status {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7bd5533e-af15-44db-b8c8-bd6624e1d032}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Task_BillingInformation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d37d52c6-261c-4303-82b3-08b926ac6f12}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Task_CompletionStatus {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{084d8a0a-e6d5-40de-bf1f-c8820e7c877c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Task_Owner {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{08c7cc5f-60f2-4494-ad75-55e3e0b5add0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Video_Compression {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440491-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Video_Director {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Video_EncodingBitrate {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440491-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Video_FourCC {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440491-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 44
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Video_FrameHeight {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440491-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Video_FrameRate {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440491-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Video_FrameWidth {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440491-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Video_HorizontalAspectRatio {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440491-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 42
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Video_IsSpherical {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440491-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Video_IsStereo {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440491-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 98
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Video_Orientation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440491-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 99
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Video_SampleSize {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440491-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Video_StreamName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440491-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Video_StreamNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440491-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Video_TotalBitrate {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440491-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 43
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Video_TranscodedForSync {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440491-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 46
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Video_VerticalAspectRatio {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64440491-4c8b-11d1-8b70-080036b11a03}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 45
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Volume_FileSystem {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9b174b35-40ff-11d2-a27e-00c04fc30871}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Volume_IsMappedDrive {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{149c0b69-2c2d-48fc-808f-d318d78c4636}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Volume_IsRoot {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9b174b35-40ff-11d2-a27e-00c04fc30871}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static ACT_AUTHORIZE_ON_RESUME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACT_AUTHORIZE_ON_SESSION_UNLOCK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACT_UNAUTHORIZE_ON_SUSPEND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACT_UNAUTHORIZE_ON_SESSION_LOCK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ES_RESERVED_COM_ERROR_START => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ES_RESERVED_COM_ERROR_END => 511

    /**
     * @type {Integer (UInt32)}
     */
    static ES_GENERAL_ERROR_START => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ES_GENERAL_ERROR_END => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static ES_AUTHN_ERROR_START => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ES_AUTHN_ERROR_END => 1279

    /**
     * @type {Integer (UInt32)}
     */
    static ES_RESERVED_SILO_ERROR_START => 1280

    /**
     * @type {Integer (UInt32)}
     */
    static ES_RESERVED_SILO_ERROR_END => 4095

    /**
     * @type {Integer (UInt32)}
     */
    static ES_PW_SILO_ERROR_START => 4352

    /**
     * @type {Integer (UInt32)}
     */
    static ES_PW_SILO_ERROR_END => 4607

    /**
     * @type {Integer (UInt32)}
     */
    static ES_RESERVED_SILO_SPECIFIC_ERROR_START => 4608

    /**
     * @type {Integer (UInt32)}
     */
    static ES_RESERVED_SILO_SPECIFIC_ERROR_END => 49151

    /**
     * @type {Integer (UInt32)}
     */
    static ES_VENDOR_ERROR_START => 49152

    /**
     * @type {Integer (UInt32)}
     */
    static ES_VENDOR_ERROR_END => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_ENHANCED_STORAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_INVALID_RESPONSE => 3221488128

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_UNPROVISIONED_HARDWARE => 3221488132

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_UNSUPPORTED_HARDWARE => 3221488133

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_INCOMPLETE_COMMAND => 3221488134

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_BAD_SEQUENCE => 3221488135

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_NO_PROBE => 3221488136

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_INVALID_SILO => 3221488137

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_INVALID_CAPABILITY => 3221488138

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_GROUP_POLICY_FORBIDDEN_USE => 3221488139

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_GROUP_POLICY_FORBIDDEN_OPERATION => 3221488140

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_INVALID_PARAM_COMBINATION => 3221488141

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_INVALID_PARAM_LENGTH => 3221488142

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_INCONSISTENT_PARAM_LENGTH => 3221488143

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_NO_AUTHENTICATION_REQUIRED => 3221488640

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_INVALID_FIELD_IDENTIFIER => 3221491968

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_CHALLENGE_MISMATCH => 3221491969

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_CHALLENGE_SIZE_MISMATCH => 3221491970

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_FRIENDLY_NAME_TOO_LONG => 3221491971

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_SILO_NAME_TOO_LONG => 3221491972

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_PASSWORD_TOO_LONG => 3221491973

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_PASSWORD_HINT_TOO_LONG => 3221491974

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_OTHER_SECURITY_PROTOCOL_ACTIVE => 3221491975

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_DEVICE_DIGEST_MISSING => 3221491976

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_NOT_AUTHORIZED_UNEXPECTED => 3221491977

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_AUTHORIZED_UNEXPECTED => 3221491978

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_PROVISIONED_UNEXPECTED => 3221491979

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_UNKNOWN_DIGEST_ALGORITHM => 3221491980
;@endregion Constants

;@region Methods
;@endregion Methods
}
