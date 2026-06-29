#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 */

;@region Constants

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_MTPBTH_IsConnected := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_MTPBTH_IsConnected.fmtid),
    Guid.Ptr, Guid("{ea1237fa-589d-4472-84e4-0abe36fd62ef}"),
    UInt32, 16)
DEVPKEY_MTPBTH_IsConnected.pid := 2

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_WPD := Guid("{6ac27878-a6fa-4155-ba85-f98f491d4f33}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_WPD_PRIVATE := Guid("{ba0c718f-4ded-49b7-bdd3-fabe28661211}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_WPD_SERVICE := Guid("{9ef44f80-3d64-4246-a6aa-206f328d1edc}")

/**
 * @type {Integer (UInt32)}
 */
export global WPD_CONTROL_FUNCTION_GENERIC_MESSAGE := 66

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_WPD_MESSAGE_READWRITE_ACCESS := 4243720

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_WPD_MESSAGE_READ_ACCESS := 4210952

/**
 * @type {String}
 */
export global WPD_DEVICE_OBJECT_ID := "DEVICE"

/**
 * @type {String}
 */
export global PORTABLE_DEVICE_TYPE := "PortableDeviceType"

/**
 * @type {String}
 */
export global PORTABLE_DEVICE_ICON := "Icons"

/**
 * @type {String}
 */
export global PORTABLE_DEVICE_NAMESPACE_TIMEOUT := "PortableDeviceNameSpaceTimeout"

/**
 * @type {String}
 */
export global PORTABLE_DEVICE_NAMESPACE_EXCLUDE_FROM_SHELL := "PortableDeviceNameSpaceExcludeFromShell"

/**
 * @type {String}
 */
export global PORTABLE_DEVICE_NAMESPACE_THUMBNAIL_CONTENT_TYPES := "PortableDeviceNameSpaceThumbnailContentTypes"

/**
 * @type {String}
 */
export global PORTABLE_DEVICE_IS_MASS_STORAGE := "PortableDeviceIsMassStorage"

/**
 * @type {String}
 */
export global PORTABLE_DEVICE_DRM_SCHEME_WMDRM10_PD := "WMDRM10-PD"

/**
 * @type {String}
 */
export global PORTABLE_DEVICE_DRM_SCHEME_PDDRM := "PDDRM"

/**
 * @type {Integer (UInt32)}
 */
export global FACILITY_WPD := 42

/**
 * @type {Integer (Int32)}
 */
export global E_WPD_DEVICE_ALREADY_OPENED := -2144731135

/**
 * @type {Integer (Int32)}
 */
export global E_WPD_DEVICE_NOT_OPEN := -2144731134

/**
 * @type {Integer (Int32)}
 */
export global E_WPD_OBJECT_ALREADY_ATTACHED_TO_DEVICE := -2144731133

/**
 * @type {Integer (Int32)}
 */
export global E_WPD_OBJECT_NOT_ATTACHED_TO_DEVICE := -2144731132

/**
 * @type {Integer (Int32)}
 */
export global E_WPD_OBJECT_NOT_COMMITED := -2144731131

/**
 * @type {Integer (Int32)}
 */
export global E_WPD_DEVICE_IS_HUNG := -2144731130

/**
 * @type {Integer (Int32)}
 */
export global E_WPD_SMS_INVALID_RECIPIENT := -2144731036

/**
 * @type {Integer (Int32)}
 */
export global E_WPD_SMS_INVALID_MESSAGE_BODY := -2144731035

/**
 * @type {Integer (Int32)}
 */
export global E_WPD_SMS_SERVICE_UNAVAILABLE := -2144731034

/**
 * @type {Integer (Int32)}
 */
export global E_WPD_SERVICE_ALREADY_OPENED := -2144730936

/**
 * @type {Integer (Int32)}
 */
export global E_WPD_SERVICE_NOT_OPEN := -2144730935

/**
 * @type {Integer (Int32)}
 */
export global E_WPD_OBJECT_ALREADY_ATTACHED_TO_SERVICE := -2144730934

/**
 * @type {Integer (Int32)}
 */
export global E_WPD_OBJECT_NOT_ATTACHED_TO_SERVICE := -2144730933

/**
 * @type {Integer (Int32)}
 */
export global E_WPD_SERVICE_BAD_PARAMETER_ORDER := -2144730932

/**
 * @type {Guid}
 */
export global WPD_EVENT_NOTIFICATION := Guid("{2ba2e40a-6b4c-4295-bb43-26322b99aeb2}")

/**
 * @type {Guid}
 */
export global WPD_EVENT_OBJECT_ADDED := Guid("{a726da95-e207-4b02-8d44-bef2e86cbffc}")

/**
 * @type {Guid}
 */
export global WPD_EVENT_OBJECT_REMOVED := Guid("{be82ab88-a52c-4823-96e5-d0272671fc38}")

/**
 * @type {Guid}
 */
export global WPD_EVENT_OBJECT_UPDATED := Guid("{1445a759-2e01-485d-9f27-ff07dae697ab}")

/**
 * @type {Guid}
 */
export global WPD_EVENT_DEVICE_RESET := Guid("{7755cf53-c1ed-44f3-b5a2-451e2c376b27}")

/**
 * @type {Guid}
 */
export global WPD_EVENT_DEVICE_CAPABILITIES_UPDATED := Guid("{36885aa1-cd54-4daa-b3d0-afb3e03f5999}")

/**
 * @type {Guid}
 */
export global WPD_EVENT_STORAGE_FORMAT := Guid("{3782616b-22bc-4474-a251-3070f8d38857}")

/**
 * @type {Guid}
 */
export global WPD_EVENT_OBJECT_TRANSFER_REQUESTED := Guid("{8d16a0a1-f2c6-41da-8f19-5e53721adbf2}")

/**
 * @type {Guid}
 */
export global WPD_EVENT_DEVICE_REMOVED := Guid("{e4cbca1b-6918-48b9-85ee-02be7c850af9}")

/**
 * @type {Guid}
 */
export global WPD_EVENT_SERVICE_METHOD_COMPLETE := Guid("{8a33f5f8-0acc-4d9b-9cc4-112d353b86ca}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_FUNCTIONAL_OBJECT := Guid("{99ed0160-17ff-4c44-9d98-1d7a6f941921}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_FOLDER := Guid("{27e2e392-a111-48e0-ab0c-e17705a05f85}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_IMAGE := Guid("{ef2107d5-a52a-4243-a26b-62d4176d7603}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_DOCUMENT := Guid("{680adf52-950a-4041-9b41-65e393648155}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_CONTACT := Guid("{eaba8313-4525-4707-9f0e-87c6808e9435}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_CONTACT_GROUP := Guid("{346b8932-4c36-40d8-9415-1828291f9de9}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_AUDIO := Guid("{4ad2c85e-5e2d-45e5-8864-4f229e3c6cf0}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_VIDEO := Guid("{9261b03c-3d78-4519-85e3-02c5e1f50bb9}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_TELEVISION := Guid("{60a169cf-f2ae-4e21-9375-9677f11c1c6e}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_PLAYLIST := Guid("{1a33f7e4-af13-48f5-994e-77369dfe04a3}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_MIXED_CONTENT_ALBUM := Guid("{00f0c3ac-a593-49ac-9219-24abca5a2563}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_AUDIO_ALBUM := Guid("{aa18737e-5009-48fa-ae21-85f24383b4e6}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_IMAGE_ALBUM := Guid("{75793148-15f5-4a30-a813-54ed8a37e226}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_VIDEO_ALBUM := Guid("{012b0db7-d4c1-45d6-b081-94b87779614f}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_MEMO := Guid("{9cd20ecf-3b50-414f-a641-e473ffe45751}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_EMAIL := Guid("{8038044a-7e51-4f8f-883d-1d0623d14533}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_APPOINTMENT := Guid("{0fed060e-8793-4b1e-90c9-48ac389ac631}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_TASK := Guid("{63252f2c-887f-4cb6-b1ac-d29855dcef6c}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_PROGRAM := Guid("{d269f96a-247c-4bff-98fb-97f3c49220e6}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_GENERIC_FILE := Guid("{0085e0a6-8d34-45d7-bc5c-447e59c73d48}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_CALENDAR := Guid("{a1fd5967-6023-49a0-9df1-f8060be751b0}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_GENERIC_MESSAGE := Guid("{e80eaaf8-b2db-4133-b67e-1bef4b4a6e5f}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_NETWORK_ASSOCIATION := Guid("{031da7ee-18c8-4205-847e-89a11261d0f3}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_CERTIFICATE := Guid("{dc3876e8-a948-4060-9050-cbd77e8a3d87}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_WIRELESS_PROFILE := Guid("{0bac070a-9f5f-4da4-a8f6-3de44d68fd6c}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_MEDIA_CAST := Guid("{5e88b3cc-3e65-4e62-bfff-229495253ab0}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_SECTION := Guid("{821089f5-1d91-4dc9-be3c-bbb1b35b18ce}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_UNSPECIFIED := Guid("{28d8d31e-249c-454e-aabc-34883168e634}")

/**
 * @type {Guid}
 */
export global WPD_CONTENT_TYPE_ALL := Guid("{80e170d2-1055-4a3e-b952-82cc4f8a8689}")

/**
 * @type {Guid}
 */
export global WPD_FUNCTIONAL_CATEGORY_DEVICE := Guid("{08ea466b-e3a4-4336-a1f3-a44d2b5c438c}")

/**
 * @type {Guid}
 */
export global WPD_FUNCTIONAL_CATEGORY_STORAGE := Guid("{23f05bbc-15de-4c2a-a55b-a9af5ce412ef}")

/**
 * @type {Guid}
 */
export global WPD_FUNCTIONAL_CATEGORY_STILL_IMAGE_CAPTURE := Guid("{613ca327-ab93-4900-b4fa-895bb5874b79}")

/**
 * @type {Guid}
 */
export global WPD_FUNCTIONAL_CATEGORY_AUDIO_CAPTURE := Guid("{3f2a1919-c7c2-4a00-855d-f57cf06debbb}")

/**
 * @type {Guid}
 */
export global WPD_FUNCTIONAL_CATEGORY_VIDEO_CAPTURE := Guid("{e23e5f6b-7243-43aa-8df1-0eb3d968a918}")

/**
 * @type {Guid}
 */
export global WPD_FUNCTIONAL_CATEGORY_SMS := Guid("{0044a0b1-c1e9-4afd-b358-a62c6117c9cf}")

/**
 * @type {Guid}
 */
export global WPD_FUNCTIONAL_CATEGORY_RENDERING_INFORMATION := Guid("{08600ba4-a7ba-4a01-ab0e-0065d0a356d3}")

/**
 * @type {Guid}
 */
export global WPD_FUNCTIONAL_CATEGORY_NETWORK_CONFIGURATION := Guid("{48f4db72-7c6a-4ab0-9e1a-470e3cdbf26a}")

/**
 * @type {Guid}
 */
export global WPD_FUNCTIONAL_CATEGORY_ALL := Guid("{2d8a6512-a74c-448e-ba8a-f4ac07c49399}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_ICON := Guid("{077232ed-102c-4638-9c22-83f142bfc822}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_M4A := Guid("{30aba7ac-6ffd-4c23-a359-3e9b52f3f1c8}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_NETWORK_ASSOCIATION := Guid("{b1020000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_X509V3CERTIFICATE := Guid("{b1030000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_MICROSOFT_WFC := Guid("{b1040000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_3GPA := Guid("{e5172730-f971-41ef-a10b-2271a0019d7a}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_3G2A := Guid("{1a11202d-8759-4e34-ba5e-b1211087eee4}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_ALL := Guid("{c1f62eb2-4bb3-479c-9cfa-05b5f3a57b22}")

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_NULL := Guid("{00000000-0000-0000-0000-000000000000}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_NULL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_NULL.fmtid),
    Guid.Ptr, Guid("{00000000-0000-0000-0000-000000000000}"),
    UInt32, 16)
WPD_PROPERTY_NULL.pid := 0

/**
 * @type {Guid}
 */
export global WPD_OBJECT_PROPERTIES_V1 := Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_CONTENT_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_CONTENT_TYPE.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_CONTENT_TYPE.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_REFERENCES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_REFERENCES.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_REFERENCES.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_CONTAINER_FUNCTIONAL_OBJECT_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_CONTAINER_FUNCTIONAL_OBJECT_ID.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_CONTAINER_FUNCTIONAL_OBJECT_ID.pid := 23

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_GENERATE_THUMBNAIL_FROM_RESOURCE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_GENERATE_THUMBNAIL_FROM_RESOURCE.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_GENERATE_THUMBNAIL_FROM_RESOURCE.pid := 24

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_HINT_LOCATION_DISPLAY_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_HINT_LOCATION_DISPLAY_NAME.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_HINT_LOCATION_DISPLAY_NAME.pid := 25

/**
 * @type {Guid}
 */
export global WPD_OBJECT_PROPERTIES_V2 := Guid("{0373cd3d-4a46-40d7-b4d8-73e8da74e775}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_SUPPORTED_UNITS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_SUPPORTED_UNITS.fmtid),
    Guid.Ptr, Guid("{0373cd3d-4a46-40d7-b4d8-73e8da74e775}"),
    UInt32, 16)
WPD_OBJECT_SUPPORTED_UNITS.pid := 2

/**
 * @type {Guid}
 */
export global WPD_FUNCTIONAL_OBJECT_PROPERTIES_V1 := Guid("{8f052d93-abca-4fc5-a5ac-b01df4dbe598}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_FUNCTIONAL_OBJECT_CATEGORY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_FUNCTIONAL_OBJECT_CATEGORY.fmtid),
    Guid.Ptr, Guid("{8f052d93-abca-4fc5-a5ac-b01df4dbe598}"),
    UInt32, 16)
WPD_FUNCTIONAL_OBJECT_CATEGORY.pid := 2

/**
 * @type {Guid}
 */
export global WPD_STORAGE_OBJECT_PROPERTIES_V1 := Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STORAGE_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STORAGE_TYPE.fmtid),
    Guid.Ptr, Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}"),
    UInt32, 16)
WPD_STORAGE_TYPE.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STORAGE_FILE_SYSTEM_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STORAGE_FILE_SYSTEM_TYPE.fmtid),
    Guid.Ptr, Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}"),
    UInt32, 16)
WPD_STORAGE_FILE_SYSTEM_TYPE.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STORAGE_CAPACITY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STORAGE_CAPACITY.fmtid),
    Guid.Ptr, Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}"),
    UInt32, 16)
WPD_STORAGE_CAPACITY.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STORAGE_FREE_SPACE_IN_BYTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STORAGE_FREE_SPACE_IN_BYTES.fmtid),
    Guid.Ptr, Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}"),
    UInt32, 16)
WPD_STORAGE_FREE_SPACE_IN_BYTES.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STORAGE_FREE_SPACE_IN_OBJECTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STORAGE_FREE_SPACE_IN_OBJECTS.fmtid),
    Guid.Ptr, Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}"),
    UInt32, 16)
WPD_STORAGE_FREE_SPACE_IN_OBJECTS.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STORAGE_DESCRIPTION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STORAGE_DESCRIPTION.fmtid),
    Guid.Ptr, Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}"),
    UInt32, 16)
WPD_STORAGE_DESCRIPTION.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STORAGE_SERIAL_NUMBER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STORAGE_SERIAL_NUMBER.fmtid),
    Guid.Ptr, Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}"),
    UInt32, 16)
WPD_STORAGE_SERIAL_NUMBER.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STORAGE_MAX_OBJECT_SIZE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STORAGE_MAX_OBJECT_SIZE.fmtid),
    Guid.Ptr, Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}"),
    UInt32, 16)
WPD_STORAGE_MAX_OBJECT_SIZE.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STORAGE_CAPACITY_IN_OBJECTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STORAGE_CAPACITY_IN_OBJECTS.fmtid),
    Guid.Ptr, Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}"),
    UInt32, 16)
WPD_STORAGE_CAPACITY_IN_OBJECTS.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STORAGE_ACCESS_CAPABILITY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STORAGE_ACCESS_CAPABILITY.fmtid),
    Guid.Ptr, Guid("{01a3057a-74d6-4e80-bea7-dc4c212ce50a}"),
    UInt32, 16)
WPD_STORAGE_ACCESS_CAPABILITY.pid := 11

/**
 * @type {Guid}
 */
export global WPD_NETWORK_ASSOCIATION_PROPERTIES_V1 := Guid("{e4c93c1f-b203-43f1-a100-5a07d11b0274}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_NETWORK_ASSOCIATION_HOST_NETWORK_IDENTIFIERS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_NETWORK_ASSOCIATION_HOST_NETWORK_IDENTIFIERS.fmtid),
    Guid.Ptr, Guid("{e4c93c1f-b203-43f1-a100-5a07d11b0274}"),
    UInt32, 16)
WPD_NETWORK_ASSOCIATION_HOST_NETWORK_IDENTIFIERS.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_NETWORK_ASSOCIATION_X509V3SEQUENCE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_NETWORK_ASSOCIATION_X509V3SEQUENCE.fmtid),
    Guid.Ptr, Guid("{e4c93c1f-b203-43f1-a100-5a07d11b0274}"),
    UInt32, 16)
WPD_NETWORK_ASSOCIATION_X509V3SEQUENCE.pid := 3

/**
 * @type {Guid}
 */
export global WPD_STILL_IMAGE_CAPTURE_OBJECT_PROPERTIES_V1 := Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_CAPTURE_RESOLUTION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_CAPTURE_RESOLUTION.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_CAPTURE_RESOLUTION.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_CAPTURE_FORMAT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_CAPTURE_FORMAT.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_CAPTURE_FORMAT.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_COMPRESSION_SETTING := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_COMPRESSION_SETTING.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_COMPRESSION_SETTING.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_WHITE_BALANCE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_WHITE_BALANCE.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_WHITE_BALANCE.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_RGB_GAIN := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_RGB_GAIN.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_RGB_GAIN.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_FNUMBER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_FNUMBER.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_FNUMBER.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_FOCAL_LENGTH := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_FOCAL_LENGTH.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_FOCAL_LENGTH.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_FOCUS_DISTANCE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_FOCUS_DISTANCE.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_FOCUS_DISTANCE.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_FOCUS_MODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_FOCUS_MODE.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_FOCUS_MODE.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_EXPOSURE_METERING_MODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_EXPOSURE_METERING_MODE.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_EXPOSURE_METERING_MODE.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_FLASH_MODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_FLASH_MODE.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_FLASH_MODE.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_EXPOSURE_TIME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_EXPOSURE_TIME.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_EXPOSURE_TIME.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_EXPOSURE_PROGRAM_MODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_EXPOSURE_PROGRAM_MODE.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_EXPOSURE_PROGRAM_MODE.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_EXPOSURE_INDEX := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_EXPOSURE_INDEX.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_EXPOSURE_INDEX.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_EXPOSURE_BIAS_COMPENSATION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_EXPOSURE_BIAS_COMPENSATION.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_EXPOSURE_BIAS_COMPENSATION.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_CAPTURE_DELAY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_CAPTURE_DELAY.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_CAPTURE_DELAY.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_CAPTURE_MODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_CAPTURE_MODE.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_CAPTURE_MODE.pid := 18

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_CONTRAST := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_CONTRAST.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_CONTRAST.pid := 19

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_SHARPNESS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_SHARPNESS.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_SHARPNESS.pid := 20

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_DIGITAL_ZOOM := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_DIGITAL_ZOOM.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_DIGITAL_ZOOM.pid := 21

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_EFFECT_MODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_EFFECT_MODE.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_EFFECT_MODE.pid := 22

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_BURST_NUMBER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_BURST_NUMBER.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_BURST_NUMBER.pid := 23

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_BURST_INTERVAL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_BURST_INTERVAL.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_BURST_INTERVAL.pid := 24

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_TIMELAPSE_NUMBER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_TIMELAPSE_NUMBER.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_TIMELAPSE_NUMBER.pid := 25

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_TIMELAPSE_INTERVAL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_TIMELAPSE_INTERVAL.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_TIMELAPSE_INTERVAL.pid := 26

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_FOCUS_METERING_MODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_FOCUS_METERING_MODE.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_FOCUS_METERING_MODE.pid := 27

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_UPLOAD_URL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_UPLOAD_URL.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_UPLOAD_URL.pid := 28

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_ARTIST := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_ARTIST.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_ARTIST.pid := 29

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_CAMERA_MODEL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_CAMERA_MODEL.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_CAMERA_MODEL.pid := 30

/**
 * @type {PROPERTYKEY}
 */
export global WPD_STILL_IMAGE_CAMERA_MANUFACTURER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_STILL_IMAGE_CAMERA_MANUFACTURER.fmtid),
    Guid.Ptr, Guid("{58c571ec-1bcb-42a7-8ac5-bb291573a260}"),
    UInt32, 16)
WPD_STILL_IMAGE_CAMERA_MANUFACTURER.pid := 31

/**
 * @type {Guid}
 */
export global WPD_RENDERING_INFORMATION_OBJECT_PROPERTIES_V1 := Guid("{c53d039f-ee23-4a31-8590-7639879870b4}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RENDERING_INFORMATION_PROFILES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RENDERING_INFORMATION_PROFILES.fmtid),
    Guid.Ptr, Guid("{c53d039f-ee23-4a31-8590-7639879870b4}"),
    UInt32, 16)
WPD_RENDERING_INFORMATION_PROFILES.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPE.fmtid),
    Guid.Ptr, Guid("{c53d039f-ee23-4a31-8590-7639879870b4}"),
    UInt32, 16)
WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPE.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RENDERING_INFORMATION_PROFILE_ENTRY_CREATABLE_RESOURCES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RENDERING_INFORMATION_PROFILE_ENTRY_CREATABLE_RESOURCES.fmtid),
    Guid.Ptr, Guid("{c53d039f-ee23-4a31-8590-7639879870b4}"),
    UInt32, 16)
WPD_RENDERING_INFORMATION_PROFILE_ENTRY_CREATABLE_RESOURCES.pid := 4

/**
 * @type {Guid}
 */
export global WPD_CLIENT_INFORMATION_PROPERTIES_V1 := Guid("{204d9f0c-2292-4080-9f42-40664e70f859}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLIENT_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLIENT_NAME.fmtid),
    Guid.Ptr, Guid("{204d9f0c-2292-4080-9f42-40664e70f859}"),
    UInt32, 16)
WPD_CLIENT_NAME.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLIENT_MAJOR_VERSION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLIENT_MAJOR_VERSION.fmtid),
    Guid.Ptr, Guid("{204d9f0c-2292-4080-9f42-40664e70f859}"),
    UInt32, 16)
WPD_CLIENT_MAJOR_VERSION.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLIENT_MINOR_VERSION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLIENT_MINOR_VERSION.fmtid),
    Guid.Ptr, Guid("{204d9f0c-2292-4080-9f42-40664e70f859}"),
    UInt32, 16)
WPD_CLIENT_MINOR_VERSION.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLIENT_REVISION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLIENT_REVISION.fmtid),
    Guid.Ptr, Guid("{204d9f0c-2292-4080-9f42-40664e70f859}"),
    UInt32, 16)
WPD_CLIENT_REVISION.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLIENT_WMDRM_APPLICATION_PRIVATE_KEY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLIENT_WMDRM_APPLICATION_PRIVATE_KEY.fmtid),
    Guid.Ptr, Guid("{204d9f0c-2292-4080-9f42-40664e70f859}"),
    UInt32, 16)
