#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TextServices {

;@region Constants

    /**
     * @type {String}
     */
    static GUID_PROP_TEXTOWNER => "{f1e2d520-0969-11d3-8df0-00105a2799b5}"

    /**
     * @type {String}
     */
    static GUID_PROP_ATTRIBUTE => "{34b45670-7526-11d2-a147-00105a2799b5}"

    /**
     * @type {String}
     */
    static GUID_PROP_LANGID => "{3280ce20-8032-11d2-b603-00105a2799b5}"

    /**
     * @type {String}
     */
    static GUID_PROP_READING => "{5463f7c0-8e31-11d2-bf46-00105a2799b5}"

    /**
     * @type {String}
     */
    static GUID_PROP_COMPOSING => "{e12ac060-af15-11d2-afc5-00105a2799b5}"

    /**
     * @type {String}
     */
    static GUID_PROP_TKB_ALTERNATES => "{70b2a803-968d-462e-b93b-2164c91517f7}"

    /**
     * @type {String}
     */
    static GUID_SYSTEM_FUNCTIONPROVIDER => "{9a698bb0-0f21-11d3-8df1-00105a2799b5}"

    /**
     * @type {String}
     */
    static GUID_APP_FUNCTIONPROVIDER => "{4caef01e-12af-4b0e-9db1-a6ec5b881208}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_CATEGORY_OF_TIP => "{534c48c1-0607-4098-a521-4fc899c73e90}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_TIP_KEYBOARD => "{34745c63-b2f0-4784-8b67-5e12c8701a31}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_TIP_SPEECH => "{b5a73cd1-8355-426b-a161-259808f26b14}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_TIP_HANDWRITING => "{246ecb87-c2f2-4abe-905b-c8b38add2c43}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_PROP_AUDIODATA => "{9b7be3a9-e8ab-4d47-a8fe-254fa423436d}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_PROP_INKDATA => "{7c6a82ae-b0d7-4f14-a745-14f28b009d61}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_SAPI_AUDIO => "{51af2086-cc6b-457d-b5aa-8b19dc290ab4}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_KEYBOARD_DISABLED => "{71a5b253-1951-466b-9fbc-9c8808fa84f2}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_KEYBOARD_OPENCLOSE => "{58273aad-01bb-4164-95c6-755ba0b5162d}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_HANDWRITING_OPENCLOSE => "{f9ae2c6b-1866-4361-af72-7aa30948890e}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_SPEECH_DISABLED => "{56c5c607-0703-4e59-8e52-cbc84e8bbe35}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_SPEECH_OPENCLOSE => "{544d6a63-e2e8-4752-bbd1-000960bca083}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_SPEECH_GLOBALSTATE => "{2a54fe8e-0d08-460c-a75d-87035ff436c5}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_CONVERSIONMODEBIAS => "{5497f516-ee91-436e-b946-aa2c05f1ac5b}"

    /**
     * @type {String}
     */
    static GUID_PROP_MODEBIAS => "{372e0716-974f-40ac-a088-08cdc92ebfbc}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_KEYBOARD_INPUTMODE => "{b6592511-bcee-4122-a7c4-09f4b3fa4396}"

    /**
     * @type {String}
     */
    static GUID_MODEBIAS_NONE => "{00000000-0000-0000-0000-000000000000}"

    /**
     * @type {String}
     */
    static GUID_MODEBIAS_URLHISTORY => "{8b0e54d9-63f2-4c68-84d4-79aee7a59f09}"

    /**
     * @type {String}
     */
    static GUID_MODEBIAS_FILENAME => "{d7f707fe-44c6-4fca-8e76-86ab50c7931b}"

    /**
     * @type {String}
     */
    static GUID_MODEBIAS_READING => "{e31643a3-6466-4cbf-8d8b-0bd4d8545461}"

    /**
     * @type {String}
     */
    static GUID_MODEBIAS_DATETIME => "{f2bdb372-7f61-4039-92ef-1c35599f0222}"

    /**
     * @type {String}
     */
    static GUID_MODEBIAS_NAME => "{fddc10f0-d239-49bf-b8fc-5410caaa427e}"

    /**
     * @type {String}
     */
    static GUID_MODEBIAS_CONVERSATION => "{0f4ec104-1790-443b-95f1-e10f939d6546}"

    /**
     * @type {String}
     */
    static GUID_MODEBIAS_NUMERIC => "{4021766c-e872-48fd-9cee-4ec5c75e16c3}"

    /**
     * @type {String}
     */
    static GUID_MODEBIAS_HIRAGANA => "{d73d316e-9b91-46f1-a280-31597f52c694}"

    /**
     * @type {String}
     */
    static GUID_MODEBIAS_KATAKANA => "{2e0eeddd-3a1a-499e-8543-3c7ee7949811}"

    /**
     * @type {String}
     */
    static GUID_MODEBIAS_HANGUL => "{76ef0541-23b3-4d77-a074-691801ccea17}"

    /**
     * @type {String}
     */
    static GUID_MODEBIAS_CHINESE => "{7add26de-4328-489b-83ae-6493750cad5c}"

    /**
     * @type {String}
     */
    static GUID_MODEBIAS_HALFWIDTHKATAKANA => "{005f6b63-78d4-41cc-8859-485ca821a795}"

    /**
     * @type {String}
     */
    static GUID_MODEBIAS_FULLWIDTHALPHANUMERIC => "{81489fb8-b36a-473d-8146-e4a2258b24ae}"

    /**
     * @type {String}
     */
    static GUID_MODEBIAS_FULLWIDTHHANGUL => "{c01ae6c9-45b5-4fd0-9cb1-9f4cebc39fea}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_PROPSTYLE_STATIC => "{565fb8d8-6bd4-4ca1-b223-0f2ccb8f4f96}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_DISPLAYATTRIBUTEPROVIDER => "{046b8c80-1647-40f7-9b21-b93b81aabc1b}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_DISPLAYATTRIBUTEPROPERTY => "{b95f181b-ea4c-4af1-8056-7c321abbb091}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_SPEECH_UI_STATUS => "{d92016f0-9367-4fe7-9abf-bc59dacbe0e3}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_EMPTYCONTEXT => "{d7487dbf-804e-41c5-894d-ad96fd4eea13}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_TIPUISTATUS => "{148ca3ec-0366-401c-8d75-ed978d85fbc9}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_SPEECH_CFGMENU => "{fb6c5c2d-4e83-4bb6-91a2-e019bff6762d}"

    /**
     * @type {String}
     */
    static GUID_LBI_SAPILAYR_CFGMENUBUTTON => "{d02f24a1-942d-422e-8d99-b4f2addee999}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_TIPCAP_SECUREMODE => "{49d2f9ce-1f5e-11d7-a6d3-00065b84435c}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_TIPCAP_UIELEMENTENABLED => "{49d2f9cf-1f5e-11d7-a6d3-00065b84435c}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_TIPCAP_INPUTMODECOMPARTMENT => "{ccf05dd7-4a87-11d7-a6e2-00065b84435c}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_TIPCAP_COMLESS => "{364215d9-75bc-11d7-a6ef-00065b84435c}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_TIPCAP_WOW16 => "{364215da-75bc-11d7-a6ef-00065b84435c}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_TIPCAP_IMMERSIVESUPPORT => "{13a016df-560b-46cd-947a-4c3af1e0e35d}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_TIPCAP_IMMERSIVEONLY => "{3a4259ac-640d-4ad4-89f7-1eb67e7c4ee8}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_TIPCAP_LOCALSERVER => "{74769ee9-4a66-4f9d-90d6-bf8b7c3eb461}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_TIPCAP_TSF3 => "{07dcb4af-98de-4548-bef7-25bd45979a1f}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_TIPCAP_DUALMODE => "{3af314a2-d79f-4b1b-9992-15086d339b05}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_TIPCAP_SYSTRAYSUPPORT => "{25504fb4-7bab-4bc1-9c69-cf81890f0ef5}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_KEYBOARD_INPUTMODE_CONVERSION => "{ccf05dd8-4a87-11d7-a6e2-00065b84435c}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_KEYBOARD_INPUTMODE_SENTENCE => "{ccf05dd9-4a87-11d7-a6e2-00065b84435c}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_TRANSITORYEXTENSION => "{8be347f5-c7a0-11d7-b408-00065b84435c}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_TRANSITORYEXTENSION_DOCUMENTMANAGER => "{8be347f7-c7a0-11d7-b408-00065b84435c}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_TRANSITORYEXTENSION_PARENT => "{8be347f8-c7a0-11d7-b408-00065b84435c}"

    /**
     * @type {String}
     */
    static GUID_COMPARTMENT_ENABLED_PROFILES_UPDATED => "{92c1fd48-a9ae-4a7c-be08-4329e4723817}"

    /**
     * @type {String}
     */
    static GUID_TFCAT_TRANSITORYEXTENSIONUI => "{6302de22-a5cf-4b02-bfe8-4d72b2bed3c6}"

    /**
     * @type {String}
     */
    static GUID_LBI_INPUTMODE => "{2c77a81e-41cc-4178-a3a7-5f8a987568e6}"

    /**
     * @type {String}
     */
    static CLSID_TF_ThreadMgr => "{529a9e6b-6587-4f23-ab9e-9c7d683e3c50}"

    /**
     * @type {String}
     */
    static CLSID_TF_LangBarMgr => "{ebb08c45-6c4a-4fdc-ae53-4eb8c4c7db8e}"

    /**
     * @type {String}
     */
    static CLSID_TF_DisplayAttributeMgr => "{3ce74de4-53d3-4d74-8b83-431b3828ba53}"

    /**
     * @type {String}
     */
    static CLSID_TF_CategoryMgr => "{a4b544a1-438d-4b41-9325-869523e2d6c7}"

    /**
     * @type {String}
     */
    static CLSID_TF_InputProcessorProfiles => "{33c53a50-f456-4884-b049-85fd643ecfed}"

    /**
     * @type {String}
     */
    static CLSID_TF_LangBarItemMgr => "{b9931692-a2b3-4fab-bf33-9ec6f9fb96ac}"

    /**
     * @type {String}
     */
    static CLSID_TF_ClassicLangBar => "{3318360c-1afc-4d09-a86b-9f9cb6dceb9c}"

    /**
     * @type {String}
     */
    static CLSID_TF_TransitoryExtensionUIEntry => "{ae6be008-07fb-400d-8beb-337a64f7051f}"

    /**
     * @type {String}
     */
    static CLSID_TsfServices => "{39aedc00-6b60-46db-8d31-3642be0e4373}"

    /**
     * @type {Integer (UInt32)}
     */
    static TF_DEFAULT_SELECTION => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static TS_DEFAULT_SELECTION => 4294967295

    /**
     * @type {String}
     */
    static GUID_TS_SERVICE_DATAOBJECT => "{6086fbb5-e225-46ce-a770-c1bbd3e05d7b}"

    /**
     * @type {String}
     */
    static GUID_TS_SERVICE_ACCESSIBLE => "{f9786200-a5bf-4a0f-8c24-fb16f5d1aabb}"

    /**
     * @type {String}
     */
    static GUID_TS_SERVICE_ACTIVEX => "{ea937a50-c9a6-4b7d-894a-49d99b784834}"

    /**
     * @type {Integer (Int32)}
     */
    static TS_E_INVALIDPOS => -2147220992

    /**
     * @type {Integer (Int32)}
     */
    static TS_E_NOLOCK => -2147220991

    /**
     * @type {Integer (Int32)}
     */
    static TS_E_NOOBJECT => -2147220990

    /**
     * @type {Integer (Int32)}
     */
    static TS_E_NOSERVICE => -2147220989

    /**
     * @type {Integer (Int32)}
     */
    static TS_E_NOINTERFACE => -2147220988

    /**
     * @type {Integer (Int32)}
     */
    static TS_E_NOSELECTION => -2147220987

    /**
     * @type {Integer (Int32)}
     */
    static TS_E_NOLAYOUT => -2147220986

    /**
     * @type {Integer (Int32)}
     */
    static TS_E_INVALIDPOINT => -2147220985

    /**
     * @type {Integer (Int32)}
     */
    static TS_E_SYNCHRONOUS => -2147220984

    /**
     * @type {Integer (Int32)}
     */
    static TS_E_READONLY => -2147220983

    /**
     * @type {Integer (Int32)}
     */
    static TS_E_FORMAT => -2147220982

    /**
     * @type {Integer (Int32)}
     */
    static TS_S_ASYNC => 262912

    /**
     * @type {Integer (UInt32)}
     */
    static TS_AS_TEXT_CHANGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TS_AS_SEL_CHANGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TS_AS_LAYOUT_CHANGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TS_AS_ATTR_CHANGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TS_AS_STATUS_CHANGE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TS_LF_SYNC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SD_READONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SD_LOADING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SD_RESERVED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SD_TKBAUTOCORRECTENABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SD_TKBPREDICTIONENABLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SD_UIINTEGRATIONENABLE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SD_INPUTPANEMANUALDISPLAYENABLE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SD_EMBEDDEDHANDWRITINGVIEW_ENABLED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SD_EMBEDDEDHANDWRITINGVIEW_VISIBLE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SS_DISJOINTSEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SS_REGIONS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SS_TRANSITORY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SS_NOHIDDENTEXT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SS_TKBAUTOCORRECTENABLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SS_TKBPREDICTIONENABLE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SS_UWPCONTROL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TS_IE_CORRECTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TS_IE_COMPOSITION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TS_IAS_NOQUERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TS_IAS_QUERYONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GXFPF_ROUND_NEAREST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GXFPF_NEAREST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TS_CHAR_EMBEDDED => 65532

    /**
     * @type {Integer (UInt32)}
     */
    static TS_CHAR_REGION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TS_CHAR_REPLACEMENT => 65533

    /**
     * @type {Integer (UInt32)}
     */
    static TS_ATTR_FIND_BACKWARDS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TS_ATTR_FIND_WANT_OFFSET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TS_ATTR_FIND_UPDATESTART => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TS_ATTR_FIND_WANT_VALUE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TS_ATTR_FIND_WANT_END => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TS_ATTR_FIND_HIDDEN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TS_VCOOKIE_NUL => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SHIFT_COUNT_HIDDEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SHIFT_HALT_HIDDEN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SHIFT_HALT_VISIBLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TS_SHIFT_COUNT_ONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TS_GTA_HIDDEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TS_GEA_HIDDEN => 1

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_LOCKED => -2147220224

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_STACKFULL => -2147220223

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_NOTOWNEDRANGE => -2147220222

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_NOPROVIDER => -2147220221

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_DISCONNECTED => -2147220220

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_INVALIDVIEW => -2147220219

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_ALREADY_EXISTS => -2147220218

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_RANGE_NOT_COVERED => -2147220217

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_COMPOSITION_REJECTED => -2147220216

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_EMPTYCONTEXT => -2147220215

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_INVALIDPOS => -2147220992

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_NOLOCK => -2147220991

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_NOOBJECT => -2147220990

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_NOSERVICE => -2147220989

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_NOINTERFACE => -2147220988

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_NOSELECTION => -2147220987

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_NOLAYOUT => -2147220986

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_INVALIDPOINT => -2147220985

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_SYNCHRONOUS => -2147220984

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_READONLY => -2147220983

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_FORMAT => -2147220982

    /**
     * @type {Integer (Int32)}
     */
    static TF_S_ASYNC => 262912

    /**
     * @type {Integer (UInt32)}
     */
    static TF_RCM_COMLESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_RCM_VKEY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_RCM_HINT_READING_LENGTH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_RCM_HINT_COLLISION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TKB_ALTERNATES_STANDARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TKB_ALTERNATES_FOR_AUTOCORRECTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TKB_ALTERNATES_FOR_PREDICTION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TKB_ALTERNATES_AUTOCORRECTION_APPLIED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TMAE_NOACTIVATETIP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TMAE_SECUREMODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TMAE_UIELEMENTENABLEDONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TMAE_COMLESS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TMAE_WOW16 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TMAE_NOACTIVATEKEYBOARDLAYOUT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TMAE_CONSOLE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TMF_NOACTIVATETIP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TMF_SECUREMODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TMF_UIELEMENTENABLEDONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TMF_COMLESS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TMF_WOW16 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TMF_CONSOLE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TMF_IMMERSIVEMODE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TMF_ACTIVATED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static TF_MOD_ALT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_MOD_CONTROL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_MOD_SHIFT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_MOD_RALT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TF_MOD_RCONTROL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TF_MOD_RSHIFT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TF_MOD_LALT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TF_MOD_LCONTROL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TF_MOD_LSHIFT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TF_MOD_ON_KEYUP => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TF_MOD_IGNORE_ALL_MODIFIER => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static TF_US_HIDETIPUI => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_DISABLE_SPEECH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_DISABLE_DICTATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_DISABLE_COMMANDING => 4

    /**
     * @type {String}
     */
    static TF_PROCESS_ATOM => "_CTF_PROCESS_ATOM_"

    /**
     * @type {String}
     */
    static TF_ENABLE_PROCESS_ATOM => "_CTF_ENABLE_PROCESS_ATOM_"

    /**
     * @type {Integer (UInt32)}
     */
    static TF_CLUIE_DOCUMENTMGR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_CLUIE_COUNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_CLUIE_SELECTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_CLUIE_STRING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TF_CLUIE_PAGEINDEX => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TF_CLUIE_CURRENTPAGE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TF_RIUIE_CONTEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_RIUIE_STRING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_RIUIE_MAXREADINGSTRINGLENGTH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_RIUIE_ERRORINDEX => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TF_RIUIE_VERTICALORDER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TF_CONVERSIONMODE_ALPHANUMERIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TF_CONVERSIONMODE_NATIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_CONVERSIONMODE_KATAKANA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_CONVERSIONMODE_FULLSHAPE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TF_CONVERSIONMODE_ROMAN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TF_CONVERSIONMODE_CHARCODE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TF_CONVERSIONMODE_SOFTKEYBOARD => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TF_CONVERSIONMODE_NOCONVERSION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TF_CONVERSIONMODE_EUDC => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TF_CONVERSIONMODE_SYMBOL => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static TF_CONVERSIONMODE_FIXED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SENTENCEMODE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SENTENCEMODE_PLAURALCLAUSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SENTENCEMODE_SINGLECONVERT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SENTENCEMODE_AUTOMATIC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SENTENCEMODE_PHRASEPREDICT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SENTENCEMODE_CONVERSATION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TRANSITORYEXTENSION_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TRANSITORYEXTENSION_FLOATING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TRANSITORYEXTENSION_ATSELECTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_PROFILETYPE_INPUTPROCESSOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_PROFILETYPE_KEYBOARDLAYOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_RIP_FLAG_FREEUNUSEDLIBRARIES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IPP_FLAG_ACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IPP_FLAG_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IPP_FLAG_SUBSTITUTEDBYINPUTPROCESSOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IPP_CAPS_DISABLEONTRANSITORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IPP_CAPS_SECUREMODESUPPORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IPP_CAPS_UIELEMENTENABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IPP_CAPS_COMLESSSUPPORT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IPP_CAPS_WOW16SUPPORT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IPP_CAPS_IMMERSIVESUPPORT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IPP_CAPS_SYSTRAYSUPPORT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IPPMF_FORPROCESS => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IPPMF_FORSESSION => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IPPMF_FORSYSTEMALL => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IPPMF_ENABLEPROFILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IPPMF_DISABLEPROFILE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IPPMF_DONTCARECURRENTINPUTLANGUAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_RP_HIDDENINSETTINGUI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_RP_LOCALPROCESS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_RP_LOCALTHREAD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TF_RP_SUBITEMINSETTINGUI => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TF_URP_ALLPROFILES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_URP_LOCALPROCESS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_URP_LOCALTHREAD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IPSINK_FLAG_ACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_INVALID_EDIT_COOKIE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TF_POPF_ALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SD_READONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SD_LOADING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SS_DISJOINTSEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SS_REGIONS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SS_TRANSITORY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SS_TKBAUTOCORRECTENABLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SS_TKBPREDICTIONENABLE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TF_CHAR_EMBEDDED => 65532

    /**
     * @type {Integer (UInt32)}
     */
    static TF_HF_OBJECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TF_MOVESTART => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TF_IGNOREEND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_ST_CORRECTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_IE_CORRECTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_TU_CORRECTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_INVALID_COOKIE => 4294967295

    /**
     * @type {String}
     */
    static TF_PROFILE_NEWPHONETIC => "{b2f9c502-1742-11d4-9790-0080c882687e}"

    /**
     * @type {String}
     */
    static TF_PROFILE_PHONETIC => "{761309de-317a-11d4-9b5d-0080c882687e}"

    /**
     * @type {String}
     */
    static TF_PROFILE_NEWCHANGJIE => "{f3ba907a-6c7e-11d4-97fa-0080c882687e}"

    /**
     * @type {String}
     */
    static TF_PROFILE_CHANGJIE => "{4bdf9f03-c7d3-11d4-b2ab-0080c882687e}"

    /**
     * @type {String}
     */
    static TF_PROFILE_NEWQUICK => "{0b883ba0-c1c7-11d4-87f9-0080c882687e}"

    /**
     * @type {String}
     */
    static TF_PROFILE_QUICK => "{6024b45f-5c54-11d4-b921-0080c882687e}"

    /**
     * @type {String}
     */
    static TF_PROFILE_CANTONESE => "{0aec109c-7e96-11d4-b2ef-0080c882687e}"

    /**
     * @type {String}
     */
    static TF_PROFILE_PINYIN => "{f3ba9077-6c7e-11d4-97fa-0080c882687e}"

    /**
     * @type {String}
     */
    static TF_PROFILE_SIMPLEFAST => "{fa550b04-5ad7-411f-a5ac-ca038ec515d7}"

    /**
     * @type {String}
     */
    static TF_PROFILE_WUBI => "{82590c13-f4dd-44f4-ba1d-8667246fdf8e}"

    /**
     * @type {String}
     */
    static TF_PROFILE_DAYI => "{037b2c25-480c-4d7f-b027-d6ca6b69788a}"

    /**
     * @type {String}
     */
    static TF_PROFILE_ARRAY => "{d38eff65-aa46-4fd5-91a7-67845fb02f5b}"

    /**
     * @type {String}
     */
    static TF_PROFILE_YI => "{409c8376-007b-4357-ae8e-26316ee3fb0d}"

    /**
     * @type {String}
     */
    static TF_PROFILE_TIGRINYA => "{3cab88b7-cc3e-46a6-9765-b772ad7761ff}"

    /**
     * @type {Integer (Int32)}
     */
    static TF_E_NOCONVERSION => -2147219968

    /**
     * @type {Integer (UInt32)}
     */
    static TF_DICTATION_ON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_DICTATION_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_COMMANDING_ENABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_COMMANDING_ON => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SPEECHUI_SHOWN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SHOW_BALLOON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_DISABLE_BALLOON => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_MENUREADY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_PROPUI_STATUS_SAVETOFILE => 1

    /**
     * @type {String}
     */
    static GUID_INTEGRATIONSTYLE_SEARCHBOX => "{e6d1bd11-82f7-4903-ae21-1a6397cde2eb}"

    /**
     * @type {Integer (UInt32)}
     */
    static TKBL_UNDEFINED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TKBL_CLASSIC_TRADITIONAL_CHINESE_PHONETIC => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static TKBL_CLASSIC_TRADITIONAL_CHINESE_CHANGJIE => 61506

    /**
     * @type {Integer (UInt32)}
     */
    static TKBL_CLASSIC_TRADITIONAL_CHINESE_DAYI => 61507

    /**
     * @type {Integer (UInt32)}
     */
    static TKBL_OPT_JAPANESE_ABC => 1041

    /**
     * @type {Integer (UInt32)}
     */
    static TKBL_OPT_KOREAN_HANGUL_2_BULSIK => 1042

    /**
     * @type {Integer (UInt32)}
     */
    static TKBL_OPT_SIMPLIFIED_CHINESE_PINYIN => 2052

    /**
     * @type {Integer (UInt32)}
     */
    static TKBL_OPT_TRADITIONAL_CHINESE_PHONETIC => 1028

    /**
     * @type {String}
     */
    static TF_FLOATINGLANGBAR_WNDTITLEW => "TF_FloatingLangBar_WndTitle"

    /**
     * @type {String}
     */
    static TF_FLOATINGLANGBAR_WNDTITLEA => "TF_FloatingLangBar_WndTitle"

    /**
     * @type {String}
     */
    static TF_FLOATINGLANGBAR_WNDTITLE => "TF_FloatingLangBar_WndTitle"

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_ICON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_TEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_TOOLTIP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_BITMAP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_BALLOON => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_CUSTOMUI => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_STATUS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_STYLE_HIDDENSTATUSCONTROL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_STYLE_SHOWNINTRAY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_STYLE_HIDEONNOOTHERITEMS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_STYLE_SHOWNINTRAYONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_STYLE_HIDDENBYDEFAULT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_STYLE_TEXTCOLORICON => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_STYLE_BTN_BUTTON => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_STYLE_BTN_MENU => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_STYLE_BTN_TOGGLE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_STATUS_HIDDEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_STATUS_DISABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_STATUS_BTN_TOGGLED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_BMPF_VERTICAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SFT_SHOWNORMAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SFT_DOCK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SFT_MINIMIZED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SFT_HIDDEN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SFT_NOTRANSPARENCY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SFT_LOWTRANSPARENCY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SFT_HIGHTRANSPARENCY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SFT_LABELS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SFT_NOLABELS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SFT_EXTRAICONSONMINIMIZED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SFT_NOEXTRAICONSONMINIMIZED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static TF_SFT_DESKBAND => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBI_DESC_MAXLEN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBMENUF_CHECKED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBMENUF_SUBMENU => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBMENUF_SEPARATOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBMENUF_RADIOCHECKED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TF_LBMENUF_GRAYED => 16

    /**
     * @type {String}
     */
    static GUID_PROP_INPUTSCOPE => "{1713dd5a-68e7-4a5b-9af6-592a595c778d}"

    /**
     * @type {Integer (UInt32)}
     */
    static DCM_FLAGS_TASKENG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DCM_FLAGS_CTFMON => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DCM_FLAGS_LOCALTHREADTSF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ILMCM_CHECKLAYOUTANDTIPENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ILMCM_LANGUAGEBAROFF => 2

    /**
     * @type {String}
     */
    static LIBID_MSAATEXTLib => "{150e2d7a-dac1-4582-947d-2a8fd78b82cd}"

    /**
     * @type {Integer (UInt32)}
     */
    static TS_STRF_START => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TS_STRF_MID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TS_STRF_END => 2

    /**
     * @type {String}
     */
    static TSATTRID_OTHERS => "{b3c32af9-57d0-46a9-bca8-dac238a13057}"

    /**
     * @type {String}
     */
    static TSATTRID_Font => "{573ea825-749b-4f8a-9cfd-21c3605ca828}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_FaceName => "{b536aeb6-053b-4eb8-b65a-50da1e81e72e}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_SizePts => "{c8493302-a5e9-456d-af04-8005e4130f03}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style => "{68b2a77f-6b0e-4f28-8177-571c2f3a42b1}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Bold => "{48813a43-8a20-4940-8e58-97823f7b268a}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Italic => "{8740682a-a765-48e1-acfc-d22222b2f810}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_SmallCaps => "{facb6bc6-9100-4cc6-b969-11eea45a86b4}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Capitalize => "{7d85a3ba-b4fd-43b3-befc-6b985c843141}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Uppercase => "{33a300e8-e340-4937-b697-8f234045cd9a}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Lowercase => "{76d8ccb5-ca7b-4498-8ee9-d5c4f6f74c60}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Animation => "{dcf73d22-e029-47b7-bb36-f263a3d004cc}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Animation_LasVegasLights => "{f40423d5-0f87-4f8f-bada-e6d60c25e152}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Animation_BlinkingBackground => "{86e5b104-0104-4b10-b585-00f2527522b5}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Animation_SparkleText => "{533aad20-962c-4e9f-8c09-b42ea4749711}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Animation_MarchingBlackAnts => "{7644e067-f186-4902-bfc6-ec815aa20e9d}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Animation_MarchingRedAnts => "{78368dad-50fb-4c6f-840b-d486bb6cf781}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Animation_Shimmer => "{2ce31b58-5293-4c36-8809-bf8bb51a27b3}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Animation_WipeDown => "{5872e874-367b-4803-b160-c90ff62569d0}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Animation_WipeRight => "{b855cbe3-3d2c-4600-b1e9-e1c9ce02f842}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Emboss => "{bd8ed742-349e-4e37-82fb-437979cb53a7}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Engrave => "{9c3371de-8332-4897-be5d-89233223179a}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Hidden => "{b1e28770-881c-475f-863f-887a647b1090}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Kerning => "{cc26e1b4-2f9a-47c8-8bff-bf1eb7cce0dd}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Outlined => "{10e6db31-db0d-4ac6-a7f5-9c9cff6f2ab4}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Position => "{15cd26ab-f2fb-4062-b5a6-9a49e1a5cc0b}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Protected => "{1c557cb2-14cf-4554-a574-ecb2f7e7efd4}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Shadow => "{5f686d2f-c6cd-4c56-8a1a-994a4b9766be}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Spacing => "{98c1200d-8f06-409a-8e49-6a554bf7c153}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Weight => "{12f3189c-8bb0-461b-b1fa-eaf907047fe0}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Height => "{7e937477-12e6-458b-926a-1fa44ee8f391}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Underline => "{c3c9c9f3-7902-444b-9a7b-48e70f4b50f7}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Underline_Single => "{1b6720e5-0f73-4951-a6b3-6f19e43c9461}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Underline_Double => "{74d24aa6-1db3-4c69-a176-31120e7586d5}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Strikethrough => "{0c562193-2d08-4668-9601-ced41309d7af}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Strikethrough_Single => "{75d736b6-3c8f-4b97-ab78-1877cb990d31}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Strikethrough_Double => "{62489b31-a3e7-4f94-ac43-ebaf8fcc7a9f}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Overline => "{e3989f4a-992b-4301-8ce1-a5b7c6d1f3c8}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Overline_Single => "{8440d94c-51ce-47b2-8d4c-15751e5f721b}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Overline_Double => "{dc46063a-e115-46e3-bcd8-ca6772aa95b4}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Blink => "{bfb2c036-7acf-4532-b720-b416dd7765a8}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Subscript => "{5774fb84-389b-43bc-a74b-1568347cf0f4}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Superscript => "{2ea4993c-563c-49aa-9372-0bef09a9255b}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_Color => "{857a7a37-b8af-4e9a-81b4-acf700c8411b}"

    /**
     * @type {String}
     */
    static TSATTRID_Font_Style_BackgroundColor => "{b50eaa4e-3091-4468-81db-d79ea190c7c7}"

    /**
     * @type {String}
     */
    static TSATTRID_Text => "{7edb8e68-81f9-449d-a15a-87a8388faac0}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_VerticalWriting => "{6bba8195-046f-4ea9-b311-97fd66c4274b}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_RightToLeft => "{ca666e71-1b08-453d-bfdd-28e08c8aaf7a}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Orientation => "{6bab707f-8785-4c39-8b52-96f878303ffb}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Language => "{d8c04ef1-5753-4c25-8887-85443fe5f819}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_ReadOnly => "{85836617-de32-4afd-a50f-a2db110e6e4d}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_EmbeddedObject => "{7edb8e68-81f9-449d-a15a-87a8388faac0}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Alignment => "{139941e6-1767-456d-938e-35ba568b5cd4}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Alignment_Left => "{16ae95d3-6361-43a2-8495-d00f397f1693}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Alignment_Right => "{b36f0f98-1b9e-4360-8616-03fb08a78456}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Alignment_Center => "{a4a95c16-53bf-4d55-8b87-4bdd8d4275fc}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Alignment_Justify => "{ed350740-a0f7-42d3-8ea8-f81b6488faf0}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Link => "{47cd9051-3722-4cd8-b7c8-4e17ca1759f5}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Hyphenation => "{dadf4525-618e-49eb-b1a8-3b68bd7648e3}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Para => "{5edc5822-99dc-4dd6-aec3-b62baa5b2e7c}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Para_FirstLineIndent => "{07c97a13-7472-4dd8-90a9-91e3d7e4f29c}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Para_LeftIndent => "{fb2848e9-7471-41c9-b6b3-8a1450e01897}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Para_RightIndent => "{2c7f26f9-a5e2-48da-b98a-520cb16513bf}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Para_SpaceAfter => "{7b0a3f55-22dc-425f-a411-93da1d8f9baa}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Para_SpaceBefore => "{8df98589-194a-4601-b251-9865a3e906dd}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Para_LineSpacing => "{699b380d-7f8c-46d6-a73b-dfe3d1538df3}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Para_LineSpacing_Single => "{ed350740-a0f7-42d3-8ea8-f81b6488faf0}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Para_LineSpacing_OnePtFive => "{0428a021-0397-4b57-9a17-0795994cd3c5}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Para_LineSpacing_Double => "{82fb1805-a6c4-4231-ac12-6260af2aba28}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Para_LineSpacing_AtLeast => "{adfedf31-2d44-4434-a5ff-7f4c4990a905}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Para_LineSpacing_Exactly => "{3d45ad40-23de-48d7-a6b3-765420c620cc}"

    /**
     * @type {String}
     */
    static TSATTRID_Text_Para_LineSpacing_Multiple => "{910f1e3c-d6d0-4f65-8a3c-42b4b31868c5}"

    /**
     * @type {String}
     */
    static TSATTRID_List => "{436d673b-26f1-4aee-9e65-8f83a4ed4884}"

    /**
     * @type {String}
     */
    static TSATTRID_List_LevelIndel => "{7f7cc899-311f-487b-ad5d-e2a459e12d42}"

    /**
     * @type {String}
     */
    static TSATTRID_List_Type => "{ae3e665e-4bce-49e3-a0fe-2db47d3a17ae}"

    /**
     * @type {String}
     */
    static TSATTRID_List_Type_Bullet => "{bccd77c5-4c4d-4ce2-b102-559f3b2bfcea}"

    /**
     * @type {String}
     */
    static TSATTRID_List_Type_Arabic => "{1338c5d6-98a3-4fa3-9bd1-7a60eef8e9e0}"

    /**
     * @type {String}
     */
    static TSATTRID_List_Type_LowerLetter => "{96372285-f3cf-491e-a925-3832347fd237}"

    /**
     * @type {String}
     */
    static TSATTRID_List_Type_UpperLetter => "{7987b7cd-ce52-428b-9b95-a357f6f10c45}"

    /**
     * @type {String}
     */
    static TSATTRID_List_Type_LowerRoman => "{90466262-3980-4b8e-9368-918bd1218a41}"

    /**
     * @type {String}
     */
    static TSATTRID_List_Type_UpperRoman => "{0f6ab552-4a80-467f-b2f1-127e2aa3ba9e}"

    /**
     * @type {String}
     */
    static TSATTRID_App => "{a80f77df-4237-40e5-849c-b5fa51c13ac7}"

    /**
     * @type {String}
     */
    static TSATTRID_App_IncorrectSpelling => "{f42de43c-ef12-430d-944c-9a08970a25d2}"

    /**
     * @type {String}
     */
    static TSATTRID_App_IncorrectGrammar => "{bd54e398-ad03-4b74-b6b3-5edb19996388}"
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<Void>} hEventForServiceStop 
     * @returns {Integer} 
     */
    static DoMsCtfMonitor(dwFlags, hEventForServiceStop) {
        result := DllCall("MsCtfMonitor.dll\DoMsCtfMonitor", "uint", dwFlags, "ptr", hEventForServiceStop, "int")
        return result
    }

    /**
     * The InitLocalMsCtfMonitor function initializes TextServicesFramework on the current desktop and prepares the floating language bar, if necessary. This function must be called on the app's desktop.
     * @remarks
     * If this function was successful, <a href="https://docs.microsoft.com/windows/desktop/api/msctfmonitorapi/nf-msctfmonitorapi-uninitlocalmsctfmonitor">UninitLocalMsCtfMonitor</a> needs to be called before the caller thread is terminated or the desktop is switched.
     * @param {Integer} dwFlags This is a combination of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILMCM_CHECKLAYOUTANDTIPENABLED"></a><a id="ilmcm_checklayoutandtipenabled"></a><dl>
     * <dt><b>ILMCM_CHECKLAYOUTANDTIPENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>InitLocalMsCtfMonitor</b> forcefully checks the available keyboard layout or text service. If there is no secondary keyboard layout or text services, it does not initialize TextServicesFramework on the desktop.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILMCM_LANGUAGEBAROFF"></a><a id="ilmcm_languagebaroff"></a><dl>
     * <dt><b>ILMCM_LANGUAGEBAROFF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Starting with Windows 8:</b> A local language bar is not started for the current desktop.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>The function was successful.</td>
     * </tr>
     * <tr>
     * <td>E_FAIL</td>
     * <td>An unspecified error occurred.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctfmonitorapi/nf-msctfmonitorapi-initlocalmsctfmonitor
     * @since windows6.0.6000
     */
    static InitLocalMsCtfMonitor(dwFlags) {
        result := DllCall("MsCtfMonitor.dll\InitLocalMsCtfMonitor", "uint", dwFlags, "int")
        return result
    }

    /**
     * The UninitLocalMsCtfMonitor function uninitializes TextServicesFramework on the current desktop.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>The function was successful.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctfmonitorapi/nf-msctfmonitorapi-uninitlocalmsctfmonitor
     * @since windows6.0.6000
     */
    static UninitLocalMsCtfMonitor() {
        result := DllCall("MsCtfMonitor.dll\UninitLocalMsCtfMonitor", "int")
        return result
    }

;@endregion Methods
}
