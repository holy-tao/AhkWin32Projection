#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\DEVPROPKEY.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class PortableDevices {

;@region Constants

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_MTPBTH_IsConnected {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{ea1237fa-589d-4472-84e4-0abe36fd62ef}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_WPD => Guid("{6ac27878-a6fa-4155-ba85-f98f491d4f33}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_WPD_PRIVATE => Guid("{ba0c718f-4ded-49b7-bdd3-fabe28661211}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_WPD_SERVICE => Guid("{9ef44f80-3d64-4246-a6aa-206f328d1edc}")

    /**
     * @type {Integer (UInt32)}
     */
    static WPD_CONTROL_FUNCTION_GENERIC_MESSAGE => 66

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_WPD_MESSAGE_READWRITE_ACCESS => 4243720

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_WPD_MESSAGE_READ_ACCESS => 4210952

    /**
     * @type {String}
     */
    static WPD_DEVICE_OBJECT_ID => "DEVICE"

    /**
     * @type {String}
     */
    static PORTABLE_DEVICE_TYPE => "PortableDeviceType"

    /**
     * @type {String}
     */
    static PORTABLE_DEVICE_ICON => "Icons"

    /**
     * @type {String}
     */
    static PORTABLE_DEVICE_NAMESPACE_TIMEOUT => "PortableDeviceNameSpaceTimeout"

    /**
     * @type {String}
     */
    static PORTABLE_DEVICE_NAMESPACE_EXCLUDE_FROM_SHELL => "PortableDeviceNameSpaceExcludeFromShell"

    /**
     * @type {String}
     */
    static PORTABLE_DEVICE_NAMESPACE_THUMBNAIL_CONTENT_TYPES => "PortableDeviceNameSpaceThumbnailContentTypes"

    /**
     * @type {String}
     */
    static PORTABLE_DEVICE_IS_MASS_STORAGE => "PortableDeviceIsMassStorage"

    /**
     * @type {String}
     */
    static PORTABLE_DEVICE_DRM_SCHEME_WMDRM10_PD => "WMDRM10-PD"

    /**
     * @type {String}
     */
    static PORTABLE_DEVICE_DRM_SCHEME_PDDRM => "PDDRM"

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WPD => 42

    /**
     * @type {Integer (Int32)}
     */
    static E_WPD_DEVICE_ALREADY_OPENED => -2144731135

    /**
     * @type {Integer (Int32)}
     */
    static E_WPD_DEVICE_NOT_OPEN => -2144731134

    /**
     * @type {Integer (Int32)}
     */
    static E_WPD_OBJECT_ALREADY_ATTACHED_TO_DEVICE => -2144731133

    /**
     * @type {Integer (Int32)}
     */
    static E_WPD_OBJECT_NOT_ATTACHED_TO_DEVICE => -2144731132

    /**
     * @type {Integer (Int32)}
     */
    static E_WPD_OBJECT_NOT_COMMITED => -2144731131

    /**
     * @type {Integer (Int32)}
     */
    static E_WPD_DEVICE_IS_HUNG => -2144731130

    /**
     * @type {Integer (Int32)}
     */
    static E_WPD_SMS_INVALID_RECIPIENT => -2144731036

    /**
     * @type {Integer (Int32)}
     */
    static E_WPD_SMS_INVALID_MESSAGE_BODY => -2144731035

    /**
     * @type {Integer (Int32)}
     */
    static E_WPD_SMS_SERVICE_UNAVAILABLE => -2144731034

    /**
     * @type {Integer (Int32)}
     */
    static E_WPD_SERVICE_ALREADY_OPENED => -2144730936

    /**
     * @type {Integer (Int32)}
     */
    static E_WPD_SERVICE_NOT_OPEN => -2144730935

    /**
     * @type {Integer (Int32)}
     */
    static E_WPD_OBJECT_ALREADY_ATTACHED_TO_SERVICE => -2144730934

    /**
     * @type {Integer (Int32)}
     */
    static E_WPD_OBJECT_NOT_ATTACHED_TO_SERVICE => -2144730933

    /**
     * @type {Integer (Int32)}
     */
    static E_WPD_SERVICE_BAD_PARAMETER_ORDER => -2144730932

    /**
     * @type {Guid}
     */
    static WPD_EVENT_NOTIFICATION => Guid("{2ba2e40a-6b4c-4295-bb43-26322b99aeb2}")

    /**
     * @type {Guid}
     */
    static WPD_EVENT_OBJECT_ADDED => Guid("{a726da95-e207-4b02-8d44-bef2e86cbffc}")

    /**
     * @type {Guid}
     */
    static WPD_EVENT_OBJECT_REMOVED => Guid("{be82ab88-a52c-4823-96e5-d0272671fc38}")

    /**
     * @type {Guid}
     */
    static WPD_EVENT_OBJECT_UPDATED => Guid("{1445a759-2e01-485d-9f27-ff07dae697ab}")

    /**
     * @type {Guid}
     */
    static WPD_EVENT_DEVICE_RESET => Guid("{7755cf53-c1ed-44f3-b5a2-451e2c376b27}")

    /**
     * @type {Guid}
     */
    static WPD_EVENT_DEVICE_CAPABILITIES_UPDATED => Guid("{36885aa1-cd54-4daa-b3d0-afb3e03f5999}")

    /**
     * @type {Guid}
     */
    static WPD_EVENT_STORAGE_FORMAT => Guid("{3782616b-22bc-4474-a251-3070f8d38857}")

    /**
     * @type {Guid}
     */
    static WPD_EVENT_OBJECT_TRANSFER_REQUESTED => Guid("{8d16a0a1-f2c6-41da-8f19-5e53721adbf2}")

    /**
     * @type {Guid}
     */
    static WPD_EVENT_DEVICE_REMOVED => Guid("{e4cbca1b-6918-48b9-85ee-02be7c850af9}")

    /**
     * @type {Guid}
     */
    static WPD_EVENT_SERVICE_METHOD_COMPLETE => Guid("{8a33f5f8-0acc-4d9b-9cc4-112d353b86ca}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_FUNCTIONAL_OBJECT => Guid("{99ed0160-17ff-4c44-9d98-1d7a6f941921}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_FOLDER => Guid("{27e2e392-a111-48e0-ab0c-e17705a05f85}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_IMAGE => Guid("{ef2107d5-a52a-4243-a26b-62d4176d7603}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_DOCUMENT => Guid("{680adf52-950a-4041-9b41-65e393648155}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_CONTACT => Guid("{eaba8313-4525-4707-9f0e-87c6808e9435}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_CONTACT_GROUP => Guid("{346b8932-4c36-40d8-9415-1828291f9de9}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_AUDIO => Guid("{4ad2c85e-5e2d-45e5-8864-4f229e3c6cf0}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_VIDEO => Guid("{9261b03c-3d78-4519-85e3-02c5e1f50bb9}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_TELEVISION => Guid("{60a169cf-f2ae-4e21-9375-9677f11c1c6e}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_PLAYLIST => Guid("{1a33f7e4-af13-48f5-994e-77369dfe04a3}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_MIXED_CONTENT_ALBUM => Guid("{00f0c3ac-a593-49ac-9219-24abca5a2563}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_AUDIO_ALBUM => Guid("{aa18737e-5009-48fa-ae21-85f24383b4e6}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_IMAGE_ALBUM => Guid("{75793148-15f5-4a30-a813-54ed8a37e226}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_VIDEO_ALBUM => Guid("{012b0db7-d4c1-45d6-b081-94b87779614f}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_MEMO => Guid("{9cd20ecf-3b50-414f-a641-e473ffe45751}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_EMAIL => Guid("{8038044a-7e51-4f8f-883d-1d0623d14533}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_APPOINTMENT => Guid("{0fed060e-8793-4b1e-90c9-48ac389ac631}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_TASK => Guid("{63252f2c-887f-4cb6-b1ac-d29855dcef6c}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_PROGRAM => Guid("{d269f96a-247c-4bff-98fb-97f3c49220e6}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_GENERIC_FILE => Guid("{0085e0a6-8d34-45d7-bc5c-447e59c73d48}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_CALENDAR => Guid("{a1fd5967-6023-49a0-9df1-f8060be751b0}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_GENERIC_MESSAGE => Guid("{e80eaaf8-b2db-4133-b67e-1bef4b4a6e5f}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_NETWORK_ASSOCIATION => Guid("{031da7ee-18c8-4205-847e-89a11261d0f3}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_CERTIFICATE => Guid("{dc3876e8-a948-4060-9050-cbd77e8a3d87}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_WIRELESS_PROFILE => Guid("{0bac070a-9f5f-4da4-a8f6-3de44d68fd6c}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_MEDIA_CAST => Guid("{5e88b3cc-3e65-4e62-bfff-229495253ab0}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_SECTION => Guid("{821089f5-1d91-4dc9-be3c-bbb1b35b18ce}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_UNSPECIFIED => Guid("{28d8d31e-249c-454e-aabc-34883168e634}")

    /**
     * @type {Guid}
     */
    static WPD_CONTENT_TYPE_ALL => Guid("{80e170d2-1055-4a3e-b952-82cc4f8a8689}")

    /**
     * @type {Guid}
     */
    static WPD_FUNCTIONAL_CATEGORY_DEVICE => Guid("{08ea466b-e3a4-4336-a1f3-a44d2b5c438c}")

    /**
     * @type {Guid}
     */
    static WPD_FUNCTIONAL_CATEGORY_STORAGE => Guid("{23f05bbc-15de-4c2a-a55b-a9af5ce412ef}")

    /**
     * @type {Guid}
     */
    static WPD_FUNCTIONAL_CATEGORY_STILL_IMAGE_CAPTURE => Guid("{613ca327-ab93-4900-b4fa-895bb5874b79}")

    /**
     * @type {Guid}
     */
    static WPD_FUNCTIONAL_CATEGORY_AUDIO_CAPTURE => Guid("{3f2a1919-c7c2-4a00-855d-f57cf06debbb}")

    /**
     * @type {Guid}
     */
    static WPD_FUNCTIONAL_CATEGORY_VIDEO_CAPTURE => Guid("{e23e5f6b-7243-43aa-8df1-0eb3d968a918}")

    /**
     * @type {Guid}
     */
    static WPD_FUNCTIONAL_CATEGORY_SMS => Guid("{0044a0b1-c1e9-4afd-b358-a62c6117c9cf}")

    /**
     * @type {Guid}
     */
    static WPD_FUNCTIONAL_CATEGORY_RENDERING_INFORMATION => Guid("{08600ba4-a7ba-4a01-ab0e-0065d0a356d3}")

    /**
     * @type {Guid}
     */
    static WPD_FUNCTIONAL_CATEGORY_NETWORK_CONFIGURATION => Guid("{48f4db72-7c6a-4ab0-9e1a-470e3cdbf26a}")

    /**
     * @type {Guid}
     */
    static WPD_FUNCTIONAL_CATEGORY_ALL => Guid("{2d8a6512-a74c-448e-ba8a-f4ac07c49399}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_ICON => Guid("{077232ed-102c-4638-9c22-83f142bfc822}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_M4A => Guid("{30aba7ac-6ffd-4c23-a359-3e9b52f3f1c8}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_NETWORK_ASSOCIATION => Guid("{b1020000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_X509V3CERTIFICATE => Guid("{b1030000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_MICROSOFT_WFC => Guid("{b1040000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_3GPA => Guid("{e5172730-f971-41ef-a10b-2271a0019d7a}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_3G2A => Guid("{1a11202d-8759-4e34-ba5e-b1211087eee4}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_ALL => Guid("{c1f62eb2-4bb3-479c-9cfa-05b5f3a57b22}")

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_NULL => Guid("{00000000-0000-0000-0000-000000000000}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_NULL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{00000000-0000-0000-0000-000000000000}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 0
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_PROPERTIES_V1 => Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_CONTENT_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_REFERENCES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_CONTAINER_FUNCTIONAL_OBJECT_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 23
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_GENERATE_THUMBNAIL_FROM_RESOURCE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_HINT_LOCATION_DISPLAY_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 25
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_PROPERTIES_V2 => Guid("{0373cd3d-4a46-40d7-b4d8-73e8da74e775}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_SUPPORTED_UNITS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0373cd3d-4a46-40d7-b4d8-73e8da74e775}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_FUNCTIONAL_OBJECT_PROPERTIES_V1 => Guid("{8f052d93-abca-4fc5-a5ac-b01df4dbe598}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_FUNCTIONAL_OBJECT_CATEGORY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8f052d93-abca-4fc5-a5ac-b01df4dbe598}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_STORAGE_OBJECT_PROPERTIES_V1 => Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STORAGE_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STORAGE_FILE_SYSTEM_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STORAGE_CAPACITY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STORAGE_FREE_SPACE_IN_BYTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STORAGE_FREE_SPACE_IN_OBJECTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STORAGE_DESCRIPTION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STORAGE_SERIAL_NUMBER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STORAGE_MAX_OBJECT_SIZE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STORAGE_CAPACITY_IN_OBJECTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STORAGE_ACCESS_CAPABILITY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_NETWORK_ASSOCIATION_PROPERTIES_V1 => Guid("{e4c93c1f-b203-43f1-a100-5a07d11b0274}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_NETWORK_ASSOCIATION_HOST_NETWORK_IDENTIFIERS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e4c93c1f-b203-43f1-a100-5a07d11b0274}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_NETWORK_ASSOCIATION_X509V3SEQUENCE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e4c93c1f-b203-43f1-a100-5a07d11b0274}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_STILL_IMAGE_CAPTURE_OBJECT_PROPERTIES_V1 => Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_CAPTURE_RESOLUTION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_CAPTURE_FORMAT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_COMPRESSION_SETTING {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_WHITE_BALANCE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_RGB_GAIN {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_FNUMBER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_FOCAL_LENGTH {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_FOCUS_DISTANCE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_FOCUS_MODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_EXPOSURE_METERING_MODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_FLASH_MODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_EXPOSURE_TIME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_EXPOSURE_PROGRAM_MODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_EXPOSURE_INDEX {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_EXPOSURE_BIAS_COMPENSATION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_CAPTURE_DELAY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_CAPTURE_MODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_CONTRAST {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_SHARPNESS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_DIGITAL_ZOOM {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 21
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_EFFECT_MODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 22
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_BURST_NUMBER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 23
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_BURST_INTERVAL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_TIMELAPSE_NUMBER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 25
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_TIMELAPSE_INTERVAL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 26
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_FOCUS_METERING_MODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 27
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_UPLOAD_URL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 28
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_ARTIST {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 29
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_CAMERA_MODEL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 30
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_STILL_IMAGE_CAMERA_MANUFACTURER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 31
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_RENDERING_INFORMATION_OBJECT_PROPERTIES_V1 => Guid("{c53d039f-ee23-4a31-8590-7639879870b4}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RENDERING_INFORMATION_PROFILES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c53d039f-ee23-4a31-8590-7639879870b4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c53d039f-ee23-4a31-8590-7639879870b4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RENDERING_INFORMATION_PROFILE_ENTRY_CREATABLE_RESOURCES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c53d039f-ee23-4a31-8590-7639879870b4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CLIENT_INFORMATION_PROPERTIES_V1 => Guid("{204d9f0c-2292-4080-9f42-40664e70f859}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLIENT_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{204d9f0c-2292-4080-9f42-40664e70f859}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLIENT_MAJOR_VERSION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{204d9f0c-2292-4080-9f42-40664e70f859}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLIENT_MINOR_VERSION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{204d9f0c-2292-4080-9f42-40664e70f859}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLIENT_REVISION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{204d9f0c-2292-4080-9f42-40664e70f859}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLIENT_WMDRM_APPLICATION_PRIVATE_KEY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{204d9f0c-2292-4080-9f42-40664e70f859}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLIENT_WMDRM_APPLICATION_CERTIFICATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{204d9f0c-2292-4080-9f42-40664e70f859}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLIENT_SECURITY_QUALITY_OF_SERVICE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{204d9f0c-2292-4080-9f42-40664e70f859}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLIENT_DESIRED_ACCESS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{204d9f0c-2292-4080-9f42-40664e70f859}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLIENT_SHARE_MODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{204d9f0c-2292-4080-9f42-40664e70f859}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLIENT_EVENT_COOKIE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{204d9f0c-2292-4080-9f42-40664e70f859}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLIENT_MINIMUM_RESULTS_BUFFER_SIZE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{204d9f0c-2292-4080-9f42-40664e70f859}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLIENT_MANUAL_CLOSE_ON_DISCONNECT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{204d9f0c-2292-4080-9f42-40664e70f859}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_PROPERTY_ATTRIBUTES_V1 => Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_ATTRIBUTE_FORM {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_ATTRIBUTE_CAN_READ {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_ATTRIBUTE_CAN_WRITE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_ATTRIBUTE_CAN_DELETE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_ATTRIBUTE_DEFAULT_VALUE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_ATTRIBUTE_FAST_PROPERTY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_ATTRIBUTE_RANGE_MIN {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_ATTRIBUTE_RANGE_MAX {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_ATTRIBUTE_RANGE_STEP {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_ATTRIBUTE_ENUMERATION_ELEMENTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_ATTRIBUTE_REGULAR_EXPRESSION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_ATTRIBUTE_MAX_SIZE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_PROPERTY_ATTRIBUTES_V2 => Guid("{5d9da160-74ae-43cc-85a9-fe555a80798e}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_ATTRIBUTE_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5d9da160-74ae-43cc-85a9-fe555a80798e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_ATTRIBUTE_VARTYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5d9da160-74ae-43cc-85a9-fe555a80798e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CLASS_EXTENSION_OPTIONS_V1 => Guid("{6309ffef-a87c-4ca7-8434-797576e40a96}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLASS_EXTENSION_OPTIONS_SUPPORTED_CONTENT_TYPES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6309ffef-a87c-4ca7-8434-797576e40a96}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLASS_EXTENSION_OPTIONS_DONT_REGISTER_WPD_DEVICE_INTERFACE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6309ffef-a87c-4ca7-8434-797576e40a96}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLASS_EXTENSION_OPTIONS_REGISTER_WPD_PRIVATE_DEVICE_INTERFACE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6309ffef-a87c-4ca7-8434-797576e40a96}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CLASS_EXTENSION_OPTIONS_V2 => Guid("{3e3595da-4d71-49fe-a0b4-d4406c3ae93f}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLASS_EXTENSION_OPTIONS_MULTITRANSPORT_MODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3e3595da-4d71-49fe-a0b4-d4406c3ae93f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLASS_EXTENSION_OPTIONS_DEVICE_IDENTIFICATION_VALUES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3e3595da-4d71-49fe-a0b4-d4406c3ae93f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLASS_EXTENSION_OPTIONS_TRANSPORT_BANDWIDTH {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3e3595da-4d71-49fe-a0b4-d4406c3ae93f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CLASS_EXTENSION_OPTIONS_V3 => Guid("{65c160f8-1367-4ce2-939d-8310839f0d30}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CLASS_EXTENSION_OPTIONS_SILENCE_AUTOPLAY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{65c160f8-1367-4ce2-939d-8310839f0d30}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_RESOURCE_ATTRIBUTES_V1 => Guid("{1eb6f604-9278-429f-93cc-5bb8c06656b6}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RESOURCE_ATTRIBUTE_TOTAL_SIZE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1eb6f604-9278-429f-93cc-5bb8c06656b6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RESOURCE_ATTRIBUTE_CAN_READ {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1eb6f604-9278-429f-93cc-5bb8c06656b6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RESOURCE_ATTRIBUTE_CAN_WRITE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1eb6f604-9278-429f-93cc-5bb8c06656b6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RESOURCE_ATTRIBUTE_CAN_DELETE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1eb6f604-9278-429f-93cc-5bb8c06656b6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RESOURCE_ATTRIBUTE_OPTIMAL_READ_BUFFER_SIZE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1eb6f604-9278-429f-93cc-5bb8c06656b6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RESOURCE_ATTRIBUTE_OPTIMAL_WRITE_BUFFER_SIZE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1eb6f604-9278-429f-93cc-5bb8c06656b6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RESOURCE_ATTRIBUTE_FORMAT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1eb6f604-9278-429f-93cc-5bb8c06656b6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RESOURCE_ATTRIBUTE_RESOURCE_KEY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1eb6f604-9278-429f-93cc-5bb8c06656b6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_DEVICE_PROPERTIES_V1 => Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_SYNC_PARTNER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_FIRMWARE_VERSION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_POWER_LEVEL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_POWER_SOURCE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_PROTOCOL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_MANUFACTURER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_MODEL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_SERIAL_NUMBER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_SUPPORTS_NON_CONSUMABLE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_DATETIME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_FRIENDLY_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_SUPPORTED_DRM_SCHEMES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_SUPPORTED_FORMATS_ARE_ORDERED {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_NETWORK_IDENTIFIER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_DEVICE_PROPERTIES_V2 => Guid("{463dd662-7fc4-4291-911c-7f4c9cca9799}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_FUNCTIONAL_UNIQUE_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{463dd662-7fc4-4291-911c-7f4c9cca9799}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_MODEL_UNIQUE_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{463dd662-7fc4-4291-911c-7f4c9cca9799}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_TRANSPORT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{463dd662-7fc4-4291-911c-7f4c9cca9799}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_USE_DEVICE_STAGE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{463dd662-7fc4-4291-911c-7f4c9cca9799}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_DEVICE_PROPERTIES_V3 => Guid("{6c2b878c-c2ec-490d-b425-d7a75e23e5ed}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_DEVICE_EDP_IDENTITY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{6c2b878c-c2ec-490d-b425-d7a75e23e5ed}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_SERVICE_PROPERTIES_V1 => Guid("{7510698a-cb54-481c-b8db-0d75c93f1c06}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_SERVICE_VERSION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7510698a-cb54-481c-b8db-0d75c93f1c06}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_EVENT_PROPERTIES_V1 => Guid("{15ab1953-f817-4fef-a921-5676e838f6e0}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EVENT_PARAMETER_PNP_DEVICE_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{15ab1953-f817-4fef-a921-5676e838f6e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EVENT_PARAMETER_EVENT_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{15ab1953-f817-4fef-a921-5676e838f6e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EVENT_PARAMETER_OPERATION_STATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{15ab1953-f817-4fef-a921-5676e838f6e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EVENT_PARAMETER_OPERATION_PROGRESS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{15ab1953-f817-4fef-a921-5676e838f6e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EVENT_PARAMETER_OBJECT_PARENT_PERSISTENT_UNIQUE_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{15ab1953-f817-4fef-a921-5676e838f6e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EVENT_PARAMETER_OBJECT_CREATION_COOKIE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{15ab1953-f817-4fef-a921-5676e838f6e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EVENT_PARAMETER_CHILD_HIERARCHY_CHANGED {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{15ab1953-f817-4fef-a921-5676e838f6e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_EVENT_PROPERTIES_V2 => Guid("{52807b8a-4914-4323-9b9a-74f654b2b846}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EVENT_PARAMETER_SERVICE_METHOD_CONTEXT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{52807b8a-4914-4323-9b9a-74f654b2b846}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_EVENT_OPTIONS_V1 => Guid("{b3d8dad7-a361-4b83-8a48-5b02ce10713b}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EVENT_OPTION_IS_BROADCAST_EVENT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3d8dad7-a361-4b83-8a48-5b02ce10713b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EVENT_OPTION_IS_AUTOPLAY_EVENT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3d8dad7-a361-4b83-8a48-5b02ce10713b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_EVENT_ATTRIBUTES_V1 => Guid("{10c96578-2e81-4111-adde-e08ca6138f6d}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EVENT_ATTRIBUTE_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{10c96578-2e81-4111-adde-e08ca6138f6d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EVENT_ATTRIBUTE_PARAMETERS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{10c96578-2e81-4111-adde-e08ca6138f6d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EVENT_ATTRIBUTE_OPTIONS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{10c96578-2e81-4111-adde-e08ca6138f6d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_API_OPTIONS_V1 => Guid("{10e54a3e-052d-4777-a13c-de7614be2bc4}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_API_OPTION_USE_CLEAR_DATA_STREAM {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{10e54a3e-052d-4777-a13c-de7614be2bc4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_API_OPTION_IOCTL_ACCESS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{10e54a3e-052d-4777-a13c-de7614be2bc4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_FORMAT_ATTRIBUTES_V1 => Guid("{a0a02000-bcaf-4be8-b3f5-233f231cf58f}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_FORMAT_ATTRIBUTE_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a0a02000-bcaf-4be8-b3f5-233f231cf58f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_FORMAT_ATTRIBUTE_MIMETYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a0a02000-bcaf-4be8-b3f5-233f231cf58f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_METHOD_ATTRIBUTES_V1 => Guid("{f17a5071-f039-44af-8efe-432cf32e432a}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_METHOD_ATTRIBUTE_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f17a5071-f039-44af-8efe-432cf32e432a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_METHOD_ATTRIBUTE_ASSOCIATED_FORMAT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f17a5071-f039-44af-8efe-432cf32e432a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_METHOD_ATTRIBUTE_ACCESS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f17a5071-f039-44af-8efe-432cf32e432a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_METHOD_ATTRIBUTE_PARAMETERS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f17a5071-f039-44af-8efe-432cf32e432a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_PARAMETER_ATTRIBUTES_V1 => Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PARAMETER_ATTRIBUTE_ORDER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PARAMETER_ATTRIBUTE_USAGE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PARAMETER_ATTRIBUTE_FORM {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PARAMETER_ATTRIBUTE_DEFAULT_VALUE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PARAMETER_ATTRIBUTE_RANGE_MIN {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PARAMETER_ATTRIBUTE_RANGE_MAX {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PARAMETER_ATTRIBUTE_RANGE_STEP {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PARAMETER_ATTRIBUTE_ENUMERATION_ELEMENTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PARAMETER_ATTRIBUTE_REGULAR_EXPRESSION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PARAMETER_ATTRIBUTE_MAX_SIZE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PARAMETER_ATTRIBUTE_VARTYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PARAMETER_ATTRIBUTE_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_COMMON => Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_COMMON_RESET_DEVICE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_COMMON_GET_OBJECT_IDS_FROM_PERSISTENT_UNIQUE_IDS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_COMMON_SAVE_CLIENT_INFORMATION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_COMMON_COMMAND_CATEGORY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_COMMON_COMMAND_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1002
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_COMMON_HRESULT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1003
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_COMMON_DRIVER_ERROR_CODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1004
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_COMMON_COMMAND_TARGET {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1006
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_COMMON_PERSISTENT_UNIQUE_IDS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1007
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_COMMON_OBJECT_IDS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1008
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_COMMON_CLIENT_INFORMATION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1009
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_COMMON_CLIENT_INFORMATION_CONTEXT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1010
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_COMMON_ACTIVITY_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1011
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OPTION_VALID_OBJECT_IDS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5001
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_OBJECT_ENUMERATION => Guid("{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_ENUMERATION_START_FIND {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_ENUMERATION_FIND_NEXT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_ENUMERATION_END_FIND {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_ENUMERATION_PARENT_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_ENUMERATION_FILTER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1002
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_ENUMERATION_OBJECT_IDS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1003
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_ENUMERATION_CONTEXT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1004
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_ENUMERATION_NUM_OBJECTS_REQUESTED {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1005
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_OBJECT_PROPERTIES => Guid("{9e5582e4-0814-44e6-981a-b2998d583804}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_PROPERTIES_GET_SUPPORTED {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9e5582e4-0814-44e6-981a-b2998d583804}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_PROPERTIES_GET_ATTRIBUTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9e5582e4-0814-44e6-981a-b2998d583804}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_PROPERTIES_GET {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9e5582e4-0814-44e6-981a-b2998d583804}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_PROPERTIES_SET {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9e5582e4-0814-44e6-981a-b2998d583804}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_PROPERTIES_GET_ALL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9e5582e4-0814-44e6-981a-b2998d583804}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_PROPERTIES_DELETE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9e5582e4-0814-44e6-981a-b2998d583804}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_PROPERTIES_OBJECT_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9e5582e4-0814-44e6-981a-b2998d583804}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_KEYS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9e5582e4-0814-44e6-981a-b2998d583804}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1002
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_ATTRIBUTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9e5582e4-0814-44e6-981a-b2998d583804}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1003
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_VALUES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9e5582e4-0814-44e6-981a-b2998d583804}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1004
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_WRITE_RESULTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9e5582e4-0814-44e6-981a-b2998d583804}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1005
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_DELETE_RESULTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{9e5582e4-0814-44e6-981a-b2998d583804}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1006
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_OBJECT_PROPERTIES_BULK => Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_LIST_START {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_LIST_NEXT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_LIST_END {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_FORMAT_START {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_FORMAT_NEXT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_FORMAT_END {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_PROPERTIES_BULK_SET_VALUES_BY_OBJECT_LIST_START {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_PROPERTIES_BULK_SET_VALUES_BY_OBJECT_LIST_NEXT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_PROPERTIES_BULK_SET_VALUES_BY_OBJECT_LIST_END {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_PROPERTIES_BULK_OBJECT_IDS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_PROPERTIES_BULK_CONTEXT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1002
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_PROPERTIES_BULK_VALUES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1003
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_PROPERTIES_BULK_PROPERTY_KEYS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1004
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_PROPERTIES_BULK_DEPTH {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1005
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_PROPERTIES_BULK_PARENT_OBJECT_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1006
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_PROPERTIES_BULK_OBJECT_FORMAT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1007
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_PROPERTIES_BULK_WRITE_RESULTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1008
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_OBJECT_RESOURCES => Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_RESOURCES_GET_SUPPORTED {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_RESOURCES_GET_ATTRIBUTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_RESOURCES_OPEN {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_RESOURCES_READ {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_RESOURCES_WRITE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_RESOURCES_CLOSE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_RESOURCES_DELETE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_RESOURCES_CREATE_RESOURCE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_RESOURCES_REVERT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_RESOURCES_SEEK {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_RESOURCES_COMMIT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_RESOURCES_SEEK_IN_UNITS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_RESOURCES_OBJECT_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_RESOURCES_ACCESS_MODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1002
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_RESOURCES_RESOURCE_KEYS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1003
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_RESOURCES_RESOURCE_ATTRIBUTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1004
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_RESOURCES_CONTEXT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1005
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_TO_READ {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1006
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_READ {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1007
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_TO_WRITE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1008
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_WRITTEN {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1009
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_RESOURCES_DATA {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1010
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_RESOURCES_OPTIMAL_TRANSFER_BUFFER_SIZE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1011
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_RESOURCES_SEEK_OFFSET {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1012
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_RESOURCES_SEEK_ORIGIN_FLAG {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1013
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_RESOURCES_POSITION_FROM_START {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1014
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_RESOURCES_SUPPORTS_UNITS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1015
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_RESOURCES_STREAM_UNITS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1016
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OPTION_OBJECT_RESOURCES_SEEK_ON_READ_SUPPORTED {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OPTION_OBJECT_RESOURCES_SEEK_ON_WRITE_SUPPORTED {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5002
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OPTION_OBJECT_RESOURCES_NO_INPUT_BUFFER_ON_READ {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5003
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_OBJECT_MANAGEMENT => Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_MANAGEMENT_CREATE_OBJECT_WITH_PROPERTIES_ONLY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_MANAGEMENT_CREATE_OBJECT_WITH_PROPERTIES_AND_DATA {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_MANAGEMENT_WRITE_OBJECT_DATA {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_MANAGEMENT_COMMIT_OBJECT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_MANAGEMENT_REVERT_OBJECT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_MANAGEMENT_DELETE_OBJECTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_MANAGEMENT_MOVE_OBJECTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_MANAGEMENT_COPY_OBJECTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_OBJECT_MANAGEMENT_UPDATE_OBJECT_WITH_PROPERTIES_AND_DATA {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_MANAGEMENT_CREATION_PROPERTIES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_MANAGEMENT_CONTEXT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1002
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_MANAGEMENT_NUM_BYTES_TO_WRITE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1003
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_MANAGEMENT_NUM_BYTES_WRITTEN {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1004
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_MANAGEMENT_DATA {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1005
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_MANAGEMENT_OBJECT_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1006
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_MANAGEMENT_DELETE_OPTIONS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1007
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_MANAGEMENT_OPTIMAL_TRANSFER_BUFFER_SIZE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1008
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_MANAGEMENT_OBJECT_IDS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1009
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_MANAGEMENT_DELETE_RESULTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1010
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_MANAGEMENT_DESTINATION_FOLDER_OBJECT_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1011
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_MANAGEMENT_MOVE_RESULTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1012
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_MANAGEMENT_COPY_RESULTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1013
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_MANAGEMENT_UPDATE_PROPERTIES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1014
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_MANAGEMENT_PROPERTY_KEYS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1015
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_OBJECT_MANAGEMENT_OBJECT_FORMAT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1016
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OPTION_OBJECT_MANAGEMENT_RECURSIVE_DELETE_SUPPORTED {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5001
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_CAPABILITIES => Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_COMMANDS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_CAPABILITIES_GET_COMMAND_OPTIONS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_FUNCTIONAL_CATEGORIES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_CAPABILITIES_GET_FUNCTIONAL_OBJECTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_CONTENT_TYPES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_FORMATS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_FORMAT_PROPERTIES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_CAPABILITIES_GET_FIXED_PROPERTY_ATTRIBUTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_EVENTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_CAPABILITIES_GET_EVENT_OPTIONS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CAPABILITIES_SUPPORTED_COMMANDS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CAPABILITIES_COMMAND {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1002
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CAPABILITIES_COMMAND_OPTIONS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1003
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CAPABILITIES_FUNCTIONAL_CATEGORIES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1004
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CAPABILITIES_FUNCTIONAL_CATEGORY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1005
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CAPABILITIES_FUNCTIONAL_OBJECTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1006
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CAPABILITIES_CONTENT_TYPES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1007
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CAPABILITIES_CONTENT_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1008
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CAPABILITIES_FORMATS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1009
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CAPABILITIES_FORMAT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1010
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CAPABILITIES_PROPERTY_KEYS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1011
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CAPABILITIES_PROPERTY_ATTRIBUTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1012
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CAPABILITIES_SUPPORTED_EVENTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1013
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CAPABILITIES_EVENT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1014
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CAPABILITIES_EVENT_OPTIONS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1015
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_STORAGE => Guid("{d8f907a6-34cc-45fa-97fb-d007fa47ec94}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_STORAGE_FORMAT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d8f907a6-34cc-45fa-97fb-d007fa47ec94}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_STORAGE_EJECT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d8f907a6-34cc-45fa-97fb-d007fa47ec94}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_STORAGE_OBJECT_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d8f907a6-34cc-45fa-97fb-d007fa47ec94}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_STORAGE_DESTINATION_OBJECT_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d8f907a6-34cc-45fa-97fb-d007fa47ec94}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1002
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_SMS => Guid("{afc25d66-fe0d-4114-9097-970c93e920d1}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SMS_SEND {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{afc25d66-fe0d-4114-9097-970c93e920d1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SMS_RECIPIENT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{afc25d66-fe0d-4114-9097-970c93e920d1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SMS_MESSAGE_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{afc25d66-fe0d-4114-9097-970c93e920d1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1002
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SMS_TEXT_MESSAGE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{afc25d66-fe0d-4114-9097-970c93e920d1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1003
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SMS_BINARY_MESSAGE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{afc25d66-fe0d-4114-9097-970c93e920d1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1004
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OPTION_SMS_BINARY_MESSAGE_SUPPORTED {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{afc25d66-fe0d-4114-9097-970c93e920d1}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5001
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_STILL_IMAGE_CAPTURE => Guid("{4fcd6982-22a2-4b05-a48b-62d38bf27b32}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_STILL_IMAGE_CAPTURE_INITIATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4fcd6982-22a2-4b05-a48b-62d38bf27b32}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_MEDIA_CAPTURE => Guid("{59b433ba-fe44-4d8d-808c-6bcb9b0f15e8}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_MEDIA_CAPTURE_START {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{59b433ba-fe44-4d8d-808c-6bcb9b0f15e8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_MEDIA_CAPTURE_STOP {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{59b433ba-fe44-4d8d-808c-6bcb9b0f15e8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_MEDIA_CAPTURE_PAUSE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{59b433ba-fe44-4d8d-808c-6bcb9b0f15e8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_DEVICE_HINTS => Guid("{0d5fb92b-cb46-4c4f-8343-0bc3d3f17c84}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_DEVICE_HINTS_GET_CONTENT_LOCATION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0d5fb92b-cb46-4c4f-8343-0bc3d3f17c84}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_DEVICE_HINTS_CONTENT_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0d5fb92b-cb46-4c4f-8343-0bc3d3f17c84}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_DEVICE_HINTS_CONTENT_LOCATIONS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{0d5fb92b-cb46-4c4f-8343-0bc3d3f17c84}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1002
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CLASS_EXTENSION_V1 => Guid("{33fb0d11-64a3-4fac-b4c7-3dfeaa99b051}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_CLASS_EXTENSION_WRITE_DEVICE_INFORMATION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{33fb0d11-64a3-4fac-b4c7-3dfeaa99b051}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CLASS_EXTENSION_DEVICE_INFORMATION_VALUES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{33fb0d11-64a3-4fac-b4c7-3dfeaa99b051}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CLASS_EXTENSION_DEVICE_INFORMATION_WRITE_RESULTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{33fb0d11-64a3-4fac-b4c7-3dfeaa99b051}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1002
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CLASS_EXTENSION_V2 => Guid("{7f0779b5-fa2b-4766-9cb2-f73ba30b6758}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_CLASS_EXTENSION_REGISTER_SERVICE_INTERFACES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f0779b5-fa2b-4766-9cb2-f73ba30b6758}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_CLASS_EXTENSION_UNREGISTER_SERVICE_INTERFACES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f0779b5-fa2b-4766-9cb2-f73ba30b6758}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CLASS_EXTENSION_SERVICE_OBJECT_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f0779b5-fa2b-4766-9cb2-f73ba30b6758}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CLASS_EXTENSION_SERVICE_INTERFACES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f0779b5-fa2b-4766-9cb2-f73ba30b6758}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1002
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_CLASS_EXTENSION_SERVICE_REGISTRATION_RESULTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f0779b5-fa2b-4766-9cb2-f73ba30b6758}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1003
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_NETWORK_CONFIGURATION => Guid("{78f9c6fc-79b8-473c-9060-6bd23dd072c4}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_GENERATE_KEYPAIR {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78f9c6fc-79b8-473c-9060-6bd23dd072c4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_COMMIT_KEYPAIR {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78f9c6fc-79b8-473c-9060-6bd23dd072c4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_PROCESS_WIRELESS_PROFILE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78f9c6fc-79b8-473c-9060-6bd23dd072c4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_PUBLIC_KEY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78f9c6fc-79b8-473c-9060-6bd23dd072c4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1001
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_SERVICE_COMMON => Guid("{322f071d-36ef-477f-b4b5-6f52d734baee}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_COMMON_GET_SERVICE_OBJECT_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{322f071d-36ef-477f-b4b5-6f52d734baee}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_OBJECT_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{322f071d-36ef-477f-b4b5-6f52d734baee}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1001
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_SERVICE_CAPABILITIES => Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_METHODS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_METHODS_BY_FORMAT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_CAPABILITIES_GET_METHOD_ATTRIBUTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_CAPABILITIES_GET_METHOD_PARAMETER_ATTRIBUTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_FORMATS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_CAPABILITIES_GET_FORMAT_ATTRIBUTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_FORMAT_PROPERTIES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_CAPABILITIES_GET_FORMAT_PROPERTY_ATTRIBUTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_EVENTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_CAPABILITIES_GET_EVENT_ATTRIBUTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_CAPABILITIES_GET_EVENT_PARAMETER_ATTRIBUTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_CAPABILITIES_GET_INHERITED_SERVICES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_CAPABILITIES_GET_FORMAT_RENDERING_PROFILES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_COMMANDS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_CAPABILITIES_GET_COMMAND_OPTIONS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_SUPPORTED_METHODS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_FORMAT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1002
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_METHOD {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1003
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_METHOD_ATTRIBUTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1004
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_PARAMETER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1005
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_PARAMETER_ATTRIBUTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1006
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_FORMATS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1007
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_FORMAT_ATTRIBUTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1008
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_PROPERTY_KEYS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1009
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_PROPERTY_ATTRIBUTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1010
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_SUPPORTED_EVENTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1011
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_EVENT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1012
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_EVENT_ATTRIBUTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1013
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_INHERITANCE_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1014
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_INHERITED_SERVICES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1015
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_RENDERING_PROFILES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1016
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_SUPPORTED_COMMANDS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1017
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_COMMAND {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1018
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_CAPABILITIES_COMMAND_OPTIONS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1019
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_SERVICE_METHODS => Guid("{2d521ca8-c1b0-4268-a342-cf19321569bc}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_METHODS_START_INVOKE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2d521ca8-c1b0-4268-a342-cf19321569bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_METHODS_CANCEL_INVOKE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2d521ca8-c1b0-4268-a342-cf19321569bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_SERVICE_METHODS_END_INVOKE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2d521ca8-c1b0-4268-a342-cf19321569bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_METHOD {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2d521ca8-c1b0-4268-a342-cf19321569bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_METHOD_PARAMETER_VALUES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2d521ca8-c1b0-4268-a342-cf19321569bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1002
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_METHOD_RESULT_VALUES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2d521ca8-c1b0-4268-a342-cf19321569bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1003
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_METHOD_CONTEXT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2d521ca8-c1b0-4268-a342-cf19321569bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1004
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_SERVICE_METHOD_HRESULT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2d521ca8-c1b0-4268-a342-cf19321569bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1005
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RESOURCE_DEFAULT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e81e79be-34f0-41bf-b53f-f1a06ae87842}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 0
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RESOURCE_CONTACT_PHOTO {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2c4d6803-80ea-4580-af9a-5be1a23eddcb}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 0
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RESOURCE_THUMBNAIL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{c7c407ba-98fa-46b5-9960-23fec124cfde}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 0
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RESOURCE_ICON {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f195fed8-aa28-4ee3-b153-e182dd5edc39}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 0
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RESOURCE_AUDIO_CLIP {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3bc13982-85b1-48e0-95a6-8d3ad06be117}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 0
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RESOURCE_ALBUM_ART {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f02aa354-2300-4e2d-a1b9-3b6730f7fa21}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 0
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RESOURCE_GENERIC {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b9b9f515-ba70-4647-94dc-fa4925e95a07}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 0
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RESOURCE_VIDEO_CLIP {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b566ee42-6368-4290-8662-70182fb79f20}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 0
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_RESOURCE_BRANDING_ART {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b633b1ae-6caf-4a87-9589-22ded6dd5899}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 0
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_PROPERTIES_ONLY => Guid("{30010000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_UNSPECIFIED => Guid("{30000000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_SCRIPT => Guid("{30020000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_EXECUTABLE => Guid("{30030000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_TEXT => Guid("{30040000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_HTML => Guid("{30050000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_DPOF => Guid("{30060000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_AIFF => Guid("{30070000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_WAVE => Guid("{30080000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_MP3 => Guid("{30090000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_AVI => Guid("{300a0000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_MPEG => Guid("{300b0000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_ASF => Guid("{300c0000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_EXIF => Guid("{38010000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_TIFFEP => Guid("{38020000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_FLASHPIX => Guid("{38030000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_BMP => Guid("{38040000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_CIFF => Guid("{38050000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_GIF => Guid("{38070000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_JFIF => Guid("{38080000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_PCD => Guid("{38090000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_PICT => Guid("{380a0000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_PNG => Guid("{380b0000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_TIFF => Guid("{380d0000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_TIFFIT => Guid("{380e0000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_JP2 => Guid("{380f0000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_JPX => Guid("{38100000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_WBMP => Guid("{b8030000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_JPEGXR => Guid("{b8040000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_WINDOWSIMAGEFORMAT => Guid("{b8810000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_WMA => Guid("{b9010000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_WMV => Guid("{b9810000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_WPLPLAYLIST => Guid("{ba100000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_M3UPLAYLIST => Guid("{ba110000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_MPLPLAYLIST => Guid("{ba120000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_ASXPLAYLIST => Guid("{ba130000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_PLSPLAYLIST => Guid("{ba140000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_ABSTRACT_CONTACT_GROUP => Guid("{ba060000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_ABSTRACT_MEDIA_CAST => Guid("{ba0b0000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_VCALENDAR1 => Guid("{be020000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_ICALENDAR => Guid("{be030000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_ABSTRACT_CONTACT => Guid("{bb810000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_VCARD2 => Guid("{bb820000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_VCARD3 => Guid("{bb830000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_XML => Guid("{ba820000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_AAC => Guid("{b9030000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_AUDIBLE => Guid("{b9040000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_FLAC => Guid("{b9060000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_QCELP => Guid("{b9070000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_AMR => Guid("{b9080000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_OGG => Guid("{b9020000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_MP4 => Guid("{b9820000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_MP2 => Guid("{b9830000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_MICROSOFT_WORD => Guid("{ba830000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_MHT_COMPILED_HTML => Guid("{ba840000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_MICROSOFT_EXCEL => Guid("{ba850000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_MICROSOFT_POWERPOINT => Guid("{ba860000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_3GP => Guid("{b9840000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_3G2 => Guid("{b9850000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_AVCHD => Guid("{b9860000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_ATSCTS => Guid("{b9870000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_DVBTS => Guid("{b9880000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {Guid}
     */
    static WPD_OBJECT_FORMAT_MKV => Guid("{b9900000-ae6c-4804-98ba-c57b46965fe7}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_PARENT_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_PERSISTENT_UNIQUE_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_FORMAT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_ISHIDDEN {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_ISSYSTEM {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_SIZE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_ORIGINAL_FILE_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_NON_CONSUMABLE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_KEYWORDS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_SYNC_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_IS_DRM_PROTECTED {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_DATE_CREATED {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_DATE_MODIFIED {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_DATE_AUTHORED {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_BACK_REFERENCES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 21
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_CAN_DELETE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 26
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_OBJECT_LANGUAGE_LOCALE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 27
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_FOLDER_OBJECT_PROPERTIES_V1 => Guid("{7e9a7abf-e568-4b34-aa2f-13bb12ab177d}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_FOLDER_CONTENT_TYPES_ALLOWED {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7e9a7abf-e568-4b34-aa2f-13bb12ab177d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_IMAGE_OBJECT_PROPERTIES_V1 => Guid("{63d64908-9fa1-479f-85ba-9952216447db}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_IMAGE_BITDEPTH {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{63d64908-9fa1-479f-85ba-9952216447db}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_IMAGE_CROPPED_STATUS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{63d64908-9fa1-479f-85ba-9952216447db}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_IMAGE_COLOR_CORRECTED_STATUS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{63d64908-9fa1-479f-85ba-9952216447db}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_IMAGE_FNUMBER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{63d64908-9fa1-479f-85ba-9952216447db}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_IMAGE_EXPOSURE_TIME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{63d64908-9fa1-479f-85ba-9952216447db}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_IMAGE_EXPOSURE_INDEX {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{63d64908-9fa1-479f-85ba-9952216447db}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_IMAGE_HORIZONTAL_RESOLUTION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{63d64908-9fa1-479f-85ba-9952216447db}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_IMAGE_VERTICAL_RESOLUTION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{63d64908-9fa1-479f-85ba-9952216447db}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_DOCUMENT_OBJECT_PROPERTIES_V1 => Guid("{0b110203-eb95-4f02-93e0-97c631493ad5}")

    /**
     * @type {Guid}
     */
    static WPD_MEDIA_PROPERTIES_V1 => Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_TOTAL_BITRATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_BITRATE_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_COPYRIGHT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_SUBSCRIPTION_CONTENT_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_USE_COUNT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_SKIP_COUNT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_LAST_ACCESSED_TIME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_PARENTAL_RATING {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_META_GENRE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_COMPOSER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_EFFECTIVE_RATING {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_SUB_TITLE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_RELEASE_DATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_SAMPLE_RATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_STAR_RATING {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_USER_EFFECTIVE_RATING {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_TITLE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_DURATION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_BUY_NOW {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_ENCODING_PROFILE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 21
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_WIDTH {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 22
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_HEIGHT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 23
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_ARTIST {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_ALBUM_ARTIST {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 25
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_OWNER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 26
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_MANAGING_EDITOR {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 27
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_WEBMASTER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 28
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_SOURCE_URL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 29
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_DESTINATION_URL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 30
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_DESCRIPTION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 31
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_GENRE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 32
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_TIME_BOOKMARK {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 33
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_OBJECT_BOOKMARK {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 34
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_LAST_BUILD_DATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 35
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_BYTE_BOOKMARK {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 36
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_TIME_TO_LIVE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 37
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_GUID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 38
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_SUB_DESCRIPTION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 39
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MEDIA_AUDIO_ENCODING_PROFILE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 49
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_CONTACT_OBJECT_PROPERTIES_V1 => Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_DISPLAY_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_FIRST_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_MIDDLE_NAMES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_LAST_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PREFIX {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_SUFFIX {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PHONETIC_FIRST_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PHONETIC_LAST_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PERSONAL_FULL_POSTAL_ADDRESS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_LINE1 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_LINE2 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_CITY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_REGION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_POSTAL_CODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_COUNTRY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_BUSINESS_FULL_POSTAL_ADDRESS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_LINE1 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_LINE2 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_CITY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_REGION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 21
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_POSTAL_CODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 22
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_COUNTRY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 23
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_OTHER_FULL_POSTAL_ADDRESS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_OTHER_POSTAL_ADDRESS_LINE1 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 25
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_OTHER_POSTAL_ADDRESS_LINE2 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 26
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_OTHER_POSTAL_ADDRESS_CITY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 27
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_OTHER_POSTAL_ADDRESS_REGION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 28
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_OTHER_POSTAL_ADDRESS_POSTAL_CODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 29
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_OTHER_POSTAL_ADDRESS_POSTAL_COUNTRY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 30
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PRIMARY_EMAIL_ADDRESS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 31
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PERSONAL_EMAIL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 32
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PERSONAL_EMAIL2 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 33
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_BUSINESS_EMAIL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 34
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_BUSINESS_EMAIL2 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 35
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_OTHER_EMAILS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 36
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PRIMARY_PHONE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 37
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PERSONAL_PHONE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 38
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PERSONAL_PHONE2 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 39
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_BUSINESS_PHONE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 40
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_BUSINESS_PHONE2 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 41
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_MOBILE_PHONE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 42
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_MOBILE_PHONE2 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 43
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PERSONAL_FAX {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 44
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_BUSINESS_FAX {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 45
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PAGER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 46
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_OTHER_PHONES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 47
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PRIMARY_WEB_ADDRESS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 48
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PERSONAL_WEB_ADDRESS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 49
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_BUSINESS_WEB_ADDRESS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 50
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_INSTANT_MESSENGER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 51
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_INSTANT_MESSENGER2 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 52
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_INSTANT_MESSENGER3 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 53
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_COMPANY_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 54
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PHONETIC_COMPANY_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 55
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_ROLE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 56
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_BIRTHDATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 57
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_PRIMARY_FAX {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 58
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_SPOUSE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 59
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_CHILDREN {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 60
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_ASSISTANT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 61
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_ANNIVERSARY_DATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 62
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_CONTACT_RINGTONE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 63
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_MUSIC_OBJECT_PROPERTIES_V1 => Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MUSIC_ALBUM {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MUSIC_TRACK {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MUSIC_LYRICS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_MUSIC_MOOD {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_AUDIO_BITRATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_AUDIO_CHANNEL_COUNT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_AUDIO_FORMAT_CODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_AUDIO_BIT_DEPTH {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_AUDIO_BLOCK_ALIGNMENT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_VIDEO_OBJECT_PROPERTIES_V1 => Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_VIDEO_AUTHOR {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_VIDEO_RECORDEDTV_STATION_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_VIDEO_RECORDEDTV_CHANNEL_NUMBER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_VIDEO_RECORDEDTV_REPEAT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_VIDEO_BUFFER_SIZE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_VIDEO_CREDITS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_VIDEO_KEY_FRAME_DISTANCE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_VIDEO_QUALITY_SETTING {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_VIDEO_SCAN_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_VIDEO_BITRATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_VIDEO_FOURCC_CODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_VIDEO_FRAMERATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_COMMON_INFORMATION_OBJECT_PROPERTIES_V1 => Guid("{b28ae94b-05a4-4e8e-be01-72cc7e099d8f}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMON_INFORMATION_SUBJECT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b28ae94b-05a4-4e8e-be01-72cc7e099d8f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMON_INFORMATION_BODY_TEXT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b28ae94b-05a4-4e8e-be01-72cc7e099d8f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMON_INFORMATION_PRIORITY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b28ae94b-05a4-4e8e-be01-72cc7e099d8f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMON_INFORMATION_START_DATETIME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b28ae94b-05a4-4e8e-be01-72cc7e099d8f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMON_INFORMATION_END_DATETIME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b28ae94b-05a4-4e8e-be01-72cc7e099d8f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMON_INFORMATION_NOTES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b28ae94b-05a4-4e8e-be01-72cc7e099d8f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_MEMO_OBJECT_PROPERTIES_V1 => Guid("{5ffbfc7b-7483-41ad-afb9-da3f4e592b8d}")

    /**
     * @type {Guid}
     */
    static WPD_EMAIL_OBJECT_PROPERTIES_V1 => Guid("{41f8f65a-5484-4782-b13d-4740dd7c37c5}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EMAIL_TO_LINE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{41f8f65a-5484-4782-b13d-4740dd7c37c5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EMAIL_CC_LINE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{41f8f65a-5484-4782-b13d-4740dd7c37c5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EMAIL_BCC_LINE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{41f8f65a-5484-4782-b13d-4740dd7c37c5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EMAIL_HAS_BEEN_READ {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{41f8f65a-5484-4782-b13d-4740dd7c37c5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EMAIL_RECEIVED_TIME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{41f8f65a-5484-4782-b13d-4740dd7c37c5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EMAIL_HAS_ATTACHMENTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{41f8f65a-5484-4782-b13d-4740dd7c37c5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_EMAIL_SENDER_ADDRESS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{41f8f65a-5484-4782-b13d-4740dd7c37c5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_APPOINTMENT_OBJECT_PROPERTIES_V1 => Guid("{f99efd03-431d-40d8-a1c9-4e220d9c88d3}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_APPOINTMENT_LOCATION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f99efd03-431d-40d8-a1c9-4e220d9c88d3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_APPOINTMENT_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f99efd03-431d-40d8-a1c9-4e220d9c88d3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_APPOINTMENT_REQUIRED_ATTENDEES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f99efd03-431d-40d8-a1c9-4e220d9c88d3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_APPOINTMENT_OPTIONAL_ATTENDEES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f99efd03-431d-40d8-a1c9-4e220d9c88d3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_APPOINTMENT_ACCEPTED_ATTENDEES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f99efd03-431d-40d8-a1c9-4e220d9c88d3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_APPOINTMENT_RESOURCES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f99efd03-431d-40d8-a1c9-4e220d9c88d3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_APPOINTMENT_TENTATIVE_ATTENDEES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f99efd03-431d-40d8-a1c9-4e220d9c88d3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_APPOINTMENT_DECLINED_ATTENDEES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{f99efd03-431d-40d8-a1c9-4e220d9c88d3}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_TASK_OBJECT_PROPERTIES_V1 => Guid("{e354e95e-d8a0-4637-a03a-0cb26838dbc7}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_TASK_STATUS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e354e95e-d8a0-4637-a03a-0cb26838dbc7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_TASK_PERCENT_COMPLETE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e354e95e-d8a0-4637-a03a-0cb26838dbc7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_TASK_REMINDER_DATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e354e95e-d8a0-4637-a03a-0cb26838dbc7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_TASK_OWNER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e354e95e-d8a0-4637-a03a-0cb26838dbc7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_SMS_OBJECT_PROPERTIES_V1 => Guid("{7e1074cc-50ff-4dd1-a742-53be6f093a0d}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_SMS_PROVIDER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7e1074cc-50ff-4dd1-a742-53be6f093a0d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_SMS_TIMEOUT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7e1074cc-50ff-4dd1-a742-53be6f093a0d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_SMS_MAX_PAYLOAD {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7e1074cc-50ff-4dd1-a742-53be6f093a0d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_SMS_ENCODING {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7e1074cc-50ff-4dd1-a742-53be6f093a0d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_SECTION_OBJECT_PROPERTIES_V1 => Guid("{516afd2b-c64e-44f0-98dc-bee1c88f7d66}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_SECTION_DATA_OFFSET {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{516afd2b-c64e-44f0-98dc-bee1c88f7d66}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_SECTION_DATA_LENGTH {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{516afd2b-c64e-44f0-98dc-bee1c88f7d66}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_SECTION_DATA_UNITS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{516afd2b-c64e-44f0-98dc-bee1c88f7d66}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_SECTION_DATA_REFERENCED_OBJECT_RESOURCE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{516afd2b-c64e-44f0-98dc-bee1c88f7d66}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {String}
     */
    static NAME_Undefined => "Undefined"

    /**
     * @type {String}
     */
    static NAME_Association => "Association"

    /**
     * @type {String}
     */
    static NAME_DeviceScript => "DeviceScript"

    /**
     * @type {String}
     */
    static NAME_DeviceExecutable => "DeviceExecutable"

    /**
     * @type {String}
     */
    static NAME_TextDocument => "TextDocument"

    /**
     * @type {String}
     */
    static NAME_HTMLDocument => "HTMLDocument"

    /**
     * @type {String}
     */
    static NAME_DPOFDocument => "DPOFDocument"

    /**
     * @type {String}
     */
    static NAME_AIFFFile => "AIFFFile"

    /**
     * @type {String}
     */
    static NAME_WAVFile => "WAVFile"

    /**
     * @type {String}
     */
    static NAME_MP3File => "MP3File"

    /**
     * @type {String}
     */
    static NAME_AVIFile => "AVIFile"

    /**
     * @type {String}
     */
    static NAME_MPEGFile => "MPEGFile"

    /**
     * @type {String}
     */
    static NAME_ASFFile => "ASFFile"

    /**
     * @type {String}
     */
    static NAME_UnknownImage => "UnknownImage"

    /**
     * @type {String}
     */
    static NAME_EXIFImage => "EXIFImage"

    /**
     * @type {String}
     */
    static NAME_TIFFEPImage => "TIFFEPImage"

    /**
     * @type {String}
     */
    static NAME_FlashPixImage => "FlashPixImage"

    /**
     * @type {String}
     */
    static NAME_BMPImage => "BMPImage"

    /**
     * @type {String}
     */
    static NAME_CIFFImage => "CIFFImage"

    /**
     * @type {String}
     */
    static NAME_GIFImage => "GIFImage"

    /**
     * @type {String}
     */
    static NAME_JFIFImage => "JFIFImage"

    /**
     * @type {String}
     */
    static NAME_PCDImage => "PCDImage"

    /**
     * @type {String}
     */
    static NAME_PICTImage => "PICTImage"

    /**
     * @type {String}
     */
    static NAME_PNGImage => "PNGImage"

    /**
     * @type {String}
     */
    static NAME_TIFFImage => "TIFFImage"

    /**
     * @type {String}
     */
    static NAME_TIFFITImage => "TIFFITImage"

    /**
     * @type {String}
     */
    static NAME_JP2Image => "JP2Image"

    /**
     * @type {String}
     */
    static NAME_JPXImage => "JPXImage"

    /**
     * @type {String}
     */
    static NAME_FirmwareFile => "FirmwareFile"

    /**
     * @type {String}
     */
    static NAME_WBMPImage => "WBMPImage"

    /**
     * @type {String}
     */
    static NAME_JPEGXRImage => "JPEGXRImage"

    /**
     * @type {String}
     */
    static NAME_HDPhotoImage => "HDPhotoImage"

    /**
     * @type {String}
     */
    static NAME_UndefinedAudio => "UndefinedAudio"

    /**
     * @type {String}
     */
    static NAME_WMAFile => "WMAFile"

    /**
     * @type {String}
     */
    static NAME_OGGFile => "OGGFile"

    /**
     * @type {String}
     */
    static NAME_AACFile => "AACFile"

    /**
     * @type {String}
     */
    static NAME_AudibleFile => "AudibleFile"

    /**
     * @type {String}
     */
    static NAME_FLACFile => "FLACFile"

    /**
     * @type {String}
     */
    static NAME_QCELPFile => "QCELPFile"

    /**
     * @type {String}
     */
    static NAME_AMRFile => "AMRFile"

    /**
     * @type {String}
     */
    static NAME_UndefinedVideo => "UndefinedVideo"

    /**
     * @type {String}
     */
    static NAME_WMVFile => "WMVFile"

    /**
     * @type {String}
     */
    static NAME_MPEG4File => "MPEG4File"

    /**
     * @type {String}
     */
    static NAME_MPEG2File => "MPEG2File"

    /**
     * @type {String}
     */
    static NAME_3GPPFile => "3GPPFile"

    /**
     * @type {String}
     */
    static NAME_3GPP2File => "3GPP2File"

    /**
     * @type {String}
     */
    static NAME_AVCHDFile => "AVCHDFile"

    /**
     * @type {String}
     */
    static NAME_ATSCTSFile => "ATSCTSFile"

    /**
     * @type {String}
     */
    static NAME_DVBTSFile => "DVBTSFile"

    /**
     * @type {String}
     */
    static NAME_UndefinedCollection => "UndefinedCollection"

    /**
     * @type {String}
     */
    static NAME_AbstractMultimediaAlbum => "AbstractMultimediaAlbum"

    /**
     * @type {String}
     */
    static NAME_AbstractImageAlbum => "AbstractImageAlbum"

    /**
     * @type {String}
     */
    static NAME_AbstractAudioAlbum => "AbstractAudioAlbum"

    /**
     * @type {String}
     */
    static NAME_AbstractVideoAlbum => "AbstractVideoAlbum"

    /**
     * @type {String}
     */
    static NAME_AbstractAudioVideoAlbum => "AbstractAudioVideoAlbum"

    /**
     * @type {String}
     */
    static NAME_AbstractChapteredProduction => "AbstractChapteredProduction"

    /**
     * @type {String}
     */
    static NAME_AbstractAudioPlaylist => "AbstractAudioPlaylist"

    /**
     * @type {String}
     */
    static NAME_AbstractVideoPlaylist => "AbstractVideoPlaylist"

    /**
     * @type {String}
     */
    static NAME_AbstractMediacast => "AbstractMediacast"

    /**
     * @type {String}
     */
    static NAME_WPLPlaylist => "WPLPlaylist"

    /**
     * @type {String}
     */
    static NAME_M3UPlaylist => "M3UPlaylist"

    /**
     * @type {String}
     */
    static NAME_MPLPlaylist => "MPLPlaylist"

    /**
     * @type {String}
     */
    static NAME_ASXPlaylist => "ASXPlaylist"

    /**
     * @type {String}
     */
    static NAME_PSLPlaylist => "PSLPlaylist"

    /**
     * @type {String}
     */
    static NAME_UndefinedDocument => "UndefinedDocument"

    /**
     * @type {String}
     */
    static NAME_AbstractDocument => "AbstractDocument"

    /**
     * @type {String}
     */
    static NAME_XMLDocument => "XMLDocument"

    /**
     * @type {String}
     */
    static NAME_WordDocument => "WordDocument"

    /**
     * @type {String}
     */
    static NAME_MHTDocument => "MHTDocument"

    /**
     * @type {String}
     */
    static NAME_ExcelDocument => "ExcelDocument"

    /**
     * @type {String}
     */
    static NAME_PowerPointDocument => "PowerPointDocument"

    /**
     * @type {String}
     */
    static NAME_GenericObj_ObjectID => "ObjectID"

    /**
     * @type {String}
     */
    static NAME_GenericObj_ReferenceParentID => "ReferenceParentID"

    /**
     * @type {String}
     */
    static NAME_GenericObj_StorageID => "StorageID"

    /**
     * @type {String}
     */
    static NAME_GenericObj_ObjectFormat => "ObjectFormat"

    /**
     * @type {String}
     */
    static NAME_GenericObj_ProtectionStatus => "ProtectionStatus"

    /**
     * @type {String}
     */
    static NAME_GenericObj_ObjectSize => "ObjectSize"

    /**
     * @type {String}
     */
    static NAME_GenericObj_AssociationType => "AssociationType"

    /**
     * @type {String}
     */
    static NAME_GenericObj_AssociationDesc => "AssociationDesc"

    /**
     * @type {String}
     */
    static NAME_GenericObj_ObjectFileName => "ObjectFileName"

    /**
     * @type {String}
     */
    static NAME_GenericObj_DateCreated => "DateCreated"

    /**
     * @type {String}
     */
    static NAME_GenericObj_DateModified => "DateModified"

    /**
     * @type {String}
     */
    static NAME_GenericObj_Keywords => "Keywords"

    /**
     * @type {String}
     */
    static NAME_GenericObj_ParentID => "ParentID"

    /**
     * @type {String}
     */
    static NAME_GenericObj_AllowedFolderContents => "AllowedFolderContents"

    /**
     * @type {String}
     */
    static NAME_GenericObj_Hidden => "Hidden"

    /**
     * @type {String}
     */
    static NAME_GenericObj_SystemObject => "SystemObject"

    /**
     * @type {String}
     */
    static NAME_GenericObj_PersistentUID => "PersistentUID"

    /**
     * @type {String}
     */
    static NAME_GenericObj_SyncID => "SyncID"

    /**
     * @type {String}
     */
    static NAME_GenericObj_PropertyBag => "PropertyBag"

    /**
     * @type {String}
     */
    static NAME_GenericObj_Name => "Name"

    /**
     * @type {String}
     */
    static NAME_MediaObj_Artist => "Artist"

    /**
     * @type {String}
     */
    static NAME_GenericObj_DateAuthored => "DateAuthored"

    /**
     * @type {String}
     */
    static NAME_GenericObj_Description => "Description"

    /**
     * @type {String}
     */
    static NAME_GenericObj_LanguageLocale => "LanguageLocale"

    /**
     * @type {String}
     */
    static NAME_GenericObj_Copyright => "Copyright"

    /**
     * @type {String}
     */
    static NAME_VideoObj_Source => "Source"

    /**
     * @type {String}
     */
    static NAME_MediaObj_GeographicOrigin => "GeographicOrigin"

    /**
     * @type {String}
     */
    static NAME_GenericObj_DateAdded => "DateAdded"

    /**
     * @type {String}
     */
    static NAME_GenericObj_NonConsumable => "NonConsumable"

    /**
     * @type {String}
     */
    static NAME_GenericObj_Corrupt => "Corrupt"

    /**
     * @type {String}
     */
    static NAME_MediaObj_Width => "Width"

    /**
     * @type {String}
     */
    static NAME_MediaObj_Height => "Height"

    /**
     * @type {String}
     */
    static NAME_MediaObj_Duration => "Duration"

    /**
     * @type {String}
     */
    static NAME_MediaObj_UserRating => "UserRating"

    /**
     * @type {String}
     */
    static NAME_MediaObj_Track => "Track"

    /**
     * @type {String}
     */
    static NAME_MediaObj_Genre => "Genre"

    /**
     * @type {String}
     */
    static NAME_MediaObj_Credits => "Credits"

    /**
     * @type {String}
     */
    static NAME_AudioObj_Lyrics => "Lyrics"

    /**
     * @type {String}
     */
    static NAME_MediaObj_SubscriptionContentID => "SubscriptionContentID"

    /**
     * @type {String}
     */
    static NAME_MediaObj_Producer => "Producer"

    /**
     * @type {String}
     */
    static NAME_MediaObj_UseCount => "UseCount"

    /**
     * @type {String}
     */
    static NAME_MediaObj_SkipCount => "SkipCount"

    /**
     * @type {String}
     */
    static NAME_GenericObj_DateAccessed => "DateAccessed"

    /**
     * @type {String}
     */
    static NAME_MediaObj_ParentalRating => "ParentalRating"

    /**
     * @type {String}
     */
    static NAME_MediaObj_MediaType => "MediaType"

    /**
     * @type {String}
     */
    static NAME_MediaObj_Composer => "Composer"

    /**
     * @type {String}
     */
    static NAME_MediaObj_EffectiveRating => "EffectiveRating"

    /**
     * @type {String}
     */
    static NAME_MediaObj_Subtitle => "Subtitle"

    /**
     * @type {String}
     */
    static NAME_MediaObj_DateOriginalRelease => "DateOriginalRelease"

    /**
     * @type {String}
     */
    static NAME_MediaObj_AlbumName => "AlbumName"

    /**
     * @type {String}
     */
    static NAME_MediaObj_AlbumArtist => "AlbumArtist"

    /**
     * @type {String}
     */
    static NAME_MediaObj_Mood => "Mood"

    /**
     * @type {String}
     */
    static NAME_GenericObj_DRMStatus => "DRMStatus"

    /**
     * @type {String}
     */
    static NAME_GenericObj_SubDescription => "SubDescription"

    /**
     * @type {String}
     */
    static NAME_ImageObj_IsCropped => "IsCropped"

    /**
     * @type {String}
     */
    static NAME_ImageObj_IsColorCorrected => "IsColorCorrected"

    /**
     * @type {String}
     */
    static NAME_ImageObj_ImageBitDepth => "ImageBitDepth"

    /**
     * @type {String}
     */
    static NAME_ImageObj_Aperature => "Aperature"

    /**
     * @type {String}
     */
    static NAME_ImageObj_Exposure => "Exposure"

    /**
     * @type {String}
     */
    static NAME_ImageObj_ISOSpeed => "ISOSpeed"

    /**
     * @type {String}
     */
    static NAME_MediaObj_Owner => "Owner"

    /**
     * @type {String}
     */
    static NAME_MediaObj_Editor => "Editor"

    /**
     * @type {String}
     */
    static NAME_MediaObj_WebMaster => "WebMaster"

    /**
     * @type {String}
     */
    static NAME_MediaObj_URLSource => "URLSource"

    /**
     * @type {String}
     */
    static NAME_MediaObj_URLLink => "URLLink"

    /**
     * @type {String}
     */
    static NAME_MediaObj_BookmarkTime => "BookmarkTime"

    /**
     * @type {String}
     */
    static NAME_MediaObj_BookmarkObject => "BookmarkObject"

    /**
     * @type {String}
     */
    static NAME_MediaObj_BookmarkByte => "BookmarkByte"

    /**
     * @type {String}
     */
    static NAME_GenericObj_DateRevised => "DateRevised"

    /**
     * @type {String}
     */
    static NAME_GenericObj_TimeToLive => "TimeToLive"

    /**
     * @type {String}
     */
    static NAME_MediaObj_MediaUID => "MediaUID"

    /**
     * @type {String}
     */
    static NAME_MediaObj_TotalBitRate => "TotalBitRate"

    /**
     * @type {String}
     */
    static NAME_MediaObj_BitRateType => "BitRateType"

    /**
     * @type {String}
     */
    static NAME_MediaObj_SampleRate => "SampleRate"

    /**
     * @type {String}
     */
    static NAME_AudioObj_Channels => "Channels"

    /**
     * @type {String}
     */
    static NAME_AudioObj_AudioBitDepth => "AudioBitDepth"

    /**
     * @type {String}
     */
    static NAME_AudioObj_AudioBlockAlignment => "AudioBlockAlignment"

    /**
     * @type {String}
     */
    static NAME_VideoObj_ScanType => "ScanType"

    /**
     * @type {String}
     */
    static NAME_AudioObj_AudioFormatCode => "AudioFormatCode"

    /**
     * @type {String}
     */
    static NAME_AudioObj_AudioBitRate => "AudioBitRate"

    /**
     * @type {String}
     */
    static NAME_VideoObj_VideoFormatCode => "VideoFormatCode"

    /**
     * @type {String}
     */
    static NAME_VideoObj_VideoBitRate => "VideoBitRate"

    /**
     * @type {String}
     */
    static NAME_VideoObj_VideoFrameRate => "VideoFrameRate"

    /**
     * @type {String}
     */
    static NAME_VideoObj_KeyFrameDistance => "KeyFrameDistance"

    /**
     * @type {String}
     */
    static NAME_MediaObj_BufferSize => "BufferSize"

    /**
     * @type {String}
     */
    static NAME_MediaObj_EncodingQuality => "EncodingQuality"

    /**
     * @type {String}
     */
    static NAME_MediaObj_EncodingProfile => "EncodingProfile"

    /**
     * @type {String}
     */
    static NAME_MediaObj_AudioEncodingProfile => "AudioEncodingProfile"

    /**
     * @type {Integer (UInt32)}
     */
    static DEVSVC_SERVICEINFO_VERSION => 100

    /**
     * @type {Integer (UInt32)}
     */
    static DEVSVCTYPE_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEVSVCTYPE_ABSTRACT => 1

    /**
     * @type {String}
     */
    static NAME_Services_ServiceDisplayName => "ServiceDisplayName"

    /**
     * @type {String}
     */
    static NAME_Services_ServiceIcon => "ServiceIcon"

    /**
     * @type {String}
     */
    static NAME_Services_ServiceLocale => "ServiceLocale"

    /**
     * @type {String}
     */
    static NAME_CalendarSvc => "Calendar"

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE_CalendarSvc => 0

    /**
     * @type {String}
     */
    static NAME_CalendarSvc_SyncWindowStart => "SyncWindowStart"

    /**
     * @type {String}
     */
    static NAME_CalendarSvc_SyncWindowEnd => "SyncWindowEnd"

    /**
     * @type {String}
     */
    static NAME_AbstractActivity => "AbstractActivity"

    /**
     * @type {String}
     */
    static NAME_AbstractActivityOccurrence => "AbstractActivityOccurrence"

    /**
     * @type {String}
     */
    static NAME_VCalendar1Activity => "VCalendar1"

    /**
     * @type {String}
     */
    static NAME_ICalendarActivity => "ICalendar"

    /**
     * @type {String}
     */
    static NAME_CalendarObj_Location => "Location"

    /**
     * @type {String}
     */
    static NAME_CalendarObj_Accepted => "Accepted"

    /**
     * @type {String}
     */
    static NAME_CalendarObj_Tentative => "Tentative"

    /**
     * @type {String}
     */
    static NAME_CalendarObj_Declined => "Declined"

    /**
     * @type {String}
     */
    static NAME_CalendarObj_TimeZone => "TimeZone"

    /**
     * @type {String}
     */
    static NAME_CalendarObj_ReminderOffset => "ReminderOffset"

    /**
     * @type {String}
     */
    static NAME_CalendarObj_BusyStatus => "BusyStatus"

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_CalendarObj_BusyStatusFree => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_CalendarObj_BusyStatusBusy => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_CalendarObj_BusyStatusOutOfOffice => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_CalendarObj_BusyStatusTentative => 3

    /**
     * @type {String}
     */
    static NAME_CalendarObj_PatternStartTime => "PatternStartTime"

    /**
     * @type {String}
     */
    static NAME_CalendarObj_PatternDuration => "PatternDuration"

    /**
     * @type {String}
     */
    static NAME_CalendarObj_BeginDateTime => "BeginDateTime"

    /**
     * @type {String}
     */
    static NAME_CalendarObj_EndDateTime => "EndDateTime"

    /**
     * @type {String}
     */
    static NAME_HintsSvc => "Hints"

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE_HintsSvc => 0

    /**
     * @type {String}
     */
    static NAME_MessageSvc => "Message"

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE_MessageSvc => 0

    /**
     * @type {String}
     */
    static NAME_AbstractMessage => "AbstractMessage"

    /**
     * @type {String}
     */
    static NAME_AbstractMessageFolder => "AbstractMessageFolder"

    /**
     * @type {String}
     */
    static NAME_MessageObj_Subject => "Subject"

    /**
     * @type {String}
     */
    static NAME_MessageObj_Body => "Body"

    /**
     * @type {String}
     */
    static NAME_MessageObj_Priority => "Priority"

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_MessageObj_PriorityHighest => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_MessageObj_PriorityNormal => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_MessageObj_PriorityLowest => 0

    /**
     * @type {String}
     */
    static NAME_MessageObj_Category => "Category"

    /**
     * @type {String}
     */
    static NAME_MessageObj_Sender => "Sender"

    /**
     * @type {String}
     */
    static NAME_MessageObj_To => "To"

    /**
     * @type {String}
     */
    static NAME_MessageObj_CC => "CC"

    /**
     * @type {String}
     */
    static NAME_MessageObj_BCC => "BCC"

    /**
     * @type {String}
     */
    static NAME_MessageObj_Read => "Read"

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_MessageObj_ReadFalse => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_MessageObj_ReadTrue => 255

    /**
     * @type {String}
     */
    static NAME_MessageObj_ReceivedTime => "ReceivedTime"

    /**
     * @type {String}
     */
    static NAME_MessageObj_PatternOriginalDateTime => "PatternOriginalDateTime"

    /**
     * @type {String}
     */
    static NAME_MessageObj_PatternType => "PatternType"

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_MessageObj_PatternTypeDaily => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_MessageObj_PatternTypeWeekly => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_MessageObj_PatternTypeMonthly => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_MessageObj_PatternTypeYearly => 4

    /**
     * @type {String}
     */
    static NAME_MessageObj_PatternValidStartDate => "PatternValidStartDate"

    /**
     * @type {String}
     */
    static NAME_MessageObj_PatternValidEndDate => "PatternValidEndDate"

    /**
     * @type {String}
     */
    static NAME_MessageObj_PatternPeriod => "PatternPeriod"

    /**
     * @type {String}
     */
    static NAME_MessageObj_PatternDayOfWeek => "PatternDayOfWeek"

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_MessageObj_DayOfWeekNone => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_MessageObj_DayOfWeekSunday => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_MessageObj_DayOfWeekMonday => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_MessageObj_DayOfWeekTuesday => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_MessageObj_DayOfWeekWednesday => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_MessageObj_DayOfWeekThursday => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_MessageObj_DayOfWeekFriday => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_MessageObj_DayOfWeekSaturday => 64

    /**
     * @type {String}
     */
    static NAME_MessageObj_PatternDayOfMonth => "PatternDayOfMonth"

    /**
     * @type {Integer (UInt32)}
     */
    static RANGEMIN_MessageObj_PatternDayOfMonth => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RANGEMAX_MessageObj_PatternDayOfMonth => 31

    /**
     * @type {Integer (UInt32)}
     */
    static RANGESTEP_MessageObj_PatternDayOfMonth => 1

    /**
     * @type {String}
     */
    static NAME_MessageObj_PatternMonthOfYear => "PatternMonthOfYear"

    /**
     * @type {Integer (UInt32)}
     */
    static RANGEMIN_MessageObj_PatternMonthOfYear => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RANGEMAX_MessageObj_PatternMonthOfYear => 12

    /**
     * @type {Integer (UInt32)}
     */
    static RANGESTEP_MessageObj_PatternMonthOfYear => 1

    /**
     * @type {String}
     */
    static NAME_MessageObj_PatternInstance => "PatternInstance"

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_MessageObj_PatternInstanceNone => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_MessageObj_PatternInstanceFirst => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_MessageObj_PatternInstanceSecond => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_MessageObj_PatternInstanceThird => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_MessageObj_PatternInstanceFourth => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_MessageObj_PatternInstanceLast => 5

    /**
     * @type {String}
     */
    static NAME_MessageObj_PatternDeleteDates => "PatternDeleteDates"

    /**
     * @type {String}
     */
    static NAME_DeviceMetadataSvc => "Metadata"

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE_DeviceMetadataSvc => 0

    /**
     * @type {String}
     */
    static NAME_DeviceMetadataCAB => "DeviceMetadataCAB"

    /**
     * @type {String}
     */
    static NAME_DeviceMetadataObj_ContentID => "ContentID"

    /**
     * @type {String}
     */
    static NAME_DeviceMetadataObj_DefaultCAB => "DefaultCAB"

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_DeviceMetadataObj_DefaultCABFalse => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_DeviceMetadataObj_DefaultCABTrue => 1

    /**
     * @type {String}
     */
    static NAME_NotesSvc => "Notes"

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE_NotesSvc => 0

    /**
     * @type {String}
     */
    static NAME_AbstractNote => "AbstractNote"

    /**
     * @type {String}
     */
    static NAME_StatusSvc => "Status"

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE_StatusSvc => 0

    /**
     * @type {String}
     */
    static NAME_StatusSvc_SignalStrength => "SignalStrength"

    /**
     * @type {Integer (UInt32)}
     */
    static RANGEMIN_StatusSvc_SignalStrength => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RANGEMAX_StatusSvc_SignalStrength => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RANGESTEP_StatusSvc_SignalStrength => 1

    /**
     * @type {String}
     */
    static NAME_StatusSvc_TextMessages => "TextMessages"

    /**
     * @type {Integer (UInt32)}
     */
    static RANGEMAX_StatusSvc_TextMessages => 255

    /**
     * @type {String}
     */
    static NAME_StatusSvc_NewPictures => "NewPictures"

    /**
     * @type {Integer (UInt32)}
     */
    static RANGEMAX_StatusSvc_NewPictures => 65535

    /**
     * @type {String}
     */
    static NAME_StatusSvc_MissedCalls => "MissedCalls"

    /**
     * @type {Integer (UInt32)}
     */
    static RANGEMAX_StatusSvc_MissedCalls => 255

    /**
     * @type {String}
     */
    static NAME_StatusSvc_VoiceMail => "VoiceMail"

    /**
     * @type {Integer (UInt32)}
     */
    static RANGEMAX_StatusSvc_VoiceMail => 255

    /**
     * @type {String}
     */
    static NAME_StatusSvc_NetworkName => "NetworkName"

    /**
     * @type {String}
     */
    static NAME_StatusSvc_NetworkType => "NetworkType"

    /**
     * @type {String}
     */
    static NAME_StatusSvc_Roaming => "Roaming"

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_StatusSvc_RoamingInactive => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_StatusSvc_RoamingActive => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_StatusSvc_RoamingUnknown => 2

    /**
     * @type {String}
     */
    static NAME_StatusSvc_BatteryLife => "BatteryLife"

    /**
     * @type {Integer (UInt32)}
     */
    static RANGEMIN_StatusSvc_BatteryLife => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RANGEMAX_StatusSvc_BatteryLife => 100

    /**
     * @type {Integer (UInt32)}
     */
    static RANGESTEP_StatusSvc_BatteryLife => 1

    /**
     * @type {String}
     */
    static NAME_StatusSvc_ChargingState => "ChargingState"

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_StatusSvc_ChargingInactive => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_StatusSvc_ChargingActive => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_StatusSvc_ChargingUnknown => 2

    /**
     * @type {String}
     */
    static NAME_StatusSvc_StorageCapacity => "StorageCapacity"

    /**
     * @type {String}
     */
    static NAME_StatusSvc_StorageFreeSpace => "StorageFreeSpace"

    /**
     * @type {String}
     */
    static NAME_SyncSvc_SyncFormat => "SyncFormat"

    /**
     * @type {String}
     */
    static NAME_SyncSvc_LocalOnlyDelete => "LocalOnlyDelete"

    /**
     * @type {String}
     */
    static NAME_SyncSvc_FilterType => "FilterType"

    /**
     * @type {Integer (UInt32)}
     */
    static SYNCSVC_FILTER_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SYNCSVC_FILTER_CONTACTS_WITH_PHONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNCSVC_FILTER_TASK_ACTIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYNCSVC_FILTER_CALENDAR_WINDOW_WITH_RECURRENCE => 3

    /**
     * @type {String}
     */
    static NAME_SyncSvc_SyncObjectReferences => "SyncObjectReferences"

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_SyncSvc_SyncObjectReferencesDisabled => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_SyncSvc_SyncObjectReferencesEnabled => 255

    /**
     * @type {String}
     */
    static NAME_SyncObj_LastAuthorProxyID => "LastAuthorProxyID"

    /**
     * @type {String}
     */
    static NAME_SyncSvc_BeginSync => "BeginSync"

    /**
     * @type {String}
     */
    static NAME_SyncSvc_EndSync => "EndSync"

    /**
     * @type {String}
     */
    static NAME_TasksSvc => "Tasks"

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE_TasksSvc => 0

    /**
     * @type {String}
     */
    static NAME_TasksSvc_SyncActiveOnly => "FilterType"

    /**
     * @type {String}
     */
    static NAME_AbstractTask => "AbstractTask"

    /**
     * @type {String}
     */
    static NAME_TaskObj_ReminderDateTime => "ReminderDateTime"

    /**
     * @type {String}
     */
    static NAME_TaskObj_Complete => "Complete"

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_TaskObj_CompleteFalse => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_TaskObj_CompleteTrue => 255

    /**
     * @type {String}
     */
    static NAME_TaskObj_BeginDate => "BeginDate"

    /**
     * @type {String}
     */
    static NAME_TaskObj_EndDate => "EndDate"

    /**
     * @type {Guid}
     */
    static WPD_CATEGORY_MTP_EXT_VENDOR_OPERATIONS => Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_MTP_EXT_GET_SUPPORTED_VENDOR_OPCODES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_MTP_EXT_EXECUTE_COMMAND_WITHOUT_DATA_PHASE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_MTP_EXT_EXECUTE_COMMAND_WITH_DATA_TO_READ {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_MTP_EXT_EXECUTE_COMMAND_WITH_DATA_TO_WRITE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_MTP_EXT_READ_DATA {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_MTP_EXT_WRITE_DATA {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_MTP_EXT_END_DATA_TRANSFER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_COMMAND_MTP_EXT_GET_VENDOR_EXTENSION_DESCRIPTION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_MTP_EXT_OPERATION_CODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1001
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_MTP_EXT_OPERATION_PARAMS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1002
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_MTP_EXT_RESPONSE_CODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1003
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_MTP_EXT_RESPONSE_PARAMS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1004
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_MTP_EXT_VENDOR_OPERATION_CODES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1005
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_MTP_EXT_TRANSFER_CONTEXT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1006
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_MTP_EXT_TRANSFER_TOTAL_DATA_SIZE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1007
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_TO_READ {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1008
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_READ {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1009
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_TO_WRITE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1010
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_WRITTEN {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1011
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_MTP_EXT_TRANSFER_DATA {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1012
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_MTP_EXT_OPTIMAL_TRANSFER_BUFFER_SIZE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1013
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_MTP_EXT_VENDOR_EXTENSION_DESCRIPTION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1014
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static WPD_PROPERTIES_MTP_VENDOR_EXTENDED_OBJECT_PROPS => Guid("{4d545058-4fce-4578-95c8-8698a9bc0f49}")

    /**
     * @type {Guid}
     */
    static WPD_PROPERTIES_MTP_VENDOR_EXTENDED_DEVICE_PROPS => Guid("{4d545058-8900-40b3-8f1d-dc246e1e8370}")

    /**
     * @type {Guid}
     */
    static WPD_EVENT_MTP_VENDOR_EXTENDED_EVENTS => Guid("{00000000-5738-4ff2-8445-be3126691059}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPD_PROPERTY_MTP_EXT_EVENT_PARAMS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4d545058-ef88-4e4d-95c3-4f327f728a96}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1011
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static CLSID_WPD_NAMESPACE_EXTENSION => Guid("{35786d3c-b075-49b9-88dd-029876e11c01}")

    /**
     * @type {Guid}
     */
    static WPDNSE_OBJECT_PROPERTIES_V1 => Guid("{34d71409-4b47-4d80-aaac-3a28a4a3b3e6}")

    /**
     * @type {PROPERTYKEY}
     */
    static WPDNSE_OBJECT_HAS_CONTACT_PHOTO {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{34d71409-4b47-4d80-aaac-3a28a4a3b3e6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPDNSE_OBJECT_HAS_THUMBNAIL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{34d71409-4b47-4d80-aaac-3a28a4a3b3e6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPDNSE_OBJECT_HAS_ICON {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{34d71409-4b47-4d80-aaac-3a28a4a3b3e6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPDNSE_OBJECT_HAS_AUDIO_CLIP {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{34d71409-4b47-4d80-aaac-3a28a4a3b3e6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPDNSE_OBJECT_HAS_ALBUM_ART {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{34d71409-4b47-4d80-aaac-3a28a4a3b3e6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static WPDNSE_OBJECT_OPTIMAL_READ_BLOCK_SIZE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{34d71409-4b47-4d80-aaac-3a28a4a3b3e6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static WPDNSE_PROPSHEET_DEVICE_GENERAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WPDNSE_PROPSHEET_STORAGE_GENERAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WPDNSE_PROPSHEET_CONTENT_GENERAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WPDNSE_PROPSHEET_CONTENT_REFERENCES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WPDNSE_PROPSHEET_CONTENT_RESOURCES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WPDNSE_PROPSHEET_CONTENT_DETAILS => 32

    /**
     * @type {String}
     */
    static STR_WPDNSE_FAST_ENUM => "WPDNSE Fast Enum"

    /**
     * @type {String}
     */
    static STR_WPDNSE_SIMPLE_ITEM => "WPDNSE SimpleItem"

    /**
     * @type {String}
     */
    static NAME_ContactsSvc => "Contacts"

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE_ContactsSvc => 0

    /**
     * @type {String}
     */
    static NAME_ContactSvc_SyncWithPhoneOnly => "FilterType"

    /**
     * @type {String}
     */
    static NAME_AbstractContact => "AbstractContact"

    /**
     * @type {String}
     */
    static NAME_VCard2Contact => "VCard2Contact"

    /**
     * @type {String}
     */
    static NAME_VCard3Contact => "VCard3Contact"

    /**
     * @type {String}
     */
    static NAME_AbstractContactGroup => "AbstractContactGroup"

    /**
     * @type {String}
     */
    static NAME_ContactObj_GivenName => "GivenName"

    /**
     * @type {String}
     */
    static NAME_ContactObj_MiddleNames => "MiddleNames"

    /**
     * @type {String}
     */
    static NAME_ContactObj_FamilyName => "FamilyName"

    /**
     * @type {String}
     */
    static NAME_ContactObj_Title => "Title"

    /**
     * @type {String}
     */
    static NAME_ContactObj_Suffix => "Suffix"

    /**
     * @type {String}
     */
    static NAME_ContactObj_PhoneticGivenName => "PhoneticGivenName"

    /**
     * @type {String}
     */
    static NAME_ContactObj_PhoneticFamilyName => "PhoneticFamilyName"

    /**
     * @type {String}
     */
    static NAME_ContactObj_PersonalAddressFull => "PersonalAddressFull"

    /**
     * @type {String}
     */
    static NAME_ContactObj_PersonalAddressStreet => "PersonalAddressStreet"

    /**
     * @type {String}
     */
    static NAME_ContactObj_PersonalAddressLine2 => "PersonalAddressLine2"

    /**
     * @type {String}
     */
    static NAME_ContactObj_PersonalAddressCity => "PersonalAddressCity"

    /**
     * @type {String}
     */
    static NAME_ContactObj_PersonalAddressRegion => "PersonalAddressRegion"

    /**
     * @type {String}
     */
    static NAME_ContactObj_PersonalAddressPostalCode => "PersonalAddressPostalCode"

    /**
     * @type {String}
     */
    static NAME_ContactObj_PersonalAddressCountry => "PersonalAddressCountry"

    /**
     * @type {String}
     */
    static NAME_ContactObj_BusinessAddressFull => "BusinessAddressFull"

    /**
     * @type {String}
     */
    static NAME_ContactObj_BusinessAddressStreet => "BusinessAddressStreet"

    /**
     * @type {String}
     */
    static NAME_ContactObj_BusinessAddressLine2 => "BusinessAddressLine2"

    /**
     * @type {String}
     */
    static NAME_ContactObj_BusinessAddressCity => "BusinessAddressCity"

    /**
     * @type {String}
     */
    static NAME_ContactObj_BusinessAddressRegion => "BusinessAddressRegion"

    /**
     * @type {String}
     */
    static NAME_ContactObj_BusinessAddressPostalCode => "BusinessAddressPostalCode"

    /**
     * @type {String}
     */
    static NAME_ContactObj_BusinessAddressCountry => "BusinessAddressCountry"

    /**
     * @type {String}
     */
    static NAME_ContactObj_OtherAddressFull => "OtherAddressFull"

    /**
     * @type {String}
     */
    static NAME_ContactObj_OtherAddressStreet => "OtherAddressStreet"

    /**
     * @type {String}
     */
    static NAME_ContactObj_OtherAddressLine2 => "OtherAddressLine2"

    /**
     * @type {String}
     */
    static NAME_ContactObj_OtherAddressCity => "OtherAddressCity"

    /**
     * @type {String}
     */
    static NAME_ContactObj_OtherAddressRegion => "OtherAddressRegion"

    /**
     * @type {String}
     */
    static NAME_ContactObj_OtherAddressPostalCode => "OtherAddressPostalCode"

    /**
     * @type {String}
     */
    static NAME_ContactObj_OtherAddressCountry => "OtherAddressCountry"

    /**
     * @type {String}
     */
    static NAME_ContactObj_Email => "Email"

    /**
     * @type {String}
     */
    static NAME_ContactObj_PersonalEmail => "PersonalEmail"

    /**
     * @type {String}
     */
    static NAME_ContactObj_PersonalEmail2 => "PersonalEmail2"

    /**
     * @type {String}
     */
    static NAME_ContactObj_BusinessEmail => "BusinessEmail"

    /**
     * @type {String}
     */
    static NAME_ContactObj_BusinessEmail2 => "BusinessEmail2"

    /**
     * @type {String}
     */
    static NAME_ContactObj_OtherEmail => "OtherEmail"

    /**
     * @type {String}
     */
    static NAME_ContactObj_Phone => "Phone"

    /**
     * @type {String}
     */
    static NAME_ContactObj_PersonalPhone => "PersonalPhone"

    /**
     * @type {String}
     */
    static NAME_ContactObj_PersonalPhone2 => "PersonalPhone2"

    /**
     * @type {String}
     */
    static NAME_ContactObj_BusinessPhone => "BusinessPhone"

    /**
     * @type {String}
     */
    static NAME_ContactObj_BusinessPhone2 => "BusinessPhone2"

    /**
     * @type {String}
     */
    static NAME_ContactObj_MobilePhone => "MobilePhone"

    /**
     * @type {String}
     */
    static NAME_ContactObj_MobilePhone2 => "MobilePhone2"

    /**
     * @type {String}
     */
    static NAME_ContactObj_PersonalFax => "PersonalFax"

    /**
     * @type {String}
     */
    static NAME_ContactObj_BusinessFax => "BusinessFax"

    /**
     * @type {String}
     */
    static NAME_ContactObj_Pager => "Pager"

    /**
     * @type {String}
     */
    static NAME_ContactObj_OtherPhone => "OtherPhone"

    /**
     * @type {String}
     */
    static NAME_ContactObj_WebAddress => "WebAddress"

    /**
     * @type {String}
     */
    static NAME_ContactObj_PersonalWebAddress => "PersonalWebAddress"

    /**
     * @type {String}
     */
    static NAME_ContactObj_BusinessWebAddress => "BusinessWebAddress"

    /**
     * @type {String}
     */
    static NAME_ContactObj_IMAddress => "IMAddress"

    /**
     * @type {String}
     */
    static NAME_ContactObj_IMAddress2 => "IMAddress2"

    /**
     * @type {String}
     */
    static NAME_ContactObj_IMAddress3 => "IMAddress3"

    /**
     * @type {String}
     */
    static NAME_ContactObj_Organization => "Organization"

    /**
     * @type {String}
     */
    static NAME_ContactObj_PhoneticOrganization => "PhoneticOrganization"

    /**
     * @type {String}
     */
    static NAME_ContactObj_Role => "Role"

    /**
     * @type {String}
     */
    static NAME_ContactObj_Fax => "Fax"

    /**
     * @type {String}
     */
    static NAME_ContactObj_Spouse => "Spouse"

    /**
     * @type {String}
     */
    static NAME_ContactObj_Children => "Children"

    /**
     * @type {String}
     */
    static NAME_ContactObj_Assistant => "Assistant"

    /**
     * @type {String}
     */
    static NAME_ContactObj_Ringtone => "Ringtone"

    /**
     * @type {String}
     */
    static NAME_ContactObj_Birthdate => "Birthdate"

    /**
     * @type {String}
     */
    static NAME_ContactObj_AnniversaryDate => "AnniversaryDate"

    /**
     * @type {String}
     */
    static NAME_RingtonesSvc => "Ringtones"

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE_RingtonesSvc => 0

    /**
     * @type {String}
     */
    static NAME_RingtonesSvc_DefaultRingtone => "DefaultRingtone"

    /**
     * @type {String}
     */
    static NAME_AnchorSyncSvc => "AnchorSync"

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE_AnchorSyncSvc => 1

    /**
     * @type {String}
     */
    static NAME_AnchorSyncSvc_VersionProps => "AnchorVersionProps"

    /**
     * @type {String}
     */
    static NAME_AnchorSyncSvc_ReplicaID => "AnchorReplicaID"

    /**
     * @type {String}
     */
    static NAME_AnchorSyncSvc_KnowledgeObjectID => "AnchorKnowledgeObjectID"

    /**
     * @type {String}
     */
    static NAME_AnchorSyncSvc_LastSyncProxyID => "AnchorLastSyncProxyID"

    /**
     * @type {String}
     */
    static NAME_AnchorSyncSvc_CurrentAnchor => "AnchorCurrentAnchor"

    /**
     * @type {String}
     */
    static NAME_AnchorSyncSvc_ProviderVersion => "AnchorProviderVersion"

    /**
     * @type {String}
     */
    static NAME_AnchorSyncSvc_SyncFormat => "SyncFormat"

    /**
     * @type {String}
     */
    static NAME_AnchorSyncSvc_LocalOnlyDelete => "LocalOnlyDelete"

    /**
     * @type {String}
     */
    static NAME_AnchorSyncSvc_FilterType => "FilterType"

    /**
     * @type {String}
     */
    static NAME_AnchorSyncKnowledge => "AnchorSyncKnowledge"

    /**
     * @type {String}
     */
    static NAME_AnchorResults => "AnchorResults"

    /**
     * @type {String}
     */
    static NAME_AnchorResults_AnchorState => "AnchorState"

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_AnchorResults_AnchorStateNormal => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_AnchorResults_AnchorStateInvalid => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_AnchorResults_AnchorStateOld => 2

    /**
     * @type {String}
     */
    static NAME_AnchorResults_Anchor => "Anchor"

    /**
     * @type {String}
     */
    static NAME_AnchorResults_ResultObjectID => "ResultObjectID"

    /**
     * @type {String}
     */
    static NAME_AnchorSyncSvc_GetChangesSinceAnchor => "GetChangesSinceAnchor"

    /**
     * @type {String}
     */
    static NAME_AnchorSyncSvc_BeginSync => "BeginSync"

    /**
     * @type {String}
     */
    static NAME_AnchorSyncSvc_EndSync => "EndSync"

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_AnchorResults_ItemStateInvalid => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_AnchorResults_ItemStateDeleted => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_AnchorResults_ItemStateCreated => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_AnchorResults_ItemStateUpdated => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_AnchorResults_ItemStateChanged => 4

    /**
     * @type {String}
     */
    static NAME_FullEnumSyncSvc => "FullEnumSync"

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE_FullEnumSyncSvc => 1

    /**
     * @type {String}
     */
    static NAME_FullEnumSyncSvc_VersionProps => "FullEnumVersionProps"

    /**
     * @type {String}
     */
    static NAME_FullEnumSyncSvc_ReplicaID => "FullEnumReplicaID"

    /**
     * @type {String}
     */
    static NAME_FullEnumSyncSvc_KnowledgeObjectID => "FullEnumKnowledgeObjectID"

    /**
     * @type {String}
     */
    static NAME_FullEnumSyncSvc_LastSyncProxyID => "FullEnumLastSyncProxyID"

    /**
     * @type {String}
     */
    static NAME_FullEnumSyncSvc_ProviderVersion => "FullEnumProviderVersion"

    /**
     * @type {String}
     */
    static NAME_FullEnumSyncSvc_SyncFormat => "SyncFormat"

    /**
     * @type {String}
     */
    static NAME_FullEnumSyncSvc_LocalOnlyDelete => "LocalOnlyDelete"

    /**
     * @type {String}
     */
    static NAME_FullEnumSyncSvc_FilterType => "FilterType"

    /**
     * @type {String}
     */
    static NAME_FullEnumSyncKnowledge => "FullEnumSyncKnowledge"

    /**
     * @type {String}
     */
    static NAME_FullEnumSyncSvc_BeginSync => "BeginSync"

    /**
     * @type {String}
     */
    static NAME_FullEnumSyncSvc_EndSync => "EndSync"
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {PWSTR} pszXmlIn 
     * @param {Pointer<PWSTR>} rgszAllowedCspNodes 
     * @param {Integer} dwNumAllowedCspNodes 
     * @returns {BSTR} 
     */
    static DMProcessConfigXMLFiltered(pszXmlIn, rgszAllowedCspNodes, dwNumAllowedCspNodes) {
        pszXmlIn := pszXmlIn is String ? StrPtr(pszXmlIn) : pszXmlIn

        rgszAllowedCspNodesMarshal := rgszAllowedCspNodes is VarRef ? "ptr*" : "ptr"

        pbstrXmlOut := BSTR()
        result := DllCall("DMProcessXMLFiltered.dll\DMProcessConfigXMLFiltered", "ptr", pszXmlIn, rgszAllowedCspNodesMarshal, rgszAllowedCspNodes, "uint", dwNumAllowedCspNodes, "ptr", pbstrXmlOut, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrXmlOut
    }

;@endregion Methods
}
