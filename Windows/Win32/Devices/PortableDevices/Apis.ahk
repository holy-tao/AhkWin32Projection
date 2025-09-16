#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class PortableDevices {

;@region Constants

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_WPD => "{6ac27878-a6fa-4155-ba85-f98f491d4f33}"

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_WPD_PRIVATE => "{ba0c718f-4ded-49b7-bdd3-fabe28661211}"

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_WPD_SERVICE => "{9ef44f80-3d64-4246-a6aa-206f328d1edc}"

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
     * @type {String}
     */
    static WPD_EVENT_NOTIFICATION => "{2ba2e40a-6b4c-4295-bb43-26322b99aeb2}"

    /**
     * @type {String}
     */
    static WPD_EVENT_OBJECT_ADDED => "{a726da95-e207-4b02-8d44-bef2e86cbffc}"

    /**
     * @type {String}
     */
    static WPD_EVENT_OBJECT_REMOVED => "{be82ab88-a52c-4823-96e5-d0272671fc38}"

    /**
     * @type {String}
     */
    static WPD_EVENT_OBJECT_UPDATED => "{1445a759-2e01-485d-9f27-ff07dae697ab}"

    /**
     * @type {String}
     */
    static WPD_EVENT_DEVICE_RESET => "{7755cf53-c1ed-44f3-b5a2-451e2c376b27}"

    /**
     * @type {String}
     */
    static WPD_EVENT_DEVICE_CAPABILITIES_UPDATED => "{36885aa1-cd54-4daa-b3d0-afb3e03f5999}"

    /**
     * @type {String}
     */
    static WPD_EVENT_STORAGE_FORMAT => "{3782616b-22bc-4474-a251-3070f8d38857}"

    /**
     * @type {String}
     */
    static WPD_EVENT_OBJECT_TRANSFER_REQUESTED => "{8d16a0a1-f2c6-41da-8f19-5e53721adbf2}"

    /**
     * @type {String}
     */
    static WPD_EVENT_DEVICE_REMOVED => "{e4cbca1b-6918-48b9-85ee-02be7c850af9}"

    /**
     * @type {String}
     */
    static WPD_EVENT_SERVICE_METHOD_COMPLETE => "{8a33f5f8-0acc-4d9b-9cc4-112d353b86ca}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_FUNCTIONAL_OBJECT => "{99ed0160-17ff-4c44-9d98-1d7a6f941921}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_FOLDER => "{27e2e392-a111-48e0-ab0c-e17705a05f85}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_IMAGE => "{ef2107d5-a52a-4243-a26b-62d4176d7603}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_DOCUMENT => "{680adf52-950a-4041-9b41-65e393648155}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_CONTACT => "{eaba8313-4525-4707-9f0e-87c6808e9435}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_CONTACT_GROUP => "{346b8932-4c36-40d8-9415-1828291f9de9}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_AUDIO => "{4ad2c85e-5e2d-45e5-8864-4f229e3c6cf0}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_VIDEO => "{9261b03c-3d78-4519-85e3-02c5e1f50bb9}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_TELEVISION => "{60a169cf-f2ae-4e21-9375-9677f11c1c6e}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_PLAYLIST => "{1a33f7e4-af13-48f5-994e-77369dfe04a3}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_MIXED_CONTENT_ALBUM => "{00f0c3ac-a593-49ac-9219-24abca5a2563}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_AUDIO_ALBUM => "{aa18737e-5009-48fa-ae21-85f24383b4e6}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_IMAGE_ALBUM => "{75793148-15f5-4a30-a813-54ed8a37e226}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_VIDEO_ALBUM => "{012b0db7-d4c1-45d6-b081-94b87779614f}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_MEMO => "{9cd20ecf-3b50-414f-a641-e473ffe45751}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_EMAIL => "{8038044a-7e51-4f8f-883d-1d0623d14533}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_APPOINTMENT => "{0fed060e-8793-4b1e-90c9-48ac389ac631}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_TASK => "{63252f2c-887f-4cb6-b1ac-d29855dcef6c}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_PROGRAM => "{d269f96a-247c-4bff-98fb-97f3c49220e6}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_GENERIC_FILE => "{0085e0a6-8d34-45d7-bc5c-447e59c73d48}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_CALENDAR => "{a1fd5967-6023-49a0-9df1-f8060be751b0}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_GENERIC_MESSAGE => "{e80eaaf8-b2db-4133-b67e-1bef4b4a6e5f}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_NETWORK_ASSOCIATION => "{031da7ee-18c8-4205-847e-89a11261d0f3}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_CERTIFICATE => "{dc3876e8-a948-4060-9050-cbd77e8a3d87}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_WIRELESS_PROFILE => "{0bac070a-9f5f-4da4-a8f6-3de44d68fd6c}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_MEDIA_CAST => "{5e88b3cc-3e65-4e62-bfff-229495253ab0}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_SECTION => "{821089f5-1d91-4dc9-be3c-bbb1b35b18ce}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_UNSPECIFIED => "{28d8d31e-249c-454e-aabc-34883168e634}"

    /**
     * @type {String}
     */
    static WPD_CONTENT_TYPE_ALL => "{80e170d2-1055-4a3e-b952-82cc4f8a8689}"

    /**
     * @type {String}
     */
    static WPD_FUNCTIONAL_CATEGORY_DEVICE => "{08ea466b-e3a4-4336-a1f3-a44d2b5c438c}"

    /**
     * @type {String}
     */
    static WPD_FUNCTIONAL_CATEGORY_STORAGE => "{23f05bbc-15de-4c2a-a55b-a9af5ce412ef}"

    /**
     * @type {String}
     */
    static WPD_FUNCTIONAL_CATEGORY_STILL_IMAGE_CAPTURE => "{613ca327-ab93-4900-b4fa-895bb5874b79}"

    /**
     * @type {String}
     */
    static WPD_FUNCTIONAL_CATEGORY_AUDIO_CAPTURE => "{3f2a1919-c7c2-4a00-855d-f57cf06debbb}"

    /**
     * @type {String}
     */
    static WPD_FUNCTIONAL_CATEGORY_VIDEO_CAPTURE => "{e23e5f6b-7243-43aa-8df1-0eb3d968a918}"

    /**
     * @type {String}
     */
    static WPD_FUNCTIONAL_CATEGORY_SMS => "{0044a0b1-c1e9-4afd-b358-a62c6117c9cf}"

    /**
     * @type {String}
     */
    static WPD_FUNCTIONAL_CATEGORY_RENDERING_INFORMATION => "{08600ba4-a7ba-4a01-ab0e-0065d0a356d3}"

    /**
     * @type {String}
     */
    static WPD_FUNCTIONAL_CATEGORY_NETWORK_CONFIGURATION => "{48f4db72-7c6a-4ab0-9e1a-470e3cdbf26a}"

    /**
     * @type {String}
     */
    static WPD_FUNCTIONAL_CATEGORY_ALL => "{2d8a6512-a74c-448e-ba8a-f4ac07c49399}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_ICON => "{077232ed-102c-4638-9c22-83f142bfc822}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_M4A => "{30aba7ac-6ffd-4c23-a359-3e9b52f3f1c8}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_NETWORK_ASSOCIATION => "{b1020000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_X509V3CERTIFICATE => "{b1030000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_MICROSOFT_WFC => "{b1040000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_3GPA => "{e5172730-f971-41ef-a10b-2271a0019d7a}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_3G2A => "{1a11202d-8759-4e34-ba5e-b1211087eee4}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_ALL => "{c1f62eb2-4bb3-479c-9cfa-05b5f3a57b22}"

    /**
     * @type {String}
     */
    static WPD_CATEGORY_NULL => "{00000000-0000-0000-0000-000000000000}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_PROPERTIES_V1 => "{ef6b490d-5cd8-437a-affc-da8b60ee4a3c}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_PROPERTIES_V2 => "{0373cd3d-4a46-40d7-b4d8-73e8da74e775}"

    /**
     * @type {String}
     */
    static WPD_FUNCTIONAL_OBJECT_PROPERTIES_V1 => "{8f052d93-abca-4fc5-a5ac-b01df4dbe598}"

    /**
     * @type {String}
     */
    static WPD_STORAGE_OBJECT_PROPERTIES_V1 => "{01a3057a-74d6-4e80-bea7-dc4c212ce50a}"

    /**
     * @type {String}
     */
    static WPD_NETWORK_ASSOCIATION_PROPERTIES_V1 => "{e4c93c1f-b203-43f1-a100-5a07d11b0274}"

    /**
     * @type {String}
     */
    static WPD_STILL_IMAGE_CAPTURE_OBJECT_PROPERTIES_V1 => "{58c571ec-1bcb-42a7-8ac5-bb291573a260}"

    /**
     * @type {String}
     */
    static WPD_RENDERING_INFORMATION_OBJECT_PROPERTIES_V1 => "{c53d039f-ee23-4a31-8590-7639879870b4}"

    /**
     * @type {String}
     */
    static WPD_CLIENT_INFORMATION_PROPERTIES_V1 => "{204d9f0c-2292-4080-9f42-40664e70f859}"

    /**
     * @type {String}
     */
    static WPD_PROPERTY_ATTRIBUTES_V1 => "{ab7943d8-6332-445f-a00d-8d5ef1e96f37}"

    /**
     * @type {String}
     */
    static WPD_PROPERTY_ATTRIBUTES_V2 => "{5d9da160-74ae-43cc-85a9-fe555a80798e}"

    /**
     * @type {String}
     */
    static WPD_CLASS_EXTENSION_OPTIONS_V1 => "{6309ffef-a87c-4ca7-8434-797576e40a96}"

    /**
     * @type {String}
     */
    static WPD_CLASS_EXTENSION_OPTIONS_V2 => "{3e3595da-4d71-49fe-a0b4-d4406c3ae93f}"

    /**
     * @type {String}
     */
    static WPD_CLASS_EXTENSION_OPTIONS_V3 => "{65c160f8-1367-4ce2-939d-8310839f0d30}"

    /**
     * @type {String}
     */
    static WPD_RESOURCE_ATTRIBUTES_V1 => "{1eb6f604-9278-429f-93cc-5bb8c06656b6}"

    /**
     * @type {String}
     */
    static WPD_DEVICE_PROPERTIES_V1 => "{26d4979a-e643-4626-9e2b-736dc0c92fdc}"

    /**
     * @type {String}
     */
    static WPD_DEVICE_PROPERTIES_V2 => "{463dd662-7fc4-4291-911c-7f4c9cca9799}"

    /**
     * @type {String}
     */
    static WPD_DEVICE_PROPERTIES_V3 => "{6c2b878c-c2ec-490d-b425-d7a75e23e5ed}"

    /**
     * @type {String}
     */
    static WPD_SERVICE_PROPERTIES_V1 => "{7510698a-cb54-481c-b8db-0d75c93f1c06}"

    /**
     * @type {String}
     */
    static WPD_EVENT_PROPERTIES_V1 => "{15ab1953-f817-4fef-a921-5676e838f6e0}"

    /**
     * @type {String}
     */
    static WPD_EVENT_PROPERTIES_V2 => "{52807b8a-4914-4323-9b9a-74f654b2b846}"

    /**
     * @type {String}
     */
    static WPD_EVENT_OPTIONS_V1 => "{b3d8dad7-a361-4b83-8a48-5b02ce10713b}"

    /**
     * @type {String}
     */
    static WPD_EVENT_ATTRIBUTES_V1 => "{10c96578-2e81-4111-adde-e08ca6138f6d}"

    /**
     * @type {String}
     */
    static WPD_API_OPTIONS_V1 => "{10e54a3e-052d-4777-a13c-de7614be2bc4}"

    /**
     * @type {String}
     */
    static WPD_FORMAT_ATTRIBUTES_V1 => "{a0a02000-bcaf-4be8-b3f5-233f231cf58f}"

    /**
     * @type {String}
     */
    static WPD_METHOD_ATTRIBUTES_V1 => "{f17a5071-f039-44af-8efe-432cf32e432a}"

    /**
     * @type {String}
     */
    static WPD_PARAMETER_ATTRIBUTES_V1 => "{e6864dd7-f325-45ea-a1d5-97cf73b6ca58}"

    /**
     * @type {String}
     */
    static WPD_CATEGORY_COMMON => "{f0422a9c-5dc8-4440-b5bd-5df28835658a}"

    /**
     * @type {String}
     */
    static WPD_CATEGORY_OBJECT_ENUMERATION => "{b7474e91-e7f8-4ad9-b400-ad1a4b58eeec}"

    /**
     * @type {String}
     */
    static WPD_CATEGORY_OBJECT_PROPERTIES => "{9e5582e4-0814-44e6-981a-b2998d583804}"

    /**
     * @type {String}
     */
    static WPD_CATEGORY_OBJECT_PROPERTIES_BULK => "{11c824dd-04cd-4e4e-8c7b-f6efb794d84e}"

    /**
     * @type {String}
     */
    static WPD_CATEGORY_OBJECT_RESOURCES => "{b3a2b22d-a595-4108-be0a-fc3c965f3d4a}"

    /**
     * @type {String}
     */
    static WPD_CATEGORY_OBJECT_MANAGEMENT => "{ef1e43dd-a9ed-4341-8bcc-186192aea089}"

    /**
     * @type {String}
     */
    static WPD_CATEGORY_CAPABILITIES => "{0cabec78-6b74-41c6-9216-2639d1fce356}"

    /**
     * @type {String}
     */
    static WPD_CATEGORY_STORAGE => "{d8f907a6-34cc-45fa-97fb-d007fa47ec94}"

    /**
     * @type {String}
     */
    static WPD_CATEGORY_SMS => "{afc25d66-fe0d-4114-9097-970c93e920d1}"

    /**
     * @type {String}
     */
    static WPD_CATEGORY_STILL_IMAGE_CAPTURE => "{4fcd6982-22a2-4b05-a48b-62d38bf27b32}"

    /**
     * @type {String}
     */
    static WPD_CATEGORY_MEDIA_CAPTURE => "{59b433ba-fe44-4d8d-808c-6bcb9b0f15e8}"

    /**
     * @type {String}
     */
    static WPD_CATEGORY_DEVICE_HINTS => "{0d5fb92b-cb46-4c4f-8343-0bc3d3f17c84}"

    /**
     * @type {String}
     */
    static WPD_CLASS_EXTENSION_V1 => "{33fb0d11-64a3-4fac-b4c7-3dfeaa99b051}"

    /**
     * @type {String}
     */
    static WPD_CLASS_EXTENSION_V2 => "{7f0779b5-fa2b-4766-9cb2-f73ba30b6758}"

    /**
     * @type {String}
     */
    static WPD_CATEGORY_NETWORK_CONFIGURATION => "{78f9c6fc-79b8-473c-9060-6bd23dd072c4}"

    /**
     * @type {String}
     */
    static WPD_CATEGORY_SERVICE_COMMON => "{322f071d-36ef-477f-b4b5-6f52d734baee}"

    /**
     * @type {String}
     */
    static WPD_CATEGORY_SERVICE_CAPABILITIES => "{24457e74-2e9f-44f9-8c57-1d1bcb170b89}"

    /**
     * @type {String}
     */
    static WPD_CATEGORY_SERVICE_METHODS => "{2d521ca8-c1b0-4268-a342-cf19321569bc}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_PROPERTIES_ONLY => "{30010000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_UNSPECIFIED => "{30000000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_SCRIPT => "{30020000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_EXECUTABLE => "{30030000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_TEXT => "{30040000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_HTML => "{30050000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_DPOF => "{30060000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_AIFF => "{30070000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_WAVE => "{30080000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_MP3 => "{30090000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_AVI => "{300a0000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_MPEG => "{300b0000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_ASF => "{300c0000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_EXIF => "{38010000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_TIFFEP => "{38020000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_FLASHPIX => "{38030000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_BMP => "{38040000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_CIFF => "{38050000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_GIF => "{38070000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_JFIF => "{38080000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_PCD => "{38090000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_PICT => "{380a0000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_PNG => "{380b0000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_TIFF => "{380d0000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_TIFFIT => "{380e0000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_JP2 => "{380f0000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_JPX => "{38100000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_WBMP => "{b8030000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_JPEGXR => "{b8040000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_WINDOWSIMAGEFORMAT => "{b8810000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_WMA => "{b9010000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_WMV => "{b9810000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_WPLPLAYLIST => "{ba100000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_M3UPLAYLIST => "{ba110000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_MPLPLAYLIST => "{ba120000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_ASXPLAYLIST => "{ba130000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_PLSPLAYLIST => "{ba140000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_ABSTRACT_CONTACT_GROUP => "{ba060000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_ABSTRACT_MEDIA_CAST => "{ba0b0000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_VCALENDAR1 => "{be020000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_ICALENDAR => "{be030000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_ABSTRACT_CONTACT => "{bb810000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_VCARD2 => "{bb820000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_VCARD3 => "{bb830000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_XML => "{ba820000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_AAC => "{b9030000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_AUDIBLE => "{b9040000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_FLAC => "{b9060000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_QCELP => "{b9070000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_AMR => "{b9080000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_OGG => "{b9020000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_MP4 => "{b9820000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_MP2 => "{b9830000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_MICROSOFT_WORD => "{ba830000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_MHT_COMPILED_HTML => "{ba840000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_MICROSOFT_EXCEL => "{ba850000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_MICROSOFT_POWERPOINT => "{ba860000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_3GP => "{b9840000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_3G2 => "{b9850000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_AVCHD => "{b9860000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_ATSCTS => "{b9870000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_DVBTS => "{b9880000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_OBJECT_FORMAT_MKV => "{b9900000-ae6c-4804-98ba-c57b46965fe7}"

    /**
     * @type {String}
     */
    static WPD_FOLDER_OBJECT_PROPERTIES_V1 => "{7e9a7abf-e568-4b34-aa2f-13bb12ab177d}"

    /**
     * @type {String}
     */
    static WPD_IMAGE_OBJECT_PROPERTIES_V1 => "{63d64908-9fa1-479f-85ba-9952216447db}"

    /**
     * @type {String}
     */
    static WPD_DOCUMENT_OBJECT_PROPERTIES_V1 => "{0b110203-eb95-4f02-93e0-97c631493ad5}"

    /**
     * @type {String}
     */
    static WPD_MEDIA_PROPERTIES_V1 => "{2ed8ba05-0ad3-42dc-b0d0-bc95ac396ac8}"

    /**
     * @type {String}
     */
    static WPD_CONTACT_OBJECT_PROPERTIES_V1 => "{fbd4fdab-987d-4777-b3f9-726185a9312b}"

    /**
     * @type {String}
     */
    static WPD_MUSIC_OBJECT_PROPERTIES_V1 => "{b324f56a-dc5d-46e5-b6df-d2ea414888c6}"

    /**
     * @type {String}
     */
    static WPD_VIDEO_OBJECT_PROPERTIES_V1 => "{346f2163-f998-4146-8b01-d19b4c00de9a}"

    /**
     * @type {String}
     */
    static WPD_COMMON_INFORMATION_OBJECT_PROPERTIES_V1 => "{b28ae94b-05a4-4e8e-be01-72cc7e099d8f}"

    /**
     * @type {String}
     */
    static WPD_MEMO_OBJECT_PROPERTIES_V1 => "{5ffbfc7b-7483-41ad-afb9-da3f4e592b8d}"

    /**
     * @type {String}
     */
    static WPD_EMAIL_OBJECT_PROPERTIES_V1 => "{41f8f65a-5484-4782-b13d-4740dd7c37c5}"

    /**
     * @type {String}
     */
    static WPD_APPOINTMENT_OBJECT_PROPERTIES_V1 => "{f99efd03-431d-40d8-a1c9-4e220d9c88d3}"

    /**
     * @type {String}
     */
    static WPD_TASK_OBJECT_PROPERTIES_V1 => "{e354e95e-d8a0-4637-a03a-0cb26838dbc7}"

    /**
     * @type {String}
     */
    static WPD_SMS_OBJECT_PROPERTIES_V1 => "{7e1074cc-50ff-4dd1-a742-53be6f093a0d}"

    /**
     * @type {String}
     */
    static WPD_SECTION_OBJECT_PROPERTIES_V1 => "{516afd2b-c64e-44f0-98dc-bee1c88f7d66}"

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
     * @type {String}
     */
    static WPD_CATEGORY_MTP_EXT_VENDOR_OPERATIONS => "{4d545058-1a2e-4106-a357-771e0819fc56}"

    /**
     * @type {String}
     */
    static WPD_PROPERTIES_MTP_VENDOR_EXTENDED_OBJECT_PROPS => "{4d545058-4fce-4578-95c8-8698a9bc0f49}"

    /**
     * @type {String}
     */
    static WPD_PROPERTIES_MTP_VENDOR_EXTENDED_DEVICE_PROPS => "{4d545058-8900-40b3-8f1d-dc246e1e8370}"

    /**
     * @type {String}
     */
    static WPD_EVENT_MTP_VENDOR_EXTENDED_EVENTS => "{00000000-5738-4ff2-8445-be3126691059}"

    /**
     * @type {String}
     */
    static CLSID_WPD_NAMESPACE_EXTENSION => "{35786d3c-b075-49b9-88dd-029876e11c01}"

    /**
     * @type {String}
     */
    static WPDNSE_OBJECT_PROPERTIES_V1 => "{34d71409-4b47-4d80-aaac-3a28a4a3b3e6}"

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
     * @param {Pointer<PWSTR>} pszXmlIn 
     * @param {Pointer<PWSTR>} rgszAllowedCspNodes 
     * @param {Integer} dwNumAllowedCspNodes 
     * @param {Pointer<BSTR>} pbstrXmlOut 
     * @returns {Integer} 
     */
    static DMProcessConfigXMLFiltered(pszXmlIn, rgszAllowedCspNodes, dwNumAllowedCspNodes, pbstrXmlOut) {
        result := DllCall("DMProcessXMLFiltered.dll\DMProcessConfigXMLFiltered", "ptr", pszXmlIn, "ptr", rgszAllowedCspNodes, "uint", dwNumAllowedCspNodes, "ptr", pbstrXmlOut, "int")
        return result
    }

;@endregion Methods
}