WPD_CLIENT_WMDRM_APPLICATION_PRIVATE_KEY.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLIENT_WMDRM_APPLICATION_CERTIFICATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLIENT_WMDRM_APPLICATION_CERTIFICATE.fmtid),
    Guid.Ptr, Guid("{204d9f0c-2292-4080-9f42-40664e70f859}"),
    UInt32, 16)
WPD_CLIENT_WMDRM_APPLICATION_CERTIFICATE.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLIENT_SECURITY_QUALITY_OF_SERVICE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLIENT_SECURITY_QUALITY_OF_SERVICE.fmtid),
    Guid.Ptr, Guid("{204d9f0c-2292-4080-9f42-40664e70f859}"),
    UInt32, 16)
WPD_CLIENT_SECURITY_QUALITY_OF_SERVICE.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLIENT_DESIRED_ACCESS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLIENT_DESIRED_ACCESS.fmtid),
    Guid.Ptr, Guid("{204d9f0c-2292-4080-9f42-40664e70f859}"),
    UInt32, 16)
WPD_CLIENT_DESIRED_ACCESS.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLIENT_SHARE_MODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLIENT_SHARE_MODE.fmtid),
    Guid.Ptr, Guid("{204d9f0c-2292-4080-9f42-40664e70f859}"),
    UInt32, 16)
WPD_CLIENT_SHARE_MODE.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLIENT_EVENT_COOKIE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLIENT_EVENT_COOKIE.fmtid),
    Guid.Ptr, Guid("{204d9f0c-2292-4080-9f42-40664e70f859}"),
    UInt32, 16)
WPD_CLIENT_EVENT_COOKIE.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLIENT_MINIMUM_RESULTS_BUFFER_SIZE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLIENT_MINIMUM_RESULTS_BUFFER_SIZE.fmtid),
    Guid.Ptr, Guid("{204d9f0c-2292-4080-9f42-40664e70f859}"),
    UInt32, 16)
WPD_CLIENT_MINIMUM_RESULTS_BUFFER_SIZE.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLIENT_MANUAL_CLOSE_ON_DISCONNECT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLIENT_MANUAL_CLOSE_ON_DISCONNECT.fmtid),
    Guid.Ptr, Guid("{204d9f0c-2292-4080-9f42-40664e70f859}"),
    UInt32, 16)
WPD_CLIENT_MANUAL_CLOSE_ON_DISCONNECT.pid := 13

/**
 * @type {Guid}
 */
export global WPD_PROPERTY_ATTRIBUTES_V1 := Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_ATTRIBUTE_FORM := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_ATTRIBUTE_FORM.fmtid),
    Guid.Ptr, Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}"),
    UInt32, 16)
WPD_PROPERTY_ATTRIBUTE_FORM.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_ATTRIBUTE_CAN_READ := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_ATTRIBUTE_CAN_READ.fmtid),
    Guid.Ptr, Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}"),
    UInt32, 16)
WPD_PROPERTY_ATTRIBUTE_CAN_READ.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_ATTRIBUTE_CAN_WRITE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_ATTRIBUTE_CAN_WRITE.fmtid),
    Guid.Ptr, Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}"),
    UInt32, 16)
WPD_PROPERTY_ATTRIBUTE_CAN_WRITE.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_ATTRIBUTE_CAN_DELETE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_ATTRIBUTE_CAN_DELETE.fmtid),
    Guid.Ptr, Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}"),
    UInt32, 16)
WPD_PROPERTY_ATTRIBUTE_CAN_DELETE.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_ATTRIBUTE_DEFAULT_VALUE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_ATTRIBUTE_DEFAULT_VALUE.fmtid),
    Guid.Ptr, Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}"),
    UInt32, 16)
WPD_PROPERTY_ATTRIBUTE_DEFAULT_VALUE.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_ATTRIBUTE_FAST_PROPERTY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_ATTRIBUTE_FAST_PROPERTY.fmtid),
    Guid.Ptr, Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}"),
    UInt32, 16)
WPD_PROPERTY_ATTRIBUTE_FAST_PROPERTY.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_ATTRIBUTE_RANGE_MIN := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_ATTRIBUTE_RANGE_MIN.fmtid),
    Guid.Ptr, Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}"),
    UInt32, 16)
WPD_PROPERTY_ATTRIBUTE_RANGE_MIN.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_ATTRIBUTE_RANGE_MAX := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_ATTRIBUTE_RANGE_MAX.fmtid),
    Guid.Ptr, Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}"),
    UInt32, 16)
WPD_PROPERTY_ATTRIBUTE_RANGE_MAX.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_ATTRIBUTE_RANGE_STEP := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_ATTRIBUTE_RANGE_STEP.fmtid),
    Guid.Ptr, Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}"),
    UInt32, 16)
WPD_PROPERTY_ATTRIBUTE_RANGE_STEP.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_ATTRIBUTE_ENUMERATION_ELEMENTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_ATTRIBUTE_ENUMERATION_ELEMENTS.fmtid),
    Guid.Ptr, Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}"),
    UInt32, 16)
WPD_PROPERTY_ATTRIBUTE_ENUMERATION_ELEMENTS.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_ATTRIBUTE_REGULAR_EXPRESSION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_ATTRIBUTE_REGULAR_EXPRESSION.fmtid),
    Guid.Ptr, Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}"),
    UInt32, 16)
WPD_PROPERTY_ATTRIBUTE_REGULAR_EXPRESSION.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_ATTRIBUTE_MAX_SIZE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_ATTRIBUTE_MAX_SIZE.fmtid),
    Guid.Ptr, Guid("{ab7943d8-6332-445f-a00d-8d5ef1e96f37}"),
    UInt32, 16)
WPD_PROPERTY_ATTRIBUTE_MAX_SIZE.pid := 13

/**
 * @type {Guid}
 */
export global WPD_PROPERTY_ATTRIBUTES_V2 := Guid("{5d9da160-74ae-43cc-85a9-fe555a80798e}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_ATTRIBUTE_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_ATTRIBUTE_NAME.fmtid),
    Guid.Ptr, Guid("{5d9da160-74ae-43cc-85a9-fe555a80798e}"),
    UInt32, 16)
WPD_PROPERTY_ATTRIBUTE_NAME.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_ATTRIBUTE_VARTYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_ATTRIBUTE_VARTYPE.fmtid),
    Guid.Ptr, Guid("{5d9da160-74ae-43cc-85a9-fe555a80798e}"),
    UInt32, 16)
WPD_PROPERTY_ATTRIBUTE_VARTYPE.pid := 3

/**
 * @type {Guid}
 */
export global WPD_CLASS_EXTENSION_OPTIONS_V1 := Guid("{6309ffef-a87c-4ca7-8434-797576e40a96}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLASS_EXTENSION_OPTIONS_SUPPORTED_CONTENT_TYPES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLASS_EXTENSION_OPTIONS_SUPPORTED_CONTENT_TYPES.fmtid),
    Guid.Ptr, Guid("{6309ffef-a87c-4ca7-8434-797576e40a96}"),
    UInt32, 16)
WPD_CLASS_EXTENSION_OPTIONS_SUPPORTED_CONTENT_TYPES.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLASS_EXTENSION_OPTIONS_DONT_REGISTER_WPD_DEVICE_INTERFACE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLASS_EXTENSION_OPTIONS_DONT_REGISTER_WPD_DEVICE_INTERFACE.fmtid),
    Guid.Ptr, Guid("{6309ffef-a87c-4ca7-8434-797576e40a96}"),
    UInt32, 16)
WPD_CLASS_EXTENSION_OPTIONS_DONT_REGISTER_WPD_DEVICE_INTERFACE.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLASS_EXTENSION_OPTIONS_REGISTER_WPD_PRIVATE_DEVICE_INTERFACE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLASS_EXTENSION_OPTIONS_REGISTER_WPD_PRIVATE_DEVICE_INTERFACE.fmtid),
    Guid.Ptr, Guid("{6309ffef-a87c-4ca7-8434-797576e40a96}"),
    UInt32, 16)
WPD_CLASS_EXTENSION_OPTIONS_REGISTER_WPD_PRIVATE_DEVICE_INTERFACE.pid := 4

/**
 * @type {Guid}
 */
export global WPD_CLASS_EXTENSION_OPTIONS_V2 := Guid("{3e3595da-4d71-49fe-a0b4-d4406c3ae93f}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLASS_EXTENSION_OPTIONS_MULTITRANSPORT_MODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLASS_EXTENSION_OPTIONS_MULTITRANSPORT_MODE.fmtid),
    Guid.Ptr, Guid("{3e3595da-4d71-49fe-a0b4-d4406c3ae93f}"),
    UInt32, 16)
WPD_CLASS_EXTENSION_OPTIONS_MULTITRANSPORT_MODE.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLASS_EXTENSION_OPTIONS_DEVICE_IDENTIFICATION_VALUES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLASS_EXTENSION_OPTIONS_DEVICE_IDENTIFICATION_VALUES.fmtid),
    Guid.Ptr, Guid("{3e3595da-4d71-49fe-a0b4-d4406c3ae93f}"),
    UInt32, 16)
WPD_CLASS_EXTENSION_OPTIONS_DEVICE_IDENTIFICATION_VALUES.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLASS_EXTENSION_OPTIONS_TRANSPORT_BANDWIDTH := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLASS_EXTENSION_OPTIONS_TRANSPORT_BANDWIDTH.fmtid),
    Guid.Ptr, Guid("{3e3595da-4d71-49fe-a0b4-d4406c3ae93f}"),
    UInt32, 16)
WPD_CLASS_EXTENSION_OPTIONS_TRANSPORT_BANDWIDTH.pid := 4

/**
 * @type {Guid}
 */
export global WPD_CLASS_EXTENSION_OPTIONS_V3 := Guid("{65c160f8-1367-4ce2-939d-8310839f0d30}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CLASS_EXTENSION_OPTIONS_SILENCE_AUTOPLAY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CLASS_EXTENSION_OPTIONS_SILENCE_AUTOPLAY.fmtid),
    Guid.Ptr, Guid("{65c160f8-1367-4ce2-939d-8310839f0d30}"),
    UInt32, 16)
WPD_CLASS_EXTENSION_OPTIONS_SILENCE_AUTOPLAY.pid := 2

/**
 * @type {Guid}
 */
export global WPD_RESOURCE_ATTRIBUTES_V1 := Guid("{1eb6f604-9278-429f-93cc-5bb8c06656b6}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RESOURCE_ATTRIBUTE_TOTAL_SIZE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RESOURCE_ATTRIBUTE_TOTAL_SIZE.fmtid),
    Guid.Ptr, Guid("{1eb6f604-9278-429f-93cc-5bb8c06656b6}"),
    UInt32, 16)
WPD_RESOURCE_ATTRIBUTE_TOTAL_SIZE.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RESOURCE_ATTRIBUTE_CAN_READ := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RESOURCE_ATTRIBUTE_CAN_READ.fmtid),
    Guid.Ptr, Guid("{1eb6f604-9278-429f-93cc-5bb8c06656b6}"),
    UInt32, 16)
WPD_RESOURCE_ATTRIBUTE_CAN_READ.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RESOURCE_ATTRIBUTE_CAN_WRITE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RESOURCE_ATTRIBUTE_CAN_WRITE.fmtid),
    Guid.Ptr, Guid("{1eb6f604-9278-429f-93cc-5bb8c06656b6}"),
    UInt32, 16)
WPD_RESOURCE_ATTRIBUTE_CAN_WRITE.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RESOURCE_ATTRIBUTE_CAN_DELETE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RESOURCE_ATTRIBUTE_CAN_DELETE.fmtid),
    Guid.Ptr, Guid("{1eb6f604-9278-429f-93cc-5bb8c06656b6}"),
    UInt32, 16)
WPD_RESOURCE_ATTRIBUTE_CAN_DELETE.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RESOURCE_ATTRIBUTE_OPTIMAL_READ_BUFFER_SIZE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RESOURCE_ATTRIBUTE_OPTIMAL_READ_BUFFER_SIZE.fmtid),
    Guid.Ptr, Guid("{1eb6f604-9278-429f-93cc-5bb8c06656b6}"),
    UInt32, 16)
WPD_RESOURCE_ATTRIBUTE_OPTIMAL_READ_BUFFER_SIZE.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RESOURCE_ATTRIBUTE_OPTIMAL_WRITE_BUFFER_SIZE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RESOURCE_ATTRIBUTE_OPTIMAL_WRITE_BUFFER_SIZE.fmtid),
    Guid.Ptr, Guid("{1eb6f604-9278-429f-93cc-5bb8c06656b6}"),
    UInt32, 16)
WPD_RESOURCE_ATTRIBUTE_OPTIMAL_WRITE_BUFFER_SIZE.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RESOURCE_ATTRIBUTE_FORMAT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RESOURCE_ATTRIBUTE_FORMAT.fmtid),
    Guid.Ptr, Guid("{1eb6f604-9278-429f-93cc-5bb8c06656b6}"),
    UInt32, 16)
WPD_RESOURCE_ATTRIBUTE_FORMAT.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RESOURCE_ATTRIBUTE_RESOURCE_KEY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RESOURCE_ATTRIBUTE_RESOURCE_KEY.fmtid),
    Guid.Ptr, Guid("{1eb6f604-9278-429f-93cc-5bb8c06656b6}"),
    UInt32, 16)
WPD_RESOURCE_ATTRIBUTE_RESOURCE_KEY.pid := 9

/**
 * @type {Guid}
 */
export global WPD_DEVICE_PROPERTIES_V1 := Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_SYNC_PARTNER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_SYNC_PARTNER.fmtid),
    Guid.Ptr, Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}"),
    UInt32, 16)
WPD_DEVICE_SYNC_PARTNER.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_FIRMWARE_VERSION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_FIRMWARE_VERSION.fmtid),
    Guid.Ptr, Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}"),
    UInt32, 16)
WPD_DEVICE_FIRMWARE_VERSION.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_POWER_LEVEL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_POWER_LEVEL.fmtid),
    Guid.Ptr, Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}"),
    UInt32, 16)
WPD_DEVICE_POWER_LEVEL.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_POWER_SOURCE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_POWER_SOURCE.fmtid),
    Guid.Ptr, Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}"),
    UInt32, 16)
WPD_DEVICE_POWER_SOURCE.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_PROTOCOL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_PROTOCOL.fmtid),
    Guid.Ptr, Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}"),
    UInt32, 16)
WPD_DEVICE_PROTOCOL.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_MANUFACTURER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_MANUFACTURER.fmtid),
    Guid.Ptr, Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}"),
    UInt32, 16)
WPD_DEVICE_MANUFACTURER.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_MODEL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_MODEL.fmtid),
    Guid.Ptr, Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}"),
    UInt32, 16)
WPD_DEVICE_MODEL.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_SERIAL_NUMBER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_SERIAL_NUMBER.fmtid),
    Guid.Ptr, Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}"),
    UInt32, 16)
WPD_DEVICE_SERIAL_NUMBER.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_SUPPORTS_NON_CONSUMABLE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_SUPPORTS_NON_CONSUMABLE.fmtid),
    Guid.Ptr, Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}"),
    UInt32, 16)
WPD_DEVICE_SUPPORTS_NON_CONSUMABLE.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_DATETIME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_DATETIME.fmtid),
    Guid.Ptr, Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}"),
    UInt32, 16)
WPD_DEVICE_DATETIME.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_FRIENDLY_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_FRIENDLY_NAME.fmtid),
    Guid.Ptr, Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}"),
    UInt32, 16)
WPD_DEVICE_FRIENDLY_NAME.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_SUPPORTED_DRM_SCHEMES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_SUPPORTED_DRM_SCHEMES.fmtid),
    Guid.Ptr, Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}"),
    UInt32, 16)
WPD_DEVICE_SUPPORTED_DRM_SCHEMES.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_SUPPORTED_FORMATS_ARE_ORDERED := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_SUPPORTED_FORMATS_ARE_ORDERED.fmtid),
    Guid.Ptr, Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}"),
    UInt32, 16)
WPD_DEVICE_SUPPORTED_FORMATS_ARE_ORDERED.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_TYPE.fmtid),
    Guid.Ptr, Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}"),
    UInt32, 16)
WPD_DEVICE_TYPE.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_NETWORK_IDENTIFIER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_NETWORK_IDENTIFIER.fmtid),
    Guid.Ptr, Guid("{26d4979a-e643-4626-9e2b-736dc0c92fdc}"),
    UInt32, 16)
WPD_DEVICE_NETWORK_IDENTIFIER.pid := 16

/**
 * @type {Guid}
 */
export global WPD_DEVICE_PROPERTIES_V2 := Guid("{463dd662-7fc4-4291-911c-7f4c9cca9799}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_FUNCTIONAL_UNIQUE_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_FUNCTIONAL_UNIQUE_ID.fmtid),
    Guid.Ptr, Guid("{463dd662-7fc4-4291-911c-7f4c9cca9799}"),
    UInt32, 16)
WPD_DEVICE_FUNCTIONAL_UNIQUE_ID.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_MODEL_UNIQUE_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_MODEL_UNIQUE_ID.fmtid),
    Guid.Ptr, Guid("{463dd662-7fc4-4291-911c-7f4c9cca9799}"),
    UInt32, 16)
WPD_DEVICE_MODEL_UNIQUE_ID.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_TRANSPORT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_TRANSPORT.fmtid),
    Guid.Ptr, Guid("{463dd662-7fc4-4291-911c-7f4c9cca9799}"),
    UInt32, 16)
WPD_DEVICE_TRANSPORT.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_USE_DEVICE_STAGE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_USE_DEVICE_STAGE.fmtid),
    Guid.Ptr, Guid("{463dd662-7fc4-4291-911c-7f4c9cca9799}"),
    UInt32, 16)
WPD_DEVICE_USE_DEVICE_STAGE.pid := 5

/**
 * @type {Guid}
 */
export global WPD_DEVICE_PROPERTIES_V3 := Guid("{6c2b878c-c2ec-490d-b425-d7a75e23e5ed}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_DEVICE_EDP_IDENTITY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_DEVICE_EDP_IDENTITY.fmtid),
    Guid.Ptr, Guid("{6c2b878c-c2ec-490d-b425-d7a75e23e5ed}"),
    UInt32, 16)
WPD_DEVICE_EDP_IDENTITY.pid := 1

/**
 * @type {Guid}
 */
export global WPD_SERVICE_PROPERTIES_V1 := Guid("{7510698a-cb54-481c-b8db-0d75c93f1c06}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_SERVICE_VERSION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_SERVICE_VERSION.fmtid),
    Guid.Ptr, Guid("{7510698a-cb54-481c-b8db-0d75c93f1c06}"),
    UInt32, 16)
WPD_SERVICE_VERSION.pid := 2

/**
 * @type {Guid}
 */
export global WPD_EVENT_PROPERTIES_V1 := Guid("{15ab1953-f817-4fef-a921-5676e838f6e0}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EVENT_PARAMETER_PNP_DEVICE_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EVENT_PARAMETER_PNP_DEVICE_ID.fmtid),
    Guid.Ptr, Guid("{15ab1953-f817-4fef-a921-5676e838f6e0}"),
    UInt32, 16)
WPD_EVENT_PARAMETER_PNP_DEVICE_ID.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EVENT_PARAMETER_EVENT_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EVENT_PARAMETER_EVENT_ID.fmtid),
    Guid.Ptr, Guid("{15ab1953-f817-4fef-a921-5676e838f6e0}"),
    UInt32, 16)
WPD_EVENT_PARAMETER_EVENT_ID.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EVENT_PARAMETER_OPERATION_STATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EVENT_PARAMETER_OPERATION_STATE.fmtid),
    Guid.Ptr, Guid("{15ab1953-f817-4fef-a921-5676e838f6e0}"),
    UInt32, 16)
WPD_EVENT_PARAMETER_OPERATION_STATE.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EVENT_PARAMETER_OPERATION_PROGRESS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EVENT_PARAMETER_OPERATION_PROGRESS.fmtid),
    Guid.Ptr, Guid("{15ab1953-f817-4fef-a921-5676e838f6e0}"),
    UInt32, 16)
WPD_EVENT_PARAMETER_OPERATION_PROGRESS.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EVENT_PARAMETER_OBJECT_PARENT_PERSISTENT_UNIQUE_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EVENT_PARAMETER_OBJECT_PARENT_PERSISTENT_UNIQUE_ID.fmtid),
    Guid.Ptr, Guid("{15ab1953-f817-4fef-a921-5676e838f6e0}"),
    UInt32, 16)
WPD_EVENT_PARAMETER_OBJECT_PARENT_PERSISTENT_UNIQUE_ID.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EVENT_PARAMETER_OBJECT_CREATION_COOKIE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EVENT_PARAMETER_OBJECT_CREATION_COOKIE.fmtid),
    Guid.Ptr, Guid("{15ab1953-f817-4fef-a921-5676e838f6e0}"),
    UInt32, 16)
WPD_EVENT_PARAMETER_OBJECT_CREATION_COOKIE.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EVENT_PARAMETER_CHILD_HIERARCHY_CHANGED := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EVENT_PARAMETER_CHILD_HIERARCHY_CHANGED.fmtid),
    Guid.Ptr, Guid("{15ab1953-f817-4fef-a921-5676e838f6e0}"),
    UInt32, 16)
WPD_EVENT_PARAMETER_CHILD_HIERARCHY_CHANGED.pid := 8

/**
 * @type {Guid}
 */
export global WPD_EVENT_PROPERTIES_V2 := Guid("{52807b8a-4914-4323-9b9a-74f654b2b846}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EVENT_PARAMETER_SERVICE_METHOD_CONTEXT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EVENT_PARAMETER_SERVICE_METHOD_CONTEXT.fmtid),
    Guid.Ptr, Guid("{52807b8a-4914-4323-9b9a-74f654b2b846}"),
    UInt32, 16)
WPD_EVENT_PARAMETER_SERVICE_METHOD_CONTEXT.pid := 2

/**
 * @type {Guid}
 */
export global WPD_EVENT_OPTIONS_V1 := Guid("{b3d8dad7-a361-4b83-8a48-5b02ce10713b}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EVENT_OPTION_IS_BROADCAST_EVENT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EVENT_OPTION_IS_BROADCAST_EVENT.fmtid),
    Guid.Ptr, Guid("{b3d8dad7-a361-4b83-8a48-5b02ce10713b}"),
    UInt32, 16)
WPD_EVENT_OPTION_IS_BROADCAST_EVENT.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EVENT_OPTION_IS_AUTOPLAY_EVENT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EVENT_OPTION_IS_AUTOPLAY_EVENT.fmtid),
    Guid.Ptr, Guid("{b3d8dad7-a361-4b83-8a48-5b02ce10713b}"),
    UInt32, 16)
WPD_EVENT_OPTION_IS_AUTOPLAY_EVENT.pid := 3

/**
 * @type {Guid}
 */
export global WPD_EVENT_ATTRIBUTES_V1 := Guid("{10c96578-2e81-4111-adde-e08ca6138f6d}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EVENT_ATTRIBUTE_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EVENT_ATTRIBUTE_NAME.fmtid),
    Guid.Ptr, Guid("{10c96578-2e81-4111-adde-e08ca6138f6d}"),
    UInt32, 16)
WPD_EVENT_ATTRIBUTE_NAME.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EVENT_ATTRIBUTE_PARAMETERS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EVENT_ATTRIBUTE_PARAMETERS.fmtid),
    Guid.Ptr, Guid("{10c96578-2e81-4111-adde-e08ca6138f6d}"),
    UInt32, 16)
WPD_EVENT_ATTRIBUTE_PARAMETERS.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EVENT_ATTRIBUTE_OPTIONS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EVENT_ATTRIBUTE_OPTIONS.fmtid),
    Guid.Ptr, Guid("{10c96578-2e81-4111-adde-e08ca6138f6d}"),
    UInt32, 16)
WPD_EVENT_ATTRIBUTE_OPTIONS.pid := 4

/**
 * @type {Guid}
 */
export global WPD_API_OPTIONS_V1 := Guid("{10e54a3e-052d-4777-a13c-de7614be2bc4}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_API_OPTION_USE_CLEAR_DATA_STREAM := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_API_OPTION_USE_CLEAR_DATA_STREAM.fmtid),
    Guid.Ptr, Guid("{10e54a3e-052d-4777-a13c-de7614be2bc4}"),
    UInt32, 16)
WPD_API_OPTION_USE_CLEAR_DATA_STREAM.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_API_OPTION_IOCTL_ACCESS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_API_OPTION_IOCTL_ACCESS.fmtid),
    Guid.Ptr, Guid("{10e54a3e-052d-4777-a13c-de7614be2bc4}"),
    UInt32, 16)
WPD_API_OPTION_IOCTL_ACCESS.pid := 3

/**
 * @type {Guid}
 */
export global WPD_FORMAT_ATTRIBUTES_V1 := Guid("{a0a02000-bcaf-4be8-b3f5-233f231cf58f}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_FORMAT_ATTRIBUTE_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_FORMAT_ATTRIBUTE_NAME.fmtid),
    Guid.Ptr, Guid("{a0a02000-bcaf-4be8-b3f5-233f231cf58f}"),
    UInt32, 16)
WPD_FORMAT_ATTRIBUTE_NAME.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_FORMAT_ATTRIBUTE_MIMETYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_FORMAT_ATTRIBUTE_MIMETYPE.fmtid),
    Guid.Ptr, Guid("{a0a02000-bcaf-4be8-b3f5-233f231cf58f}"),
    UInt32, 16)
WPD_FORMAT_ATTRIBUTE_MIMETYPE.pid := 3

/**
 * @type {Guid}
 */
export global WPD_METHOD_ATTRIBUTES_V1 := Guid("{f17a5071-f039-44af-8efe-432cf32e432a}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_METHOD_ATTRIBUTE_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_METHOD_ATTRIBUTE_NAME.fmtid),
    Guid.Ptr, Guid("{f17a5071-f039-44af-8efe-432cf32e432a}"),
    UInt32, 16)
WPD_METHOD_ATTRIBUTE_NAME.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_METHOD_ATTRIBUTE_ASSOCIATED_FORMAT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_METHOD_ATTRIBUTE_ASSOCIATED_FORMAT.fmtid),
    Guid.Ptr, Guid("{f17a5071-f039-44af-8efe-432cf32e432a}"),
    UInt32, 16)
WPD_METHOD_ATTRIBUTE_ASSOCIATED_FORMAT.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_METHOD_ATTRIBUTE_ACCESS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_METHOD_ATTRIBUTE_ACCESS.fmtid),
    Guid.Ptr, Guid("{f17a5071-f039-44af-8efe-432cf32e432a}"),
    UInt32, 16)
WPD_METHOD_ATTRIBUTE_ACCESS.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_METHOD_ATTRIBUTE_PARAMETERS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_METHOD_ATTRIBUTE_PARAMETERS.fmtid),
    Guid.Ptr, Guid("{f17a5071-f039-44af-8efe-432cf32e432a}"),
    UInt32, 16)
WPD_METHOD_ATTRIBUTE_PARAMETERS.pid := 5

/**
 * @type {Guid}
 */
export global WPD_PARAMETER_ATTRIBUTES_V1 := Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PARAMETER_ATTRIBUTE_ORDER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PARAMETER_ATTRIBUTE_ORDER.fmtid),
    Guid.Ptr, Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}"),
    UInt32, 16)
WPD_PARAMETER_ATTRIBUTE_ORDER.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PARAMETER_ATTRIBUTE_USAGE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PARAMETER_ATTRIBUTE_USAGE.fmtid),
    Guid.Ptr, Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}"),
    UInt32, 16)
WPD_PARAMETER_ATTRIBUTE_USAGE.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PARAMETER_ATTRIBUTE_FORM := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PARAMETER_ATTRIBUTE_FORM.fmtid),
    Guid.Ptr, Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}"),
    UInt32, 16)
WPD_PARAMETER_ATTRIBUTE_FORM.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PARAMETER_ATTRIBUTE_DEFAULT_VALUE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PARAMETER_ATTRIBUTE_DEFAULT_VALUE.fmtid),
    Guid.Ptr, Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}"),
    UInt32, 16)
WPD_PARAMETER_ATTRIBUTE_DEFAULT_VALUE.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PARAMETER_ATTRIBUTE_RANGE_MIN := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PARAMETER_ATTRIBUTE_RANGE_MIN.fmtid),
    Guid.Ptr, Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}"),
    UInt32, 16)
WPD_PARAMETER_ATTRIBUTE_RANGE_MIN.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PARAMETER_ATTRIBUTE_RANGE_MAX := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PARAMETER_ATTRIBUTE_RANGE_MAX.fmtid),
    Guid.Ptr, Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}"),
    UInt32, 16)
WPD_PARAMETER_ATTRIBUTE_RANGE_MAX.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PARAMETER_ATTRIBUTE_RANGE_STEP := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PARAMETER_ATTRIBUTE_RANGE_STEP.fmtid),
    Guid.Ptr, Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}"),
    UInt32, 16)
WPD_PARAMETER_ATTRIBUTE_RANGE_STEP.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PARAMETER_ATTRIBUTE_ENUMERATION_ELEMENTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PARAMETER_ATTRIBUTE_ENUMERATION_ELEMENTS.fmtid),
    Guid.Ptr, Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}"),
    UInt32, 16)
WPD_PARAMETER_ATTRIBUTE_ENUMERATION_ELEMENTS.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PARAMETER_ATTRIBUTE_REGULAR_EXPRESSION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PARAMETER_ATTRIBUTE_REGULAR_EXPRESSION.fmtid),
    Guid.Ptr, Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}"),
    UInt32, 16)
WPD_PARAMETER_ATTRIBUTE_REGULAR_EXPRESSION.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PARAMETER_ATTRIBUTE_MAX_SIZE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PARAMETER_ATTRIBUTE_MAX_SIZE.fmtid),
    Guid.Ptr, Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}"),
    UInt32, 16)
WPD_PARAMETER_ATTRIBUTE_MAX_SIZE.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PARAMETER_ATTRIBUTE_VARTYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PARAMETER_ATTRIBUTE_VARTYPE.fmtid),
    Guid.Ptr, Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}"),
    UInt32, 16)
WPD_PARAMETER_ATTRIBUTE_VARTYPE.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PARAMETER_ATTRIBUTE_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PARAMETER_ATTRIBUTE_NAME.fmtid),
    Guid.Ptr, Guid("{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}"),
    UInt32, 16)
WPD_PARAMETER_ATTRIBUTE_NAME.pid := 13

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_COMMON := Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_COMMON_RESET_DEVICE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_COMMON_RESET_DEVICE.fmtid),
    Guid.Ptr, Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}"),
    UInt32, 16)
WPD_COMMAND_COMMON_RESET_DEVICE.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_COMMON_GET_OBJECT_IDS_FROM_PERSISTENT_UNIQUE_IDS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_COMMON_GET_OBJECT_IDS_FROM_PERSISTENT_UNIQUE_IDS.fmtid),
    Guid.Ptr, Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}"),
    UInt32, 16)
WPD_COMMAND_COMMON_GET_OBJECT_IDS_FROM_PERSISTENT_UNIQUE_IDS.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_COMMON_SAVE_CLIENT_INFORMATION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_COMMON_SAVE_CLIENT_INFORMATION.fmtid),
    Guid.Ptr, Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}"),
    UInt32, 16)
WPD_COMMAND_COMMON_SAVE_CLIENT_INFORMATION.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_COMMON_COMMAND_CATEGORY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_COMMON_COMMAND_CATEGORY.fmtid),
    Guid.Ptr, Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}"),
    UInt32, 16)
WPD_PROPERTY_COMMON_COMMAND_CATEGORY.pid := 1001

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_COMMON_COMMAND_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_COMMON_COMMAND_ID.fmtid),
    Guid.Ptr, Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}"),
    UInt32, 16)
WPD_PROPERTY_COMMON_COMMAND_ID.pid := 1002

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_COMMON_HRESULT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_COMMON_HRESULT.fmtid),
    Guid.Ptr, Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}"),
    UInt32, 16)
WPD_PROPERTY_COMMON_HRESULT.pid := 1003

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_COMMON_DRIVER_ERROR_CODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_COMMON_DRIVER_ERROR_CODE.fmtid),
    Guid.Ptr, Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}"),
    UInt32, 16)
WPD_PROPERTY_COMMON_DRIVER_ERROR_CODE.pid := 1004

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_COMMON_COMMAND_TARGET := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_COMMON_COMMAND_TARGET.fmtid),
    Guid.Ptr, Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}"),
    UInt32, 16)
WPD_PROPERTY_COMMON_COMMAND_TARGET.pid := 1006

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_COMMON_PERSISTENT_UNIQUE_IDS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_COMMON_PERSISTENT_UNIQUE_IDS.fmtid),
    Guid.Ptr, Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}"),
    UInt32, 16)
WPD_PROPERTY_COMMON_PERSISTENT_UNIQUE_IDS.pid := 1007

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_COMMON_OBJECT_IDS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_COMMON_OBJECT_IDS.fmtid),
    Guid.Ptr, Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}"),
    UInt32, 16)
WPD_PROPERTY_COMMON_OBJECT_IDS.pid := 1008

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_COMMON_CLIENT_INFORMATION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_COMMON_CLIENT_INFORMATION.fmtid),
    Guid.Ptr, Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}"),
    UInt32, 16)
WPD_PROPERTY_COMMON_CLIENT_INFORMATION.pid := 1009

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_COMMON_CLIENT_INFORMATION_CONTEXT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_COMMON_CLIENT_INFORMATION_CONTEXT.fmtid),
    Guid.Ptr, Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}"),
    UInt32, 16)
WPD_PROPERTY_COMMON_CLIENT_INFORMATION_CONTEXT.pid := 1010

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_COMMON_ACTIVITY_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_COMMON_ACTIVITY_ID.fmtid),
    Guid.Ptr, Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}"),
    UInt32, 16)
WPD_PROPERTY_COMMON_ACTIVITY_ID.pid := 1011

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OPTION_VALID_OBJECT_IDS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OPTION_VALID_OBJECT_IDS.fmtid),
    Guid.Ptr, Guid("{f0422a9c-5dc8-4440-b5bd-5df28835658a}"),
    UInt32, 16)
WPD_OPTION_VALID_OBJECT_IDS.pid := 5001

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_OBJECT_ENUMERATION := Guid("{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_ENUMERATION_START_FIND := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_ENUMERATION_START_FIND.fmtid),
    Guid.Ptr, Guid("{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_ENUMERATION_START_FIND.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_ENUMERATION_FIND_NEXT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_ENUMERATION_FIND_NEXT.fmtid),
    Guid.Ptr, Guid("{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_ENUMERATION_FIND_NEXT.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_ENUMERATION_END_FIND := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_ENUMERATION_END_FIND.fmtid),
    Guid.Ptr, Guid("{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_ENUMERATION_END_FIND.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_ENUMERATION_PARENT_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_ENUMERATION_PARENT_ID.fmtid),
    Guid.Ptr, Guid("{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_ENUMERATION_PARENT_ID.pid := 1001

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_ENUMERATION_FILTER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_ENUMERATION_FILTER.fmtid),
    Guid.Ptr, Guid("{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_ENUMERATION_FILTER.pid := 1002

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_ENUMERATION_OBJECT_IDS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_ENUMERATION_OBJECT_IDS.fmtid),
    Guid.Ptr, Guid("{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_ENUMERATION_OBJECT_IDS.pid := 1003

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_ENUMERATION_CONTEXT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_ENUMERATION_CONTEXT.fmtid),
    Guid.Ptr, Guid("{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_ENUMERATION_CONTEXT.pid := 1004

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_ENUMERATION_NUM_OBJECTS_REQUESTED := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_ENUMERATION_NUM_OBJECTS_REQUESTED.fmtid),
    Guid.Ptr, Guid("{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_ENUMERATION_NUM_OBJECTS_REQUESTED.pid := 1005

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_OBJECT_PROPERTIES := Guid("{9e5582e4-0814-44e6-981a-b2998d583804}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_PROPERTIES_GET_SUPPORTED := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_PROPERTIES_GET_SUPPORTED.fmtid),
    Guid.Ptr, Guid("{9e5582e4-0814-44e6-981a-b2998d583804}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_PROPERTIES_GET_SUPPORTED.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_PROPERTIES_GET_ATTRIBUTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_PROPERTIES_GET_ATTRIBUTES.fmtid),
    Guid.Ptr, Guid("{9e5582e4-0814-44e6-981a-b2998d583804}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_PROPERTIES_GET_ATTRIBUTES.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_PROPERTIES_GET := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_PROPERTIES_GET.fmtid),
    Guid.Ptr, Guid("{9e5582e4-0814-44e6-981a-b2998d583804}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_PROPERTIES_GET.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_PROPERTIES_SET := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_PROPERTIES_SET.fmtid),
    Guid.Ptr, Guid("{9e5582e4-0814-44e6-981a-b2998d583804}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_PROPERTIES_SET.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_PROPERTIES_GET_ALL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_PROPERTIES_GET_ALL.fmtid),
    Guid.Ptr, Guid("{9e5582e4-0814-44e6-981a-b2998d583804}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_PROPERTIES_GET_ALL.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_PROPERTIES_DELETE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_PROPERTIES_DELETE.fmtid),
    Guid.Ptr, Guid("{9e5582e4-0814-44e6-981a-b2998d583804}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_PROPERTIES_DELETE.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_PROPERTIES_OBJECT_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_PROPERTIES_OBJECT_ID.fmtid),
    Guid.Ptr, Guid("{9e5582e4-0814-44e6-981a-b2998d583804}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_PROPERTIES_OBJECT_ID.pid := 1001

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_KEYS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_KEYS.fmtid),
    Guid.Ptr, Guid("{9e5582e4-0814-44e6-981a-b2998d583804}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_KEYS.pid := 1002

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_ATTRIBUTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_ATTRIBUTES.fmtid),
    Guid.Ptr, Guid("{9e5582e4-0814-44e6-981a-b2998d583804}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_ATTRIBUTES.pid := 1003

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_VALUES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_VALUES.fmtid),
    Guid.Ptr, Guid("{9e5582e4-0814-44e6-981a-b2998d583804}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_VALUES.pid := 1004

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_WRITE_RESULTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_WRITE_RESULTS.fmtid),
    Guid.Ptr, Guid("{9e5582e4-0814-44e6-981a-b2998d583804}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_WRITE_RESULTS.pid := 1005

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_DELETE_RESULTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_DELETE_RESULTS.fmtid),
    Guid.Ptr, Guid("{9e5582e4-0814-44e6-981a-b2998d583804}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_PROPERTIES_PROPERTY_DELETE_RESULTS.pid := 1006

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_OBJECT_PROPERTIES_BULK := Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_LIST_START := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_LIST_START.fmtid),
    Guid.Ptr, Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_LIST_START.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_LIST_NEXT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_LIST_NEXT.fmtid),
    Guid.Ptr, Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_LIST_NEXT.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_LIST_END := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_LIST_END.fmtid),
    Guid.Ptr, Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_LIST_END.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_FORMAT_START := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_FORMAT_START.fmtid),
    Guid.Ptr, Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_FORMAT_START.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_FORMAT_NEXT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_FORMAT_NEXT.fmtid),
    Guid.Ptr, Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_FORMAT_NEXT.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_FORMAT_END := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_FORMAT_END.fmtid),
    Guid.Ptr, Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_PROPERTIES_BULK_GET_VALUES_BY_OBJECT_FORMAT_END.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_PROPERTIES_BULK_SET_VALUES_BY_OBJECT_LIST_START := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_PROPERTIES_BULK_SET_VALUES_BY_OBJECT_LIST_START.fmtid),
    Guid.Ptr, Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_PROPERTIES_BULK_SET_VALUES_BY_OBJECT_LIST_START.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_PROPERTIES_BULK_SET_VALUES_BY_OBJECT_LIST_NEXT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_PROPERTIES_BULK_SET_VALUES_BY_OBJECT_LIST_NEXT.fmtid),
    Guid.Ptr, Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_PROPERTIES_BULK_SET_VALUES_BY_OBJECT_LIST_NEXT.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_PROPERTIES_BULK_SET_VALUES_BY_OBJECT_LIST_END := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_PROPERTIES_BULK_SET_VALUES_BY_OBJECT_LIST_END.fmtid),
    Guid.Ptr, Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_PROPERTIES_BULK_SET_VALUES_BY_OBJECT_LIST_END.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_PROPERTIES_BULK_OBJECT_IDS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_PROPERTIES_BULK_OBJECT_IDS.fmtid),
    Guid.Ptr, Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_PROPERTIES_BULK_OBJECT_IDS.pid := 1001

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_PROPERTIES_BULK_CONTEXT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_PROPERTIES_BULK_CONTEXT.fmtid),
    Guid.Ptr, Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_PROPERTIES_BULK_CONTEXT.pid := 1002

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_PROPERTIES_BULK_VALUES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_PROPERTIES_BULK_VALUES.fmtid),
    Guid.Ptr, Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_PROPERTIES_BULK_VALUES.pid := 1003

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_PROPERTIES_BULK_PROPERTY_KEYS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_PROPERTIES_BULK_PROPERTY_KEYS.fmtid),
    Guid.Ptr, Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_PROPERTIES_BULK_PROPERTY_KEYS.pid := 1004

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_PROPERTIES_BULK_DEPTH := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_PROPERTIES_BULK_DEPTH.fmtid),
    Guid.Ptr, Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_PROPERTIES_BULK_DEPTH.pid := 1005

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_PROPERTIES_BULK_PARENT_OBJECT_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_PROPERTIES_BULK_PARENT_OBJECT_ID.fmtid),
    Guid.Ptr, Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_PROPERTIES_BULK_PARENT_OBJECT_ID.pid := 1006

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_PROPERTIES_BULK_OBJECT_FORMAT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_PROPERTIES_BULK_OBJECT_FORMAT.fmtid),
    Guid.Ptr, Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_PROPERTIES_BULK_OBJECT_FORMAT.pid := 1007

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_PROPERTIES_BULK_WRITE_RESULTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_PROPERTIES_BULK_WRITE_RESULTS.fmtid),
    Guid.Ptr, Guid("{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_PROPERTIES_BULK_WRITE_RESULTS.pid := 1008

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_OBJECT_RESOURCES := Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_RESOURCES_GET_SUPPORTED := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_RESOURCES_GET_SUPPORTED.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_RESOURCES_GET_SUPPORTED.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_RESOURCES_GET_ATTRIBUTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_RESOURCES_GET_ATTRIBUTES.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_RESOURCES_GET_ATTRIBUTES.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_RESOURCES_OPEN := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_RESOURCES_OPEN.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_RESOURCES_OPEN.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_RESOURCES_READ := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_RESOURCES_READ.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_RESOURCES_READ.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_RESOURCES_WRITE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_RESOURCES_WRITE.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_RESOURCES_WRITE.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_RESOURCES_CLOSE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_RESOURCES_CLOSE.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_RESOURCES_CLOSE.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_RESOURCES_DELETE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_RESOURCES_DELETE.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_RESOURCES_DELETE.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_RESOURCES_CREATE_RESOURCE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_RESOURCES_CREATE_RESOURCE.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_RESOURCES_CREATE_RESOURCE.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_RESOURCES_REVERT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_RESOURCES_REVERT.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_RESOURCES_REVERT.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_RESOURCES_SEEK := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_RESOURCES_SEEK.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_RESOURCES_SEEK.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_RESOURCES_COMMIT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_RESOURCES_COMMIT.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_RESOURCES_COMMIT.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_RESOURCES_SEEK_IN_UNITS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_RESOURCES_SEEK_IN_UNITS.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_RESOURCES_SEEK_IN_UNITS.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_RESOURCES_OBJECT_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_RESOURCES_OBJECT_ID.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_RESOURCES_OBJECT_ID.pid := 1001

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_RESOURCES_ACCESS_MODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_RESOURCES_ACCESS_MODE.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_RESOURCES_ACCESS_MODE.pid := 1002

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_RESOURCES_RESOURCE_KEYS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_RESOURCES_RESOURCE_KEYS.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_RESOURCES_RESOURCE_KEYS.pid := 1003

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_RESOURCES_RESOURCE_ATTRIBUTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_RESOURCES_RESOURCE_ATTRIBUTES.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_RESOURCES_RESOURCE_ATTRIBUTES.pid := 1004

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_RESOURCES_CONTEXT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_RESOURCES_CONTEXT.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_RESOURCES_CONTEXT.pid := 1005

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_TO_READ := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_TO_READ.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_TO_READ.pid := 1006

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_READ := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_READ.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_READ.pid := 1007

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_TO_WRITE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_TO_WRITE.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_TO_WRITE.pid := 1008

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_WRITTEN := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_WRITTEN.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_RESOURCES_NUM_BYTES_WRITTEN.pid := 1009

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_RESOURCES_DATA := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_RESOURCES_DATA.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_RESOURCES_DATA.pid := 1010

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_RESOURCES_OPTIMAL_TRANSFER_BUFFER_SIZE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_RESOURCES_OPTIMAL_TRANSFER_BUFFER_SIZE.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_RESOURCES_OPTIMAL_TRANSFER_BUFFER_SIZE.pid := 1011

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_RESOURCES_SEEK_OFFSET := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_RESOURCES_SEEK_OFFSET.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_RESOURCES_SEEK_OFFSET.pid := 1012

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_RESOURCES_SEEK_ORIGIN_FLAG := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_RESOURCES_SEEK_ORIGIN_FLAG.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_RESOURCES_SEEK_ORIGIN_FLAG.pid := 1013

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_RESOURCES_POSITION_FROM_START := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_RESOURCES_POSITION_FROM_START.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_RESOURCES_POSITION_FROM_START.pid := 1014

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_RESOURCES_SUPPORTS_UNITS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_RESOURCES_SUPPORTS_UNITS.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_RESOURCES_SUPPORTS_UNITS.pid := 1015

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_RESOURCES_STREAM_UNITS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_RESOURCES_STREAM_UNITS.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_RESOURCES_STREAM_UNITS.pid := 1016

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OPTION_OBJECT_RESOURCES_SEEK_ON_READ_SUPPORTED := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OPTION_OBJECT_RESOURCES_SEEK_ON_READ_SUPPORTED.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_OPTION_OBJECT_RESOURCES_SEEK_ON_READ_SUPPORTED.pid := 5001

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OPTION_OBJECT_RESOURCES_SEEK_ON_WRITE_SUPPORTED := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OPTION_OBJECT_RESOURCES_SEEK_ON_WRITE_SUPPORTED.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_OPTION_OBJECT_RESOURCES_SEEK_ON_WRITE_SUPPORTED.pid := 5002

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OPTION_OBJECT_RESOURCES_NO_INPUT_BUFFER_ON_READ := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OPTION_OBJECT_RESOURCES_NO_INPUT_BUFFER_ON_READ.fmtid),
    Guid.Ptr, Guid("{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"),
    UInt32, 16)
WPD_OPTION_OBJECT_RESOURCES_NO_INPUT_BUFFER_ON_READ.pid := 5003

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_OBJECT_MANAGEMENT := Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_MANAGEMENT_CREATE_OBJECT_WITH_PROPERTIES_ONLY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_MANAGEMENT_CREATE_OBJECT_WITH_PROPERTIES_ONLY.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_MANAGEMENT_CREATE_OBJECT_WITH_PROPERTIES_ONLY.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_MANAGEMENT_CREATE_OBJECT_WITH_PROPERTIES_AND_DATA := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_MANAGEMENT_CREATE_OBJECT_WITH_PROPERTIES_AND_DATA.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_MANAGEMENT_CREATE_OBJECT_WITH_PROPERTIES_AND_DATA.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_MANAGEMENT_WRITE_OBJECT_DATA := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_MANAGEMENT_WRITE_OBJECT_DATA.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_MANAGEMENT_WRITE_OBJECT_DATA.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_MANAGEMENT_COMMIT_OBJECT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_MANAGEMENT_COMMIT_OBJECT.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_MANAGEMENT_COMMIT_OBJECT.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_MANAGEMENT_REVERT_OBJECT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_MANAGEMENT_REVERT_OBJECT.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_MANAGEMENT_REVERT_OBJECT.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_MANAGEMENT_DELETE_OBJECTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_MANAGEMENT_DELETE_OBJECTS.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_MANAGEMENT_DELETE_OBJECTS.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_MANAGEMENT_MOVE_OBJECTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_MANAGEMENT_MOVE_OBJECTS.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_MANAGEMENT_MOVE_OBJECTS.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_MANAGEMENT_COPY_OBJECTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_MANAGEMENT_COPY_OBJECTS.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_MANAGEMENT_COPY_OBJECTS.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_OBJECT_MANAGEMENT_UPDATE_OBJECT_WITH_PROPERTIES_AND_DATA := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_OBJECT_MANAGEMENT_UPDATE_OBJECT_WITH_PROPERTIES_AND_DATA.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_COMMAND_OBJECT_MANAGEMENT_UPDATE_OBJECT_WITH_PROPERTIES_AND_DATA.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_MANAGEMENT_CREATION_PROPERTIES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_MANAGEMENT_CREATION_PROPERTIES.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_MANAGEMENT_CREATION_PROPERTIES.pid := 1001

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_MANAGEMENT_CONTEXT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_MANAGEMENT_CONTEXT.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_MANAGEMENT_CONTEXT.pid := 1002

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_MANAGEMENT_NUM_BYTES_TO_WRITE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_MANAGEMENT_NUM_BYTES_TO_WRITE.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_MANAGEMENT_NUM_BYTES_TO_WRITE.pid := 1003

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_MANAGEMENT_NUM_BYTES_WRITTEN := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_MANAGEMENT_NUM_BYTES_WRITTEN.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_MANAGEMENT_NUM_BYTES_WRITTEN.pid := 1004

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_MANAGEMENT_DATA := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_MANAGEMENT_DATA.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_MANAGEMENT_DATA.pid := 1005

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_MANAGEMENT_OBJECT_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_MANAGEMENT_OBJECT_ID.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_MANAGEMENT_OBJECT_ID.pid := 1006

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_MANAGEMENT_DELETE_OPTIONS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_MANAGEMENT_DELETE_OPTIONS.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_MANAGEMENT_DELETE_OPTIONS.pid := 1007

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_MANAGEMENT_OPTIMAL_TRANSFER_BUFFER_SIZE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_MANAGEMENT_OPTIMAL_TRANSFER_BUFFER_SIZE.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_MANAGEMENT_OPTIMAL_TRANSFER_BUFFER_SIZE.pid := 1008

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_MANAGEMENT_OBJECT_IDS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_MANAGEMENT_OBJECT_IDS.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_MANAGEMENT_OBJECT_IDS.pid := 1009

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_MANAGEMENT_DELETE_RESULTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_MANAGEMENT_DELETE_RESULTS.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_MANAGEMENT_DELETE_RESULTS.pid := 1010

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_MANAGEMENT_DESTINATION_FOLDER_OBJECT_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_MANAGEMENT_DESTINATION_FOLDER_OBJECT_ID.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_MANAGEMENT_DESTINATION_FOLDER_OBJECT_ID.pid := 1011

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_MANAGEMENT_MOVE_RESULTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_MANAGEMENT_MOVE_RESULTS.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_MANAGEMENT_MOVE_RESULTS.pid := 1012

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_MANAGEMENT_COPY_RESULTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_MANAGEMENT_COPY_RESULTS.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_MANAGEMENT_COPY_RESULTS.pid := 1013

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_MANAGEMENT_UPDATE_PROPERTIES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_MANAGEMENT_UPDATE_PROPERTIES.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_MANAGEMENT_UPDATE_PROPERTIES.pid := 1014

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_MANAGEMENT_PROPERTY_KEYS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_MANAGEMENT_PROPERTY_KEYS.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_MANAGEMENT_PROPERTY_KEYS.pid := 1015

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_OBJECT_MANAGEMENT_OBJECT_FORMAT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_OBJECT_MANAGEMENT_OBJECT_FORMAT.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_PROPERTY_OBJECT_MANAGEMENT_OBJECT_FORMAT.pid := 1016

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OPTION_OBJECT_MANAGEMENT_RECURSIVE_DELETE_SUPPORTED := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OPTION_OBJECT_MANAGEMENT_RECURSIVE_DELETE_SUPPORTED.fmtid),
    Guid.Ptr, Guid("{ef1e43dd-a9ed-4341-8bcc-186192aea089}"),
    UInt32, 16)
WPD_OPTION_OBJECT_MANAGEMENT_RECURSIVE_DELETE_SUPPORTED.pid := 5001

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_CAPABILITIES := Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_COMMANDS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_COMMANDS.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_COMMANDS.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_CAPABILITIES_GET_COMMAND_OPTIONS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_CAPABILITIES_GET_COMMAND_OPTIONS.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_COMMAND_CAPABILITIES_GET_COMMAND_OPTIONS.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_FUNCTIONAL_CATEGORIES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_FUNCTIONAL_CATEGORIES.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_FUNCTIONAL_CATEGORIES.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_CAPABILITIES_GET_FUNCTIONAL_OBJECTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_CAPABILITIES_GET_FUNCTIONAL_OBJECTS.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_COMMAND_CAPABILITIES_GET_FUNCTIONAL_OBJECTS.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_CONTENT_TYPES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_CONTENT_TYPES.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_CONTENT_TYPES.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_FORMATS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_FORMATS.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_FORMATS.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_FORMAT_PROPERTIES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_FORMAT_PROPERTIES.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_FORMAT_PROPERTIES.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_CAPABILITIES_GET_FIXED_PROPERTY_ATTRIBUTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_CAPABILITIES_GET_FIXED_PROPERTY_ATTRIBUTES.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_COMMAND_CAPABILITIES_GET_FIXED_PROPERTY_ATTRIBUTES.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_EVENTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_EVENTS.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_COMMAND_CAPABILITIES_GET_SUPPORTED_EVENTS.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_CAPABILITIES_GET_EVENT_OPTIONS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_CAPABILITIES_GET_EVENT_OPTIONS.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_COMMAND_CAPABILITIES_GET_EVENT_OPTIONS.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CAPABILITIES_SUPPORTED_COMMANDS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CAPABILITIES_SUPPORTED_COMMANDS.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_PROPERTY_CAPABILITIES_SUPPORTED_COMMANDS.pid := 1001

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CAPABILITIES_COMMAND := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CAPABILITIES_COMMAND.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_PROPERTY_CAPABILITIES_COMMAND.pid := 1002

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CAPABILITIES_COMMAND_OPTIONS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CAPABILITIES_COMMAND_OPTIONS.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_PROPERTY_CAPABILITIES_COMMAND_OPTIONS.pid := 1003

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CAPABILITIES_FUNCTIONAL_CATEGORIES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CAPABILITIES_FUNCTIONAL_CATEGORIES.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_PROPERTY_CAPABILITIES_FUNCTIONAL_CATEGORIES.pid := 1004

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CAPABILITIES_FUNCTIONAL_CATEGORY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CAPABILITIES_FUNCTIONAL_CATEGORY.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_PROPERTY_CAPABILITIES_FUNCTIONAL_CATEGORY.pid := 1005

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CAPABILITIES_FUNCTIONAL_OBJECTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CAPABILITIES_FUNCTIONAL_OBJECTS.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_PROPERTY_CAPABILITIES_FUNCTIONAL_OBJECTS.pid := 1006

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CAPABILITIES_CONTENT_TYPES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CAPABILITIES_CONTENT_TYPES.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_PROPERTY_CAPABILITIES_CONTENT_TYPES.pid := 1007

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CAPABILITIES_CONTENT_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CAPABILITIES_CONTENT_TYPE.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_PROPERTY_CAPABILITIES_CONTENT_TYPE.pid := 1008

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CAPABILITIES_FORMATS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CAPABILITIES_FORMATS.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_PROPERTY_CAPABILITIES_FORMATS.pid := 1009

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CAPABILITIES_FORMAT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CAPABILITIES_FORMAT.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_PROPERTY_CAPABILITIES_FORMAT.pid := 1010

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CAPABILITIES_PROPERTY_KEYS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CAPABILITIES_PROPERTY_KEYS.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_PROPERTY_CAPABILITIES_PROPERTY_KEYS.pid := 1011

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CAPABILITIES_PROPERTY_ATTRIBUTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CAPABILITIES_PROPERTY_ATTRIBUTES.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_PROPERTY_CAPABILITIES_PROPERTY_ATTRIBUTES.pid := 1012

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CAPABILITIES_SUPPORTED_EVENTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CAPABILITIES_SUPPORTED_EVENTS.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_PROPERTY_CAPABILITIES_SUPPORTED_EVENTS.pid := 1013

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CAPABILITIES_EVENT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CAPABILITIES_EVENT.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_PROPERTY_CAPABILITIES_EVENT.pid := 1014

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CAPABILITIES_EVENT_OPTIONS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CAPABILITIES_EVENT_OPTIONS.fmtid),
    Guid.Ptr, Guid("{0cabec78-6b74-41c6-9216-2639d1fce356}"),
    UInt32, 16)
WPD_PROPERTY_CAPABILITIES_EVENT_OPTIONS.pid := 1015

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_STORAGE := Guid("{d8f907a6-34cc-45fa-97fb-d007fa47ec94}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_STORAGE_FORMAT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_STORAGE_FORMAT.fmtid),
    Guid.Ptr, Guid("{d8f907a6-34cc-45fa-97fb-d007fa47ec94}"),
    UInt32, 16)
WPD_COMMAND_STORAGE_FORMAT.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_STORAGE_EJECT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_STORAGE_EJECT.fmtid),
    Guid.Ptr, Guid("{d8f907a6-34cc-45fa-97fb-d007fa47ec94}"),
    UInt32, 16)
WPD_COMMAND_STORAGE_EJECT.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_STORAGE_OBJECT_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_STORAGE_OBJECT_ID.fmtid),
    Guid.Ptr, Guid("{d8f907a6-34cc-45fa-97fb-d007fa47ec94}"),
    UInt32, 16)
WPD_PROPERTY_STORAGE_OBJECT_ID.pid := 1001

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_STORAGE_DESTINATION_OBJECT_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_STORAGE_DESTINATION_OBJECT_ID.fmtid),
    Guid.Ptr, Guid("{d8f907a6-34cc-45fa-97fb-d007fa47ec94}"),
    UInt32, 16)
WPD_PROPERTY_STORAGE_DESTINATION_OBJECT_ID.pid := 1002

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_SMS := Guid("{afc25d66-fe0d-4114-9097-970c93e920d1}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SMS_SEND := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SMS_SEND.fmtid),
    Guid.Ptr, Guid("{afc25d66-fe0d-4114-9097-970c93e920d1}"),
    UInt32, 16)
WPD_COMMAND_SMS_SEND.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SMS_RECIPIENT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SMS_RECIPIENT.fmtid),
    Guid.Ptr, Guid("{afc25d66-fe0d-4114-9097-970c93e920d1}"),
    UInt32, 16)
WPD_PROPERTY_SMS_RECIPIENT.pid := 1001

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SMS_MESSAGE_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SMS_MESSAGE_TYPE.fmtid),
    Guid.Ptr, Guid("{afc25d66-fe0d-4114-9097-970c93e920d1}"),
    UInt32, 16)
WPD_PROPERTY_SMS_MESSAGE_TYPE.pid := 1002

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SMS_TEXT_MESSAGE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SMS_TEXT_MESSAGE.fmtid),
    Guid.Ptr, Guid("{afc25d66-fe0d-4114-9097-970c93e920d1}"),
    UInt32, 16)
WPD_PROPERTY_SMS_TEXT_MESSAGE.pid := 1003

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SMS_BINARY_MESSAGE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SMS_BINARY_MESSAGE.fmtid),
    Guid.Ptr, Guid("{afc25d66-fe0d-4114-9097-970c93e920d1}"),
    UInt32, 16)
WPD_PROPERTY_SMS_BINARY_MESSAGE.pid := 1004

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OPTION_SMS_BINARY_MESSAGE_SUPPORTED := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OPTION_SMS_BINARY_MESSAGE_SUPPORTED.fmtid),
    Guid.Ptr, Guid("{afc25d66-fe0d-4114-9097-970c93e920d1}"),
    UInt32, 16)
WPD_OPTION_SMS_BINARY_MESSAGE_SUPPORTED.pid := 5001

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_STILL_IMAGE_CAPTURE := Guid("{4fcd6982-22a2-4b05-a48b-62d38bf27b32}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_STILL_IMAGE_CAPTURE_INITIATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_STILL_IMAGE_CAPTURE_INITIATE.fmtid),
    Guid.Ptr, Guid("{4fcd6982-22a2-4b05-a48b-62d38bf27b32}"),
    UInt32, 16)
WPD_COMMAND_STILL_IMAGE_CAPTURE_INITIATE.pid := 2

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_MEDIA_CAPTURE := Guid("{59b433ba-fe44-4d8d-808c-6bcb9b0f15e8}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_MEDIA_CAPTURE_START := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_MEDIA_CAPTURE_START.fmtid),
    Guid.Ptr, Guid("{59b433ba-fe44-4d8d-808c-6bcb9b0f15e8}"),
    UInt32, 16)
WPD_COMMAND_MEDIA_CAPTURE_START.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_MEDIA_CAPTURE_STOP := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_MEDIA_CAPTURE_STOP.fmtid),
    Guid.Ptr, Guid("{59b433ba-fe44-4d8d-808c-6bcb9b0f15e8}"),
    UInt32, 16)
WPD_COMMAND_MEDIA_CAPTURE_STOP.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_MEDIA_CAPTURE_PAUSE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_MEDIA_CAPTURE_PAUSE.fmtid),
    Guid.Ptr, Guid("{59b433ba-fe44-4d8d-808c-6bcb9b0f15e8}"),
    UInt32, 16)
WPD_COMMAND_MEDIA_CAPTURE_PAUSE.pid := 4

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_DEVICE_HINTS := Guid("{0d5fb92b-cb46-4c4f-8343-0bc3d3f17c84}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_DEVICE_HINTS_GET_CONTENT_LOCATION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_DEVICE_HINTS_GET_CONTENT_LOCATION.fmtid),
    Guid.Ptr, Guid("{0d5fb92b-cb46-4c4f-8343-0bc3d3f17c84}"),
    UInt32, 16)
WPD_COMMAND_DEVICE_HINTS_GET_CONTENT_LOCATION.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_DEVICE_HINTS_CONTENT_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_DEVICE_HINTS_CONTENT_TYPE.fmtid),
    Guid.Ptr, Guid("{0d5fb92b-cb46-4c4f-8343-0bc3d3f17c84}"),
    UInt32, 16)
WPD_PROPERTY_DEVICE_HINTS_CONTENT_TYPE.pid := 1001

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_DEVICE_HINTS_CONTENT_LOCATIONS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_DEVICE_HINTS_CONTENT_LOCATIONS.fmtid),
    Guid.Ptr, Guid("{0d5fb92b-cb46-4c4f-8343-0bc3d3f17c84}"),
    UInt32, 16)
WPD_PROPERTY_DEVICE_HINTS_CONTENT_LOCATIONS.pid := 1002

/**
 * @type {Guid}
 */
export global WPD_CLASS_EXTENSION_V1 := Guid("{33fb0d11-64a3-4fac-b4c7-3dfeaa99b051}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_CLASS_EXTENSION_WRITE_DEVICE_INFORMATION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_CLASS_EXTENSION_WRITE_DEVICE_INFORMATION.fmtid),
    Guid.Ptr, Guid("{33fb0d11-64a3-4fac-b4c7-3dfeaa99b051}"),
    UInt32, 16)
WPD_COMMAND_CLASS_EXTENSION_WRITE_DEVICE_INFORMATION.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CLASS_EXTENSION_DEVICE_INFORMATION_VALUES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CLASS_EXTENSION_DEVICE_INFORMATION_VALUES.fmtid),
    Guid.Ptr, Guid("{33fb0d11-64a3-4fac-b4c7-3dfeaa99b051}"),
    UInt32, 16)
WPD_PROPERTY_CLASS_EXTENSION_DEVICE_INFORMATION_VALUES.pid := 1001

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CLASS_EXTENSION_DEVICE_INFORMATION_WRITE_RESULTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CLASS_EXTENSION_DEVICE_INFORMATION_WRITE_RESULTS.fmtid),
    Guid.Ptr, Guid("{33fb0d11-64a3-4fac-b4c7-3dfeaa99b051}"),
    UInt32, 16)
WPD_PROPERTY_CLASS_EXTENSION_DEVICE_INFORMATION_WRITE_RESULTS.pid := 1002

/**
 * @type {Guid}
 */
export global WPD_CLASS_EXTENSION_V2 := Guid("{7f0779b5-fa2b-4766-9cb2-f73ba30b6758}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_CLASS_EXTENSION_REGISTER_SERVICE_INTERFACES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_CLASS_EXTENSION_REGISTER_SERVICE_INTERFACES.fmtid),
    Guid.Ptr, Guid("{7f0779b5-fa2b-4766-9cb2-f73ba30b6758}"),
    UInt32, 16)
WPD_COMMAND_CLASS_EXTENSION_REGISTER_SERVICE_INTERFACES.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_CLASS_EXTENSION_UNREGISTER_SERVICE_INTERFACES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_CLASS_EXTENSION_UNREGISTER_SERVICE_INTERFACES.fmtid),
    Guid.Ptr, Guid("{7f0779b5-fa2b-4766-9cb2-f73ba30b6758}"),
    UInt32, 16)
WPD_COMMAND_CLASS_EXTENSION_UNREGISTER_SERVICE_INTERFACES.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CLASS_EXTENSION_SERVICE_OBJECT_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CLASS_EXTENSION_SERVICE_OBJECT_ID.fmtid),
    Guid.Ptr, Guid("{7f0779b5-fa2b-4766-9cb2-f73ba30b6758}"),
    UInt32, 16)
WPD_PROPERTY_CLASS_EXTENSION_SERVICE_OBJECT_ID.pid := 1001

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CLASS_EXTENSION_SERVICE_INTERFACES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CLASS_EXTENSION_SERVICE_INTERFACES.fmtid),
    Guid.Ptr, Guid("{7f0779b5-fa2b-4766-9cb2-f73ba30b6758}"),
    UInt32, 16)
WPD_PROPERTY_CLASS_EXTENSION_SERVICE_INTERFACES.pid := 1002

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_CLASS_EXTENSION_SERVICE_REGISTRATION_RESULTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_CLASS_EXTENSION_SERVICE_REGISTRATION_RESULTS.fmtid),
    Guid.Ptr, Guid("{7f0779b5-fa2b-4766-9cb2-f73ba30b6758}"),
    UInt32, 16)
WPD_PROPERTY_CLASS_EXTENSION_SERVICE_REGISTRATION_RESULTS.pid := 1003

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_NETWORK_CONFIGURATION := Guid("{78f9c6fc-79b8-473c-9060-6bd23dd072c4}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_GENERATE_KEYPAIR := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_GENERATE_KEYPAIR.fmtid),
    Guid.Ptr, Guid("{78f9c6fc-79b8-473c-9060-6bd23dd072c4}"),
    UInt32, 16)
WPD_COMMAND_GENERATE_KEYPAIR.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_COMMIT_KEYPAIR := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_COMMIT_KEYPAIR.fmtid),
    Guid.Ptr, Guid("{78f9c6fc-79b8-473c-9060-6bd23dd072c4}"),
    UInt32, 16)
WPD_COMMAND_COMMIT_KEYPAIR.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_PROCESS_WIRELESS_PROFILE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_PROCESS_WIRELESS_PROFILE.fmtid),
    Guid.Ptr, Guid("{78f9c6fc-79b8-473c-9060-6bd23dd072c4}"),
    UInt32, 16)
WPD_COMMAND_PROCESS_WIRELESS_PROFILE.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_PUBLIC_KEY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_PUBLIC_KEY.fmtid),
    Guid.Ptr, Guid("{78f9c6fc-79b8-473c-9060-6bd23dd072c4}"),
    UInt32, 16)
WPD_PROPERTY_PUBLIC_KEY.pid := 1001

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_SERVICE_COMMON := Guid("{322f071d-36ef-477f-b4b5-6f52d734baee}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_COMMON_GET_SERVICE_OBJECT_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_COMMON_GET_SERVICE_OBJECT_ID.fmtid),
    Guid.Ptr, Guid("{322f071d-36ef-477f-b4b5-6f52d734baee}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_COMMON_GET_SERVICE_OBJECT_ID.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_OBJECT_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_OBJECT_ID.fmtid),
    Guid.Ptr, Guid("{322f071d-36ef-477f-b4b5-6f52d734baee}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_OBJECT_ID.pid := 1001

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_SERVICE_CAPABILITIES := Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_METHODS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_METHODS.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_METHODS.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_METHODS_BY_FORMAT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_METHODS_BY_FORMAT.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_METHODS_BY_FORMAT.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_CAPABILITIES_GET_METHOD_ATTRIBUTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_CAPABILITIES_GET_METHOD_ATTRIBUTES.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_CAPABILITIES_GET_METHOD_ATTRIBUTES.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_CAPABILITIES_GET_METHOD_PARAMETER_ATTRIBUTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_CAPABILITIES_GET_METHOD_PARAMETER_ATTRIBUTES.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_CAPABILITIES_GET_METHOD_PARAMETER_ATTRIBUTES.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_FORMATS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_FORMATS.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_FORMATS.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_CAPABILITIES_GET_FORMAT_ATTRIBUTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_CAPABILITIES_GET_FORMAT_ATTRIBUTES.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_CAPABILITIES_GET_FORMAT_ATTRIBUTES.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_FORMAT_PROPERTIES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_FORMAT_PROPERTIES.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_FORMAT_PROPERTIES.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_CAPABILITIES_GET_FORMAT_PROPERTY_ATTRIBUTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_CAPABILITIES_GET_FORMAT_PROPERTY_ATTRIBUTES.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_CAPABILITIES_GET_FORMAT_PROPERTY_ATTRIBUTES.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_EVENTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_EVENTS.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_EVENTS.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_CAPABILITIES_GET_EVENT_ATTRIBUTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_CAPABILITIES_GET_EVENT_ATTRIBUTES.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_CAPABILITIES_GET_EVENT_ATTRIBUTES.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_CAPABILITIES_GET_EVENT_PARAMETER_ATTRIBUTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_CAPABILITIES_GET_EVENT_PARAMETER_ATTRIBUTES.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_CAPABILITIES_GET_EVENT_PARAMETER_ATTRIBUTES.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_CAPABILITIES_GET_INHERITED_SERVICES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_CAPABILITIES_GET_INHERITED_SERVICES.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_CAPABILITIES_GET_INHERITED_SERVICES.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_CAPABILITIES_GET_FORMAT_RENDERING_PROFILES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_CAPABILITIES_GET_FORMAT_RENDERING_PROFILES.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_CAPABILITIES_GET_FORMAT_RENDERING_PROFILES.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_COMMANDS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_COMMANDS.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_CAPABILITIES_GET_SUPPORTED_COMMANDS.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_CAPABILITIES_GET_COMMAND_OPTIONS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_CAPABILITIES_GET_COMMAND_OPTIONS.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_CAPABILITIES_GET_COMMAND_OPTIONS.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_SUPPORTED_METHODS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_SUPPORTED_METHODS.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_SUPPORTED_METHODS.pid := 1001

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_FORMAT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_FORMAT.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_FORMAT.pid := 1002

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_METHOD := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_METHOD.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_METHOD.pid := 1003

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_METHOD_ATTRIBUTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_METHOD_ATTRIBUTES.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_METHOD_ATTRIBUTES.pid := 1004

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_PARAMETER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_PARAMETER.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_PARAMETER.pid := 1005

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_PARAMETER_ATTRIBUTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_PARAMETER_ATTRIBUTES.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_PARAMETER_ATTRIBUTES.pid := 1006

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_FORMATS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_FORMATS.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_FORMATS.pid := 1007

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_FORMAT_ATTRIBUTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_FORMAT_ATTRIBUTES.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_FORMAT_ATTRIBUTES.pid := 1008

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_PROPERTY_KEYS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_PROPERTY_KEYS.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_PROPERTY_KEYS.pid := 1009

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_PROPERTY_ATTRIBUTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_PROPERTY_ATTRIBUTES.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_PROPERTY_ATTRIBUTES.pid := 1010

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_SUPPORTED_EVENTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_SUPPORTED_EVENTS.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_SUPPORTED_EVENTS.pid := 1011

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_EVENT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_EVENT.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_EVENT.pid := 1012

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_EVENT_ATTRIBUTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_EVENT_ATTRIBUTES.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_EVENT_ATTRIBUTES.pid := 1013

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_INHERITANCE_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_INHERITANCE_TYPE.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_INHERITANCE_TYPE.pid := 1014

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_INHERITED_SERVICES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_INHERITED_SERVICES.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_INHERITED_SERVICES.pid := 1015

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_RENDERING_PROFILES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_RENDERING_PROFILES.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_RENDERING_PROFILES.pid := 1016

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_SUPPORTED_COMMANDS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_SUPPORTED_COMMANDS.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_SUPPORTED_COMMANDS.pid := 1017

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_COMMAND := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_COMMAND.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_COMMAND.pid := 1018

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_CAPABILITIES_COMMAND_OPTIONS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_CAPABILITIES_COMMAND_OPTIONS.fmtid),
    Guid.Ptr, Guid("{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_CAPABILITIES_COMMAND_OPTIONS.pid := 1019

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_SERVICE_METHODS := Guid("{2d521ca8-c1b0-4268-a342-cf19321569bc}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_METHODS_START_INVOKE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_METHODS_START_INVOKE.fmtid),
    Guid.Ptr, Guid("{2d521ca8-c1b0-4268-a342-cf19321569bc}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_METHODS_START_INVOKE.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_METHODS_CANCEL_INVOKE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_METHODS_CANCEL_INVOKE.fmtid),
    Guid.Ptr, Guid("{2d521ca8-c1b0-4268-a342-cf19321569bc}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_METHODS_CANCEL_INVOKE.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_SERVICE_METHODS_END_INVOKE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_SERVICE_METHODS_END_INVOKE.fmtid),
    Guid.Ptr, Guid("{2d521ca8-c1b0-4268-a342-cf19321569bc}"),
    UInt32, 16)
WPD_COMMAND_SERVICE_METHODS_END_INVOKE.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_METHOD := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_METHOD.fmtid),
    Guid.Ptr, Guid("{2d521ca8-c1b0-4268-a342-cf19321569bc}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_METHOD.pid := 1001

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_METHOD_PARAMETER_VALUES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_METHOD_PARAMETER_VALUES.fmtid),
    Guid.Ptr, Guid("{2d521ca8-c1b0-4268-a342-cf19321569bc}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_METHOD_PARAMETER_VALUES.pid := 1002

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_METHOD_RESULT_VALUES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_METHOD_RESULT_VALUES.fmtid),
    Guid.Ptr, Guid("{2d521ca8-c1b0-4268-a342-cf19321569bc}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_METHOD_RESULT_VALUES.pid := 1003

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_METHOD_CONTEXT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_METHOD_CONTEXT.fmtid),
    Guid.Ptr, Guid("{2d521ca8-c1b0-4268-a342-cf19321569bc}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_METHOD_CONTEXT.pid := 1004

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_SERVICE_METHOD_HRESULT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_SERVICE_METHOD_HRESULT.fmtid),
    Guid.Ptr, Guid("{2d521ca8-c1b0-4268-a342-cf19321569bc}"),
    UInt32, 16)
WPD_PROPERTY_SERVICE_METHOD_HRESULT.pid := 1005

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RESOURCE_DEFAULT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RESOURCE_DEFAULT.fmtid),
    Guid.Ptr, Guid("{e81e79be-34f0-41bf-b53f-f1a06ae87842}"),
    UInt32, 16)
WPD_RESOURCE_DEFAULT.pid := 0

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RESOURCE_CONTACT_PHOTO := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RESOURCE_CONTACT_PHOTO.fmtid),
    Guid.Ptr, Guid("{2c4d6803-80ea-4580-af9a-5be1a23eddcb}"),
    UInt32, 16)
WPD_RESOURCE_CONTACT_PHOTO.pid := 0

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RESOURCE_THUMBNAIL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RESOURCE_THUMBNAIL.fmtid),
    Guid.Ptr, Guid("{c7c407ba-98fa-46b5-9960-23fec124cfde}"),
    UInt32, 16)
WPD_RESOURCE_THUMBNAIL.pid := 0

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RESOURCE_ICON := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RESOURCE_ICON.fmtid),
    Guid.Ptr, Guid("{f195fed8-aa28-4ee3-b153-e182dd5edc39}"),
    UInt32, 16)
WPD_RESOURCE_ICON.pid := 0

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RESOURCE_AUDIO_CLIP := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RESOURCE_AUDIO_CLIP.fmtid),
    Guid.Ptr, Guid("{3bc13982-85b1-48e0-95a6-8d3ad06be117}"),
    UInt32, 16)
WPD_RESOURCE_AUDIO_CLIP.pid := 0

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RESOURCE_ALBUM_ART := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RESOURCE_ALBUM_ART.fmtid),
    Guid.Ptr, Guid("{f02aa354-2300-4e2d-a1b9-3b6730f7fa21}"),
    UInt32, 16)
WPD_RESOURCE_ALBUM_ART.pid := 0

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RESOURCE_GENERIC := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RESOURCE_GENERIC.fmtid),
    Guid.Ptr, Guid("{b9b9f515-ba70-4647-94dc-fa4925e95a07}"),
    UInt32, 16)
WPD_RESOURCE_GENERIC.pid := 0

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RESOURCE_VIDEO_CLIP := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RESOURCE_VIDEO_CLIP.fmtid),
    Guid.Ptr, Guid("{b566ee42-6368-4290-8662-70182fb79f20}"),
    UInt32, 16)
WPD_RESOURCE_VIDEO_CLIP.pid := 0

/**
 * @type {PROPERTYKEY}
 */
export global WPD_RESOURCE_BRANDING_ART := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_RESOURCE_BRANDING_ART.fmtid),
    Guid.Ptr, Guid("{b633b1ae-6caf-4a87-9589-22ded6dd5899}"),
    UInt32, 16)
WPD_RESOURCE_BRANDING_ART.pid := 0

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_PROPERTIES_ONLY := Guid("{30010000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_UNSPECIFIED := Guid("{30000000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_SCRIPT := Guid("{30020000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_EXECUTABLE := Guid("{30030000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_TEXT := Guid("{30040000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_HTML := Guid("{30050000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_DPOF := Guid("{30060000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_AIFF := Guid("{30070000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_WAVE := Guid("{30080000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_MP3 := Guid("{30090000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_AVI := Guid("{300a0000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_MPEG := Guid("{300b0000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_ASF := Guid("{300c0000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_EXIF := Guid("{38010000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_TIFFEP := Guid("{38020000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_FLASHPIX := Guid("{38030000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_BMP := Guid("{38040000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_CIFF := Guid("{38050000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_GIF := Guid("{38070000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_JFIF := Guid("{38080000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_PCD := Guid("{38090000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_PICT := Guid("{380a0000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_PNG := Guid("{380b0000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_TIFF := Guid("{380d0000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_TIFFIT := Guid("{380e0000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_JP2 := Guid("{380f0000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_JPX := Guid("{38100000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_WBMP := Guid("{b8030000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_JPEGXR := Guid("{b8040000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_WINDOWSIMAGEFORMAT := Guid("{b8810000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_WMA := Guid("{b9010000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_WMV := Guid("{b9810000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_WPLPLAYLIST := Guid("{ba100000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_M3UPLAYLIST := Guid("{ba110000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_MPLPLAYLIST := Guid("{ba120000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_ASXPLAYLIST := Guid("{ba130000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_PLSPLAYLIST := Guid("{ba140000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_ABSTRACT_CONTACT_GROUP := Guid("{ba060000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_ABSTRACT_MEDIA_CAST := Guid("{ba0b0000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_VCALENDAR1 := Guid("{be020000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_ICALENDAR := Guid("{be030000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_ABSTRACT_CONTACT := Guid("{bb810000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_VCARD2 := Guid("{bb820000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_VCARD3 := Guid("{bb830000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_XML := Guid("{ba820000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_AAC := Guid("{b9030000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_AUDIBLE := Guid("{b9040000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_FLAC := Guid("{b9060000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_QCELP := Guid("{b9070000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_AMR := Guid("{b9080000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_OGG := Guid("{b9020000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_MP4 := Guid("{b9820000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_MP2 := Guid("{b9830000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_MICROSOFT_WORD := Guid("{ba830000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_MHT_COMPILED_HTML := Guid("{ba840000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_MICROSOFT_EXCEL := Guid("{ba850000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_MICROSOFT_POWERPOINT := Guid("{ba860000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_3GP := Guid("{b9840000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_3G2 := Guid("{b9850000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_AVCHD := Guid("{b9860000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_ATSCTS := Guid("{b9870000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_DVBTS := Guid("{b9880000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {Guid}
 */
export global WPD_OBJECT_FORMAT_MKV := Guid("{b9900000-ae6c-4804-98ba-c57b46965fe7}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_ID.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_ID.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_PARENT_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_PARENT_ID.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_PARENT_ID.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_NAME.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_NAME.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_PERSISTENT_UNIQUE_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_PERSISTENT_UNIQUE_ID.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_PERSISTENT_UNIQUE_ID.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_FORMAT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_FORMAT.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_FORMAT.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_ISHIDDEN := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_ISHIDDEN.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_ISHIDDEN.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_ISSYSTEM := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_ISSYSTEM.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_ISSYSTEM.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_SIZE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_SIZE.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_SIZE.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_ORIGINAL_FILE_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_ORIGINAL_FILE_NAME.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_ORIGINAL_FILE_NAME.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_NON_CONSUMABLE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_NON_CONSUMABLE.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_NON_CONSUMABLE.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_KEYWORDS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_KEYWORDS.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_KEYWORDS.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_SYNC_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_SYNC_ID.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_SYNC_ID.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_IS_DRM_PROTECTED := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_IS_DRM_PROTECTED.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_IS_DRM_PROTECTED.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_DATE_CREATED := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_DATE_CREATED.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_DATE_CREATED.pid := 18

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_DATE_MODIFIED := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_DATE_MODIFIED.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_DATE_MODIFIED.pid := 19

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_DATE_AUTHORED := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_DATE_AUTHORED.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_DATE_AUTHORED.pid := 20

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_BACK_REFERENCES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_BACK_REFERENCES.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_BACK_REFERENCES.pid := 21

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_CAN_DELETE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_CAN_DELETE.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_CAN_DELETE.pid := 26

/**
 * @type {PROPERTYKEY}
 */
export global WPD_OBJECT_LANGUAGE_LOCALE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_OBJECT_LANGUAGE_LOCALE.fmtid),
    Guid.Ptr, Guid("{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"),
    UInt32, 16)
WPD_OBJECT_LANGUAGE_LOCALE.pid := 27

/**
 * @type {Guid}
 */
export global WPD_FOLDER_OBJECT_PROPERTIES_V1 := Guid("{7e9a7abf-e568-4b34-aa2f-13bb12ab177d}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_FOLDER_CONTENT_TYPES_ALLOWED := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_FOLDER_CONTENT_TYPES_ALLOWED.fmtid),
    Guid.Ptr, Guid("{7e9a7abf-e568-4b34-aa2f-13bb12ab177d}"),
    UInt32, 16)
WPD_FOLDER_CONTENT_TYPES_ALLOWED.pid := 2

/**
 * @type {Guid}
 */
export global WPD_IMAGE_OBJECT_PROPERTIES_V1 := Guid("{63d64908-9fa1-479f-85ba-9952216447db}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_IMAGE_BITDEPTH := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_IMAGE_BITDEPTH.fmtid),
    Guid.Ptr, Guid("{63d64908-9fa1-479f-85ba-9952216447db}"),
    UInt32, 16)
WPD_IMAGE_BITDEPTH.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_IMAGE_CROPPED_STATUS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_IMAGE_CROPPED_STATUS.fmtid),
    Guid.Ptr, Guid("{63d64908-9fa1-479f-85ba-9952216447db}"),
    UInt32, 16)
WPD_IMAGE_CROPPED_STATUS.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_IMAGE_COLOR_CORRECTED_STATUS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_IMAGE_COLOR_CORRECTED_STATUS.fmtid),
    Guid.Ptr, Guid("{63d64908-9fa1-479f-85ba-9952216447db}"),
    UInt32, 16)
WPD_IMAGE_COLOR_CORRECTED_STATUS.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_IMAGE_FNUMBER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_IMAGE_FNUMBER.fmtid),
    Guid.Ptr, Guid("{63d64908-9fa1-479f-85ba-9952216447db}"),
    UInt32, 16)
WPD_IMAGE_FNUMBER.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_IMAGE_EXPOSURE_TIME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_IMAGE_EXPOSURE_TIME.fmtid),
    Guid.Ptr, Guid("{63d64908-9fa1-479f-85ba-9952216447db}"),
    UInt32, 16)
WPD_IMAGE_EXPOSURE_TIME.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_IMAGE_EXPOSURE_INDEX := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_IMAGE_EXPOSURE_INDEX.fmtid),
    Guid.Ptr, Guid("{63d64908-9fa1-479f-85ba-9952216447db}"),
    UInt32, 16)
WPD_IMAGE_EXPOSURE_INDEX.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_IMAGE_HORIZONTAL_RESOLUTION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_IMAGE_HORIZONTAL_RESOLUTION.fmtid),
    Guid.Ptr, Guid("{63d64908-9fa1-479f-85ba-9952216447db}"),
    UInt32, 16)
WPD_IMAGE_HORIZONTAL_RESOLUTION.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_IMAGE_VERTICAL_RESOLUTION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_IMAGE_VERTICAL_RESOLUTION.fmtid),
    Guid.Ptr, Guid("{63d64908-9fa1-479f-85ba-9952216447db}"),
    UInt32, 16)
WPD_IMAGE_VERTICAL_RESOLUTION.pid := 10

/**
 * @type {Guid}
 */
export global WPD_DOCUMENT_OBJECT_PROPERTIES_V1 := Guid("{0b110203-eb95-4f02-93e0-97c631493ad5}")

/**
 * @type {Guid}
 */
export global WPD_MEDIA_PROPERTIES_V1 := Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_TOTAL_BITRATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_TOTAL_BITRATE.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_TOTAL_BITRATE.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_BITRATE_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_BITRATE_TYPE.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_BITRATE_TYPE.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_COPYRIGHT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_COPYRIGHT.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_COPYRIGHT.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_SUBSCRIPTION_CONTENT_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_SUBSCRIPTION_CONTENT_ID.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_SUBSCRIPTION_CONTENT_ID.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_USE_COUNT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_USE_COUNT.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_USE_COUNT.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_SKIP_COUNT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_SKIP_COUNT.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_SKIP_COUNT.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_LAST_ACCESSED_TIME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_LAST_ACCESSED_TIME.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_LAST_ACCESSED_TIME.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_PARENTAL_RATING := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_PARENTAL_RATING.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_PARENTAL_RATING.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_META_GENRE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_META_GENRE.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_META_GENRE.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_COMPOSER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_COMPOSER.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_COMPOSER.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_EFFECTIVE_RATING := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_EFFECTIVE_RATING.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_EFFECTIVE_RATING.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_SUB_TITLE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_SUB_TITLE.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_SUB_TITLE.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_RELEASE_DATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_RELEASE_DATE.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_RELEASE_DATE.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_SAMPLE_RATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_SAMPLE_RATE.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_SAMPLE_RATE.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_STAR_RATING := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_STAR_RATING.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_STAR_RATING.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_USER_EFFECTIVE_RATING := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_USER_EFFECTIVE_RATING.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_USER_EFFECTIVE_RATING.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_TITLE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_TITLE.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_TITLE.pid := 18

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_DURATION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_DURATION.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_DURATION.pid := 19

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_BUY_NOW := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_BUY_NOW.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_BUY_NOW.pid := 20

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_ENCODING_PROFILE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_ENCODING_PROFILE.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_ENCODING_PROFILE.pid := 21

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_WIDTH := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_WIDTH.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_WIDTH.pid := 22

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_HEIGHT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_HEIGHT.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_HEIGHT.pid := 23

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_ARTIST := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_ARTIST.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_ARTIST.pid := 24

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_ALBUM_ARTIST := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_ALBUM_ARTIST.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_ALBUM_ARTIST.pid := 25

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_OWNER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_OWNER.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_OWNER.pid := 26

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_MANAGING_EDITOR := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_MANAGING_EDITOR.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_MANAGING_EDITOR.pid := 27

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_WEBMASTER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_WEBMASTER.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_WEBMASTER.pid := 28

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_SOURCE_URL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_SOURCE_URL.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_SOURCE_URL.pid := 29

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_DESTINATION_URL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_DESTINATION_URL.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_DESTINATION_URL.pid := 30

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_DESCRIPTION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_DESCRIPTION.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_DESCRIPTION.pid := 31

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_GENRE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_GENRE.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_GENRE.pid := 32

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_TIME_BOOKMARK := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_TIME_BOOKMARK.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_TIME_BOOKMARK.pid := 33

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_OBJECT_BOOKMARK := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_OBJECT_BOOKMARK.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_OBJECT_BOOKMARK.pid := 34

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_LAST_BUILD_DATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_LAST_BUILD_DATE.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_LAST_BUILD_DATE.pid := 35

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_BYTE_BOOKMARK := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_BYTE_BOOKMARK.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_BYTE_BOOKMARK.pid := 36

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_TIME_TO_LIVE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_TIME_TO_LIVE.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_TIME_TO_LIVE.pid := 37

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_GUID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_GUID.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_GUID.pid := 38

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_SUB_DESCRIPTION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_SUB_DESCRIPTION.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_SUB_DESCRIPTION.pid := 39

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MEDIA_AUDIO_ENCODING_PROFILE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MEDIA_AUDIO_ENCODING_PROFILE.fmtid),
    Guid.Ptr, Guid("{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"),
    UInt32, 16)
WPD_MEDIA_AUDIO_ENCODING_PROFILE.pid := 49

/**
 * @type {Guid}
 */
export global WPD_CONTACT_OBJECT_PROPERTIES_V1 := Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_DISPLAY_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_DISPLAY_NAME.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_DISPLAY_NAME.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_FIRST_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_FIRST_NAME.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_FIRST_NAME.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_MIDDLE_NAMES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_MIDDLE_NAMES.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_MIDDLE_NAMES.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_LAST_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_LAST_NAME.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_LAST_NAME.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PREFIX := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PREFIX.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PREFIX.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_SUFFIX := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_SUFFIX.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_SUFFIX.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PHONETIC_FIRST_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PHONETIC_FIRST_NAME.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PHONETIC_FIRST_NAME.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PHONETIC_LAST_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PHONETIC_LAST_NAME.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PHONETIC_LAST_NAME.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PERSONAL_FULL_POSTAL_ADDRESS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PERSONAL_FULL_POSTAL_ADDRESS.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PERSONAL_FULL_POSTAL_ADDRESS.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_LINE1 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_LINE1.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_LINE1.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_LINE2 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_LINE2.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_LINE2.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_CITY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_CITY.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_CITY.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_REGION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_REGION.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_REGION.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_POSTAL_CODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_POSTAL_CODE.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_POSTAL_CODE.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_COUNTRY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_COUNTRY.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PERSONAL_POSTAL_ADDRESS_COUNTRY.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_BUSINESS_FULL_POSTAL_ADDRESS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_BUSINESS_FULL_POSTAL_ADDRESS.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_BUSINESS_FULL_POSTAL_ADDRESS.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_LINE1 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_LINE1.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_LINE1.pid := 18

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_LINE2 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_LINE2.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_LINE2.pid := 19

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_CITY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_CITY.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_CITY.pid := 20

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_REGION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_REGION.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_REGION.pid := 21

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_POSTAL_CODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_POSTAL_CODE.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_POSTAL_CODE.pid := 22

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_COUNTRY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_COUNTRY.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_BUSINESS_POSTAL_ADDRESS_COUNTRY.pid := 23

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_OTHER_FULL_POSTAL_ADDRESS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_OTHER_FULL_POSTAL_ADDRESS.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_OTHER_FULL_POSTAL_ADDRESS.pid := 24

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_OTHER_POSTAL_ADDRESS_LINE1 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_OTHER_POSTAL_ADDRESS_LINE1.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_OTHER_POSTAL_ADDRESS_LINE1.pid := 25

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_OTHER_POSTAL_ADDRESS_LINE2 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_OTHER_POSTAL_ADDRESS_LINE2.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_OTHER_POSTAL_ADDRESS_LINE2.pid := 26

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_OTHER_POSTAL_ADDRESS_CITY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_OTHER_POSTAL_ADDRESS_CITY.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_OTHER_POSTAL_ADDRESS_CITY.pid := 27

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_OTHER_POSTAL_ADDRESS_REGION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_OTHER_POSTAL_ADDRESS_REGION.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_OTHER_POSTAL_ADDRESS_REGION.pid := 28

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_OTHER_POSTAL_ADDRESS_POSTAL_CODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_OTHER_POSTAL_ADDRESS_POSTAL_CODE.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_OTHER_POSTAL_ADDRESS_POSTAL_CODE.pid := 29

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_OTHER_POSTAL_ADDRESS_POSTAL_COUNTRY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_OTHER_POSTAL_ADDRESS_POSTAL_COUNTRY.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_OTHER_POSTAL_ADDRESS_POSTAL_COUNTRY.pid := 30

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PRIMARY_EMAIL_ADDRESS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PRIMARY_EMAIL_ADDRESS.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PRIMARY_EMAIL_ADDRESS.pid := 31

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PERSONAL_EMAIL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PERSONAL_EMAIL.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PERSONAL_EMAIL.pid := 32

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PERSONAL_EMAIL2 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PERSONAL_EMAIL2.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PERSONAL_EMAIL2.pid := 33

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_BUSINESS_EMAIL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_BUSINESS_EMAIL.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_BUSINESS_EMAIL.pid := 34

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_BUSINESS_EMAIL2 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_BUSINESS_EMAIL2.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_BUSINESS_EMAIL2.pid := 35

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_OTHER_EMAILS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_OTHER_EMAILS.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_OTHER_EMAILS.pid := 36

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PRIMARY_PHONE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PRIMARY_PHONE.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PRIMARY_PHONE.pid := 37

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PERSONAL_PHONE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PERSONAL_PHONE.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PERSONAL_PHONE.pid := 38

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PERSONAL_PHONE2 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PERSONAL_PHONE2.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PERSONAL_PHONE2.pid := 39

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_BUSINESS_PHONE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_BUSINESS_PHONE.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_BUSINESS_PHONE.pid := 40

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_BUSINESS_PHONE2 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_BUSINESS_PHONE2.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_BUSINESS_PHONE2.pid := 41

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_MOBILE_PHONE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_MOBILE_PHONE.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_MOBILE_PHONE.pid := 42

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_MOBILE_PHONE2 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_MOBILE_PHONE2.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_MOBILE_PHONE2.pid := 43

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PERSONAL_FAX := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PERSONAL_FAX.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PERSONAL_FAX.pid := 44

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_BUSINESS_FAX := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_BUSINESS_FAX.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_BUSINESS_FAX.pid := 45

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PAGER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PAGER.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PAGER.pid := 46

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_OTHER_PHONES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_OTHER_PHONES.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_OTHER_PHONES.pid := 47

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PRIMARY_WEB_ADDRESS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PRIMARY_WEB_ADDRESS.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PRIMARY_WEB_ADDRESS.pid := 48

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PERSONAL_WEB_ADDRESS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PERSONAL_WEB_ADDRESS.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PERSONAL_WEB_ADDRESS.pid := 49

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_BUSINESS_WEB_ADDRESS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_BUSINESS_WEB_ADDRESS.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_BUSINESS_WEB_ADDRESS.pid := 50

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_INSTANT_MESSENGER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_INSTANT_MESSENGER.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_INSTANT_MESSENGER.pid := 51

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_INSTANT_MESSENGER2 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_INSTANT_MESSENGER2.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_INSTANT_MESSENGER2.pid := 52

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_INSTANT_MESSENGER3 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_INSTANT_MESSENGER3.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_INSTANT_MESSENGER3.pid := 53

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_COMPANY_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_COMPANY_NAME.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_COMPANY_NAME.pid := 54

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PHONETIC_COMPANY_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PHONETIC_COMPANY_NAME.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PHONETIC_COMPANY_NAME.pid := 55

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_ROLE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_ROLE.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_ROLE.pid := 56

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_BIRTHDATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_BIRTHDATE.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_BIRTHDATE.pid := 57

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_PRIMARY_FAX := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_PRIMARY_FAX.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_PRIMARY_FAX.pid := 58

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_SPOUSE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_SPOUSE.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_SPOUSE.pid := 59

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_CHILDREN := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_CHILDREN.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_CHILDREN.pid := 60

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_ASSISTANT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_ASSISTANT.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_ASSISTANT.pid := 61

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_ANNIVERSARY_DATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_ANNIVERSARY_DATE.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_ANNIVERSARY_DATE.pid := 62

/**
 * @type {PROPERTYKEY}
 */
export global WPD_CONTACT_RINGTONE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_CONTACT_RINGTONE.fmtid),
    Guid.Ptr, Guid("{fbd4fdab-987d-4777-b3f9-726185a9312b}"),
    UInt32, 16)
WPD_CONTACT_RINGTONE.pid := 63

/**
 * @type {Guid}
 */
export global WPD_MUSIC_OBJECT_PROPERTIES_V1 := Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MUSIC_ALBUM := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MUSIC_ALBUM.fmtid),
    Guid.Ptr, Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}"),
    UInt32, 16)
WPD_MUSIC_ALBUM.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MUSIC_TRACK := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MUSIC_TRACK.fmtid),
    Guid.Ptr, Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}"),
    UInt32, 16)
WPD_MUSIC_TRACK.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MUSIC_LYRICS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MUSIC_LYRICS.fmtid),
    Guid.Ptr, Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}"),
    UInt32, 16)
WPD_MUSIC_LYRICS.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_MUSIC_MOOD := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_MUSIC_MOOD.fmtid),
    Guid.Ptr, Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}"),
    UInt32, 16)
WPD_MUSIC_MOOD.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_AUDIO_BITRATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_AUDIO_BITRATE.fmtid),
    Guid.Ptr, Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}"),
    UInt32, 16)
WPD_AUDIO_BITRATE.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_AUDIO_CHANNEL_COUNT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_AUDIO_CHANNEL_COUNT.fmtid),
    Guid.Ptr, Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}"),
    UInt32, 16)
WPD_AUDIO_CHANNEL_COUNT.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global WPD_AUDIO_FORMAT_CODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_AUDIO_FORMAT_CODE.fmtid),
    Guid.Ptr, Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}"),
    UInt32, 16)
WPD_AUDIO_FORMAT_CODE.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global WPD_AUDIO_BIT_DEPTH := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_AUDIO_BIT_DEPTH.fmtid),
    Guid.Ptr, Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}"),
    UInt32, 16)
WPD_AUDIO_BIT_DEPTH.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global WPD_AUDIO_BLOCK_ALIGNMENT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_AUDIO_BLOCK_ALIGNMENT.fmtid),
    Guid.Ptr, Guid("{b324f56a-dc5d-46e5-b6df-d2ea414888c6}"),
    UInt32, 16)
WPD_AUDIO_BLOCK_ALIGNMENT.pid := 13

/**
 * @type {Guid}
 */
export global WPD_VIDEO_OBJECT_PROPERTIES_V1 := Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_VIDEO_AUTHOR := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_VIDEO_AUTHOR.fmtid),
    Guid.Ptr, Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}"),
    UInt32, 16)
WPD_VIDEO_AUTHOR.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_VIDEO_RECORDEDTV_STATION_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_VIDEO_RECORDEDTV_STATION_NAME.fmtid),
    Guid.Ptr, Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}"),
    UInt32, 16)
WPD_VIDEO_RECORDEDTV_STATION_NAME.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_VIDEO_RECORDEDTV_CHANNEL_NUMBER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_VIDEO_RECORDEDTV_CHANNEL_NUMBER.fmtid),
    Guid.Ptr, Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}"),
    UInt32, 16)
WPD_VIDEO_RECORDEDTV_CHANNEL_NUMBER.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_VIDEO_RECORDEDTV_REPEAT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_VIDEO_RECORDEDTV_REPEAT.fmtid),
    Guid.Ptr, Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}"),
    UInt32, 16)
WPD_VIDEO_RECORDEDTV_REPEAT.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_VIDEO_BUFFER_SIZE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_VIDEO_BUFFER_SIZE.fmtid),
    Guid.Ptr, Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}"),
    UInt32, 16)
WPD_VIDEO_BUFFER_SIZE.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_VIDEO_CREDITS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_VIDEO_CREDITS.fmtid),
    Guid.Ptr, Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}"),
    UInt32, 16)
WPD_VIDEO_CREDITS.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_VIDEO_KEY_FRAME_DISTANCE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_VIDEO_KEY_FRAME_DISTANCE.fmtid),
    Guid.Ptr, Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}"),
    UInt32, 16)
WPD_VIDEO_KEY_FRAME_DISTANCE.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global WPD_VIDEO_QUALITY_SETTING := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_VIDEO_QUALITY_SETTING.fmtid),
    Guid.Ptr, Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}"),
    UInt32, 16)
WPD_VIDEO_QUALITY_SETTING.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global WPD_VIDEO_SCAN_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_VIDEO_SCAN_TYPE.fmtid),
    Guid.Ptr, Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}"),
    UInt32, 16)
WPD_VIDEO_SCAN_TYPE.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global WPD_VIDEO_BITRATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_VIDEO_BITRATE.fmtid),
    Guid.Ptr, Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}"),
    UInt32, 16)
WPD_VIDEO_BITRATE.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global WPD_VIDEO_FOURCC_CODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_VIDEO_FOURCC_CODE.fmtid),
    Guid.Ptr, Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}"),
    UInt32, 16)
WPD_VIDEO_FOURCC_CODE.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global WPD_VIDEO_FRAMERATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_VIDEO_FRAMERATE.fmtid),
    Guid.Ptr, Guid("{346f2163-f998-4146-8b01-d19b4c00de9a}"),
    UInt32, 16)
WPD_VIDEO_FRAMERATE.pid := 15

/**
 * @type {Guid}
 */
export global WPD_COMMON_INFORMATION_OBJECT_PROPERTIES_V1 := Guid("{b28ae94b-05a4-4e8e-be01-72cc7e099d8f}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMON_INFORMATION_SUBJECT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMON_INFORMATION_SUBJECT.fmtid),
    Guid.Ptr, Guid("{b28ae94b-05a4-4e8e-be01-72cc7e099d8f}"),
    UInt32, 16)
WPD_COMMON_INFORMATION_SUBJECT.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMON_INFORMATION_BODY_TEXT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMON_INFORMATION_BODY_TEXT.fmtid),
    Guid.Ptr, Guid("{b28ae94b-05a4-4e8e-be01-72cc7e099d8f}"),
    UInt32, 16)
WPD_COMMON_INFORMATION_BODY_TEXT.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMON_INFORMATION_PRIORITY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMON_INFORMATION_PRIORITY.fmtid),
    Guid.Ptr, Guid("{b28ae94b-05a4-4e8e-be01-72cc7e099d8f}"),
    UInt32, 16)
WPD_COMMON_INFORMATION_PRIORITY.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMON_INFORMATION_START_DATETIME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMON_INFORMATION_START_DATETIME.fmtid),
    Guid.Ptr, Guid("{b28ae94b-05a4-4e8e-be01-72cc7e099d8f}"),
    UInt32, 16)
WPD_COMMON_INFORMATION_START_DATETIME.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMON_INFORMATION_END_DATETIME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMON_INFORMATION_END_DATETIME.fmtid),
    Guid.Ptr, Guid("{b28ae94b-05a4-4e8e-be01-72cc7e099d8f}"),
    UInt32, 16)
WPD_COMMON_INFORMATION_END_DATETIME.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMON_INFORMATION_NOTES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMON_INFORMATION_NOTES.fmtid),
    Guid.Ptr, Guid("{b28ae94b-05a4-4e8e-be01-72cc7e099d8f}"),
    UInt32, 16)
WPD_COMMON_INFORMATION_NOTES.pid := 7

/**
 * @type {Guid}
 */
export global WPD_MEMO_OBJECT_PROPERTIES_V1 := Guid("{5ffbfc7b-7483-41ad-afb9-da3f4e592b8d}")

/**
 * @type {Guid}
 */
export global WPD_EMAIL_OBJECT_PROPERTIES_V1 := Guid("{41f8f65a-5484-4782-b13d-4740dd7c37c5}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EMAIL_TO_LINE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EMAIL_TO_LINE.fmtid),
    Guid.Ptr, Guid("{41f8f65a-5484-4782-b13d-4740dd7c37c5}"),
    UInt32, 16)
WPD_EMAIL_TO_LINE.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EMAIL_CC_LINE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EMAIL_CC_LINE.fmtid),
    Guid.Ptr, Guid("{41f8f65a-5484-4782-b13d-4740dd7c37c5}"),
    UInt32, 16)
WPD_EMAIL_CC_LINE.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EMAIL_BCC_LINE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EMAIL_BCC_LINE.fmtid),
    Guid.Ptr, Guid("{41f8f65a-5484-4782-b13d-4740dd7c37c5}"),
    UInt32, 16)
WPD_EMAIL_BCC_LINE.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EMAIL_HAS_BEEN_READ := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EMAIL_HAS_BEEN_READ.fmtid),
    Guid.Ptr, Guid("{41f8f65a-5484-4782-b13d-4740dd7c37c5}"),
    UInt32, 16)
WPD_EMAIL_HAS_BEEN_READ.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EMAIL_RECEIVED_TIME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EMAIL_RECEIVED_TIME.fmtid),
    Guid.Ptr, Guid("{41f8f65a-5484-4782-b13d-4740dd7c37c5}"),
    UInt32, 16)
WPD_EMAIL_RECEIVED_TIME.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EMAIL_HAS_ATTACHMENTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EMAIL_HAS_ATTACHMENTS.fmtid),
    Guid.Ptr, Guid("{41f8f65a-5484-4782-b13d-4740dd7c37c5}"),
    UInt32, 16)
WPD_EMAIL_HAS_ATTACHMENTS.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_EMAIL_SENDER_ADDRESS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_EMAIL_SENDER_ADDRESS.fmtid),
    Guid.Ptr, Guid("{41f8f65a-5484-4782-b13d-4740dd7c37c5}"),
    UInt32, 16)
WPD_EMAIL_SENDER_ADDRESS.pid := 10

/**
 * @type {Guid}
 */
export global WPD_APPOINTMENT_OBJECT_PROPERTIES_V1 := Guid("{f99efd03-431d-40d8-a1c9-4e220d9c88d3}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_APPOINTMENT_LOCATION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_APPOINTMENT_LOCATION.fmtid),
    Guid.Ptr, Guid("{f99efd03-431d-40d8-a1c9-4e220d9c88d3}"),
    UInt32, 16)
WPD_APPOINTMENT_LOCATION.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_APPOINTMENT_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_APPOINTMENT_TYPE.fmtid),
    Guid.Ptr, Guid("{f99efd03-431d-40d8-a1c9-4e220d9c88d3}"),
    UInt32, 16)
WPD_APPOINTMENT_TYPE.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global WPD_APPOINTMENT_REQUIRED_ATTENDEES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_APPOINTMENT_REQUIRED_ATTENDEES.fmtid),
    Guid.Ptr, Guid("{f99efd03-431d-40d8-a1c9-4e220d9c88d3}"),
    UInt32, 16)
WPD_APPOINTMENT_REQUIRED_ATTENDEES.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_APPOINTMENT_OPTIONAL_ATTENDEES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_APPOINTMENT_OPTIONAL_ATTENDEES.fmtid),
    Guid.Ptr, Guid("{f99efd03-431d-40d8-a1c9-4e220d9c88d3}"),
    UInt32, 16)
WPD_APPOINTMENT_OPTIONAL_ATTENDEES.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global WPD_APPOINTMENT_ACCEPTED_ATTENDEES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_APPOINTMENT_ACCEPTED_ATTENDEES.fmtid),
    Guid.Ptr, Guid("{f99efd03-431d-40d8-a1c9-4e220d9c88d3}"),
    UInt32, 16)
WPD_APPOINTMENT_ACCEPTED_ATTENDEES.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global WPD_APPOINTMENT_RESOURCES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_APPOINTMENT_RESOURCES.fmtid),
    Guid.Ptr, Guid("{f99efd03-431d-40d8-a1c9-4e220d9c88d3}"),
    UInt32, 16)
WPD_APPOINTMENT_RESOURCES.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global WPD_APPOINTMENT_TENTATIVE_ATTENDEES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_APPOINTMENT_TENTATIVE_ATTENDEES.fmtid),
    Guid.Ptr, Guid("{f99efd03-431d-40d8-a1c9-4e220d9c88d3}"),
    UInt32, 16)
WPD_APPOINTMENT_TENTATIVE_ATTENDEES.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global WPD_APPOINTMENT_DECLINED_ATTENDEES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_APPOINTMENT_DECLINED_ATTENDEES.fmtid),
    Guid.Ptr, Guid("{f99efd03-431d-40d8-a1c9-4e220d9c88d3}"),
    UInt32, 16)
WPD_APPOINTMENT_DECLINED_ATTENDEES.pid := 13

/**
 * @type {Guid}
 */
export global WPD_TASK_OBJECT_PROPERTIES_V1 := Guid("{e354e95e-d8a0-4637-a03a-0cb26838dbc7}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_TASK_STATUS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_TASK_STATUS.fmtid),
    Guid.Ptr, Guid("{e354e95e-d8a0-4637-a03a-0cb26838dbc7}"),
    UInt32, 16)
WPD_TASK_STATUS.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPD_TASK_PERCENT_COMPLETE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_TASK_PERCENT_COMPLETE.fmtid),
    Guid.Ptr, Guid("{e354e95e-d8a0-4637-a03a-0cb26838dbc7}"),
    UInt32, 16)
WPD_TASK_PERCENT_COMPLETE.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global WPD_TASK_REMINDER_DATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_TASK_REMINDER_DATE.fmtid),
    Guid.Ptr, Guid("{e354e95e-d8a0-4637-a03a-0cb26838dbc7}"),
    UInt32, 16)
WPD_TASK_REMINDER_DATE.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global WPD_TASK_OWNER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_TASK_OWNER.fmtid),
    Guid.Ptr, Guid("{e354e95e-d8a0-4637-a03a-0cb26838dbc7}"),
    UInt32, 16)
WPD_TASK_OWNER.pid := 11

/**
 * @type {Guid}
 */
export global WPD_SMS_OBJECT_PROPERTIES_V1 := Guid("{7e1074cc-50ff-4dd1-a742-53be6f093a0d}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_SMS_PROVIDER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_SMS_PROVIDER.fmtid),
    Guid.Ptr, Guid("{7e1074cc-50ff-4dd1-a742-53be6f093a0d}"),
    UInt32, 16)
WPD_SMS_PROVIDER.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_SMS_TIMEOUT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_SMS_TIMEOUT.fmtid),
    Guid.Ptr, Guid("{7e1074cc-50ff-4dd1-a742-53be6f093a0d}"),
    UInt32, 16)
WPD_SMS_TIMEOUT.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_SMS_MAX_PAYLOAD := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_SMS_MAX_PAYLOAD.fmtid),
    Guid.Ptr, Guid("{7e1074cc-50ff-4dd1-a742-53be6f093a0d}"),
    UInt32, 16)
WPD_SMS_MAX_PAYLOAD.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_SMS_ENCODING := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_SMS_ENCODING.fmtid),
    Guid.Ptr, Guid("{7e1074cc-50ff-4dd1-a742-53be6f093a0d}"),
    UInt32, 16)
WPD_SMS_ENCODING.pid := 5

/**
 * @type {Guid}
 */
export global WPD_SECTION_OBJECT_PROPERTIES_V1 := Guid("{516afd2b-c64e-44f0-98dc-bee1c88f7d66}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_SECTION_DATA_OFFSET := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_SECTION_DATA_OFFSET.fmtid),
    Guid.Ptr, Guid("{516afd2b-c64e-44f0-98dc-bee1c88f7d66}"),
    UInt32, 16)
WPD_SECTION_DATA_OFFSET.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPD_SECTION_DATA_LENGTH := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_SECTION_DATA_LENGTH.fmtid),
    Guid.Ptr, Guid("{516afd2b-c64e-44f0-98dc-bee1c88f7d66}"),
    UInt32, 16)
WPD_SECTION_DATA_LENGTH.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPD_SECTION_DATA_UNITS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_SECTION_DATA_UNITS.fmtid),
    Guid.Ptr, Guid("{516afd2b-c64e-44f0-98dc-bee1c88f7d66}"),
    UInt32, 16)
WPD_SECTION_DATA_UNITS.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPD_SECTION_DATA_REFERENCED_OBJECT_RESOURCE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_SECTION_DATA_REFERENCED_OBJECT_RESOURCE.fmtid),
    Guid.Ptr, Guid("{516afd2b-c64e-44f0-98dc-bee1c88f7d66}"),
    UInt32, 16)
WPD_SECTION_DATA_REFERENCED_OBJECT_RESOURCE.pid := 5

/**
 * @type {String}
 */
export global NAME_Undefined := "Undefined"

/**
 * @type {String}
 */
export global NAME_Association := "Association"

/**
 * @type {String}
 */
export global NAME_DeviceScript := "DeviceScript"

/**
 * @type {String}
 */
export global NAME_DeviceExecutable := "DeviceExecutable"

/**
 * @type {String}
 */
export global NAME_TextDocument := "TextDocument"

/**
 * @type {String}
 */
export global NAME_HTMLDocument := "HTMLDocument"

/**
 * @type {String}
 */
export global NAME_DPOFDocument := "DPOFDocument"

/**
 * @type {String}
 */
export global NAME_AIFFFile := "AIFFFile"

/**
 * @type {String}
 */
export global NAME_WAVFile := "WAVFile"

/**
 * @type {String}
 */
export global NAME_MP3File := "MP3File"

/**
 * @type {String}
 */
export global NAME_AVIFile := "AVIFile"

/**
 * @type {String}
 */
export global NAME_MPEGFile := "MPEGFile"

/**
 * @type {String}
 */
export global NAME_ASFFile := "ASFFile"

/**
 * @type {String}
 */
export global NAME_UnknownImage := "UnknownImage"

/**
 * @type {String}
 */
export global NAME_EXIFImage := "EXIFImage"

/**
 * @type {String}
 */
export global NAME_TIFFEPImage := "TIFFEPImage"

/**
 * @type {String}
 */
export global NAME_FlashPixImage := "FlashPixImage"

/**
 * @type {String}
 */
export global NAME_BMPImage := "BMPImage"

/**
 * @type {String}
 */
export global NAME_CIFFImage := "CIFFImage"

/**
 * @type {String}
 */
export global NAME_GIFImage := "GIFImage"

/**
 * @type {String}
 */
export global NAME_JFIFImage := "JFIFImage"

/**
 * @type {String}
 */
export global NAME_PCDImage := "PCDImage"

/**
 * @type {String}
 */
export global NAME_PICTImage := "PICTImage"

/**
 * @type {String}
 */
export global NAME_PNGImage := "PNGImage"

/**
 * @type {String}
 */
export global NAME_TIFFImage := "TIFFImage"

/**
 * @type {String}
 */
export global NAME_TIFFITImage := "TIFFITImage"

/**
 * @type {String}
 */
export global NAME_JP2Image := "JP2Image"

/**
 * @type {String}
 */
export global NAME_JPXImage := "JPXImage"

/**
 * @type {String}
 */
export global NAME_FirmwareFile := "FirmwareFile"

/**
 * @type {String}
 */
export global NAME_WBMPImage := "WBMPImage"

/**
 * @type {String}
 */
export global NAME_JPEGXRImage := "JPEGXRImage"

/**
 * @type {String}
 */
export global NAME_HDPhotoImage := "HDPhotoImage"

/**
 * @type {String}
 */
export global NAME_UndefinedAudio := "UndefinedAudio"

/**
 * @type {String}
 */
export global NAME_WMAFile := "WMAFile"

/**
 * @type {String}
 */
export global NAME_OGGFile := "OGGFile"

/**
 * @type {String}
 */
export global NAME_AACFile := "AACFile"

/**
 * @type {String}
 */
export global NAME_AudibleFile := "AudibleFile"

/**
 * @type {String}
 */
export global NAME_FLACFile := "FLACFile"

/**
 * @type {String}
 */
export global NAME_QCELPFile := "QCELPFile"

/**
 * @type {String}
 */
export global NAME_AMRFile := "AMRFile"

/**
 * @type {String}
 */
export global NAME_UndefinedVideo := "UndefinedVideo"

/**
 * @type {String}
 */
export global NAME_WMVFile := "WMVFile"

/**
 * @type {String}
 */
export global NAME_MPEG4File := "MPEG4File"

/**
 * @type {String}
 */
export global NAME_MPEG2File := "MPEG2File"

/**
 * @type {String}
 */
export global NAME_3GPPFile := "3GPPFile"

/**
 * @type {String}
 */
export global NAME_3GPP2File := "3GPP2File"

/**
 * @type {String}
 */
export global NAME_AVCHDFile := "AVCHDFile"

/**
 * @type {String}
 */
export global NAME_ATSCTSFile := "ATSCTSFile"

/**
 * @type {String}
 */
export global NAME_DVBTSFile := "DVBTSFile"

/**
 * @type {String}
 */
export global NAME_UndefinedCollection := "UndefinedCollection"

/**
 * @type {String}
 */
export global NAME_AbstractMultimediaAlbum := "AbstractMultimediaAlbum"

/**
 * @type {String}
 */
export global NAME_AbstractImageAlbum := "AbstractImageAlbum"

/**
 * @type {String}
 */
export global NAME_AbstractAudioAlbum := "AbstractAudioAlbum"

/**
 * @type {String}
 */
export global NAME_AbstractVideoAlbum := "AbstractVideoAlbum"

/**
 * @type {String}
 */
export global NAME_AbstractAudioVideoAlbum := "AbstractAudioVideoAlbum"

/**
 * @type {String}
 */
export global NAME_AbstractChapteredProduction := "AbstractChapteredProduction"

/**
 * @type {String}
 */
export global NAME_AbstractAudioPlaylist := "AbstractAudioPlaylist"

/**
 * @type {String}
 */
export global NAME_AbstractVideoPlaylist := "AbstractVideoPlaylist"

/**
 * @type {String}
 */
export global NAME_AbstractMediacast := "AbstractMediacast"

/**
 * @type {String}
 */
export global NAME_WPLPlaylist := "WPLPlaylist"

/**
 * @type {String}
 */
export global NAME_M3UPlaylist := "M3UPlaylist"

/**
 * @type {String}
 */
export global NAME_MPLPlaylist := "MPLPlaylist"

/**
 * @type {String}
 */
export global NAME_ASXPlaylist := "ASXPlaylist"

/**
 * @type {String}
 */
export global NAME_PSLPlaylist := "PSLPlaylist"

/**
 * @type {String}
 */
export global NAME_UndefinedDocument := "UndefinedDocument"

/**
 * @type {String}
 */
export global NAME_AbstractDocument := "AbstractDocument"

/**
 * @type {String}
 */
export global NAME_XMLDocument := "XMLDocument"

/**
 * @type {String}
 */
export global NAME_WordDocument := "WordDocument"

/**
 * @type {String}
 */
export global NAME_MHTDocument := "MHTDocument"

/**
 * @type {String}
 */
export global NAME_ExcelDocument := "ExcelDocument"

/**
 * @type {String}
 */
export global NAME_PowerPointDocument := "PowerPointDocument"

/**
 * @type {String}
 */
export global NAME_GenericObj_ObjectID := "ObjectID"

/**
 * @type {String}
 */
export global NAME_GenericObj_ReferenceParentID := "ReferenceParentID"

/**
 * @type {String}
 */
export global NAME_GenericObj_StorageID := "StorageID"

/**
 * @type {String}
 */
export global NAME_GenericObj_ObjectFormat := "ObjectFormat"

/**
 * @type {String}
 */
export global NAME_GenericObj_ProtectionStatus := "ProtectionStatus"

/**
 * @type {String}
 */
export global NAME_GenericObj_ObjectSize := "ObjectSize"

/**
 * @type {String}
 */
export global NAME_GenericObj_AssociationType := "AssociationType"

/**
 * @type {String}
 */
export global NAME_GenericObj_AssociationDesc := "AssociationDesc"

/**
 * @type {String}
 */
export global NAME_GenericObj_ObjectFileName := "ObjectFileName"

/**
 * @type {String}
 */
export global NAME_GenericObj_DateCreated := "DateCreated"

/**
 * @type {String}
 */
export global NAME_GenericObj_DateModified := "DateModified"

/**
 * @type {String}
 */
export global NAME_GenericObj_Keywords := "Keywords"

/**
 * @type {String}
 */
export global NAME_GenericObj_ParentID := "ParentID"

/**
 * @type {String}
 */
export global NAME_GenericObj_AllowedFolderContents := "AllowedFolderContents"

/**
 * @type {String}
 */
export global NAME_GenericObj_Hidden := "Hidden"

/**
 * @type {String}
 */
export global NAME_GenericObj_SystemObject := "SystemObject"

/**
 * @type {String}
 */
export global NAME_GenericObj_PersistentUID := "PersistentUID"

/**
 * @type {String}
 */
export global NAME_GenericObj_SyncID := "SyncID"

/**
 * @type {String}
 */
export global NAME_GenericObj_PropertyBag := "PropertyBag"

/**
 * @type {String}
 */
export global NAME_GenericObj_Name := "Name"

/**
 * @type {String}
 */
export global NAME_MediaObj_Artist := "Artist"

/**
 * @type {String}
 */
export global NAME_GenericObj_DateAuthored := "DateAuthored"

/**
 * @type {String}
 */
export global NAME_GenericObj_Description := "Description"

/**
 * @type {String}
 */
export global NAME_GenericObj_LanguageLocale := "LanguageLocale"

/**
 * @type {String}
 */
export global NAME_GenericObj_Copyright := "Copyright"

/**
 * @type {String}
 */
export global NAME_VideoObj_Source := "Source"

/**
 * @type {String}
 */
export global NAME_MediaObj_GeographicOrigin := "GeographicOrigin"

/**
 * @type {String}
 */
export global NAME_GenericObj_DateAdded := "DateAdded"

/**
 * @type {String}
 */
export global NAME_GenericObj_NonConsumable := "NonConsumable"

/**
 * @type {String}
 */
export global NAME_GenericObj_Corrupt := "Corrupt"

/**
 * @type {String}
 */
export global NAME_MediaObj_Width := "Width"

/**
 * @type {String}
 */
export global NAME_MediaObj_Height := "Height"

/**
 * @type {String}
 */
export global NAME_MediaObj_Duration := "Duration"

/**
 * @type {String}
 */
export global NAME_MediaObj_UserRating := "UserRating"

/**
 * @type {String}
 */
export global NAME_MediaObj_Track := "Track"

/**
 * @type {String}
 */
export global NAME_MediaObj_Genre := "Genre"

/**
 * @type {String}
 */
export global NAME_MediaObj_Credits := "Credits"

/**
 * @type {String}
 */
export global NAME_AudioObj_Lyrics := "Lyrics"

/**
 * @type {String}
 */
export global NAME_MediaObj_SubscriptionContentID := "SubscriptionContentID"

/**
 * @type {String}
 */
export global NAME_MediaObj_Producer := "Producer"

/**
 * @type {String}
 */
export global NAME_MediaObj_UseCount := "UseCount"

/**
 * @type {String}
 */
export global NAME_MediaObj_SkipCount := "SkipCount"

/**
 * @type {String}
 */
export global NAME_GenericObj_DateAccessed := "DateAccessed"

/**
 * @type {String}
 */
export global NAME_MediaObj_ParentalRating := "ParentalRating"

/**
 * @type {String}
 */
export global NAME_MediaObj_MediaType := "MediaType"

/**
 * @type {String}
 */
export global NAME_MediaObj_Composer := "Composer"

/**
 * @type {String}
 */
export global NAME_MediaObj_EffectiveRating := "EffectiveRating"

/**
 * @type {String}
 */
export global NAME_MediaObj_Subtitle := "Subtitle"

/**
 * @type {String}
 */
export global NAME_MediaObj_DateOriginalRelease := "DateOriginalRelease"

/**
 * @type {String}
 */
export global NAME_MediaObj_AlbumName := "AlbumName"

/**
 * @type {String}
 */
export global NAME_MediaObj_AlbumArtist := "AlbumArtist"

/**
 * @type {String}
 */
export global NAME_MediaObj_Mood := "Mood"

/**
 * @type {String}
 */
export global NAME_GenericObj_DRMStatus := "DRMStatus"

/**
 * @type {String}
 */
export global NAME_GenericObj_SubDescription := "SubDescription"

/**
 * @type {String}
 */
export global NAME_ImageObj_IsCropped := "IsCropped"

/**
 * @type {String}
 */
export global NAME_ImageObj_IsColorCorrected := "IsColorCorrected"

/**
 * @type {String}
 */
export global NAME_ImageObj_ImageBitDepth := "ImageBitDepth"

/**
 * @type {String}
 */
export global NAME_ImageObj_Aperature := "Aperature"

/**
 * @type {String}
 */
export global NAME_ImageObj_Exposure := "Exposure"

/**
 * @type {String}
 */
export global NAME_ImageObj_ISOSpeed := "ISOSpeed"

/**
 * @type {String}
 */
export global NAME_MediaObj_Owner := "Owner"

/**
 * @type {String}
 */
export global NAME_MediaObj_Editor := "Editor"

/**
 * @type {String}
 */
export global NAME_MediaObj_WebMaster := "WebMaster"

/**
 * @type {String}
 */
export global NAME_MediaObj_URLSource := "URLSource"

/**
 * @type {String}
 */
export global NAME_MediaObj_URLLink := "URLLink"

/**
 * @type {String}
 */
export global NAME_MediaObj_BookmarkTime := "BookmarkTime"

/**
 * @type {String}
 */
export global NAME_MediaObj_BookmarkObject := "BookmarkObject"

/**
 * @type {String}
 */
export global NAME_MediaObj_BookmarkByte := "BookmarkByte"

/**
 * @type {String}
 */
export global NAME_GenericObj_DateRevised := "DateRevised"

/**
 * @type {String}
 */
export global NAME_GenericObj_TimeToLive := "TimeToLive"

/**
 * @type {String}
 */
export global NAME_MediaObj_MediaUID := "MediaUID"

/**
 * @type {String}
 */
export global NAME_MediaObj_TotalBitRate := "TotalBitRate"

/**
 * @type {String}
 */
export global NAME_MediaObj_BitRateType := "BitRateType"

/**
 * @type {String}
 */
export global NAME_MediaObj_SampleRate := "SampleRate"

/**
 * @type {String}
 */
export global NAME_AudioObj_Channels := "Channels"

/**
 * @type {String}
 */
export global NAME_AudioObj_AudioBitDepth := "AudioBitDepth"

/**
 * @type {String}
 */
export global NAME_AudioObj_AudioBlockAlignment := "AudioBlockAlignment"

/**
 * @type {String}
 */
export global NAME_VideoObj_ScanType := "ScanType"

/**
 * @type {String}
 */
export global NAME_AudioObj_AudioFormatCode := "AudioFormatCode"

/**
 * @type {String}
 */
export global NAME_AudioObj_AudioBitRate := "AudioBitRate"

/**
 * @type {String}
 */
export global NAME_VideoObj_VideoFormatCode := "VideoFormatCode"

/**
 * @type {String}
 */
export global NAME_VideoObj_VideoBitRate := "VideoBitRate"

/**
 * @type {String}
 */
export global NAME_VideoObj_VideoFrameRate := "VideoFrameRate"

/**
 * @type {String}
 */
export global NAME_VideoObj_KeyFrameDistance := "KeyFrameDistance"

/**
 * @type {String}
 */
export global NAME_MediaObj_BufferSize := "BufferSize"

/**
 * @type {String}
 */
export global NAME_MediaObj_EncodingQuality := "EncodingQuality"

/**
 * @type {String}
 */
export global NAME_MediaObj_EncodingProfile := "EncodingProfile"

/**
 * @type {String}
 */
export global NAME_MediaObj_AudioEncodingProfile := "AudioEncodingProfile"

/**
 * @type {Integer (UInt32)}
 */
export global DEVSVC_SERVICEINFO_VERSION := 100

/**
 * @type {Integer (UInt32)}
 */
export global DEVSVCTYPE_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global DEVSVCTYPE_ABSTRACT := 1

/**
 * @type {String}
 */
export global NAME_Services_ServiceDisplayName := "ServiceDisplayName"

/**
 * @type {String}
 */
export global NAME_Services_ServiceIcon := "ServiceIcon"

/**
 * @type {String}
 */
export global NAME_Services_ServiceLocale := "ServiceLocale"

/**
 * @type {String}
 */
export global NAME_CalendarSvc := "Calendar"

/**
 * @type {Integer (UInt32)}
 */
export global TYPE_CalendarSvc := 0

/**
 * @type {String}
 */
export global NAME_CalendarSvc_SyncWindowStart := "SyncWindowStart"

/**
 * @type {String}
 */
export global NAME_CalendarSvc_SyncWindowEnd := "SyncWindowEnd"

/**
 * @type {String}
 */
export global NAME_AbstractActivity := "AbstractActivity"

/**
 * @type {String}
 */
export global NAME_AbstractActivityOccurrence := "AbstractActivityOccurrence"

/**
 * @type {String}
 */
export global NAME_VCalendar1Activity := "VCalendar1"

/**
 * @type {String}
 */
export global NAME_ICalendarActivity := "ICalendar"

/**
 * @type {String}
 */
export global NAME_CalendarObj_Location := "Location"

/**
 * @type {String}
 */
export global NAME_CalendarObj_Accepted := "Accepted"

/**
 * @type {String}
 */
export global NAME_CalendarObj_Tentative := "Tentative"

/**
 * @type {String}
 */
export global NAME_CalendarObj_Declined := "Declined"

/**
 * @type {String}
 */
export global NAME_CalendarObj_TimeZone := "TimeZone"

/**
 * @type {String}
 */
export global NAME_CalendarObj_ReminderOffset := "ReminderOffset"

/**
 * @type {String}
 */
export global NAME_CalendarObj_BusyStatus := "BusyStatus"

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_CalendarObj_BusyStatusFree := 0

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_CalendarObj_BusyStatusBusy := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_CalendarObj_BusyStatusOutOfOffice := 2

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_CalendarObj_BusyStatusTentative := 3

/**
 * @type {String}
 */
export global NAME_CalendarObj_PatternStartTime := "PatternStartTime"

/**
 * @type {String}
 */
export global NAME_CalendarObj_PatternDuration := "PatternDuration"

/**
 * @type {String}
 */
export global NAME_CalendarObj_BeginDateTime := "BeginDateTime"

/**
 * @type {String}
 */
export global NAME_CalendarObj_EndDateTime := "EndDateTime"

/**
 * @type {String}
 */
export global NAME_HintsSvc := "Hints"

/**
 * @type {Integer (UInt32)}
 */
export global TYPE_HintsSvc := 0

/**
 * @type {String}
 */
export global NAME_MessageSvc := "Message"

/**
 * @type {Integer (UInt32)}
 */
export global TYPE_MessageSvc := 0

/**
 * @type {String}
 */
export global NAME_AbstractMessage := "AbstractMessage"

/**
 * @type {String}
 */
export global NAME_AbstractMessageFolder := "AbstractMessageFolder"

/**
 * @type {String}
 */
export global NAME_MessageObj_Subject := "Subject"

/**
 * @type {String}
 */
export global NAME_MessageObj_Body := "Body"

/**
 * @type {String}
 */
export global NAME_MessageObj_Priority := "Priority"

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_MessageObj_PriorityHighest := 2

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_MessageObj_PriorityNormal := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_MessageObj_PriorityLowest := 0

/**
 * @type {String}
 */
export global NAME_MessageObj_Category := "Category"

/**
 * @type {String}
 */
export global NAME_MessageObj_Sender := "Sender"

/**
 * @type {String}
 */
export global NAME_MessageObj_To := "To"

/**
 * @type {String}
 */
export global NAME_MessageObj_CC := "CC"

/**
 * @type {String}
 */
export global NAME_MessageObj_BCC := "BCC"

/**
 * @type {String}
 */
export global NAME_MessageObj_Read := "Read"

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_MessageObj_ReadFalse := 0

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_MessageObj_ReadTrue := 255

/**
 * @type {String}
 */
export global NAME_MessageObj_ReceivedTime := "ReceivedTime"

/**
 * @type {String}
 */
export global NAME_MessageObj_PatternOriginalDateTime := "PatternOriginalDateTime"

/**
 * @type {String}
 */
export global NAME_MessageObj_PatternType := "PatternType"

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_MessageObj_PatternTypeDaily := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_MessageObj_PatternTypeWeekly := 2

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_MessageObj_PatternTypeMonthly := 3

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_MessageObj_PatternTypeYearly := 4

/**
 * @type {String}
 */
export global NAME_MessageObj_PatternValidStartDate := "PatternValidStartDate"

/**
 * @type {String}
 */
export global NAME_MessageObj_PatternValidEndDate := "PatternValidEndDate"

/**
 * @type {String}
 */
export global NAME_MessageObj_PatternPeriod := "PatternPeriod"

/**
 * @type {String}
 */
export global NAME_MessageObj_PatternDayOfWeek := "PatternDayOfWeek"

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_MessageObj_DayOfWeekNone := 0

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_MessageObj_DayOfWeekSunday := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_MessageObj_DayOfWeekMonday := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_MessageObj_DayOfWeekTuesday := 4

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_MessageObj_DayOfWeekWednesday := 8

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_MessageObj_DayOfWeekThursday := 16

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_MessageObj_DayOfWeekFriday := 32

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_MessageObj_DayOfWeekSaturday := 64

/**
 * @type {String}
 */
export global NAME_MessageObj_PatternDayOfMonth := "PatternDayOfMonth"

/**
 * @type {Integer (UInt32)}
 */
export global RANGEMIN_MessageObj_PatternDayOfMonth := 1

/**
 * @type {Integer (UInt32)}
 */
export global RANGEMAX_MessageObj_PatternDayOfMonth := 31

/**
 * @type {Integer (UInt32)}
 */
export global RANGESTEP_MessageObj_PatternDayOfMonth := 1

/**
 * @type {String}
 */
export global NAME_MessageObj_PatternMonthOfYear := "PatternMonthOfYear"

/**
 * @type {Integer (UInt32)}
 */
export global RANGEMIN_MessageObj_PatternMonthOfYear := 1

/**
 * @type {Integer (UInt32)}
 */
export global RANGEMAX_MessageObj_PatternMonthOfYear := 12

/**
 * @type {Integer (UInt32)}
 */
export global RANGESTEP_MessageObj_PatternMonthOfYear := 1

/**
 * @type {String}
 */
export global NAME_MessageObj_PatternInstance := "PatternInstance"

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_MessageObj_PatternInstanceNone := 0

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_MessageObj_PatternInstanceFirst := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_MessageObj_PatternInstanceSecond := 2

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_MessageObj_PatternInstanceThird := 3

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_MessageObj_PatternInstanceFourth := 4

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_MessageObj_PatternInstanceLast := 5

/**
 * @type {String}
 */
export global NAME_MessageObj_PatternDeleteDates := "PatternDeleteDates"

/**
 * @type {String}
 */
export global NAME_DeviceMetadataSvc := "Metadata"

/**
 * @type {Integer (UInt32)}
 */
export global TYPE_DeviceMetadataSvc := 0

/**
 * @type {String}
 */
export global NAME_DeviceMetadataCAB := "DeviceMetadataCAB"

/**
 * @type {String}
 */
export global NAME_DeviceMetadataObj_ContentID := "ContentID"

/**
 * @type {String}
 */
export global NAME_DeviceMetadataObj_DefaultCAB := "DefaultCAB"

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_DeviceMetadataObj_DefaultCABFalse := 0

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_DeviceMetadataObj_DefaultCABTrue := 1

/**
 * @type {String}
 */
export global NAME_NotesSvc := "Notes"

/**
 * @type {Integer (UInt32)}
 */
export global TYPE_NotesSvc := 0

/**
 * @type {String}
 */
export global NAME_AbstractNote := "AbstractNote"

/**
 * @type {String}
 */
export global NAME_StatusSvc := "Status"

/**
 * @type {Integer (UInt32)}
 */
export global TYPE_StatusSvc := 0

/**
 * @type {String}
 */
export global NAME_StatusSvc_SignalStrength := "SignalStrength"

/**
 * @type {Integer (UInt32)}
 */
export global RANGEMIN_StatusSvc_SignalStrength := 0

/**
 * @type {Integer (UInt32)}
 */
export global RANGEMAX_StatusSvc_SignalStrength := 4

/**
 * @type {Integer (UInt32)}
 */
export global RANGESTEP_StatusSvc_SignalStrength := 1

/**
 * @type {String}
 */
export global NAME_StatusSvc_TextMessages := "TextMessages"

/**
 * @type {Integer (UInt32)}
 */
export global RANGEMAX_StatusSvc_TextMessages := 255

/**
 * @type {String}
 */
export global NAME_StatusSvc_NewPictures := "NewPictures"

/**
 * @type {Integer (UInt32)}
 */
export global RANGEMAX_StatusSvc_NewPictures := 65535

/**
 * @type {String}
 */
export global NAME_StatusSvc_MissedCalls := "MissedCalls"

/**
 * @type {Integer (UInt32)}
 */
export global RANGEMAX_StatusSvc_MissedCalls := 255

/**
 * @type {String}
 */
export global NAME_StatusSvc_VoiceMail := "VoiceMail"

/**
 * @type {Integer (UInt32)}
 */
export global RANGEMAX_StatusSvc_VoiceMail := 255

/**
 * @type {String}
 */
export global NAME_StatusSvc_NetworkName := "NetworkName"

/**
 * @type {String}
 */
export global NAME_StatusSvc_NetworkType := "NetworkType"

/**
 * @type {String}
 */
export global NAME_StatusSvc_Roaming := "Roaming"

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_StatusSvc_RoamingInactive := 0

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_StatusSvc_RoamingActive := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_StatusSvc_RoamingUnknown := 2

/**
 * @type {String}
 */
export global NAME_StatusSvc_BatteryLife := "BatteryLife"

/**
 * @type {Integer (UInt32)}
 */
export global RANGEMIN_StatusSvc_BatteryLife := 0

/**
 * @type {Integer (UInt32)}
 */
export global RANGEMAX_StatusSvc_BatteryLife := 100

/**
 * @type {Integer (UInt32)}
 */
export global RANGESTEP_StatusSvc_BatteryLife := 1

/**
 * @type {String}
 */
export global NAME_StatusSvc_ChargingState := "ChargingState"

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_StatusSvc_ChargingInactive := 0

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_StatusSvc_ChargingActive := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_StatusSvc_ChargingUnknown := 2

/**
 * @type {String}
 */
export global NAME_StatusSvc_StorageCapacity := "StorageCapacity"

/**
 * @type {String}
 */
export global NAME_StatusSvc_StorageFreeSpace := "StorageFreeSpace"

/**
 * @type {String}
 */
export global NAME_SyncSvc_SyncFormat := "SyncFormat"

/**
 * @type {String}
 */
export global NAME_SyncSvc_LocalOnlyDelete := "LocalOnlyDelete"

/**
 * @type {String}
 */
export global NAME_SyncSvc_FilterType := "FilterType"

/**
 * @type {Integer (UInt32)}
 */
export global SYNCSVC_FILTER_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SYNCSVC_FILTER_CONTACTS_WITH_PHONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYNCSVC_FILTER_TASK_ACTIVE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SYNCSVC_FILTER_CALENDAR_WINDOW_WITH_RECURRENCE := 3

/**
 * @type {String}
 */
export global NAME_SyncSvc_SyncObjectReferences := "SyncObjectReferences"

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_SyncSvc_SyncObjectReferencesDisabled := 0

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_SyncSvc_SyncObjectReferencesEnabled := 255

/**
 * @type {String}
 */
export global NAME_SyncObj_LastAuthorProxyID := "LastAuthorProxyID"

/**
 * @type {String}
 */
export global NAME_SyncSvc_BeginSync := "BeginSync"

/**
 * @type {String}
 */
export global NAME_SyncSvc_EndSync := "EndSync"

/**
 * @type {String}
 */
export global NAME_TasksSvc := "Tasks"

/**
 * @type {Integer (UInt32)}
 */
export global TYPE_TasksSvc := 0

/**
 * @type {String}
 */
export global NAME_TasksSvc_SyncActiveOnly := "FilterType"

/**
 * @type {String}
 */
export global NAME_AbstractTask := "AbstractTask"

/**
 * @type {String}
 */
export global NAME_TaskObj_ReminderDateTime := "ReminderDateTime"

/**
 * @type {String}
 */
export global NAME_TaskObj_Complete := "Complete"

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_TaskObj_CompleteFalse := 0

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_TaskObj_CompleteTrue := 255

/**
 * @type {String}
 */
export global NAME_TaskObj_BeginDate := "BeginDate"

/**
 * @type {String}
 */
export global NAME_TaskObj_EndDate := "EndDate"

/**
 * @type {Guid}
 */
export global WPD_CATEGORY_MTP_EXT_VENDOR_OPERATIONS := Guid("{4d545058-1a2e-4106-a357-771e0819fc56}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_MTP_EXT_GET_SUPPORTED_VENDOR_OPCODES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_MTP_EXT_GET_SUPPORTED_VENDOR_OPCODES.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_COMMAND_MTP_EXT_GET_SUPPORTED_VENDOR_OPCODES.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_MTP_EXT_EXECUTE_COMMAND_WITHOUT_DATA_PHASE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_MTP_EXT_EXECUTE_COMMAND_WITHOUT_DATA_PHASE.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_COMMAND_MTP_EXT_EXECUTE_COMMAND_WITHOUT_DATA_PHASE.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_MTP_EXT_EXECUTE_COMMAND_WITH_DATA_TO_READ := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_MTP_EXT_EXECUTE_COMMAND_WITH_DATA_TO_READ.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_COMMAND_MTP_EXT_EXECUTE_COMMAND_WITH_DATA_TO_READ.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_MTP_EXT_EXECUTE_COMMAND_WITH_DATA_TO_WRITE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_MTP_EXT_EXECUTE_COMMAND_WITH_DATA_TO_WRITE.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_COMMAND_MTP_EXT_EXECUTE_COMMAND_WITH_DATA_TO_WRITE.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_MTP_EXT_READ_DATA := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_MTP_EXT_READ_DATA.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_COMMAND_MTP_EXT_READ_DATA.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_MTP_EXT_WRITE_DATA := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_MTP_EXT_WRITE_DATA.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_COMMAND_MTP_EXT_WRITE_DATA.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_MTP_EXT_END_DATA_TRANSFER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_MTP_EXT_END_DATA_TRANSFER.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_COMMAND_MTP_EXT_END_DATA_TRANSFER.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global WPD_COMMAND_MTP_EXT_GET_VENDOR_EXTENSION_DESCRIPTION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_COMMAND_MTP_EXT_GET_VENDOR_EXTENSION_DESCRIPTION.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_COMMAND_MTP_EXT_GET_VENDOR_EXTENSION_DESCRIPTION.pid := 18

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_MTP_EXT_OPERATION_CODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_MTP_EXT_OPERATION_CODE.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_PROPERTY_MTP_EXT_OPERATION_CODE.pid := 1001

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_MTP_EXT_OPERATION_PARAMS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_MTP_EXT_OPERATION_PARAMS.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_PROPERTY_MTP_EXT_OPERATION_PARAMS.pid := 1002

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_MTP_EXT_RESPONSE_CODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_MTP_EXT_RESPONSE_CODE.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_PROPERTY_MTP_EXT_RESPONSE_CODE.pid := 1003

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_MTP_EXT_RESPONSE_PARAMS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_MTP_EXT_RESPONSE_PARAMS.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_PROPERTY_MTP_EXT_RESPONSE_PARAMS.pid := 1004

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_MTP_EXT_VENDOR_OPERATION_CODES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_MTP_EXT_VENDOR_OPERATION_CODES.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_PROPERTY_MTP_EXT_VENDOR_OPERATION_CODES.pid := 1005

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_MTP_EXT_TRANSFER_CONTEXT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_MTP_EXT_TRANSFER_CONTEXT.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_PROPERTY_MTP_EXT_TRANSFER_CONTEXT.pid := 1006

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_MTP_EXT_TRANSFER_TOTAL_DATA_SIZE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_MTP_EXT_TRANSFER_TOTAL_DATA_SIZE.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_PROPERTY_MTP_EXT_TRANSFER_TOTAL_DATA_SIZE.pid := 1007

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_TO_READ := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_TO_READ.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_TO_READ.pid := 1008

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_READ := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_READ.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_READ.pid := 1009

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_TO_WRITE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_TO_WRITE.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_TO_WRITE.pid := 1010

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_WRITTEN := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_WRITTEN.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_PROPERTY_MTP_EXT_TRANSFER_NUM_BYTES_WRITTEN.pid := 1011

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_MTP_EXT_TRANSFER_DATA := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_MTP_EXT_TRANSFER_DATA.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_PROPERTY_MTP_EXT_TRANSFER_DATA.pid := 1012

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_MTP_EXT_OPTIMAL_TRANSFER_BUFFER_SIZE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_MTP_EXT_OPTIMAL_TRANSFER_BUFFER_SIZE.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_PROPERTY_MTP_EXT_OPTIMAL_TRANSFER_BUFFER_SIZE.pid := 1013

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_MTP_EXT_VENDOR_EXTENSION_DESCRIPTION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_MTP_EXT_VENDOR_EXTENSION_DESCRIPTION.fmtid),
    Guid.Ptr, Guid("{4d545058-1a2e-4106-a357-771e0819fc56}"),
    UInt32, 16)
WPD_PROPERTY_MTP_EXT_VENDOR_EXTENSION_DESCRIPTION.pid := 1014

/**
 * @type {Guid}
 */
export global WPD_PROPERTIES_MTP_VENDOR_EXTENDED_OBJECT_PROPS := Guid("{4d545058-4fce-4578-95c8-8698a9bc0f49}")

/**
 * @type {Guid}
 */
export global WPD_PROPERTIES_MTP_VENDOR_EXTENDED_DEVICE_PROPS := Guid("{4d545058-8900-40b3-8f1d-dc246e1e8370}")

/**
 * @type {Guid}
 */
export global WPD_EVENT_MTP_VENDOR_EXTENDED_EVENTS := Guid("{00000000-5738-4ff2-8445-be3126691059}")

/**
 * @type {PROPERTYKEY}
 */
export global WPD_PROPERTY_MTP_EXT_EVENT_PARAMS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPD_PROPERTY_MTP_EXT_EVENT_PARAMS.fmtid),
    Guid.Ptr, Guid("{4d545058-ef88-4e4d-95c3-4f327f728a96}"),
    UInt32, 16)
WPD_PROPERTY_MTP_EXT_EVENT_PARAMS.pid := 1011

/**
 * @type {Guid}
 */
export global CLSID_WPD_NAMESPACE_EXTENSION := Guid("{35786d3c-b075-49b9-88dd-029876e11c01}")

/**
 * @type {Guid}
 */
export global WPDNSE_OBJECT_PROPERTIES_V1 := Guid("{34d71409-4b47-4d80-aaac-3a28a4a3b3e6}")

/**
 * @type {PROPERTYKEY}
 */
export global WPDNSE_OBJECT_HAS_CONTACT_PHOTO := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPDNSE_OBJECT_HAS_CONTACT_PHOTO.fmtid),
    Guid.Ptr, Guid("{34d71409-4b47-4d80-aaac-3a28a4a3b3e6}"),
    UInt32, 16)
WPDNSE_OBJECT_HAS_CONTACT_PHOTO.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global WPDNSE_OBJECT_HAS_THUMBNAIL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPDNSE_OBJECT_HAS_THUMBNAIL.fmtid),
    Guid.Ptr, Guid("{34d71409-4b47-4d80-aaac-3a28a4a3b3e6}"),
    UInt32, 16)
WPDNSE_OBJECT_HAS_THUMBNAIL.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global WPDNSE_OBJECT_HAS_ICON := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPDNSE_OBJECT_HAS_ICON.fmtid),
    Guid.Ptr, Guid("{34d71409-4b47-4d80-aaac-3a28a4a3b3e6}"),
    UInt32, 16)
WPDNSE_OBJECT_HAS_ICON.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global WPDNSE_OBJECT_HAS_AUDIO_CLIP := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPDNSE_OBJECT_HAS_AUDIO_CLIP.fmtid),
    Guid.Ptr, Guid("{34d71409-4b47-4d80-aaac-3a28a4a3b3e6}"),
    UInt32, 16)
WPDNSE_OBJECT_HAS_AUDIO_CLIP.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global WPDNSE_OBJECT_HAS_ALBUM_ART := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPDNSE_OBJECT_HAS_ALBUM_ART.fmtid),
    Guid.Ptr, Guid("{34d71409-4b47-4d80-aaac-3a28a4a3b3e6}"),
    UInt32, 16)
WPDNSE_OBJECT_HAS_ALBUM_ART.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global WPDNSE_OBJECT_OPTIMAL_READ_BLOCK_SIZE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(WPDNSE_OBJECT_OPTIMAL_READ_BLOCK_SIZE.fmtid),
    Guid.Ptr, Guid("{34d71409-4b47-4d80-aaac-3a28a4a3b3e6}"),
    UInt32, 16)
WPDNSE_OBJECT_OPTIMAL_READ_BLOCK_SIZE.pid := 7

/**
 * @type {Integer (UInt32)}
 */
export global WPDNSE_PROPSHEET_DEVICE_GENERAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global WPDNSE_PROPSHEET_STORAGE_GENERAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global WPDNSE_PROPSHEET_CONTENT_GENERAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global WPDNSE_PROPSHEET_CONTENT_REFERENCES := 8

/**
 * @type {Integer (UInt32)}
 */
export global WPDNSE_PROPSHEET_CONTENT_RESOURCES := 16

/**
 * @type {Integer (UInt32)}
 */
export global WPDNSE_PROPSHEET_CONTENT_DETAILS := 32

/**
 * @type {String}
 */
export global STR_WPDNSE_FAST_ENUM := "WPDNSE Fast Enum"

/**
 * @type {String}
 */
export global STR_WPDNSE_SIMPLE_ITEM := "WPDNSE SimpleItem"

/**
 * @type {String}
 */
export global NAME_ContactsSvc := "Contacts"

/**
 * @type {Integer (UInt32)}
 */
export global TYPE_ContactsSvc := 0

/**
 * @type {String}
 */
export global NAME_ContactSvc_SyncWithPhoneOnly := "FilterType"

/**
 * @type {String}
 */
export global NAME_AbstractContact := "AbstractContact"

/**
 * @type {String}
 */
export global NAME_VCard2Contact := "VCard2Contact"

/**
 * @type {String}
 */
export global NAME_VCard3Contact := "VCard3Contact"

/**
 * @type {String}
 */
export global NAME_AbstractContactGroup := "AbstractContactGroup"

/**
 * @type {String}
 */
export global NAME_ContactObj_GivenName := "GivenName"

/**
 * @type {String}
 */
export global NAME_ContactObj_MiddleNames := "MiddleNames"

/**
 * @type {String}
 */
export global NAME_ContactObj_FamilyName := "FamilyName"

/**
 * @type {String}
 */
export global NAME_ContactObj_Title := "Title"

/**
 * @type {String}
 */
export global NAME_ContactObj_Suffix := "Suffix"

/**
 * @type {String}
 */
export global NAME_ContactObj_PhoneticGivenName := "PhoneticGivenName"

/**
 * @type {String}
 */
export global NAME_ContactObj_PhoneticFamilyName := "PhoneticFamilyName"

/**
 * @type {String}
 */
export global NAME_ContactObj_PersonalAddressFull := "PersonalAddressFull"

/**
 * @type {String}
 */
export global NAME_ContactObj_PersonalAddressStreet := "PersonalAddressStreet"

/**
 * @type {String}
 */
export global NAME_ContactObj_PersonalAddressLine2 := "PersonalAddressLine2"

/**
 * @type {String}
 */
export global NAME_ContactObj_PersonalAddressCity := "PersonalAddressCity"

/**
 * @type {String}
 */
export global NAME_ContactObj_PersonalAddressRegion := "PersonalAddressRegion"

/**
 * @type {String}
 */
export global NAME_ContactObj_PersonalAddressPostalCode := "PersonalAddressPostalCode"

/**
 * @type {String}
 */
export global NAME_ContactObj_PersonalAddressCountry := "PersonalAddressCountry"

/**
 * @type {String}
 */
export global NAME_ContactObj_BusinessAddressFull := "BusinessAddressFull"

/**
 * @type {String}
 */
export global NAME_ContactObj_BusinessAddressStreet := "BusinessAddressStreet"

/**
 * @type {String}
 */
export global NAME_ContactObj_BusinessAddressLine2 := "BusinessAddressLine2"

/**
 * @type {String}
 */
export global NAME_ContactObj_BusinessAddressCity := "BusinessAddressCity"

/**
 * @type {String}
 */
export global NAME_ContactObj_BusinessAddressRegion := "BusinessAddressRegion"

/**
 * @type {String}
 */
export global NAME_ContactObj_BusinessAddressPostalCode := "BusinessAddressPostalCode"

/**
 * @type {String}
 */
export global NAME_ContactObj_BusinessAddressCountry := "BusinessAddressCountry"

/**
 * @type {String}
 */
export global NAME_ContactObj_OtherAddressFull := "OtherAddressFull"

/**
 * @type {String}
 */
export global NAME_ContactObj_OtherAddressStreet := "OtherAddressStreet"

/**
 * @type {String}
 */
export global NAME_ContactObj_OtherAddressLine2 := "OtherAddressLine2"

/**
 * @type {String}
 */
export global NAME_ContactObj_OtherAddressCity := "OtherAddressCity"

/**
 * @type {String}
 */
export global NAME_ContactObj_OtherAddressRegion := "OtherAddressRegion"

/**
 * @type {String}
 */
export global NAME_ContactObj_OtherAddressPostalCode := "OtherAddressPostalCode"

/**
 * @type {String}
 */
export global NAME_ContactObj_OtherAddressCountry := "OtherAddressCountry"

/**
 * @type {String}
 */
export global NAME_ContactObj_Email := "Email"

/**
 * @type {String}
 */
export global NAME_ContactObj_PersonalEmail := "PersonalEmail"

/**
 * @type {String}
 */
export global NAME_ContactObj_PersonalEmail2 := "PersonalEmail2"

/**
 * @type {String}
 */
export global NAME_ContactObj_BusinessEmail := "BusinessEmail"

/**
 * @type {String}
 */
export global NAME_ContactObj_BusinessEmail2 := "BusinessEmail2"

/**
 * @type {String}
 */
export global NAME_ContactObj_OtherEmail := "OtherEmail"

/**
 * @type {String}
 */
export global NAME_ContactObj_Phone := "Phone"

/**
 * @type {String}
 */
export global NAME_ContactObj_PersonalPhone := "PersonalPhone"

/**
 * @type {String}
 */
export global NAME_ContactObj_PersonalPhone2 := "PersonalPhone2"

/**
 * @type {String}
 */
export global NAME_ContactObj_BusinessPhone := "BusinessPhone"

/**
 * @type {String}
 */
export global NAME_ContactObj_BusinessPhone2 := "BusinessPhone2"

/**
 * @type {String}
 */
export global NAME_ContactObj_MobilePhone := "MobilePhone"

/**
 * @type {String}
 */
export global NAME_ContactObj_MobilePhone2 := "MobilePhone2"

/**
 * @type {String}
 */
export global NAME_ContactObj_PersonalFax := "PersonalFax"

/**
 * @type {String}
 */
export global NAME_ContactObj_BusinessFax := "BusinessFax"

/**
 * @type {String}
 */
export global NAME_ContactObj_Pager := "Pager"

/**
 * @type {String}
 */
export global NAME_ContactObj_OtherPhone := "OtherPhone"

/**
 * @type {String}
 */
export global NAME_ContactObj_WebAddress := "WebAddress"

/**
 * @type {String}
 */
export global NAME_ContactObj_PersonalWebAddress := "PersonalWebAddress"

/**
 * @type {String}
 */
export global NAME_ContactObj_BusinessWebAddress := "BusinessWebAddress"

/**
 * @type {String}
 */
export global NAME_ContactObj_IMAddress := "IMAddress"

/**
 * @type {String}
 */
export global NAME_ContactObj_IMAddress2 := "IMAddress2"

/**
 * @type {String}
 */
export global NAME_ContactObj_IMAddress3 := "IMAddress3"

/**
 * @type {String}
 */
export global NAME_ContactObj_Organization := "Organization"

/**
 * @type {String}
 */
export global NAME_ContactObj_PhoneticOrganization := "PhoneticOrganization"

/**
 * @type {String}
 */
export global NAME_ContactObj_Role := "Role"

/**
 * @type {String}
 */
export global NAME_ContactObj_Fax := "Fax"

/**
 * @type {String}
 */
export global NAME_ContactObj_Spouse := "Spouse"

/**
 * @type {String}
 */
export global NAME_ContactObj_Children := "Children"

/**
 * @type {String}
 */
export global NAME_ContactObj_Assistant := "Assistant"

/**
 * @type {String}
 */
export global NAME_ContactObj_Ringtone := "Ringtone"

/**
 * @type {String}
 */
export global NAME_ContactObj_Birthdate := "Birthdate"

/**
 * @type {String}
 */
export global NAME_ContactObj_AnniversaryDate := "AnniversaryDate"

/**
 * @type {String}
 */
export global NAME_RingtonesSvc := "Ringtones"

/**
 * @type {Integer (UInt32)}
 */
export global TYPE_RingtonesSvc := 0

/**
 * @type {String}
 */
export global NAME_RingtonesSvc_DefaultRingtone := "DefaultRingtone"

/**
 * @type {String}
 */
export global NAME_AnchorSyncSvc := "AnchorSync"

/**
 * @type {Integer (UInt32)}
 */
export global TYPE_AnchorSyncSvc := 1

/**
 * @type {String}
 */
export global NAME_AnchorSyncSvc_VersionProps := "AnchorVersionProps"

/**
 * @type {String}
 */
export global NAME_AnchorSyncSvc_ReplicaID := "AnchorReplicaID"

/**
 * @type {String}
 */
export global NAME_AnchorSyncSvc_KnowledgeObjectID := "AnchorKnowledgeObjectID"

/**
 * @type {String}
 */
export global NAME_AnchorSyncSvc_LastSyncProxyID := "AnchorLastSyncProxyID"

/**
 * @type {String}
 */
export global NAME_AnchorSyncSvc_CurrentAnchor := "AnchorCurrentAnchor"

/**
 * @type {String}
 */
export global NAME_AnchorSyncSvc_ProviderVersion := "AnchorProviderVersion"

/**
 * @type {String}
 */
export global NAME_AnchorSyncSvc_SyncFormat := "SyncFormat"

/**
 * @type {String}
 */
export global NAME_AnchorSyncSvc_LocalOnlyDelete := "LocalOnlyDelete"

/**
 * @type {String}
 */
export global NAME_AnchorSyncSvc_FilterType := "FilterType"

/**
 * @type {String}
 */
export global NAME_AnchorSyncKnowledge := "AnchorSyncKnowledge"

/**
 * @type {String}
 */
export global NAME_AnchorResults := "AnchorResults"

/**
 * @type {String}
 */
export global NAME_AnchorResults_AnchorState := "AnchorState"

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_AnchorResults_AnchorStateNormal := 0

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_AnchorResults_AnchorStateInvalid := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_AnchorResults_AnchorStateOld := 2

/**
 * @type {String}
 */
export global NAME_AnchorResults_Anchor := "Anchor"

/**
 * @type {String}
 */
export global NAME_AnchorResults_ResultObjectID := "ResultObjectID"

/**
 * @type {String}
 */
export global NAME_AnchorSyncSvc_GetChangesSinceAnchor := "GetChangesSinceAnchor"

/**
 * @type {String}
 */
export global NAME_AnchorSyncSvc_BeginSync := "BeginSync"

/**
 * @type {String}
 */
export global NAME_AnchorSyncSvc_EndSync := "EndSync"

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_AnchorResults_ItemStateInvalid := 0

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_AnchorResults_ItemStateDeleted := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_AnchorResults_ItemStateCreated := 2

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_AnchorResults_ItemStateUpdated := 3

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_AnchorResults_ItemStateChanged := 4

/**
 * @type {String}
 */
export global NAME_FullEnumSyncSvc := "FullEnumSync"

/**
 * @type {Integer (UInt32)}
 */
export global TYPE_FullEnumSyncSvc := 1

/**
 * @type {String}
 */
export global NAME_FullEnumSyncSvc_VersionProps := "FullEnumVersionProps"

/**
 * @type {String}
 */
export global NAME_FullEnumSyncSvc_ReplicaID := "FullEnumReplicaID"

/**
 * @type {String}
 */
export global NAME_FullEnumSyncSvc_KnowledgeObjectID := "FullEnumKnowledgeObjectID"

/**
 * @type {String}
 */
export global NAME_FullEnumSyncSvc_LastSyncProxyID := "FullEnumLastSyncProxyID"

/**
 * @type {String}
 */
export global NAME_FullEnumSyncSvc_ProviderVersion := "FullEnumProviderVersion"

/**
 * @type {String}
 */
export global NAME_FullEnumSyncSvc_SyncFormat := "SyncFormat"

/**
 * @type {String}
 */
export global NAME_FullEnumSyncSvc_LocalOnlyDelete := "LocalOnlyDelete"

/**
 * @type {String}
 */
export global NAME_FullEnumSyncSvc_FilterType := "FilterType"

/**
 * @type {String}
 */
export global NAME_FullEnumSyncKnowledge := "FullEnumSyncKnowledge"

/**
 * @type {String}
 */
export global NAME_FullEnumSyncSvc_BeginSync := "BeginSync"

/**
 * @type {String}
 */
export global NAME_FullEnumSyncSvc_EndSync := "EndSync"
;@endregion Constants
