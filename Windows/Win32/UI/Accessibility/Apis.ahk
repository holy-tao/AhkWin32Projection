#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class Accessibility {

;@region Constants

    /**
     * @type {String}
     */
    static LIBID_Accessibility => "{1ea4dbf0-3c3b-11cf-810c-00aa00389b71}"

    /**
     * @type {String}
     */
    static CLSID_AccPropServices => "{b5f8350b-0548-48b1-a6ee-88bd00b4a5e7}"

    /**
     * @type {String}
     */
    static IIS_IsOleaccProxy => "{902697fa-80e4-4560-802a-a13f22a64709}"

    /**
     * @type {String}
     */
    static IIS_ControlAccessible => "{38c682a6-9731-43f2-9fae-e901e641b101}"

    /**
     * @type {Integer (UInt32)}
     */
    static ANRUS_PRIORITY_AUDIO_DYNAMIC_DUCK => 16

    /**
     * @type {Integer (Int32)}
     */
    static MSAA_MENU_SIG => -1441927155

    /**
     * @type {String}
     */
    static PROPID_ACC_NAME => "{608d3df8-8128-4aa7-a428-f55e49267291}"

    /**
     * @type {String}
     */
    static PROPID_ACC_VALUE => "{123fe443-211a-4615-9527-c45a7e93717a}"

    /**
     * @type {String}
     */
    static PROPID_ACC_DESCRIPTION => "{4d48dfe4-bd3f-491f-a648-492d6f20c588}"

    /**
     * @type {String}
     */
    static PROPID_ACC_ROLE => "{cb905ff2-7bd1-4c05-b3c8-e6c241364d70}"

    /**
     * @type {String}
     */
    static PROPID_ACC_STATE => "{a8d4d5b0-0a21-42d0-a5c0-514e984f457b}"

    /**
     * @type {String}
     */
    static PROPID_ACC_HELP => "{c831e11f-44db-4a99-9768-cb8f978b7231}"

    /**
     * @type {String}
     */
    static PROPID_ACC_KEYBOARDSHORTCUT => "{7d9bceee-7d1e-4979-9382-5180f4172c34}"

    /**
     * @type {String}
     */
    static PROPID_ACC_DEFAULTACTION => "{180c072b-c27f-43c7-9922-f63562a4632b}"

    /**
     * @type {String}
     */
    static PROPID_ACC_HELPTOPIC => "{787d1379-8ede-440b-8aec-11f7bf9030b3}"

    /**
     * @type {String}
     */
    static PROPID_ACC_FOCUS => "{6eb335df-1c29-4127-b12c-dee9fd157f2b}"

    /**
     * @type {String}
     */
    static PROPID_ACC_SELECTION => "{b99d073c-d731-405b-9061-d95e8f842984}"

    /**
     * @type {String}
     */
    static PROPID_ACC_PARENT => "{474c22b6-ffc2-467a-b1b5-e958b4657330}"

    /**
     * @type {String}
     */
    static PROPID_ACC_NAV_UP => "{016e1a2b-1a4e-4767-8612-3386f66935ec}"

    /**
     * @type {String}
     */
    static PROPID_ACC_NAV_DOWN => "{031670ed-3cdf-48d2-9613-138f2dd8a668}"

    /**
     * @type {String}
     */
    static PROPID_ACC_NAV_LEFT => "{228086cb-82f1-4a39-8705-dcdc0fff92f5}"

    /**
     * @type {String}
     */
    static PROPID_ACC_NAV_RIGHT => "{cd211d9f-e1cb-4fe5-a77c-920b884d095b}"

    /**
     * @type {String}
     */
    static PROPID_ACC_NAV_PREV => "{776d3891-c73b-4480-b3f6-076a16a15af6}"

    /**
     * @type {String}
     */
    static PROPID_ACC_NAV_NEXT => "{1cdc5455-8cd9-4c92-a371-3939a2fe3eee}"

    /**
     * @type {String}
     */
    static PROPID_ACC_NAV_FIRSTCHILD => "{cfd02558-557b-4c67-84f9-2a09fce40749}"

    /**
     * @type {String}
     */
    static PROPID_ACC_NAV_LASTCHILD => "{302ecaa5-48d5-4f8d-b671-1a8d20a77832}"

    /**
     * @type {String}
     */
    static PROPID_ACC_ROLEMAP => "{f79acda2-140d-4fe6-8914-208476328269}"

    /**
     * @type {String}
     */
    static PROPID_ACC_VALUEMAP => "{da1c3d79-fc5c-420e-b399-9d1533549e75}"

    /**
     * @type {String}
     */
    static PROPID_ACC_STATEMAP => "{43946c5e-0ac0-4042-b525-07bbdbe17fa7}"

    /**
     * @type {String}
     */
    static PROPID_ACC_DESCRIPTIONMAP => "{1ff1435f-8a14-477b-b226-a0abe279975d}"

    /**
     * @type {String}
     */
    static PROPID_ACC_DODEFAULTACTION => "{1ba09523-2e3b-49a6-a059-59682a3c48fd}"

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_PARENT => -5000

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_CHILDCOUNT => -5001

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_CHILD => -5002

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_NAME => -5003

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_VALUE => -5004

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_DESCRIPTION => -5005

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_ROLE => -5006

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_STATE => -5007

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_HELP => -5008

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_HELPTOPIC => -5009

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_KEYBOARDSHORTCUT => -5010

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_FOCUS => -5011

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_SELECTION => -5012

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_DEFAULTACTION => -5013

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_SELECT => -5014

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_LOCATION => -5015

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_NAVIGATE => -5016

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_HITTEST => -5017

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACC_DODEFAULTACTION => -5018

    /**
     * @type {Integer (UInt32)}
     */
    static NAVDIR_MIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NAVDIR_UP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NAVDIR_DOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NAVDIR_LEFT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NAVDIR_RIGHT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NAVDIR_NEXT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static NAVDIR_PREVIOUS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static NAVDIR_FIRSTCHILD => 7

    /**
     * @type {Integer (UInt32)}
     */
    static NAVDIR_LASTCHILD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NAVDIR_MAX => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SELFLAG_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SELFLAG_TAKEFOCUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SELFLAG_TAKESELECTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SELFLAG_EXTENDSELECTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SELFLAG_ADDSELECTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SELFLAG_REMOVESELECTION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SELFLAG_VALID => 31

    /**
     * @type {Integer (UInt32)}
     */
    static STATE_SYSTEM_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STATE_SYSTEM_HASPOPUP => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_TITLEBAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_MENUBAR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_SCROLLBAR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_GRIP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_SOUND => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_CURSOR => 6

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_CARET => 7

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_ALERT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_WINDOW => 9

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_CLIENT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_MENUPOPUP => 11

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_MENUITEM => 12

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_TOOLTIP => 13

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_APPLICATION => 14

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_DOCUMENT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_PANE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_CHART => 17

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_DIALOG => 18

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_BORDER => 19

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_GROUPING => 20

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_SEPARATOR => 21

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_TOOLBAR => 22

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_STATUSBAR => 23

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_TABLE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_COLUMNHEADER => 25

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_ROWHEADER => 26

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_COLUMN => 27

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_ROW => 28

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_CELL => 29

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_LINK => 30

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_HELPBALLOON => 31

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_CHARACTER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_LIST => 33

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_LISTITEM => 34

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_OUTLINE => 35

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_OUTLINEITEM => 36

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_PAGETAB => 37

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_PROPERTYPAGE => 38

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_INDICATOR => 39

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_GRAPHIC => 40

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_STATICTEXT => 41

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_TEXT => 42

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_PUSHBUTTON => 43

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_CHECKBUTTON => 44

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_RADIOBUTTON => 45

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_COMBOBOX => 46

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_DROPLIST => 47

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_PROGRESSBAR => 48

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_DIAL => 49

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_HOTKEYFIELD => 50

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_SLIDER => 51

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_SPINBUTTON => 52

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_DIAGRAM => 53

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_ANIMATION => 54

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_EQUATION => 55

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_BUTTONDROPDOWN => 56

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_BUTTONMENU => 57

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_BUTTONDROPDOWNGRID => 58

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_WHITESPACE => 59

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_PAGETABLIST => 60

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_CLOCK => 61

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_SPLITBUTTON => 62

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_IPADDRESS => 63

    /**
     * @type {Integer (UInt32)}
     */
    static ROLE_SYSTEM_OUTLINEBUTTON => 64

    /**
     * @type {Integer (UInt32)}
     */
    static UIA_E_ELEMENTNOTENABLED => 2147746304

    /**
     * @type {Integer (UInt32)}
     */
    static UIA_E_ELEMENTNOTAVAILABLE => 2147746305

    /**
     * @type {Integer (UInt32)}
     */
    static UIA_E_NOCLICKABLEPOINT => 2147746306

    /**
     * @type {Integer (UInt32)}
     */
    static UIA_E_PROXYASSEMBLYNOTLOADED => 2147746307

    /**
     * @type {Integer (UInt32)}
     */
    static UIA_E_NOTSUPPORTED => 2147746308

    /**
     * @type {Integer (UInt32)}
     */
    static UIA_E_INVALIDOPERATION => 2148734217

    /**
     * @type {Integer (UInt32)}
     */
    static UIA_E_TIMEOUT => 2148734213

    /**
     * @type {Integer (UInt32)}
     */
    static UiaAppendRuntimeId => 3

    /**
     * @type {Integer (Int32)}
     */
    static UiaRootObjectId => -25

    /**
     * @type {String}
     */
    static RuntimeId_Property_GUID => "{a39eebfa-7fba-4c89-b4d4-b99e2de7d160}"

    /**
     * @type {String}
     */
    static BoundingRectangle_Property_GUID => "{7bbfe8b2-3bfc-48dd-b729-c794b846e9a1}"

    /**
     * @type {String}
     */
    static ProcessId_Property_GUID => "{40499998-9c31-4245-a403-87320e59eaf6}"

    /**
     * @type {String}
     */
    static ControlType_Property_GUID => "{ca774fea-28ac-4bc2-94ca-acec6d6c10a3}"

    /**
     * @type {String}
     */
    static LocalizedControlType_Property_GUID => "{8763404f-a1bd-452a-89c4-3f01d3833806}"

    /**
     * @type {String}
     */
    static Name_Property_GUID => "{c3a6921b-4a99-44f1-bca6-61187052c431}"

    /**
     * @type {String}
     */
    static AcceleratorKey_Property_GUID => "{514865df-2557-4cb9-aeed-6ced084ce52c}"

    /**
     * @type {String}
     */
    static AccessKey_Property_GUID => "{06827b12-a7f9-4a15-917c-ffa5ad3eb0a7}"

    /**
     * @type {String}
     */
    static HasKeyboardFocus_Property_GUID => "{cf8afd39-3f46-4800-9656-b2bf12529905}"

    /**
     * @type {String}
     */
    static IsKeyboardFocusable_Property_GUID => "{f7b8552a-0859-4b37-b9cb-51e72092f29f}"

    /**
     * @type {String}
     */
    static IsEnabled_Property_GUID => "{2109427f-da60-4fed-bf1b-264bdce6eb3a}"

    /**
     * @type {String}
     */
    static AutomationId_Property_GUID => "{c82c0500-b60e-4310-a267-303c531f8ee5}"

    /**
     * @type {String}
     */
    static ClassName_Property_GUID => "{157b7215-894f-4b65-84e2-aac0da08b16b}"

    /**
     * @type {String}
     */
    static HelpText_Property_GUID => "{08555685-0977-45c7-a7a6-abaf5684121a}"

    /**
     * @type {String}
     */
    static ClickablePoint_Property_GUID => "{0196903b-b203-4818-a9f3-f08e675f2341}"

    /**
     * @type {String}
     */
    static Culture_Property_GUID => "{e2d74f27-3d79-4dc2-b88b-3044963a8afb}"

    /**
     * @type {String}
     */
    static IsControlElement_Property_GUID => "{95f35085-abcc-4afd-a5f4-dbb46c230fdb}"

    /**
     * @type {String}
     */
    static IsContentElement_Property_GUID => "{4bda64a8-f5d8-480b-8155-ef2e89adb672}"

    /**
     * @type {String}
     */
    static LabeledBy_Property_GUID => "{e5b8924b-fc8a-4a35-8031-cf78ac43e55e}"

    /**
     * @type {String}
     */
    static IsPassword_Property_GUID => "{e8482eb1-687c-497b-bebc-03be53ec1454}"

    /**
     * @type {String}
     */
    static NewNativeWindowHandle_Property_GUID => "{5196b33b-380a-4982-95e1-91f3ef60e024}"

    /**
     * @type {String}
     */
    static ItemType_Property_GUID => "{cdda434d-6222-413b-a68a-325dd1d40f39}"

    /**
     * @type {String}
     */
    static IsOffscreen_Property_GUID => "{03c3d160-db79-42db-a2ef-1c231eede507}"

    /**
     * @type {String}
     */
    static Orientation_Property_GUID => "{a01eee62-3884-4415-887e-678ec21e39ba}"

    /**
     * @type {String}
     */
    static FrameworkId_Property_GUID => "{dbfd9900-7e1a-4f58-b61b-7063120f773b}"

    /**
     * @type {String}
     */
    static IsRequiredForForm_Property_GUID => "{4f5f43cf-59fb-4bde-a270-602e5e1141e9}"

    /**
     * @type {String}
     */
    static ItemStatus_Property_GUID => "{51de0321-3973-43e7-8913-0b08e813c37f}"

    /**
     * @type {String}
     */
    static AriaRole_Property_GUID => "{dd207b95-be4a-4e0d-b727-63ace94b6916}"

    /**
     * @type {String}
     */
    static AriaProperties_Property_GUID => "{4213678c-e025-4922-beb5-e43ba08e6221}"

    /**
     * @type {String}
     */
    static IsDataValidForForm_Property_GUID => "{445ac684-c3fc-4dd9-acf8-845a579296ba}"

    /**
     * @type {String}
     */
    static ControllerFor_Property_GUID => "{51124c8a-a5d2-4f13-9be6-7fa8ba9d3a90}"

    /**
     * @type {String}
     */
    static DescribedBy_Property_GUID => "{7c5865b8-9992-40fd-8db0-6bf1d317f998}"

    /**
     * @type {String}
     */
    static FlowsTo_Property_GUID => "{e4f33d20-559a-47fb-a830-f9cb4ff1a70a}"

    /**
     * @type {String}
     */
    static ProviderDescription_Property_GUID => "{dca5708a-c16b-4cd9-b889-beb16a804904}"

    /**
     * @type {String}
     */
    static OptimizeForVisualContent_Property_GUID => "{6a852250-c75a-4e5d-b858-e381b0f78861}"

    /**
     * @type {String}
     */
    static IsDockPatternAvailable_Property_GUID => "{2600a4c4-2ff8-4c96-ae31-8fe619a13c6c}"

    /**
     * @type {String}
     */
    static IsExpandCollapsePatternAvailable_Property_GUID => "{929d3806-5287-4725-aa16-222afc63d595}"

    /**
     * @type {String}
     */
    static IsGridItemPatternAvailable_Property_GUID => "{5a43e524-f9a2-4b12-84c8-b48a3efedd34}"

    /**
     * @type {String}
     */
    static IsGridPatternAvailable_Property_GUID => "{5622c26c-f0ef-4f3b-97cb-714c0868588b}"

    /**
     * @type {String}
     */
    static IsInvokePatternAvailable_Property_GUID => "{4e725738-8364-4679-aa6c-f3f41931f750}"

    /**
     * @type {String}
     */
    static IsMultipleViewPatternAvailable_Property_GUID => "{ff0a31eb-8e25-469d-8d6e-e771a27c1b90}"

    /**
     * @type {String}
     */
    static IsRangeValuePatternAvailable_Property_GUID => "{fda4244a-eb4d-43ff-b5ad-ed36d373ec4c}"

    /**
     * @type {String}
     */
    static IsScrollPatternAvailable_Property_GUID => "{3ebb7b4a-828a-4b57-9d22-2fea1632ed0d}"

    /**
     * @type {String}
     */
    static IsScrollItemPatternAvailable_Property_GUID => "{1cad1a05-0927-4b76-97e1-0fcdb209b98a}"

    /**
     * @type {String}
     */
    static IsSelectionItemPatternAvailable_Property_GUID => "{8becd62d-0bc3-4109-bee2-8e6715290e68}"

    /**
     * @type {String}
     */
    static IsSelectionPatternAvailable_Property_GUID => "{f588acbe-c769-4838-9a60-2686dc1188c4}"

    /**
     * @type {String}
     */
    static IsTablePatternAvailable_Property_GUID => "{cb83575f-45c2-4048-9c76-159715a139df}"

    /**
     * @type {String}
     */
    static IsTableItemPatternAvailable_Property_GUID => "{eb36b40d-8ea4-489b-a013-e60d5951fe34}"

    /**
     * @type {String}
     */
    static IsTextPatternAvailable_Property_GUID => "{fbe2d69d-aff6-4a45-82e2-fc92a82f5917}"

    /**
     * @type {String}
     */
    static IsTogglePatternAvailable_Property_GUID => "{78686d53-fcd0-4b83-9b78-5832ce63bb5b}"

    /**
     * @type {String}
     */
    static IsTransformPatternAvailable_Property_GUID => "{a7f78804-d68b-4077-a5c6-7a5ea1ac31c5}"

    /**
     * @type {String}
     */
    static IsValuePatternAvailable_Property_GUID => "{0b5020a7-2119-473b-be37-5ceb98bbfb22}"

    /**
     * @type {String}
     */
    static IsWindowPatternAvailable_Property_GUID => "{e7a57bb1-5888-4155-98dc-b422fd57f2bc}"

    /**
     * @type {String}
     */
    static IsLegacyIAccessiblePatternAvailable_Property_GUID => "{d8ebd0c7-929a-4ee7-8d3a-d3d94413027b}"

    /**
     * @type {String}
     */
    static IsItemContainerPatternAvailable_Property_GUID => "{624b5ca7-fe40-4957-a019-20c4cf11920f}"

    /**
     * @type {String}
     */
    static IsVirtualizedItemPatternAvailable_Property_GUID => "{302cb151-2ac8-45d6-977b-d2b3a5a53f20}"

    /**
     * @type {String}
     */
    static IsSynchronizedInputPatternAvailable_Property_GUID => "{75d69cc5-d2bf-4943-876e-b45b62a6cc66}"

    /**
     * @type {String}
     */
    static IsObjectModelPatternAvailable_Property_GUID => "{6b21d89b-2841-412f-8ef2-15ca952318ba}"

    /**
     * @type {String}
     */
    static IsAnnotationPatternAvailable_Property_GUID => "{0b5b3238-6d5c-41b6-bcc4-5e807f6551c4}"

    /**
     * @type {String}
     */
    static IsTextPattern2Available_Property_GUID => "{41cf921d-e3f1-4b22-9c81-e1c3ed331c22}"

    /**
     * @type {String}
     */
    static IsTextEditPatternAvailable_Property_GUID => "{7843425c-8b32-484c-9ab5-e3200571ffda}"

    /**
     * @type {String}
     */
    static IsCustomNavigationPatternAvailable_Property_GUID => "{8f8e80d4-2351-48e0-874a-54aa7313889a}"

    /**
     * @type {String}
     */
    static IsStylesPatternAvailable_Property_GUID => "{27f353d3-459c-4b59-a490-50611dacafb5}"

    /**
     * @type {String}
     */
    static IsSpreadsheetPatternAvailable_Property_GUID => "{6ff43732-e4b4-4555-97bc-ecdbbc4d1888}"

    /**
     * @type {String}
     */
    static IsSpreadsheetItemPatternAvailable_Property_GUID => "{9fe79b2a-2f94-43fd-996b-549e316f4acd}"

    /**
     * @type {String}
     */
    static IsTransformPattern2Available_Property_GUID => "{25980b4b-be04-4710-ab4a-fda31dbd2895}"

    /**
     * @type {String}
     */
    static IsTextChildPatternAvailable_Property_GUID => "{559e65df-30ff-43b5-b5ed-5b283b80c7e9}"

    /**
     * @type {String}
     */
    static IsDragPatternAvailable_Property_GUID => "{e997a7b7-1d39-4ca7-be0f-277fcf5605cc}"

    /**
     * @type {String}
     */
    static IsDropTargetPatternAvailable_Property_GUID => "{0686b62e-8e19-4aaf-873d-384f6d3b92be}"

    /**
     * @type {String}
     */
    static IsStructuredMarkupPatternAvailable_Property_GUID => "{b0d4c196-2c0b-489c-b165-a405928c6f3d}"

    /**
     * @type {String}
     */
    static IsPeripheral_Property_GUID => "{da758276-7ed5-49d4-8e68-ecc9a2d300dd}"

    /**
     * @type {String}
     */
    static PositionInSet_Property_GUID => "{33d1dc54-641e-4d76-a6b1-13f341c1f896}"

    /**
     * @type {String}
     */
    static SizeOfSet_Property_GUID => "{1600d33c-3b9f-4369-9431-aa293f344cf1}"

    /**
     * @type {String}
     */
    static Level_Property_GUID => "{242ac529-cd36-400f-aad9-7876ef3af627}"

    /**
     * @type {String}
     */
    static AnnotationTypes_Property_GUID => "{64b71f76-53c4-4696-a219-20e940c9a176}"

    /**
     * @type {String}
     */
    static AnnotationObjects_Property_GUID => "{310910c8-7c6e-4f20-becd-4aaf6d191156}"

    /**
     * @type {String}
     */
    static LandmarkType_Property_GUID => "{454045f2-6f61-49f7-a4f8-b5f0cf82da1e}"

    /**
     * @type {String}
     */
    static LocalizedLandmarkType_Property_GUID => "{7ac81980-eafb-4fb2-bf91-f485bef5e8e1}"

    /**
     * @type {String}
     */
    static FullDescription_Property_GUID => "{0d4450ff-6aef-4f33-95dd-7befa72a4391}"

    /**
     * @type {String}
     */
    static Value_Value_Property_GUID => "{e95f5e64-269f-4a85-ba99-4092c3ea2986}"

    /**
     * @type {String}
     */
    static Value_IsReadOnly_Property_GUID => "{eb090f30-e24c-4799-a705-0d247bc037f8}"

    /**
     * @type {String}
     */
    static RangeValue_Value_Property_GUID => "{131f5d98-c50c-489d-abe5-ae220898c5f7}"

    /**
     * @type {String}
     */
    static RangeValue_IsReadOnly_Property_GUID => "{25fa1055-debf-4373-a79e-1f1a1908d3c4}"

    /**
     * @type {String}
     */
    static RangeValue_Minimum_Property_GUID => "{78cbd3b2-684d-4860-af93-d1f95cb022fd}"

    /**
     * @type {String}
     */
    static RangeValue_Maximum_Property_GUID => "{19319914-f979-4b35-a1a6-d37e05433473}"

    /**
     * @type {String}
     */
    static RangeValue_LargeChange_Property_GUID => "{a1f96325-3a3d-4b44-8e1f-4a46d9844019}"

    /**
     * @type {String}
     */
    static RangeValue_SmallChange_Property_GUID => "{81c2c457-3941-4107-9975-139760f7c072}"

    /**
     * @type {String}
     */
    static Scroll_HorizontalScrollPercent_Property_GUID => "{c7c13c0e-eb21-47ff-acc4-b5a3350f5191}"

    /**
     * @type {String}
     */
    static Scroll_HorizontalViewSize_Property_GUID => "{70c2e5d4-fcb0-4713-a9aa-af92ff79e4cd}"

    /**
     * @type {String}
     */
    static Scroll_VerticalScrollPercent_Property_GUID => "{6c8d7099-b2a8-4948-bff7-3cf9058bfefb}"

    /**
     * @type {String}
     */
    static Scroll_VerticalViewSize_Property_GUID => "{de6a2e22-d8c7-40c5-83ba-e5f681d53108}"

    /**
     * @type {String}
     */
    static Scroll_HorizontallyScrollable_Property_GUID => "{8b925147-28cd-49ae-bd63-f44118d2e719}"

    /**
     * @type {String}
     */
    static Scroll_VerticallyScrollable_Property_GUID => "{89164798-0068-4315-b89a-1e7cfbbc3dfc}"

    /**
     * @type {String}
     */
    static Selection_Selection_Property_GUID => "{aa6dc2a2-0e2b-4d38-96d5-34e470b81853}"

    /**
     * @type {String}
     */
    static Selection_CanSelectMultiple_Property_GUID => "{49d73da5-c883-4500-883d-8fcf8daf6cbe}"

    /**
     * @type {String}
     */
    static Selection_IsSelectionRequired_Property_GUID => "{b1ae4422-63fe-44e7-a5a5-a738c829b19a}"

    /**
     * @type {String}
     */
    static Grid_RowCount_Property_GUID => "{2a9505bf-c2eb-4fb6-b356-8245ae53703e}"

    /**
     * @type {String}
     */
    static Grid_ColumnCount_Property_GUID => "{fe96f375-44aa-4536-ac7a-2a75d71a3efc}"

    /**
     * @type {String}
     */
    static GridItem_Row_Property_GUID => "{6223972a-c945-4563-9329-fdc974af2553}"

    /**
     * @type {String}
     */
    static GridItem_Column_Property_GUID => "{c774c15c-62c0-4519-8bdc-47be573c8ad5}"

    /**
     * @type {String}
     */
    static GridItem_RowSpan_Property_GUID => "{4582291c-466b-4e93-8e83-3d1715ec0c5e}"

    /**
     * @type {String}
     */
    static GridItem_ColumnSpan_Property_GUID => "{583ea3f5-86d0-4b08-a6ec-2c5463ffc109}"

    /**
     * @type {String}
     */
    static GridItem_Parent_Property_GUID => "{9d912252-b97f-4ecc-8510-ea0e33427c72}"

    /**
     * @type {String}
     */
    static Dock_DockPosition_Property_GUID => "{6d67f02e-c0b0-4b10-b5b9-18d6ecf98760}"

    /**
     * @type {String}
     */
    static ExpandCollapse_ExpandCollapseState_Property_GUID => "{275a4c48-85a7-4f69-aba0-af157610002b}"

    /**
     * @type {String}
     */
    static MultipleView_CurrentView_Property_GUID => "{7a81a67a-b94f-4875-918b-65c8d2f998e5}"

    /**
     * @type {String}
     */
    static MultipleView_SupportedViews_Property_GUID => "{8d5db9fd-ce3c-4ae7-b788-400a3c645547}"

    /**
     * @type {String}
     */
    static Window_CanMaximize_Property_GUID => "{64fff53f-635d-41c1-950c-cb5adfbe28e3}"

    /**
     * @type {String}
     */
    static Window_CanMinimize_Property_GUID => "{b73b4625-5988-4b97-b4c2-a6fe6e78c8c6}"

    /**
     * @type {String}
     */
    static Window_WindowVisualState_Property_GUID => "{4ab7905f-e860-453e-a30a-f6431e5daad5}"

    /**
     * @type {String}
     */
    static Window_WindowInteractionState_Property_GUID => "{4fed26a4-0455-4fa2-b21c-c4da2db1ff9c}"

    /**
     * @type {String}
     */
    static Window_IsModal_Property_GUID => "{ff4e6892-37b9-4fca-8532-ffe674ecfeed}"

    /**
     * @type {String}
     */
    static Window_IsTopmost_Property_GUID => "{ef7d85d3-0937-4962-9241-b62345f24041}"

    /**
     * @type {String}
     */
    static SelectionItem_IsSelected_Property_GUID => "{f122835f-cd5f-43df-b79d-4b849e9e6020}"

    /**
     * @type {String}
     */
    static SelectionItem_SelectionContainer_Property_GUID => "{a4365b6e-9c1e-4b63-8b53-c2421dd1e8fb}"

    /**
     * @type {String}
     */
    static Table_RowHeaders_Property_GUID => "{d9e35b87-6eb8-4562-aac6-a8a9075236a8}"

    /**
     * @type {String}
     */
    static Table_ColumnHeaders_Property_GUID => "{aff1d72b-968d-42b1-b459-150b299da664}"

    /**
     * @type {String}
     */
    static Table_RowOrColumnMajor_Property_GUID => "{83be75c3-29fe-4a30-85e1-2a6277fd106e}"

    /**
     * @type {String}
     */
    static TableItem_RowHeaderItems_Property_GUID => "{b3f853a0-0574-4cd8-bcd7-ed5923572d97}"

    /**
     * @type {String}
     */
    static TableItem_ColumnHeaderItems_Property_GUID => "{967a56a3-74b6-431e-8de6-99c411031c58}"

    /**
     * @type {String}
     */
    static Toggle_ToggleState_Property_GUID => "{b23cdc52-22c2-4c6c-9ded-f5c422479ede}"

    /**
     * @type {String}
     */
    static Transform_CanMove_Property_GUID => "{1b75824d-208b-4fdf-bccd-f1f4e5741f4f}"

    /**
     * @type {String}
     */
    static Transform_CanResize_Property_GUID => "{bb98dca5-4c1a-41d4-a4f6-ebc128644180}"

    /**
     * @type {String}
     */
    static Transform_CanRotate_Property_GUID => "{10079b48-3849-476f-ac96-44a95c8440d9}"

    /**
     * @type {String}
     */
    static LegacyIAccessible_ChildId_Property_GUID => "{9a191b5d-9ef2-4787-a459-dcde885dd4e8}"

    /**
     * @type {String}
     */
    static LegacyIAccessible_Name_Property_GUID => "{caeb063d-40ae-4869-aa5a-1b8e5d666739}"

    /**
     * @type {String}
     */
    static LegacyIAccessible_Value_Property_GUID => "{b5c5b0b6-8217-4a77-97a5-190a85ed0156}"

    /**
     * @type {String}
     */
    static LegacyIAccessible_Description_Property_GUID => "{46448418-7d70-4ea9-9d27-b7e775cf2ad7}"

    /**
     * @type {String}
     */
    static LegacyIAccessible_Role_Property_GUID => "{6856e59f-cbaf-4e31-93e8-bcbf6f7e491c}"

    /**
     * @type {String}
     */
    static LegacyIAccessible_State_Property_GUID => "{df985854-2281-4340-ab9c-c60e2c5803f6}"

    /**
     * @type {String}
     */
    static LegacyIAccessible_Help_Property_GUID => "{94402352-161c-4b77-a98d-a872cc33947a}"

    /**
     * @type {String}
     */
    static LegacyIAccessible_KeyboardShortcut_Property_GUID => "{8f6909ac-00b8-4259-a41c-966266d43a8a}"

    /**
     * @type {String}
     */
    static LegacyIAccessible_Selection_Property_GUID => "{8aa8b1e0-0891-40cc-8b06-90d7d4166219}"

    /**
     * @type {String}
     */
    static LegacyIAccessible_DefaultAction_Property_GUID => "{3b331729-eaad-4502-b85f-92615622913c}"

    /**
     * @type {String}
     */
    static Annotation_AnnotationTypeId_Property_GUID => "{20ae484f-69ef-4c48-8f5b-c4938b206ac7}"

    /**
     * @type {String}
     */
    static Annotation_AnnotationTypeName_Property_GUID => "{9b818892-5ac9-4af9-aa96-f58a77b058e3}"

    /**
     * @type {String}
     */
    static Annotation_Author_Property_GUID => "{7a528462-9c5c-4a03-a974-8b307a9937f2}"

    /**
     * @type {String}
     */
    static Annotation_DateTime_Property_GUID => "{99b5ca5d-1acf-414b-a4d0-6b350b047578}"

    /**
     * @type {String}
     */
    static Annotation_Target_Property_GUID => "{b71b302d-2104-44ad-9c5c-092b4907d70f}"

    /**
     * @type {String}
     */
    static Styles_StyleId_Property_GUID => "{da82852f-3817-4233-82af-02279e72cc77}"

    /**
     * @type {String}
     */
    static Styles_StyleName_Property_GUID => "{1c12b035-05d1-4f55-9e8e-1489f3ff550d}"

    /**
     * @type {String}
     */
    static Styles_FillColor_Property_GUID => "{63eff97a-a1c5-4b1d-84eb-b765f2edd632}"

    /**
     * @type {String}
     */
    static Styles_FillPatternStyle_Property_GUID => "{81cf651f-482b-4451-a30a-e1545e554fb8}"

    /**
     * @type {String}
     */
    static Styles_Shape_Property_GUID => "{c71a23f8-778c-400d-8458-3b543e526984}"

    /**
     * @type {String}
     */
    static Styles_FillPatternColor_Property_GUID => "{939a59fe-8fbd-4e75-a271-ac4595195163}"

    /**
     * @type {String}
     */
    static Styles_ExtendedProperties_Property_GUID => "{f451cda0-ba0a-4681-b0b0-0dbdb53e58f3}"

    /**
     * @type {String}
     */
    static SpreadsheetItem_Formula_Property_GUID => "{e602e47d-1b47-4bea-87cf-3b0b0b5c15b6}"

    /**
     * @type {String}
     */
    static SpreadsheetItem_AnnotationObjects_Property_GUID => "{a3194c38-c9bc-4604-9396-ae3f9f457f7b}"

    /**
     * @type {String}
     */
    static SpreadsheetItem_AnnotationTypes_Property_GUID => "{c70c51d0-d602-4b45-afbc-b4712b96d72b}"

    /**
     * @type {String}
     */
    static Transform2_CanZoom_Property_GUID => "{f357e890-a756-4359-9ca6-86702bf8f381}"

    /**
     * @type {String}
     */
    static LiveSetting_Property_GUID => "{c12bcd8e-2a8e-4950-8ae7-3625111d58eb}"

    /**
     * @type {String}
     */
    static Drag_IsGrabbed_Property_GUID => "{45f206f3-75cc-4cca-a9b9-fcdfb982d8a2}"

    /**
     * @type {String}
     */
    static Drag_GrabbedItems_Property_GUID => "{77c1562c-7b86-4b21-9ed7-3cefda6f4c43}"

    /**
     * @type {String}
     */
    static Drag_DropEffect_Property_GUID => "{646f2779-48d3-4b23-8902-4bf100005df3}"

    /**
     * @type {String}
     */
    static Drag_DropEffects_Property_GUID => "{f5d61156-7ce6-49be-a836-9269dcec920f}"

    /**
     * @type {String}
     */
    static DropTarget_DropTargetEffect_Property_GUID => "{8bb75975-a0ca-4981-b818-87fc66e9509d}"

    /**
     * @type {String}
     */
    static DropTarget_DropTargetEffects_Property_GUID => "{bc1dd4ed-cb89-45f1-a592-e03b08ae790f}"

    /**
     * @type {String}
     */
    static Transform2_ZoomLevel_Property_GUID => "{eee29f1a-f4a2-4b5b-ac65-95cf93283387}"

    /**
     * @type {String}
     */
    static Transform2_ZoomMinimum_Property_GUID => "{742ccc16-4ad1-4e07-96fe-b122c6e6b22b}"

    /**
     * @type {String}
     */
    static Transform2_ZoomMaximum_Property_GUID => "{42ab6b77-ceb0-4eca-b82a-6cfa5fa1fc08}"

    /**
     * @type {String}
     */
    static FlowsFrom_Property_GUID => "{05c6844f-19de-48f8-95fa-880d5b0fd615}"

    /**
     * @type {String}
     */
    static FillColor_Property_GUID => "{6e0ec4d0-e2a8-4a56-9de7-953389933b39}"

    /**
     * @type {String}
     */
    static OutlineColor_Property_GUID => "{c395d6c0-4b55-4762-a073-fd303a634f52}"

    /**
     * @type {String}
     */
    static FillType_Property_GUID => "{c6fc74e4-8cb9-429c-a9e1-9bc4ac372b62}"

    /**
     * @type {String}
     */
    static VisualEffects_Property_GUID => "{e61a8565-aad9-46d7-9e70-4e8a8420d420}"

    /**
     * @type {String}
     */
    static OutlineThickness_Property_GUID => "{13e67cc7-dac2-4888-bdd3-375c62fa9618}"

    /**
     * @type {String}
     */
    static CenterPoint_Property_GUID => "{0cb00c08-540c-4edb-9445-26359ea69785}"

    /**
     * @type {String}
     */
    static Rotation_Property_GUID => "{767cdc7d-aec0-4110-ad32-30edd403492e}"

    /**
     * @type {String}
     */
    static Size_Property_GUID => "{2b5f761d-f885-4404-973f-9b1d98e36d8f}"

    /**
     * @type {String}
     */
    static ToolTipOpened_Event_GUID => "{3f4b97ff-2edc-451d-bca4-95a3188d5b03}"

    /**
     * @type {String}
     */
    static ToolTipClosed_Event_GUID => "{276d71ef-24a9-49b6-8e97-da98b401bbcd}"

    /**
     * @type {String}
     */
    static StructureChanged_Event_GUID => "{59977961-3edd-4b11-b13b-676b2a2a6ca9}"

    /**
     * @type {String}
     */
    static MenuOpened_Event_GUID => "{ebe2e945-66ca-4ed1-9ff8-2ad7df0a1b08}"

    /**
     * @type {String}
     */
    static AutomationPropertyChanged_Event_GUID => "{2527fba1-8d7a-4630-a4cc-e66315942f52}"

    /**
     * @type {String}
     */
    static AutomationFocusChanged_Event_GUID => "{b68a1f17-f60d-41a7-a3cc-b05292155fe0}"

    /**
     * @type {String}
     */
    static ActiveTextPositionChanged_Event_GUID => "{a5c09e9c-c77d-4f25-b491-e5bb7017cbd4}"

    /**
     * @type {String}
     */
    static AsyncContentLoaded_Event_GUID => "{5fdee11c-d2fa-4fb9-904e-5cbee894d5ef}"

    /**
     * @type {String}
     */
    static MenuClosed_Event_GUID => "{3cf1266e-1582-4041-acd7-88a35a965297}"

    /**
     * @type {String}
     */
    static LayoutInvalidated_Event_GUID => "{ed7d6544-a6bd-4595-9bae-3d28946cc715}"

    /**
     * @type {String}
     */
    static Invoke_Invoked_Event_GUID => "{dfd699f0-c915-49dd-b422-dde785c3d24b}"

    /**
     * @type {String}
     */
    static SelectionItem_ElementAddedToSelectionEvent_Event_GUID => "{3c822dd1-c407-4dba-91dd-79d4aed0aec6}"

    /**
     * @type {String}
     */
    static SelectionItem_ElementRemovedFromSelectionEvent_Event_GUID => "{097fa8a9-7079-41af-8b9c-0934d8305e5c}"

    /**
     * @type {String}
     */
    static SelectionItem_ElementSelectedEvent_Event_GUID => "{b9c7dbfb-4ebe-4532-aaf4-008cf647233c}"

    /**
     * @type {String}
     */
    static Selection_InvalidatedEvent_Event_GUID => "{cac14904-16b4-4b53-8e47-4cb1df267bb7}"

    /**
     * @type {String}
     */
    static Text_TextSelectionChangedEvent_Event_GUID => "{918edaa1-71b3-49ae-9741-79beb8d358f3}"

    /**
     * @type {String}
     */
    static Text_TextChangedEvent_Event_GUID => "{4a342082-f483-48c4-ac11-a84b435e2a84}"

    /**
     * @type {String}
     */
    static Window_WindowOpened_Event_GUID => "{d3e81d06-de45-4f2f-9633-de9e02fb65af}"

    /**
     * @type {String}
     */
    static Window_WindowClosed_Event_GUID => "{edf141f8-fa67-4e22-bbf7-944e05735ee2}"

    /**
     * @type {String}
     */
    static MenuModeStart_Event_GUID => "{18d7c631-166a-4ac9-ae3b-ef4b5420e681}"

    /**
     * @type {String}
     */
    static MenuModeEnd_Event_GUID => "{9ecd4c9f-80dd-47b8-8267-5aec06bb2cff}"

    /**
     * @type {String}
     */
    static InputReachedTarget_Event_GUID => "{93ed549a-0549-40f0-bedb-28e44f7de2a3}"

    /**
     * @type {String}
     */
    static InputReachedOtherElement_Event_GUID => "{ed201d8a-4e6c-415e-a874-2460c9b66ba8}"

    /**
     * @type {String}
     */
    static InputDiscarded_Event_GUID => "{7f36c367-7b18-417c-97e3-9d58ddc944ab}"

    /**
     * @type {String}
     */
    static SystemAlert_Event_GUID => "{d271545d-7a3a-47a7-8474-81d29a2451c9}"

    /**
     * @type {String}
     */
    static LiveRegionChanged_Event_GUID => "{102d5e90-e6a9-41b6-b1c5-a9b1929d9510}"

    /**
     * @type {String}
     */
    static HostedFragmentRootsInvalidated_Event_GUID => "{e6bdb03e-0921-4ec5-8dcf-eae877b0426b}"

    /**
     * @type {String}
     */
    static Drag_DragStart_Event_GUID => "{883a480b-3aa9-429d-95e4-d9c8d011f0dd}"

    /**
     * @type {String}
     */
    static Drag_DragCancel_Event_GUID => "{c3ede6fa-3451-4e0f-9e71-df9c280a4657}"

    /**
     * @type {String}
     */
    static Drag_DragComplete_Event_GUID => "{38e96188-ef1f-463e-91ca-3a7792c29caf}"

    /**
     * @type {String}
     */
    static DropTarget_DragEnter_Event_GUID => "{aad9319b-032c-4a88-961d-1cf579581e34}"

    /**
     * @type {String}
     */
    static DropTarget_DragLeave_Event_GUID => "{0f82eb15-24a2-4988-9217-de162aee272b}"

    /**
     * @type {String}
     */
    static DropTarget_Dropped_Event_GUID => "{622cead8-1edb-4a3d-abbc-be2211ff68b5}"

    /**
     * @type {String}
     */
    static StructuredMarkup_CompositionComplete_Event_GUID => "{c48a3c17-677a-4047-a68d-fc1257528aef}"

    /**
     * @type {String}
     */
    static StructuredMarkup_Deleted_Event_GUID => "{f9d0a020-e1c1-4ecf-b9aa-52efde7e41e1}"

    /**
     * @type {String}
     */
    static StructuredMarkup_SelectionChanged_Event_GUID => "{a7c815f7-ff9f-41c7-a3a7-ab6cbfdb4903}"

    /**
     * @type {String}
     */
    static Invoke_Pattern_GUID => "{d976c2fc-66ea-4a6e-b28f-c24c7546ad37}"

    /**
     * @type {String}
     */
    static Selection_Pattern_GUID => "{66e3b7e8-d821-4d25-8761-435d2c8b253f}"

    /**
     * @type {String}
     */
    static Value_Pattern_GUID => "{17faad9e-c877-475b-b933-77332779b637}"

    /**
     * @type {String}
     */
    static RangeValue_Pattern_GUID => "{18b00d87-b1c9-476a-bfbd-5f0bdb926f63}"

    /**
     * @type {String}
     */
    static Scroll_Pattern_GUID => "{895fa4b4-759d-4c50-8e15-03460672003c}"

    /**
     * @type {String}
     */
    static ExpandCollapse_Pattern_GUID => "{ae05efa2-f9d1-428a-834c-53a5c52f9b8b}"

    /**
     * @type {String}
     */
    static Grid_Pattern_GUID => "{260a2ccb-93a8-4e44-a4c1-3df397f2b02b}"

    /**
     * @type {String}
     */
    static GridItem_Pattern_GUID => "{f2d5c877-a462-4957-a2a5-2c96b303bc63}"

    /**
     * @type {String}
     */
    static MultipleView_Pattern_GUID => "{547a6ae4-113f-47c4-850f-db4dfa466b1d}"

    /**
     * @type {String}
     */
    static Window_Pattern_GUID => "{27901735-c760-4994-ad11-5919e606b110}"

    /**
     * @type {String}
     */
    static SelectionItem_Pattern_GUID => "{9bc64eeb-87c7-4b28-94bb-4d9fa437b6ef}"

    /**
     * @type {String}
     */
    static Dock_Pattern_GUID => "{9cbaa846-83c8-428d-827f-7e6063fe0620}"

    /**
     * @type {String}
     */
    static Table_Pattern_GUID => "{c415218e-a028-461e-aa92-8f925cf79351}"

    /**
     * @type {String}
     */
    static TableItem_Pattern_GUID => "{df1343bd-1888-4a29-a50c-b92e6de37f6f}"

    /**
     * @type {String}
     */
    static Text_Pattern_GUID => "{8615f05d-7de5-44fd-a679-2ca4b46033a8}"

    /**
     * @type {String}
     */
    static Toggle_Pattern_GUID => "{0b419760-e2f4-43ff-8c5f-9457c82b56e9}"

    /**
     * @type {String}
     */
    static Transform_Pattern_GUID => "{24b46fdb-587e-49f1-9c4a-d8e98b664b7b}"

    /**
     * @type {String}
     */
    static ScrollItem_Pattern_GUID => "{4591d005-a803-4d5c-b4d5-8d2800f906a7}"

    /**
     * @type {String}
     */
    static LegacyIAccessible_Pattern_GUID => "{54cc0a9f-3395-48af-ba8d-73f85690f3e0}"

    /**
     * @type {String}
     */
    static ItemContainer_Pattern_GUID => "{3d13da0f-8b9a-4a99-85fa-c5c9a69f1ed4}"

    /**
     * @type {String}
     */
    static VirtualizedItem_Pattern_GUID => "{f510173e-2e71-45e9-a6e5-62f6ed8289d5}"

    /**
     * @type {String}
     */
    static SynchronizedInput_Pattern_GUID => "{05c288a6-c47b-488b-b653-33977a551b8b}"

    /**
     * @type {String}
     */
    static ObjectModel_Pattern_GUID => "{3e04acfe-08fc-47ec-96bc-353fa3b34aa7}"

    /**
     * @type {String}
     */
    static Annotation_Pattern_GUID => "{f6c72ad7-356c-4850-9291-316f608a8c84}"

    /**
     * @type {String}
     */
    static Text_Pattern2_GUID => "{498479a2-5b22-448d-b6e4-647490860698}"

    /**
     * @type {String}
     */
    static TextEdit_Pattern_GUID => "{69f3ff89-5af9-4c75-9340-f2de292e4591}"

    /**
     * @type {String}
     */
    static CustomNavigation_Pattern_GUID => "{afea938a-621e-4054-bb2c-2f46114dac3f}"

    /**
     * @type {String}
     */
    static Styles_Pattern_GUID => "{1ae62655-da72-4d60-a153-e5aa6988e3bf}"

    /**
     * @type {String}
     */
    static Spreadsheet_Pattern_GUID => "{6a5b24c9-9d1e-4b85-9e44-c02e3169b10b}"

    /**
     * @type {String}
     */
    static SpreadsheetItem_Pattern_GUID => "{32cf83ff-f1a8-4a8c-8658-d47ba74e20ba}"

    /**
     * @type {String}
     */
    static Tranform_Pattern2_GUID => "{8afcfd07-a369-44de-988b-2f7ff49fb8a8}"

    /**
     * @type {String}
     */
    static TextChild_Pattern_GUID => "{7533cab7-3bfe-41ef-9e85-e2638cbe169e}"

    /**
     * @type {String}
     */
    static Drag_Pattern_GUID => "{c0bee21f-ccb3-4fed-995b-114f6e3d2728}"

    /**
     * @type {String}
     */
    static DropTarget_Pattern_GUID => "{0bcbec56-bd34-4b7b-9fd5-2659905ea3dc}"

    /**
     * @type {String}
     */
    static StructuredMarkup_Pattern_GUID => "{abbd0878-8665-4f5c-94fc-36e7d8bb706b}"

    /**
     * @type {String}
     */
    static Button_Control_GUID => "{5a78e369-c6a1-4f33-a9d7-79f20d0c788e}"

    /**
     * @type {String}
     */
    static Calendar_Control_GUID => "{8913eb88-00e5-46bc-8e4e-14a786e165a1}"

    /**
     * @type {String}
     */
    static CheckBox_Control_GUID => "{fb50f922-a3db-49c0-8bc3-06dad55778e2}"

    /**
     * @type {String}
     */
    static ComboBox_Control_GUID => "{54cb426c-2f33-4fff-aaa1-aef60dac5deb}"

    /**
     * @type {String}
     */
    static Edit_Control_GUID => "{6504a5c8-2c86-4f87-ae7b-1abddc810cf9}"

    /**
     * @type {String}
     */
    static Hyperlink_Control_GUID => "{8a56022c-b00d-4d15-8ff0-5b6b266e5e02}"

    /**
     * @type {String}
     */
    static Image_Control_GUID => "{2d3736e4-6b16-4c57-a962-f93260a75243}"

    /**
     * @type {String}
     */
    static ListItem_Control_GUID => "{7b3717f2-44d1-4a58-98a8-f12a9b8f78e2}"

    /**
     * @type {String}
     */
    static List_Control_GUID => "{9b149ee1-7cca-4cfc-9af1-cac7bddd3031}"

    /**
     * @type {String}
     */
    static Menu_Control_GUID => "{2e9b1440-0ea8-41fd-b374-c1ea6f503cd1}"

    /**
     * @type {String}
     */
    static MenuBar_Control_GUID => "{cc384250-0e7b-4ae8-95ae-a08f261b52ee}"

    /**
     * @type {String}
     */
    static MenuItem_Control_GUID => "{f45225d3-d0a0-49d8-9834-9a000d2aeddc}"

    /**
     * @type {String}
     */
    static ProgressBar_Control_GUID => "{228c9f86-c36c-47bb-9fb6-a5834bfc53a4}"

    /**
     * @type {String}
     */
    static RadioButton_Control_GUID => "{3bdb49db-fe2c-4483-b3e1-e57f219440c6}"

    /**
     * @type {String}
     */
    static ScrollBar_Control_GUID => "{daf34b36-5065-4946-b22f-92595fc0751a}"

    /**
     * @type {String}
     */
    static Slider_Control_GUID => "{b033c24b-3b35-4cea-b609-763682fa660b}"

    /**
     * @type {String}
     */
    static Spinner_Control_GUID => "{60cc4b38-3cb1-4161-b442-c6b726c17825}"

    /**
     * @type {String}
     */
    static StatusBar_Control_GUID => "{d45e7d1b-5873-475f-95a4-0433e1f1b00a}"

    /**
     * @type {String}
     */
    static Tab_Control_GUID => "{38cd1f2d-337a-4bd2-a5e3-adb469e30bd3}"

    /**
     * @type {String}
     */
    static TabItem_Control_GUID => "{2c6a634f-921b-4e6e-b26e-08fcb0798f4c}"

    /**
     * @type {String}
     */
    static Text_Control_GUID => "{ae9772dc-d331-4f09-be20-7e6dfaf07b0a}"

    /**
     * @type {String}
     */
    static ToolBar_Control_GUID => "{8f06b751-e182-4e98-8893-2284543a7dce}"

    /**
     * @type {String}
     */
    static ToolTip_Control_GUID => "{05ddc6d1-2137-4768-98ea-73f52f7134f3}"

    /**
     * @type {String}
     */
    static Tree_Control_GUID => "{7561349c-d241-43f4-9908-b5f091bee611}"

    /**
     * @type {String}
     */
    static TreeItem_Control_GUID => "{62c9feb9-8ffc-4878-a3a4-96b030315c18}"

    /**
     * @type {String}
     */
    static Custom_Control_GUID => "{f29ea0c3-adb7-430a-ba90-e52c7313e6ed}"

    /**
     * @type {String}
     */
    static Group_Control_GUID => "{ad50aa1c-e8c8-4774-ae1b-dd86df0b3bdc}"

    /**
     * @type {String}
     */
    static Thumb_Control_GUID => "{701ca877-e310-4dd6-b644-797e4faea213}"

    /**
     * @type {String}
     */
    static DataGrid_Control_GUID => "{84b783af-d103-4b0a-8415-e73942410f4b}"

    /**
     * @type {String}
     */
    static DataItem_Control_GUID => "{a0177842-d94f-42a5-814b-6068addc8da5}"

    /**
     * @type {String}
     */
    static Document_Control_GUID => "{3cd6bb6f-6f08-4562-b229-e4e2fc7a9eb4}"

    /**
     * @type {String}
     */
    static SplitButton_Control_GUID => "{7011f01f-4ace-4901-b461-920a6f1ca650}"

    /**
     * @type {String}
     */
    static Window_Control_GUID => "{e13a7242-f462-4f4d-aec1-53b28d6c3290}"

    /**
     * @type {String}
     */
    static Pane_Control_GUID => "{5c2b3f5b-9182-42a3-8dec-8c04c1ee634d}"

    /**
     * @type {String}
     */
    static Header_Control_GUID => "{5b90cbce-78fb-4614-82b6-554d74718e67}"

    /**
     * @type {String}
     */
    static HeaderItem_Control_GUID => "{e6bc12cb-7c8e-49cf-b168-4a93a32bebb0}"

    /**
     * @type {String}
     */
    static Table_Control_GUID => "{773bfa0e-5bc4-4deb-921b-de7b3206229e}"

    /**
     * @type {String}
     */
    static TitleBar_Control_GUID => "{98aa55bf-3bb0-4b65-836e-2ea30dbc171f}"

    /**
     * @type {String}
     */
    static Separator_Control_GUID => "{8767eba3-2a63-4ab0-ac8d-aa50e23de978}"

    /**
     * @type {String}
     */
    static SemanticZoom_Control_GUID => "{5fd34a43-061e-42c8-b589-9dccf74bc43a}"

    /**
     * @type {String}
     */
    static AppBar_Control_GUID => "{6114908d-cc02-4d37-875b-b530c7139554}"

    /**
     * @type {String}
     */
    static Text_AnimationStyle_Attribute_GUID => "{628209f0-7c9a-4d57-be64-1f1836571ff5}"

    /**
     * @type {String}
     */
    static Text_BackgroundColor_Attribute_GUID => "{fdc49a07-583d-4f17-ad27-77fc832a3c0b}"

    /**
     * @type {String}
     */
    static Text_BulletStyle_Attribute_GUID => "{c1097c90-d5c4-4237-9781-3bec8ba54e48}"

    /**
     * @type {String}
     */
    static Text_CapStyle_Attribute_GUID => "{fb059c50-92cc-49a5-ba8f-0aa872bba2f3}"

    /**
     * @type {String}
     */
    static Text_Culture_Attribute_GUID => "{c2025af9-a42d-4ced-a1fb-c6746315222e}"

    /**
     * @type {String}
     */
    static Text_FontName_Attribute_GUID => "{64e63ba8-f2e5-476e-a477-1734feaaf726}"

    /**
     * @type {String}
     */
    static Text_FontSize_Attribute_GUID => "{dc5eeeff-0506-4673-93f2-377e4a8e01f1}"

    /**
     * @type {String}
     */
    static Text_FontWeight_Attribute_GUID => "{6fc02359-b316-4f5f-b401-f1ce55741853}"

    /**
     * @type {String}
     */
    static Text_ForegroundColor_Attribute_GUID => "{72d1c95d-5e60-471a-96b1-6c1b3b77a436}"

    /**
     * @type {String}
     */
    static Text_HorizontalTextAlignment_Attribute_GUID => "{04ea6161-fba3-477a-952a-bb326d026a5b}"

    /**
     * @type {String}
     */
    static Text_IndentationFirstLine_Attribute_GUID => "{206f9ad5-c1d3-424a-8182-6da9a7f3d632}"

    /**
     * @type {String}
     */
    static Text_IndentationLeading_Attribute_GUID => "{5cf66bac-2d45-4a4b-b6c9-f7221d2815b0}"

    /**
     * @type {String}
     */
    static Text_IndentationTrailing_Attribute_GUID => "{97ff6c0f-1ce4-408a-b67b-94d83eb69bf2}"

    /**
     * @type {String}
     */
    static Text_IsHidden_Attribute_GUID => "{360182fb-bdd7-47f6-ab69-19e33f8a3344}"

    /**
     * @type {String}
     */
    static Text_IsItalic_Attribute_GUID => "{fce12a56-1336-4a34-9663-1bab47239320}"

    /**
     * @type {String}
     */
    static Text_IsReadOnly_Attribute_GUID => "{a738156b-ca3e-495e-9514-833c440feb11}"

    /**
     * @type {String}
     */
    static Text_IsSubscript_Attribute_GUID => "{f0ead858-8f53-413c-873f-1a7d7f5e0de4}"

    /**
     * @type {String}
     */
    static Text_IsSuperscript_Attribute_GUID => "{da706ee4-b3aa-4645-a41f-cd25157dea76}"

    /**
     * @type {String}
     */
    static Text_MarginBottom_Attribute_GUID => "{7ee593c4-72b4-4cac-9271-3ed24b0e4d42}"

    /**
     * @type {String}
     */
    static Text_MarginLeading_Attribute_GUID => "{9e9242d0-5ed0-4900-8e8a-eecc03835afc}"

    /**
     * @type {String}
     */
    static Text_MarginTop_Attribute_GUID => "{683d936f-c9b9-4a9a-b3d9-d20d33311e2a}"

    /**
     * @type {String}
     */
    static Text_MarginTrailing_Attribute_GUID => "{af522f98-999d-40af-a5b2-0169d0342002}"

    /**
     * @type {String}
     */
    static Text_OutlineStyles_Attribute_GUID => "{5b675b27-db89-46fe-970c-614d523bb97d}"

    /**
     * @type {String}
     */
    static Text_OverlineColor_Attribute_GUID => "{83ab383a-fd43-40da-ab3e-ecf8165cbb6d}"

    /**
     * @type {String}
     */
    static Text_OverlineStyle_Attribute_GUID => "{0a234d66-617e-427f-871d-e1ff1e0c213f}"

    /**
     * @type {String}
     */
    static Text_StrikethroughColor_Attribute_GUID => "{bfe15a18-8c41-4c5a-9a0b-04af0e07f487}"

    /**
     * @type {String}
     */
    static Text_StrikethroughStyle_Attribute_GUID => "{72913ef1-da00-4f01-899c-ac5a8577a307}"

    /**
     * @type {String}
     */
    static Text_Tabs_Attribute_GUID => "{2e68d00b-92fe-42d8-899a-a784aa4454a1}"

    /**
     * @type {String}
     */
    static Text_TextFlowDirections_Attribute_GUID => "{8bdf8739-f420-423e-af77-20a5d973a907}"

    /**
     * @type {String}
     */
    static Text_UnderlineColor_Attribute_GUID => "{bfa12c73-fde2-4473-bf64-1036d6aa0f45}"

    /**
     * @type {String}
     */
    static Text_UnderlineStyle_Attribute_GUID => "{5f3b21c0-ede4-44bd-9c36-3853038cbfeb}"

    /**
     * @type {String}
     */
    static Text_AnnotationTypes_Attribute_GUID => "{ad2eb431-ee4e-4be1-a7ba-5559155a73ef}"

    /**
     * @type {String}
     */
    static Text_AnnotationObjects_Attribute_GUID => "{ff41cf68-e7ab-40b9-8c72-72a8ed94017d}"

    /**
     * @type {String}
     */
    static Text_StyleName_Attribute_GUID => "{22c9e091-4d66-45d8-a828-737bab4c98a7}"

    /**
     * @type {String}
     */
    static Text_StyleId_Attribute_GUID => "{14c300de-c32b-449b-ab7c-b0e0789aea5d}"

    /**
     * @type {String}
     */
    static Text_Link_Attribute_GUID => "{b38ef51d-9e8d-4e46-9144-56ebe177329b}"

    /**
     * @type {String}
     */
    static Text_IsActive_Attribute_GUID => "{f5a4e533-e1b8-436b-935d-b57aa3f558c4}"

    /**
     * @type {String}
     */
    static Text_SelectionActiveEnd_Attribute_GUID => "{1f668cc3-9bbf-416b-b0a2-f89f86f6612c}"

    /**
     * @type {String}
     */
    static Text_CaretPosition_Attribute_GUID => "{b227b131-9889-4752-a91b-733efdc5c5a0}"

    /**
     * @type {String}
     */
    static Text_CaretBidiMode_Attribute_GUID => "{929ee7a6-51d3-4715-96dc-b694fa24a168}"

    /**
     * @type {String}
     */
    static Text_BeforeParagraphSpacing_Attribute_GUID => "{be7b0ab1-c822-4a24-85e9-c8f2650fc79c}"

    /**
     * @type {String}
     */
    static Text_AfterParagraphSpacing_Attribute_GUID => "{588cbb38-e62f-497c-b5d1-ccdf0ee823d8}"

    /**
     * @type {String}
     */
    static Text_LineSpacing_Attribute_GUID => "{63ff70ae-d943-4b47-8ab7-a7a033d3214b}"

    /**
     * @type {String}
     */
    static Text_BeforeSpacing_Attribute_GUID => "{be7b0ab1-c822-4a24-85e9-c8f2650fc79c}"

    /**
     * @type {String}
     */
    static Text_AfterSpacing_Attribute_GUID => "{588cbb38-e62f-497c-b5d1-ccdf0ee823d8}"

    /**
     * @type {String}
     */
    static Text_SayAsInterpretAs_Attribute_GUID => "{b38ad6ac-eee1-4b6e-88cc-014cefa93fcb}"

    /**
     * @type {String}
     */
    static TextEdit_TextChanged_Event_GUID => "{120b0308-ec22-4eb8-9c98-9867cda1b165}"

    /**
     * @type {String}
     */
    static TextEdit_ConversionTargetChanged_Event_GUID => "{3388c183-ed4f-4c8b-9baa-364d51d8847f}"

    /**
     * @type {String}
     */
    static Changes_Event_GUID => "{7df26714-614f-4e05-9488-716c5ba19436}"

    /**
     * @type {String}
     */
    static Annotation_Custom_GUID => "{9ec82750-3931-4952-85bc-1dbff78a43e3}"

    /**
     * @type {String}
     */
    static Annotation_SpellingError_GUID => "{ae85567e-9ece-423f-81b7-96c43d53e50e}"

    /**
     * @type {String}
     */
    static Annotation_GrammarError_GUID => "{757a048d-4518-41c6-854c-dc009b7cfb53}"

    /**
     * @type {String}
     */
    static Annotation_Comment_GUID => "{fd2fda30-26b3-4c06-8bc7-98f1532e46fd}"

    /**
     * @type {String}
     */
    static Annotation_FormulaError_GUID => "{95611982-0cab-46d5-a2f0-e30d1905f8bf}"

    /**
     * @type {String}
     */
    static Annotation_TrackChanges_GUID => "{21e6e888-dc14-4016-ac27-190553c8c470}"

    /**
     * @type {String}
     */
    static Annotation_Header_GUID => "{867b409b-b216-4472-a219-525e310681f8}"

    /**
     * @type {String}
     */
    static Annotation_Footer_GUID => "{cceab046-1833-47aa-8080-701ed0b0c832}"

    /**
     * @type {String}
     */
    static Annotation_Highlighted_GUID => "{757c884e-8083-4081-8b9c-e87f5072f0e4}"

    /**
     * @type {String}
     */
    static Annotation_Endnote_GUID => "{7565725c-2d99-4839-960d-33d3b866aba5}"

    /**
     * @type {String}
     */
    static Annotation_Footnote_GUID => "{3de10e21-4125-42db-8620-be8083080624}"

    /**
     * @type {String}
     */
    static Annotation_InsertionChange_GUID => "{0dbeb3a6-df15-4164-a3c0-e21a8ce931c4}"

    /**
     * @type {String}
     */
    static Annotation_DeletionChange_GUID => "{be3d5b05-951d-42e7-901d-adc8c2cf34d0}"

    /**
     * @type {String}
     */
    static Annotation_MoveChange_GUID => "{9da587eb-23e5-4490-b385-1a22ddc8b187}"

    /**
     * @type {String}
     */
    static Annotation_FormatChange_GUID => "{eb247345-d4f1-41ce-8e52-f79b69635e48}"

    /**
     * @type {String}
     */
    static Annotation_UnsyncedChange_GUID => "{1851116a-0e47-4b30-8cb5-d7dae4fbcd1b}"

    /**
     * @type {String}
     */
    static Annotation_EditingLockedChange_GUID => "{c31f3e1c-7423-4dac-8348-41f099ff6f64}"

    /**
     * @type {String}
     */
    static Annotation_ExternalChange_GUID => "{75a05b31-5f11-42fd-887d-dfa010db2392}"

    /**
     * @type {String}
     */
    static Annotation_ConflictingChange_GUID => "{98af8802-517c-459f-af13-016d3fab877e}"

    /**
     * @type {String}
     */
    static Annotation_Author_GUID => "{f161d3a7-f81b-4128-b17f-71f690914520}"

    /**
     * @type {String}
     */
    static Annotation_AdvancedProofingIssue_GUID => "{dac7b72c-c0f2-4b84-b90d-5fafc0f0ef1c}"

    /**
     * @type {String}
     */
    static Annotation_DataValidationError_GUID => "{c8649fa8-9775-437e-ad46-e709d93c2343}"

    /**
     * @type {String}
     */
    static Annotation_CircularReferenceError_GUID => "{25bd9cf4-1745-4659-ba67-727f0318c616}"

    /**
     * @type {String}
     */
    static Annotation_Mathematics_GUID => "{eaab634b-26d0-40c1-8073-57ca1c633c9b}"

    /**
     * @type {String}
     */
    static Annotation_Sensitive_GUID => "{37f4c04f-0f12-4464-929c-828fd15292e3}"

    /**
     * @type {String}
     */
    static Changes_Summary_GUID => "{313d65a6-e60f-4d62-9861-55afd728d207}"

    /**
     * @type {String}
     */
    static StyleId_Custom_GUID => "{ef2edd3e-a999-4b7c-a378-09bbd52a3516}"

    /**
     * @type {String}
     */
    static StyleId_Heading1_GUID => "{7f7e8f69-6866-4621-930c-9a5d0ca5961c}"

    /**
     * @type {String}
     */
    static StyleId_Heading2_GUID => "{baa9b241-5c69-469d-85ad-474737b52b14}"

    /**
     * @type {String}
     */
    static StyleId_Heading3_GUID => "{bf8be9d2-d8b8-4ec5-8c52-9cfb0d035970}"

    /**
     * @type {String}
     */
    static StyleId_Heading4_GUID => "{8436ffc0-9578-45fc-83a4-ff40053315dd}"

    /**
     * @type {String}
     */
    static StyleId_Heading5_GUID => "{909f424d-0dbf-406e-97bb-4e773d9798f7}"

    /**
     * @type {String}
     */
    static StyleId_Heading6_GUID => "{89d23459-5d5b-4824-a420-11d3ed82e40f}"

    /**
     * @type {String}
     */
    static StyleId_Heading7_GUID => "{a3790473-e9ae-422d-b8e3-3b675c6181a4}"

    /**
     * @type {String}
     */
    static StyleId_Heading8_GUID => "{2bc14145-a40c-4881-84ae-f2235685380c}"

    /**
     * @type {String}
     */
    static StyleId_Heading9_GUID => "{c70d9133-bb2a-43d3-8ac6-33657884b0f0}"

    /**
     * @type {String}
     */
    static StyleId_Title_GUID => "{15d8201a-ffcf-481f-b0a1-30b63be98f07}"

    /**
     * @type {String}
     */
    static StyleId_Subtitle_GUID => "{b5d9fc17-5d6f-4420-b439-7cb19ad434e2}"

    /**
     * @type {String}
     */
    static StyleId_Normal_GUID => "{cd14d429-e45e-4475-a1c5-7f9e6be96eba}"

    /**
     * @type {String}
     */
    static StyleId_Emphasis_GUID => "{ca6e7dbe-355e-4820-95a0-925f041d3470}"

    /**
     * @type {String}
     */
    static StyleId_Quote_GUID => "{5d1c21ea-8195-4f6c-87ea-5dabece64c1d}"

    /**
     * @type {String}
     */
    static StyleId_BulletedList_GUID => "{5963ed64-6426-4632-8caf-a32ad402d91a}"

    /**
     * @type {String}
     */
    static StyleId_NumberedList_GUID => "{1e96dbd5-64c3-43d0-b1ee-b53b06e3eddf}"

    /**
     * @type {String}
     */
    static Notification_Event_GUID => "{72c5a2f7-9788-480f-b8eb-4dee00f6186f}"

    /**
     * @type {String}
     */
    static SID_IsUIAutomationObject => "{b96fdb85-7204-4724-842b-c7059dedb9d0}"

    /**
     * @type {String}
     */
    static SID_ControlElementProvider => "{f4791d68-e254-4ba3-9a53-26a5c5497946}"

    /**
     * @type {String}
     */
    static IsSelectionPattern2Available_Property_GUID => "{490806fb-6e89-4a47-8319-d266e511f021}"

    /**
     * @type {String}
     */
    static Selection2_FirstSelectedItem_Property_GUID => "{cc24ea67-369c-4e55-9ff7-38da69540c29}"

    /**
     * @type {String}
     */
    static Selection2_LastSelectedItem_Property_GUID => "{cf7bda90-2d83-49f8-860c-9ce394cf89b4}"

    /**
     * @type {String}
     */
    static Selection2_CurrentSelectedItem_Property_GUID => "{34257c26-83b5-41a6-939c-ae841c136236}"

    /**
     * @type {String}
     */
    static Selection2_ItemCount_Property_GUID => "{bb49eb9f-456d-4048-b591-9c2026b84636}"

    /**
     * @type {String}
     */
    static Selection_Pattern2_GUID => "{fba25cab-ab98-49f7-a7dc-fe539dc15be7}"

    /**
     * @type {String}
     */
    static HeadingLevel_Property_GUID => "{29084272-aaaf-4a30-8796-3c12f62b6bbb}"

    /**
     * @type {String}
     */
    static IsDialog_Property_GUID => "{9d0dfb9b-8436-4501-bbbb-e534a4fb3b3f}"

    /**
     * @type {Integer (UInt32)}
     */
    static UIA_IAFP_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static UIA_IAFP_UNWRAP_BRIDGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UIA_PFIA_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static UIA_PFIA_UNWRAP_BRIDGE => 1

    /**
     * @type {Integer (Double)}
     */
    static UIA_ScrollPatternNoScroll => -1
;@endregion Constants

;@region Methods
    /**
     * Returns a reference, similar to a handle, to the specified object. Servers return this reference when handling WM_GETOBJECT.
     * @remarks
     * Servers call this function only when handling the [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message. For an overview of how <b>LresultFromObject</b> is related to <b>WM_GETOBJECT</b>, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-wm-getobject-works">How WM_GETOBJECT Works</a>.
     * 
     * <b>LresultFromObject</b> increments the object's reference count. If you are not storing the interface pointer passed to the function (that is, you create a new interface pointer for the object each time [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) is received), call the object's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method to decrement the reference count back to one. Then the client calls <b>Release</b> and the object is destroyed. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-to-handle-wm-getobject">How to Handle WM_GETOBJECT</a>.
     * 
     * Each time a server processes [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) for a specific object, it calls <b>LresultFromObject</b> to obtain a new reference to the object. Servers do not save the reference returned from <b>LresultFromObject</b> from one instance of processing <b>WM_GETOBJECT</b> to use as the message's return value when processing subsequent <b>WM_GETOBJECT</b> messages for the same object. This causes the client to receive an error.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference identifier of the interface provided to the client. This parameter is IID_IAccessible.
     * @param {Pointer} wParam Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WPARAM</a></b>
     * 
     * Value sent by the associated [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message in its <i>wParam</i> parameter.
     * @param {Pointer<IUnknown>} punk Type: <b>LPUNKNOWN</b>
     * 
     * Address of the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface to the object that corresponds to the [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message.
     * @returns {Pointer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LRESULT</a></b>
     * 
     * If successful, returns a positive value that is a reference to the object.
     * 
     * If not successful, returns one of the values in the table that follows, or another standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/return-values">COM error code</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object specified in the <i>pAcc</i> parameter does not support the interface specified in the <i>riid</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to store the object reference.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-lresultfromobject
     * @since windows5.0
     */
    static LresultFromObject(riid, wParam, punk) {
        result := DllCall("OLEACC.dll\LresultFromObject", "ptr", riid, "ptr", wParam, "ptr", punk, "ptr")
        return result
    }

    /**
     * Retrieves a requested interface pointer for an accessible object based on a previously generated object reference.
     * @param {Pointer} lResult Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LRESULT</a></b>
     * 
     * A 32-bit value returned by a previous successful call to the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-lresultfromobject">LresultFromObject</a> function.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference identifier of the interface to be retrieved. This is IID_IAccessible.
     * @param {Pointer} wParam Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WPARAM</a></b>
     * 
     * Value sent by the associated [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message in its <i>wParam</i> parameter.
     * @param {Pointer<Void>} ppvObject Type: <b>void**</b>
     * 
     * Receives the address of the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface on the object that corresponds to the [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message.
     * @returns {Integer} Type: <b>STDAPI</b>
     * 
     * If successful, returns S_OK.
     * 
     * If not successful, returns one of the following standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/return-values">COM error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid. This occurs when the <i>lResult</i> parameter specified is not a value obtained by a call to <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-lresultfromobject">LresultFromObject</a>, or when <i>lResult</i> is a value used on a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-objectfromlresult">ObjectFromLresult</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object specified in the <i>ppvObject</i> parameter does not support the interface specified by the <i>riid</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to store the object reference.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-objectfromlresult
     * @since windows5.1.2600
     */
    static ObjectFromLresult(lResult, riid, wParam, ppvObject) {
        result := DllCall("OLEACC.dll\ObjectFromLresult", "ptr", lResult, "ptr", riid, "ptr", wParam, "ptr", ppvObject, "int")
        return result
    }

    /**
     * Retrieves the window handle that corresponds to a particular instance of an IAccessible interface.
     * @param {Pointer<IAccessible>} param0 
     * @param {Pointer<HWND>} phwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a>*</b>
     * 
     * Address of a variable that receives a handle to the window containing the object specified in <i>pacc</i>. If this value is <b>NULL</b> after the call, the object is not contained within a window; for example, the mouse pointer is not contained within a window.
     * @returns {Integer} Type: <b>STDAPI</b>
     * 
     * If successful, returns S_OK.
     * 
     * If not successful, returns the following or another standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/return-values">COM error code</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An argument is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-windowfromaccessibleobject
     * @since windows5.0
     */
    static WindowFromAccessibleObject(param0, phwnd) {
        result := DllCall("OLEACC.dll\WindowFromAccessibleObject", "ptr", param0, "ptr", phwnd, "int")
        return result
    }

    /**
     * Retrieves the address of the specified interface for the object associated with the specified window.
     * @remarks
     * Clients call this function to retrieve the address of an object's <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>, <a href="https://docs.microsoft.com/windows/desktop/WinAuto/idispatch-interface">IDispatch</a>, <a href="https://docs.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a>, <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>, or other supported interface pointer.
     * 
     * As with other <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> methods and functions, clients might receive errors for <b>IAccessible</b> interface pointers because of a user action. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/receiving-errors-for-iaccessible-interface-pointers">Receiving Errors for IAccessible Interface Pointers</a>.
     * 
     * Clients use this function to obtain access to the Microsoft Office 2000 native object model. The native object model provides clients with accessibility information about an Office application's document or client area that is not exposed by Microsoft Active Accessibility.
     * 
     * To obtain an <a href="https://docs.microsoft.com/windows/desktop/WinAuto/idispatch-interface">IDispatch</a> interface pointer to a class supported by the native object model, specify <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_NATIVEOM</a> in <i>dwObjectID</i>. When using this object identifier, the <i>hwnd</i> parameter must match the following window class types.
     * 
     * <table>
     * <tr>
     * <th>Office application</th>
     * <th>Window class</th>
     * <th>IDispatch pointer to</th>
     * </tr>
     * <tr>
     * <td>Word</td>
     * <td>_WwG</td>
     * <td>Window</td>
     * </tr>
     * <tr>
     * <td>Excel</td>
     * <td>EXCEL7</td>
     * <td>Window</td>
     * </tr>
     * <tr>
     * <td>PowerPoint</td>
     * <td>paneClassDC</td>
     * <td>DocumentWindow</td>
     * </tr>
     * <tr>
     * <td>Command Bars</td>
     * <td>MsoCommandBar</td>
     * <td>CommandBar</td>
     * </tr>
     * </table>
     *  
     * 
     * Note that the above window classes correspond to the innermost document window or pane window. For more information about the Office object model, see the <a href="https://docs.microsoft.com/previous-versions/office/developer/office2000/aa141393(v=office.10)">Microsoft Office 2000/Visual Basic Programmer's Guide</a>.
     * @param {Pointer<HWND>} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Specifies the handle of a window for which an object is to be retrieved. To retrieve an interface pointer to the cursor or caret object, specify <b>NULL</b> and use the appropriate object ID in <i>dwObjectID</i>.
     * @param {Integer} dwId Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the object ID. This value is one of the standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">object identifier</a> constants or a custom object ID such as <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_NATIVEOM</a>, which is the object ID for the Office native object model. For more information about <b>OBJID_NATIVEOM</b>, see the Remarks section in this topic.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Specifies the reference identifier of the requested interface. This value is either IID_IAccessible or IID_IDispatch, but it can also be IID_IUnknown, or the IID of any interface that the object is expected to support.
     * @param {Pointer<Void>} ppvObject Type: <b>void**</b>
     * 
     * Address of a pointer variable that receives the address of the specified interface.
     * @returns {Integer} Type: <b>STDAPI</b>
     * 
     * If successful, returns S_OK.
     * 
     * If not successful, returns one of the following or another standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/return-values">COM error code</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An argument is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested interface is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-accessibleobjectfromwindow
     * @since windows5.0
     */
    static AccessibleObjectFromWindow(hwnd, dwId, riid, ppvObject) {
        result := DllCall("OLEACC.dll\AccessibleObjectFromWindow", "ptr", hwnd, "uint", dwId, "ptr", riid, "ptr", ppvObject, "int")
        return result
    }

    /**
     * Retrieves the address of the IAccessible interface for the object that generated the event that is currently being processed by the client's event hook function.
     * @remarks
     * Clients call this function within an event hook function to obtain an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface pointer to either the object that generated the event or to the parent of the element that generated the event. The parameters sent to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-wineventproc">WinEventProc</a> callback function must be used for this function's <i>hwnd</i>, <i>dwObjectID</i>, and <i>dwChildID</i> parameters.
     * 
     * This function retrieves the lowest-level accessible object in the object hierarchy that is associated with an event. If the element that generated the event is not an accessible object (that is, does not support <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>), then the function retrieves the <b>IAccessible</b> interface of the parent object. The parent object must provide information about the child element through the <b>IAccessible</b> interface.
     * 
     * As with other <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> methods and functions, clients might receive errors for <b>IAccessible</b> interface pointers because of a user action. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/receiving-errors-for-iaccessible-interface-pointers">Receiving Errors for IAccessible Interface Pointers</a>.
     * 
     * This function fails if called in response to <a href="https://docs.microsoft.com/windows/desktop/WinAuto/event-constants">EVENT_OBJECT_CREATE</a> because the object is not fully initialized. Similarly, clients should not call this in response to <a href="https://docs.microsoft.com/windows/desktop/WinAuto/event-constants">EVENT_OBJECT_DESTROY</a> because the object is no longer available and cannot respond. Clients watch for <a href="https://docs.microsoft.com/windows/desktop/WinAuto/event-constants">EVENT_OBJECT_SHOW</a> and <a href="https://docs.microsoft.com/windows/desktop/WinAuto/event-constants">EVENT_OBJECT_HIDE</a> events rather than for <b>EVENT_OBJECT_CREATE</b> and <b>EVENT_OBJECT_DESTROY</b>.
     * @param {Pointer<HWND>} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Specifies the window handle of the window that generated the event. This value must be the window handle that is sent to the event hook function.
     * @param {Integer} dwId Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the object ID of the object that generated the event. This value must be the object ID that is sent to the event hook function.
     * @param {Integer} dwChildId Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies whether the event was triggered by an object or one of its child elements. If the object triggered the event, <i>dwChildID</i> is CHILDID_SELF. If a child element triggered the event, <i>dwChildID</i> is the element's child ID. This value must be the child ID that is sent to the event hook function.
     * @param {Pointer<IAccessible>} ppacc Type: <b>IAccessible**</b>
     * 
     * Address of a pointer variable that receives the address of an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface. The interface is either for the object that generated the event, or for the parent of the element that generated the event.
     * @param {Pointer<VARIANT>} pvarChild Type: <b>VARIANT*</b>
     * 
     * Address of a <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT structure</a> that specifies the child ID that can be used to access information about the UI element.
     * @returns {Integer} Type: <b>STDAPI</b>
     * 
     * If successful, returns S_OK.
     * 
     * If not successful, returns one of the following or another standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/return-values">COM error code</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An argument is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-accessibleobjectfromevent
     * @since windows5.0
     */
    static AccessibleObjectFromEvent(hwnd, dwId, dwChildId, ppacc, pvarChild) {
        result := DllCall("OLEACC.dll\AccessibleObjectFromEvent", "ptr", hwnd, "uint", dwId, "uint", dwChildId, "ptr", ppacc, "ptr", pvarChild, "int")
        return result
    }

    /**
     * Retrieves the address of the IAccessible interface pointer for the object displayed at a specified point on the screen.
     * @remarks
     * This function retrieves the lowest-level accessible object in the object hierarchy at a given point. If the element at the point is not an accessible object (that is, does not support <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>), then the function retrieves the <b>IAccessible</b> interface of the parent object. The parent object must provide information about the child element through the <b>IAccessible</b> interface. Call <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-iaccessible-acchittest">IAccessible::accHitTest</a> to identify the child element at the specified screen coordinates.
     * 
     * As with other <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> methods and functions, clients might receive errors for <b>IAccessible</b> interface pointers because of a user action. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/receiving-errors-for-iaccessible-interface-pointers">Receiving Errors for IAccessible Interface Pointers</a>.
     * 
     * <h3><a id="Client_Example"></a><a id="client_example"></a><a id="CLIENT_EXAMPLE"></a>Client Example</h3>
     * The following example function selects the item at a specified point on the screen. It is assumed that a single selection is wanted.
     * 
     * 
     * ```cpp
     * 
     * HRESULT SelectItemAtPoint(POINT point)
     * {
     *     VARIANT varItem;
     *     IAccessible* pAcc;
     *     HRESULT hr = AccessibleObjectFromPoint(point, &pAcc, &varItem);
     *     if ((hr == S_OK))
     *     {
     *         hr = pAcc->accSelect((SELFLAG_TAKEFOCUS | SELFLAG_TAKESELECTION), varItem);
     *         VariantClear(&varItem);
     *         pAcc->Release();
     *     }
     *     return hr;
     * }
     * 
     * ```
     * @param {Pointer} ptScreen Specifies, in physical screen coordinates, the point that is examined.
     * @param {Pointer<IAccessible>} ppacc Address of a pointer variable that receives the address of the object's <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface.
     * @param {Pointer<VARIANT>} pvarChild Address of a <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a> structure that specifies whether the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface pointer that is returned in <i>ppacc</i> belongs to the object displayed at the specified point, or to the parent of the element at the specified point. The <b>vt</b> member of the <b>VARIANT</b> is always VT_I4. If the <b>lVal</b> member is CHILDID_SELF, then the <b>IAccessible</b> interface pointer at <i>ppacc</i> belongs to the object at the point. If the <b>lVal</b> member is not CHILDID_SELF, <i>ppacc</i> is the address of the <b>IAccessible</b> interface of the child element's parent object. Clients must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a> on the retrieved <b>VARIANT</b> parameter when finished using it.
     * @returns {Integer} If successful, returns S_OK.
     * 
     * If not successful, returns one of the following or another standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/return-values">COM error code</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An argument is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-accessibleobjectfrompoint
     * @since windows5.0
     */
    static AccessibleObjectFromPoint(ptScreen, ppacc, pvarChild) {
        result := DllCall("OLEACC.dll\AccessibleObjectFromPoint", "ptr", ptScreen, "ptr", ppacc, "ptr", pvarChild, "int")
        return result
    }

    /**
     * Retrieves the child ID or IDispatch of each child within an accessible container object.
     * @remarks
     * To retrieve information about all of the children in a container, the <i>iChildStart</i> parameter  must be zero (0), and <i>cChildren</i> must be the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-iaccessible-get_accchildcount">IAccessible::get_accChildCount</a>.
     * 
     * When calling this function to obtain information about the children of a user interface element, it is recommended that clients obtain information about all of the children. For example, <i>iChildStart</i> must be zero (0), and <i>cChildren</i> must be the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-iaccessible-get_accchildcount">IAccessible::get_accChildCount</a>.
     * 
     * If a child ID is returned for an element, then the container must provide information about the child element. To obtain information about the element, clients use the container's  <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface pointer and specify the obtained child ID in calls to the <b>IAccessible</b> properties.
     * 
     * Clients must call the <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method for any <a href="https://docs.microsoft.com/windows/desktop/WinAuto/idispatch-interface">IDispatch</a> interfaces retrieved by this function, and free the array when it is no longer required.
     * @param {Pointer<IAccessible>} paccContainer Type: <b>IAccessible*</b>
     * 
     * Pointer to the container object's <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface.
     * @param {Integer} iChildStart Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Specifies the zero-based index of the first child that is retrieved. This parameter is an index, not a child ID, and it is usually is set to zero (0).
     * @param {Integer} cChildren Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Specifies the number of children to retrieve. To retrieve the current number of children, an application calls <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-iaccessible-get_accchildcount">IAccessible::get_accChildCount</a>.
     * @param {Pointer<VARIANT>} rgvarChildren Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a> structures that receives information about the container's children. If the <b>vt</b> member of an array element is VT_I4, then the <b>lVal</b> member for that element is the child ID. If the <b>vt</b> member of an array element is VT_DISPATCH, then the <b>pdispVal</b> member for that element is the address of the child object's <a href="https://docs.microsoft.com/windows/desktop/WinAuto/idispatch-interface">IDispatch</a> interface.
     * @param {Pointer<Int32>} pcObtained Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * Address of a variable that receives the number of elements in the <i>rgvarChildren</i> array that is populated by the <b>AccessibleChildren</b> function. This value is the same as that of the <i>cChildren</i> parameter; however, if you request more children than exist, this value will be less than that of <i>cChildren</i>.
     * @returns {Integer} Type: <b>STDAPI</b>
     * 
     * If successful, returns S_OK.
     * 
     * If not successful, returns one of the following or another standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/return-values">COM error code</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An argument is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded, but there are fewer elements in the <i>rgvarChildren</i> array than there are children requested in <i>cChildren</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-accessiblechildren
     * @since windows5.0
     */
    static AccessibleChildren(paccContainer, iChildStart, cChildren, rgvarChildren, pcObtained) {
        result := DllCall("OLEACC.dll\AccessibleChildren", "ptr", paccContainer, "int", iChildStart, "int", cChildren, "ptr", rgvarChildren, "ptr", pcObtained, "int")
        return result
    }

    /**
     * Retrieves the localized string that describes the object's role for the specified role value. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The oleacc.h header defines GetRoleText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} lRole Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-roles">object role</a> constants.
     * @param {Pointer<PSTR>} lpszRole Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Address of a buffer that receives the role text string. If this parameter is <b>NULL</b>, the function returns the role string's length, not including the null character.
     * @param {Integer} cchRoleMax Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size of the buffer that is pointed to by the <i>lpszRole</i> parameter. For ANSI strings, this value is measured in bytes; for Unicode strings, it is measured in characters.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-getroletexta
     * @since windows5.0
     */
    static GetRoleTextA(lRole, lpszRole, cchRoleMax) {
        lpszRole := lpszRole is String? StrPtr(lpszRole) : lpszRole

        A_LastError := 0

        DllCall("OLEACC.dll\GetRoleTextA", "uint", lRole, "ptr", lpszRole, "uint", cchRoleMax)
        if(A_LastError)
            throw OSError()

    }

    /**
     * Retrieves the localized string that describes the object's role for the specified role value. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The oleacc.h header defines GetRoleText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} lRole Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-roles">object role</a> constants.
     * @param {Pointer<PWSTR>} lpszRole Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Address of a buffer that receives the role text string. If this parameter is <b>NULL</b>, the function returns the role string's length, not including the null character.
     * @param {Integer} cchRoleMax Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size of the buffer that is pointed to by the <i>lpszRole</i> parameter. For ANSI strings, this value is measured in bytes; for Unicode strings, it is measured in characters.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-getroletextw
     * @since windows5.0
     */
    static GetRoleTextW(lRole, lpszRole, cchRoleMax) {
        lpszRole := lpszRole is String? StrPtr(lpszRole) : lpszRole

        A_LastError := 0

        DllCall("OLEACC.dll\GetRoleTextW", "uint", lRole, "ptr", lpszRole, "uint", cchRoleMax)
        if(A_LastError)
            throw OSError()

    }

    /**
     * Retrieves a localized string that describes an object's state for a single predefined state bit flag. Because state values are a combination of one or more bit flags, clients call this function more than once to retrieve all state strings. (ANSI)
     * @remarks
     * This function accepts only one state bit at a time, not a bitmask.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The oleacc.h header defines GetStateText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} lStateBit Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-state-constants">object state constants</a>.
     * @param {Pointer<PSTR>} lpszState Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Address of a buffer that receives the state text string. If this parameter is <b>NULL</b>, the function returns the state string's length, not including the null character.
     * @param {Integer} cchState Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size of the buffer that is pointed to by the <i>lpszStateBit</i> parameter. For ANSI strings, this value is measured in bytes; for Unicode strings, it is measured in characters.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-getstatetexta
     * @since windows5.0
     */
    static GetStateTextA(lStateBit, lpszState, cchState) {
        lpszState := lpszState is String? StrPtr(lpszState) : lpszState

        A_LastError := 0

        DllCall("OLEACC.dll\GetStateTextA", "uint", lStateBit, "ptr", lpszState, "uint", cchState)
        if(A_LastError)
            throw OSError()

    }

    /**
     * Retrieves a localized string that describes an object's state for a single predefined state bit flag. Because state values are a combination of one or more bit flags, clients call this function more than once to retrieve all state strings. (Unicode)
     * @remarks
     * This function accepts only one state bit at a time, not a bitmask.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The oleacc.h header defines GetStateText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} lStateBit Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-state-constants">object state constants</a>.
     * @param {Pointer<PWSTR>} lpszState Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Address of a buffer that receives the state text string. If this parameter is <b>NULL</b>, the function returns the state string's length, not including the null character.
     * @param {Integer} cchState Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size of the buffer that is pointed to by the <i>lpszStateBit</i> parameter. For ANSI strings, this value is measured in bytes; for Unicode strings, it is measured in characters.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-getstatetextw
     * @since windows5.0
     */
    static GetStateTextW(lStateBit, lpszState, cchState) {
        lpszState := lpszState is String? StrPtr(lpszState) : lpszState

        A_LastError := 0

        DllCall("OLEACC.dll\GetStateTextW", "uint", lStateBit, "ptr", lpszState, "uint", cchState)
        if(A_LastError)
            throw OSError()

    }

    /**
     * Retrieves the version number and build number of the Microsoft Active Accessibility file Oleacc.dll.
     * @remarks
     * This function provides an easy way to get the version and build numbers for Oleacc.dll. The <a href="https://docs.microsoft.com/windows/win32/api/winver/nf-winver-getfileversioninfosizea">GetFileVersionInfoSize</a>, <a href="https://docs.microsoft.com/windows/win32/api/winver/nf-winver-getfileversioninfoa">GetFileVersionInfo</a>, and <a href="https://docs.microsoft.com/windows/win32/api/winver/nf-winver-verqueryvaluea">VerQueryValue</a> functions can be used to retrieve the same information.
     * @param {Pointer<UInt32>} pVer Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Address of a <b>DWORD</b> that receives the version number. The major version number is placed in the high word, and the minor version number is placed in the low word.
     * @param {Pointer<UInt32>} pBuild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Address of a <b>DWORD</b> that receives the build number. The major build number is placed in the high word, and the minor build number is placed in the low word.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-getoleaccversioninfo
     * @since windows5.0
     */
    static GetOleaccVersionInfo(pVer, pBuild) {
        DllCall("OLEACC.dll\GetOleaccVersionInfo", "ptr", pVer, "ptr", pBuild)
    }

    /**
     * Creates an accessible object with the methods and properties of the specified type of system-provided user interface element.
     * @remarks
     * Server applications call this function when they contain a custom UI object that is similar to a system-provided object. Server developers can call <b>CreateStdAccessibleObject</b> to override the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> methods and properties as required to match their custom objects. Alternatively, server developers can use Dynamic Annotation to override specific properties without having to use difficult subclassing techniques that <b>CreateStdAccessibleObject</b> requires. Server developers should still use <b>CreateStdAccessibleObject</b> for structural changes, such as hiding a child element or creating a placeholder child element. This approach saves server developers the work of fully implementing all of the <b>IAccessible</b> properties and methods.
     * 
     * This function is similar to <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-createstdaccessibleproxya">CreateStdAccessibleProxy</a>, except that <b>CreateStdAccessibleProxy</b> allows you to specify the class name as a parameter whereas <b>CreateStdAccessibleObject</b> uses the class name associated with the <i>hwnd</i> parameter.
     * @param {Pointer<HWND>} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Window handle of the system-provided user interface element (a control) for which an accessible object is created.
     * @param {Integer} idObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Object ID. This value is usually <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_CLIENT</a>, but it may be another object identifier.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference identifier of the requested interface. This value is one of the following: IID_IAccessible, IID_IDispatch, IID_IEnumVARIANT, or IID_IUnknown.
     * @param {Pointer<Void>} ppvObject Type: <b>void**</b>
     * 
     * Address of a pointer variable that receives the address of the specified interface.
     * @returns {Integer} Type: <b>STDAPI</b>
     * 
     * If successful, returns S_OK.
     * 
     * If not successful, returns a standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/return-values">COM error code</a>.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-createstdaccessibleobject
     * @since windows5.0
     */
    static CreateStdAccessibleObject(hwnd, idObject, riid, ppvObject) {
        result := DllCall("OLEACC.dll\CreateStdAccessibleObject", "ptr", hwnd, "int", idObject, "ptr", riid, "ptr", ppvObject, "int")
        return result
    }

    /**
     * Creates an accessible object that has the properties and methods of the specified class of system-provided user interface element. (ANSI)
     * @remarks
     * Server applications call this function when they contain a custom control that is similar to a system-provided control. Server applications can call <b>CreateStdAccessibleProxy</b> to override the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> methods and properties as required to match their custom controls. Alternatively, server developers can use Dynamic Annotation to override specific properties without having to use difficult subclassing techniques that were required with <b>CreateStdAccessibleProxy</b>. Server developers should still use <b>CreateStdAccessibleProxy</b> for structural changes, such as hiding a child element or creating a placeholder child element. This approach saves server developers the work of fully implementing all of the <b>IAccessible</b> properties and methods.
     * 
     * This function is similar to <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-createstdaccessibleobject">CreateStdAccessibleObject</a>, except that <b>CreateStdAccessibleObject</b> always uses the class name associated with the <i>hwnd</i> whereas <b>CreateStdAccessibleProxy</b> allows you to specify the class name as a parameter.
     * 
     * Use <b>CreateStdAccessibleProxy</b> to create an accessible object for a user interface element that is superclassed. When a user interface element is superclassed, an application creates a custom control with a window class name different from the predefined control on which it is based. Because the class name associated with the <i>hwnd</i> parameter is the superclass window class name, specify the base class name (the system class name on which the superclassed control is based) in <i>pszClassName</i>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The oleacc.h header defines CreateStdAccessibleProxy as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HWND>} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Window handle of the system-provided user interface element (a control) for which an accessible object is created.
     * @param {Pointer<PSTR>} pClassName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * Pointer to a null-terminated string of the class name of a system-provided user interface element for which an accessible object is created. The window class name is one of the common controls (defined in Comctl32.dll), predefined controls (defined in User32.dll), or window elements.
     * @param {Integer} idObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Object ID. This value is usually <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_CLIENT</a>, which is one of the object identifier constants, but it may be another object identifier.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference identifier of the interface requested. This value is one of the following: IID_IAccessible, IID_IDispatch, IID_IEnumVARIANT, or IID_IUnknown.
     * @param {Pointer<Void>} ppvObject Type: <b>void**</b>
     * 
     * Address of a pointer variable that receives the address of the specified interface.
     * @returns {Integer} Type: <b>STDAPI</b>
     * 
     * If successful, returns S_OK.
     * 
     * If not successful, returns a standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/return-values">COM error code</a>.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-createstdaccessibleproxya
     * @since windows5.0
     */
    static CreateStdAccessibleProxyA(hwnd, pClassName, idObject, riid, ppvObject) {
        pClassName := pClassName is String? StrPtr(pClassName) : pClassName

        result := DllCall("OLEACC.dll\CreateStdAccessibleProxyA", "ptr", hwnd, "ptr", pClassName, "int", idObject, "ptr", riid, "ptr", ppvObject, "int")
        return result
    }

    /**
     * Creates an accessible object that has the properties and methods of the specified class of system-provided user interface element. (Unicode)
     * @remarks
     * Server applications call this function when they contain a custom control that is similar to a system-provided control. Server applications can call <b>CreateStdAccessibleProxy</b> to override the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> methods and properties as required to match their custom controls. Alternatively, server developers can use Dynamic Annotation to override specific properties without having to use difficult subclassing techniques that were required with <b>CreateStdAccessibleProxy</b>. Server developers should still use <b>CreateStdAccessibleProxy</b> for structural changes, such as hiding a child element or creating a placeholder child element. This approach saves server developers the work of fully implementing all of the <b>IAccessible</b> properties and methods.
     * 
     * This function is similar to <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-createstdaccessibleobject">CreateStdAccessibleObject</a>, except that <b>CreateStdAccessibleObject</b> always uses the class name associated with the <i>hwnd</i> whereas <b>CreateStdAccessibleProxy</b> allows you to specify the class name as a parameter.
     * 
     * Use <b>CreateStdAccessibleProxy</b> to create an accessible object for a user interface element that is superclassed. When a user interface element is superclassed, an application creates a custom control with a window class name different from the predefined control on which it is based. Because the class name associated with the <i>hwnd</i> parameter is the superclass window class name, specify the base class name (the system class name on which the superclassed control is based) in <i>pszClassName</i>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The oleacc.h header defines CreateStdAccessibleProxy as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HWND>} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Window handle of the system-provided user interface element (a control) for which an accessible object is created.
     * @param {Pointer<PWSTR>} pClassName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * Pointer to a null-terminated string of the class name of a system-provided user interface element for which an accessible object is created. The window class name is one of the common controls (defined in Comctl32.dll), predefined controls (defined in User32.dll), or window elements.
     * @param {Integer} idObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Object ID. This value is usually <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_CLIENT</a>, which is one of the object identifier constants, but it may be another object identifier.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference identifier of the interface requested. This value is one of the following: IID_IAccessible, IID_IDispatch, IID_IEnumVARIANT, or IID_IUnknown.
     * @param {Pointer<Void>} ppvObject Type: <b>void**</b>
     * 
     * Address of a pointer variable that receives the address of the specified interface.
     * @returns {Integer} Type: <b>STDAPI</b>
     * 
     * If successful, returns S_OK.
     * 
     * If not successful, returns a standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/return-values">COM error code</a>.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-createstdaccessibleproxyw
     * @since windows5.0
     */
    static CreateStdAccessibleProxyW(hwnd, pClassName, idObject, riid, ppvObject) {
        pClassName := pClassName is String? StrPtr(pClassName) : pClassName

        result := DllCall("OLEACC.dll\CreateStdAccessibleProxyW", "ptr", hwnd, "ptr", pClassName, "int", idObject, "ptr", riid, "ptr", ppvObject, "int")
        return result
    }

    /**
     * Sets system values that indicate whether an assistive technology (AT) application's current state affects functionality that is typically provided by the system.
     * @remarks
     * Before it exits, an AT application should reset any system values that it previously set. 
     * 
     * This function requires the calling process to have UIAccess or higher privileges.  If the caller does not have the required privileges, the call to <b>AccSetRunningUtilityState</b> fails and returns <b>E_ACCESSDENIED</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-securityoverview">Security Considerations for Assistive Technologies</a> and <a href="https://docs.microsoft.com/cpp/build/reference/manifestuac-embeds-uac-information-in-manifest">/MANIFESTUAC (Embeds UAC information in manifest)</a>.
     * @param {Pointer<HWND>} hwndApp Type: <b>HWND</b>
     * 
     * The handle of the AT application window. This parameter must not be <b>NULL</b>.
     * @param {Integer} dwUtilityStateMask Type: <b>DWORD</b>
     * 
     * 
     * A
     * @param {Integer} dwUtilityState Type: <b>DWORD</b>
     * @returns {Integer} Type: <b>STDAPI</b>
     * 
     * If successful, returns S_OK.
     * 
     * If not successful, returns a standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/return-values">COM error code</a>.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-accsetrunningutilitystate
     * @since windows8.0
     */
    static AccSetRunningUtilityState(hwndApp, dwUtilityStateMask, dwUtilityState) {
        result := DllCall("OLEACC.dll\AccSetRunningUtilityState", "ptr", hwndApp, "uint", dwUtilityStateMask, "uint", dwUtilityState, "int")
        return result
    }

    /**
     * Allows an assistive technology (AT) application to notify the system that it is interacting with UI through a Windows Automation API (such as Microsoft UI Automation) as a result of a touch gesture from the user.
     * @remarks
     * This function requires the calling process to have UIAccess or higher privileges.  If the caller does not have the required privileges, the call to <b>AccNotifyTouchInteraction</b> fails and returns <b>E_ACCESSDENIED</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-securityoverview">Security Considerations for Assistive Technologies</a> and <a href="https://docs.microsoft.com/cpp/build/reference/manifestuac-embeds-uac-information-in-manifest">/MANIFESTUAC (Embeds UAC information in manifest)</a>.
     * 
     * When an AT is consuming touch data (such as when using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerpointerinputtarget">RegisterPointerInputTarget</a> function), the shell and applications that the AT interacts with through the Windows Automation API are not aware that the user is interacting through touch. For the system to expose touch-related functionality to the user, the AT must use <b>AccNotifyTouchInteraction</b> to notify the system that it is performing the interaction in response to user touch input.
     * @param {Pointer<HWND>} hwndApp A window that belongs to the AT process that is calling <b>AccNotifyTouchInteraction</b>.
     * @param {Pointer<HWND>} hwndTarget The nearest window of the automation element that the AT is targeting.
     * @param {Pointer} ptTarget The center point of the automation element (or a point in the bounding rectangle of the element).
     * @returns {Integer} If successful, returns S_OK.
     * 
     * If not successful, returns a standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/return-values">COM error code</a>.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-accnotifytouchinteraction
     * @since windows8.0
     */
    static AccNotifyTouchInteraction(hwndApp, hwndTarget, ptTarget) {
        result := DllCall("OLEACC.dll\AccNotifyTouchInteraction", "ptr", hwndApp, "ptr", hwndTarget, "ptr", ptTarget, "int")
        return result
    }

    /**
     * Gets an error string so that it can be passed to the client. This method is not used directly by clients.
     * @param {Pointer<BSTR>} pDescription Type: <b>BSTR*</b>
     * 
     * The address of a variable that receives the description of the error. This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if an error description can be reported; otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiageterrordescription
     * @since windows5.1.2600
     */
    static UiaGetErrorDescription(pDescription) {
        result := DllCall("UIAutomationCore.dll\UiaGetErrorDescription", "ptr", pDescription, "int")
        return result
    }

    /**
     * Gets an HUIANODE from a VARIANT type.
     * @param {Pointer<VARIANT>} pvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>*</b>
     * 
     * The node.
     * @param {Pointer<HUIANODE>} phnode Type: <b>HUIANODE*</b>
     * 
     * The address of a variable that receives the HUIANODE.
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiahuianodefromvariant
     * @since windows5.1.2600
     */
    static UiaHUiaNodeFromVariant(pvar, phnode) {
        result := DllCall("UIAutomationCore.dll\UiaHUiaNodeFromVariant", "ptr", pvar, "ptr", phnode, "int")
        return result
    }

    /**
     * Gets a control pattern object from a VARIANT type.
     * @param {Pointer<VARIANT>} pvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>*</b>
     * 
     * The pattern.
     * @param {Pointer<HUIAPATTERNOBJECT>} phobj Type: <b>HUIAPATTERNOBJECT *</b>
     * 
     * The address of a variable that receives the control pattern object.
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiahpatternobjectfromvariant
     * @since windows5.1.2600
     */
    static UiaHPatternObjectFromVariant(pvar, phobj) {
        result := DllCall("UIAutomationCore.dll\UiaHPatternObjectFromVariant", "ptr", pvar, "ptr", phobj, "int")
        return result
    }

    /**
     * Gets a text range from a VARIANT type.
     * @param {Pointer<VARIANT>} pvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>*</b>
     * 
     * The text range.
     * @param {Pointer<HUIATEXTRANGE>} phtextrange Type: <b>HUIATEXTRANGE*</b>
     * 
     * The address of a variable that receives the text range.
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiahtextrangefromvariant
     * @since windows5.1.2600
     */
    static UiaHTextRangeFromVariant(pvar, phtextrange) {
        result := DllCall("UIAutomationCore.dll\UiaHTextRangeFromVariant", "ptr", pvar, "ptr", phtextrange, "int")
        return result
    }

    /**
     * Deletes a node from memory.
     * @param {Pointer<HUIANODE>} hnode Type: <b>HUIANODE</b>
     * 
     * The node to be deleted.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the node was successfully deleted; otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uianoderelease
     * @since windows5.1.2600
     */
    static UiaNodeRelease(hnode) {
        result := DllCall("UIAutomationCore.dll\UiaNodeRelease", "ptr", hnode, "int")
        return result
    }

    /**
     * Retrieves the value of a UI Automation property.
     * @param {Pointer<HUIANODE>} hnode Type: <b>HUIANODE</b>
     * 
     * The element that the property is being requested from.
     * @param {Integer} propertyId Type: <b>PROPERTYID</b>
     * 
     * The property identifier. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {Pointer<VARIANT>} pValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>*</b>
     * 
     * Receives the value of the specified property, or the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiagetreservednotsupportedvalue">UiaGetReservedNotSupportedValue</a> if the property is not supported.
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiagetpropertyvalue
     * @since windows5.1.2600
     */
    static UiaGetPropertyValue(hnode, propertyId, pValue) {
        result := DllCall("UIAutomationCore.dll\UiaGetPropertyValue", "ptr", hnode, "int", propertyId, "ptr", pValue, "int")
        return result
    }

    /**
     * Retrieves a control pattern.
     * @param {Pointer<HUIANODE>} hnode Type: <b>HUIANODE</b>
     * 
     * The element that implements the pattern.
     * @param {Integer} patternId Type: <b>PATTERNID</b>
     * 
     * The identifier of the control pattern being requested. For a list of control pattern IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-controlpattern-ids">Control Pattern Identifiers</a>.
     * @param {Pointer<HUIAPATTERNOBJECT>} phobj Type: <b>HPATTERNOBJECT*</b>
     * 
     * The address of a variable that receives a handle to the control pattern.
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiagetpatternprovider
     * @since windows5.1.2600
     */
    static UiaGetPatternProvider(hnode, patternId, phobj) {
        result := DllCall("UIAutomationCore.dll\UiaGetPatternProvider", "ptr", hnode, "int", patternId, "ptr", phobj, "int")
        return result
    }

    /**
     * Retrieves the runtime identifier of a UI Automation node.
     * @remarks
     * The runtime identifier should be treated as an opaque value and used only for comparison.
     * @param {Pointer<HUIANODE>} hnode Type: <b>HUIANODE</b>
     * 
     * The node for which the identifier is being requested.
     * @param {Pointer<SAFEARRAY>} pruntimeId Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * The address of a variable that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains the runtime identifier of the type VT_I4. This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiagetruntimeid
     * @since windows5.1.2600
     */
    static UiaGetRuntimeId(hnode, pruntimeId) {
        result := DllCall("UIAutomationCore.dll\UiaGetRuntimeId", "ptr", hnode, "ptr", pruntimeId, "int")
        return result
    }

    /**
     * Sets the input focus to the specified element in the UI.
     * @param {Pointer<HUIANODE>} hnode Type: <b>HUIANODE</b>
     * 
     * The element that receives focus.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiasetfocus
     * @since windows5.1.2600
     */
    static UiaSetFocus(hnode) {
        result := DllCall("UIAutomationCore.dll\UiaSetFocus", "ptr", hnode, "int")
        return result
    }

    /**
     * Navigates in the UI Automation tree, optionally retrieving cached information.
     * @remarks
     * The tree structure is described by a string where every character is either "p" or ")". 
     * 			The first character in the string always represents the root node. 
     * The string is <b>NULL</b> if no elements are returned by the function.
     * 			
     * 
     * A "p" represents a node 
     * 			(UI Automation element). When one "p" directly follows another, the second node is a child of the first.
     * 			A ")" represents a step back up the tree. For example, "pp)p" represents a node followed
     * 			by two child nodes that are siblings of one another. In "pp))p", the last node is a sibling of the first one.
     * @param {Pointer<HUIANODE>} hnode Type: <b>HUIANODE</b>
     * 
     * The element on which the navigation begins.
     * @param {Integer} direction Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-navigatedirection">NavigateDirection</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-navigatedirection">NavigateDirection</a> enumerated type indicating the direction to navigate from <i>hnode</i>.
     * @param {Pointer<UiaCondition>} pCondition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a>*</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a> structure that specifies the condition that the element being navigated to must match. Use this parameter to skip elements that are not of interest.
     * @param {Pointer<UiaCacheRequest>} pRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a>*</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a> structure that contains a description of the information to be cached.
     * @param {Pointer<SAFEARRAY>} ppRequestedData Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * The address of a variable that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains the requested data. This parameter is passed uninitialized. See Remarks.
     * @param {Pointer<BSTR>} ppTreeStructure Type: <b>BSTR*</b>
     * 
     * The address of a variable that receives the description of the tree structure. 
     * 				This parameter is passed uninitialized. See Remarks.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uianavigate
     * @since windows5.1.2600
     */
    static UiaNavigate(hnode, direction, pCondition, pRequest, ppRequestedData, ppTreeStructure) {
        result := DllCall("UIAutomationCore.dll\UiaNavigate", "ptr", hnode, "int", direction, "ptr", pCondition, "ptr", pRequest, "ptr", ppRequestedData, "ptr", ppTreeStructure, "int")
        return result
    }

    /**
     * Updates the cache of property values and control patterns.
     * @remarks
     * The tree structure is described by a string where every character is either "p" or ")". 
     * 			The first character in the string always represents the root node. 
     * The string is <b>NULL</b> if no elements are returned by the function.
     * 			
     * 
     * A "p" represents a node 
     * 			(UI Automation element). When one "p" directly follows another, the second node is a child of the first.
     * 			A ")" represents a step back up the tree. For example, "pp)p" represents a node followed
     * 			by two child nodes that are siblings of one another. In "pp))p", the last node is a sibling of the first one.
     * @param {Pointer<HUIANODE>} hnode Type: <b>HUIANODE</b>
     * 
     * The element that updated information is being requested for.
     * @param {Pointer<UiaCacheRequest>} pRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a>*</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a> structure that specifies the cached information to update.
     * @param {Integer} normalizeState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-normalizestate">NormalizeState</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-normalizestate">NormalizeState</a> enumerated type specifying the type of normalization.
     * @param {Pointer<UiaCondition>} pNormalizeCondition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a>*</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a> structure that specifies a condition against which the information can be normalized, if <i>normalizeState</i> is <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-normalizestate">NormalizeState_Custom</a>.
     * @param {Pointer<SAFEARRAY>} ppRequestedData Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * The address of a variable that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains the requested data. This parameter is passed uninitialized. See Remarks.
     * @param {Pointer<BSTR>} ppTreeStructure Type: <b>BSTR*</b>
     * 
     * A pointer to the description of the tree structure.
     * 				This parameter is passed uninitialized. See Remarks.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiagetupdatedcache
     * @since windows5.1.2600
     */
    static UiaGetUpdatedCache(hnode, pRequest, normalizeState, pNormalizeCondition, ppRequestedData, ppTreeStructure) {
        result := DllCall("UIAutomationCore.dll\UiaGetUpdatedCache", "ptr", hnode, "ptr", pRequest, "int", normalizeState, "ptr", pNormalizeCondition, "ptr", ppRequestedData, "ptr", ppTreeStructure, "int")
        return result
    }

    /**
     * Retrieves one or more UI Automation nodes that match the search criteria.
     * @remarks
     * The tree structure is described by a string where every character is either "p" or ")". 
     * 			The first character in the string always represents the root node. 
     * The string is <b>NULL</b> if no elements are returned by the function.
     * 			
     * 
     * A "p" represents a node 
     * 			(UI Automation element). When one "p" directly follows another, the second node is a child of the first.
     * 			A ")" represents a step back up the tree. For example, "pp)p" represents a node followed
     * 			by two child nodes that are siblings of one another. In "pp))p", the last node is a sibling of the first one.
     * @param {Pointer<HUIANODE>} hnode Type: <b>HUIANODE</b>
     * 
     * The node to use as starting-point of the search.
     * @param {Pointer<UiaFindParams>} pParams Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiafindparams">UiaFindParams</a>*</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiafindparams">UiaFindParams</a> structure that contains the search parameters.
     * @param {Pointer<UiaCacheRequest>} pRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a>*</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a> structure that specifies what information is to be cached.
     * @param {Pointer<SAFEARRAY>} ppRequestedData Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * The address of a variable that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> containing the requested data. This parameter is passed uninitialized. See Remarks.
     * @param {Pointer<SAFEARRAY>} ppOffsets Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * The address of a variable that receives a pointer to a SAFEARRAY containing the indexes to the requested data array for where the element subtree starts. This parameter is passed uninitialized.
     * @param {Pointer<SAFEARRAY>} ppTreeStructures Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * The address of a variable that receives a pointer to a SAFEARRAY containing the description of the tree structure. This parameter is passed uninitialized. See Remarks.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiafind
     * @since windows5.1.2600
     */
    static UiaFind(hnode, pParams, pRequest, ppRequestedData, ppOffsets, ppTreeStructures) {
        result := DllCall("UIAutomationCore.dll\UiaFind", "ptr", hnode, "ptr", pParams, "ptr", pRequest, "ptr", ppRequestedData, "ptr", ppOffsets, "ptr", ppTreeStructures, "int")
        return result
    }

    /**
     * Retrieves the UI Automation node for the element at the specified point.
     * @remarks
     * The element returned will be the closest element in the UI Automation tree structure that matches the specified criteria.
     * 
     * The tree structure is described by a string where every character is either "p" or ")". 
     * 			The first character in the string always represents the root node. 
     * The string is <b>NULL</b> if no elements are returned by the function.
     * 			
     * 
     * A "p" represents a node 
     * 			(UI Automation element). When one "p" directly follows another, the second node is a child of the first.
     * 			A ")" represents a step back up the tree. For example, "pp)p" represents a node followed
     * 			by two child nodes that are siblings of one another. In "pp))p", the last node is a sibling of the first one.
     * @param {Float} x Type: <b>double</b>
     * 
     * The horizontal coordinate of the point.
     * @param {Float} y Type: <b>double</b>
     * 
     * The vertical coordinate of the point.
     * @param {Pointer<UiaCacheRequest>} pRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a>*</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a> structure that contains the cache request for information from the client.
     * @param {Pointer<SAFEARRAY>} ppRequestedData Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * The address of a variable that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains the requested data. This parameter is passed uninitialized.
     * @param {Pointer<BSTR>} ppTreeStructure Type: <b>BSTR*</b>
     * 
     * The address of a variable that receives the description of the tree structure.
     * 				This parameter is passed uninitialized. See Remarks.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uianodefrompoint
     * @since windows5.1.2600
     */
    static UiaNodeFromPoint(x, y, pRequest, ppRequestedData, ppTreeStructure) {
        result := DllCall("UIAutomationCore.dll\UiaNodeFromPoint", "double", x, "double", y, "ptr", pRequest, "ptr", ppRequestedData, "ptr", ppTreeStructure, "int")
        return result
    }

    /**
     * Retrieves the UI Automation node for the UI element that currently has input focus.
     * @remarks
     * The tree structure is described by a string where every character is either "p" or ")". 
     * 			The first character in the string always represents the root node. 
     * The string is <b>NULL</b> if no elements are returned by the function.
     * 			
     * 
     * A "p" represents a node 
     * 			(UI Automation element). When one "p" directly follows another, the second node is a child of the first.
     * 			A ")" represents a step back up the tree. For example, "pp)p" represents a node followed
     * 			by two child nodes that are siblings of one another. In "pp))p", the last node is a sibling of the first one.
     * @param {Pointer<UiaCacheRequest>} pRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a>*</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a> structure that contains information about data to be cached.
     * @param {Pointer<SAFEARRAY>} ppRequestedData Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * The address of a variable that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains 				the requested information.
     * 				This parameter is passed uninitialized.
     * @param {Pointer<BSTR>} ppTreeStructure Type: <b>BSTR*</b>
     * 
     * The address of a variable that receives the description of the tree structure. 
     * 				This parameter is passed uninitialized. See Remarks.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uianodefromfocus
     * @since windows5.1.2600
     */
    static UiaNodeFromFocus(pRequest, ppRequestedData, ppTreeStructure) {
        result := DllCall("UIAutomationCore.dll\UiaNodeFromFocus", "ptr", pRequest, "ptr", ppRequestedData, "ptr", ppTreeStructure, "int")
        return result
    }

    /**
     * Retrieves the UI Automation node associated with a window.
     * @param {Pointer<HWND>} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The handle of the window.
     * @param {Pointer<HUIANODE>} phnode Type: <b>HUIANODE*</b>
     * 
     * The address of a variable that receives the handle of the node.
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uianodefromhandle
     * @since windows5.1.2600
     */
    static UiaNodeFromHandle(hwnd, phnode) {
        result := DllCall("UIAutomationCore.dll\UiaNodeFromHandle", "ptr", hwnd, "ptr", phnode, "int")
        return result
    }

    /**
     * Retrieves the UI Automation node for a raw element provider.
     * @param {Pointer<IRawElementProviderSimple>} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> interface of the provider.
     * @param {Pointer<HUIANODE>} phnode Type: <b>HUIANODE*</b>
     * 
     * The address of a variable that receives the UI Automation node for the raw element provider.
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uianodefromprovider
     * @since windows5.1.2600
     */
    static UiaNodeFromProvider(pProvider, phnode) {
        result := DllCall("UIAutomationCore.dll\UiaNodeFromProvider", "ptr", pProvider, "ptr", phnode, "int")
        return result
    }

    /**
     * Retrieves the root UI Automation node.
     * @param {Pointer<HUIANODE>} phnode Type: <b>HUIANODE*</b>
     * 
     * The address of a variable that receives a handle to the root node.
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiagetrootnode
     * @since windows5.1.2600
     */
    static UiaGetRootNode(phnode) {
        result := DllCall("UIAutomationCore.dll\UiaGetRootNode", "ptr", phnode, "int")
        return result
    }

    /**
     * Registers the application-defined method that is called by UI Automation to obtain a provider for an element.
     * @param {Pointer<UiaProviderCallback>} pCallback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nc-uiautomationcoreapi-uiaprovidercallback">UiaProviderCallback</a>*</b>
     * 
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nc-uiautomationcoreapi-uiaprovidercallback">UiaProviderCallback</a> callback function that returns the provider.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaregisterprovidercallback
     * @since windows5.1.2600
     */
    static UiaRegisterProviderCallback(pCallback) {
        DllCall("UIAutomationCore.dll\UiaRegisterProviderCallback", "ptr", pCallback)
    }

    /**
     * Gets the integer identifier that can be used in methods that require a PROPERTYID, PATTERNID, CONTROLTYPEID, TEXTATTRIBUTEID, or EVENTID.
     * @param {Integer} type Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-automationidentifiertype">AutomationIdentifierType</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-automationidentifiertype">AutomationIdentifierType</a> enumerated type that specifies the type of identifier to look up.
     * @param {Pointer<Guid>} pGuid Type: <b>GUID*</b>
     * 
     * The address of the unique identifier of the property, pattern, control type, text attribute, or event.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uialookupid
     * @since windows5.1.2600
     */
    static UiaLookupId(type, pGuid) {
        DllCall("UIAutomationCore.dll\UiaLookupId", "int", type, "ptr", pGuid)
    }

    /**
     * Retrieves a reserved value indicating that a Microsoft UI Automation property or a text attribute is not supported.
     * @param {Pointer<IUnknown>} punkNotSupportedValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives the object representing the value.
     *     This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiagetreservednotsupportedvalue
     * @since windows5.1.2600
     */
    static UiaGetReservedNotSupportedValue(punkNotSupportedValue) {
        result := DllCall("UIAutomationCore.dll\UiaGetReservedNotSupportedValue", "ptr", punkNotSupportedValue, "int")
        return result
    }

    /**
     * Retrieves a reserved value indicating that the value of a Microsoft UI Automation text attribute varies within a text range.
     * @param {Pointer<IUnknown>} punkMixedAttributeValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives 
     *     a reserved value specifying that 
     *     an attribute varies over a text range.
     *     This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiagetreservedmixedattributevalue
     * @since windows5.1.2600
     */
    static UiaGetReservedMixedAttributeValue(punkMixedAttributeValue) {
        result := DllCall("UIAutomationCore.dll\UiaGetReservedMixedAttributeValue", "ptr", punkMixedAttributeValue, "int")
        return result
    }

    /**
     * Gets a value that indicates whether any client application is subscribed to Microsoft UI Automation events.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if a client has subscribed to events; otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaclientsarelistening
     * @since windows5.1.2600
     */
    static UiaClientsAreListening() {
        result := DllCall("UIAutomationCore.dll\UiaClientsAreListening", "int")
        return result
    }

    /**
     * Called by providers to notify the Microsoft UI Automation core that an element property has changed.
     * @param {Pointer<IRawElementProviderSimple>} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * The provider node where the property change event occurred.
     * @param {Integer} id Type: <b>PROPERTYID</b>
     * 
     * The identifier for the property that changed. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {Pointer} oldValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
     * 
     * The old value of the property.
     * @param {Pointer} newValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
     * 
     * The new value of the property.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraiseautomationpropertychangedevent
     * @since windows5.1.2600
     */
    static UiaRaiseAutomationPropertyChangedEvent(pProvider, id, oldValue, newValue) {
        result := DllCall("UIAutomationCore.dll\UiaRaiseAutomationPropertyChangedEvent", "ptr", pProvider, "int", id, "ptr", oldValue, "ptr", newValue, "int")
        return result
    }

    /**
     * Notifies listeners of an event.
     * @remarks
     * This function increments the reference counter of the <i>pProvider</i> interface, and UI Automation decrements the reference counter when the event handers finish processing the event.
     * @param {Pointer<IRawElementProviderSimple>} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * The provider element where the event occurred.
     * @param {Integer} id Type: <b>EVENTID</b>
     * 
     * The identifier of the event to be raised. For a list of event IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraiseautomationevent
     * @since windows5.1.2600
     */
    static UiaRaiseAutomationEvent(pProvider, id) {
        result := DllCall("UIAutomationCore.dll\UiaRaiseAutomationEvent", "ptr", pProvider, "int", id, "int")
        return result
    }

    /**
     * Called by a provider to notify the Microsoft UI Automation core that the tree structure has changed.
     * @remarks
     * An example of a change in the tree structure is child elements being added to or removed from a list box, or being expanded or collapsed in a tree view.
     * @param {Pointer<IRawElementProviderSimple>} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * The provider node where the tree change occurred.
     * @param {Integer} structureChangeType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-structurechangetype">StructureChangeType</a></b>
     * 
     * The type of change that occurred in the tree.
     * @param {Pointer<Int32>} pRuntimeId Type: <b>int*</b>
     * 
     * The runtime IDs for the child elements of the provider node where the tree change occurred. This parameter is used only when <i>structureChangeType</i> is <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-structurechangetype">StructureChangeType_ChildRemoved</a>; it is <b>NULL</b> for all other structure-change events.
     * 
     * <div class="alert"><b>Note</b>  For Windows 7, the array of integers pointed to by <i>pRuntimeId</i> can contain a partial set of IDs that identify only those elements affected by the structure change.</div>
     * @param {Integer} cRuntimeIdLen Type: <b>int</b>
     * 
     * Length of the array of integers.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraisestructurechangedevent
     * @since windows5.1.2600
     */
    static UiaRaiseStructureChangedEvent(pProvider, structureChangeType, pRuntimeId, cRuntimeIdLen) {
        result := DllCall("UIAutomationCore.dll\UiaRaiseStructureChangedEvent", "ptr", pProvider, "int", structureChangeType, "ptr", pRuntimeId, "int", cRuntimeIdLen, "int")
        return result
    }

    /**
     * Called by a provider to notify the Microsoft UI Automation core that content is being loaded asynchronously.
     * @param {Pointer<IRawElementProviderSimple>} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * The provider node where the content is being loaded.
     * @param {Integer} asyncContentLoadedState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-asynccontentloadedstate">AsyncContentLoadedState</a></b>
     * 
     * The current state of loading.
     * @param {Float} percentComplete Type: <b>double</b>
     * 
     * The percentage of content that has been loaded.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraiseasynccontentloadedevent
     * @since windows5.1.2600
     */
    static UiaRaiseAsyncContentLoadedEvent(pProvider, asyncContentLoadedState, percentComplete) {
        result := DllCall("UIAutomationCore.dll\UiaRaiseAsyncContentLoadedEvent", "ptr", pProvider, "int", asyncContentLoadedState, "double", percentComplete, "int")
        return result
    }

    /**
     * Called by a provider to notify the Microsoft UI Automation core that a text control has programmatically changed text. (UiaRaiseTextEditTextChangedEvent)
     * @remarks
     * This is a helper function for providers that implement <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itexteditprovider">ITextEditProvider</a> and are raising the pattern's required events. Follow the guidance given in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/textedit-control-pattern">TextEdit Control Pattern</a> that describes when to raise the events and what payload the events should pass to UI Automation.
     * 
     * If there are no clients listening for a particular change type, no event is raised.
     * 
     * The event data should contain different payloads for each change type (per <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-texteditchangetype">TextEditChangeType</a>):
     * 
     * <ul>
     * <li><b>TextEditChangeType_AutoCorrect</b>: <i>pChangedData</i> should be the new corrected string .</li>
     * <li><b>TextEditChangeType_Composition</b>: <i>pChangedData</i> should be the updated string in the composition (only the part that changed).</li>
     * <li><b>TextEditChangeType_CompositionFinalized</b>: <i>pChangedData</i> should be the finalized string of the completed composition (this may be empty if composition was canceled or deleted).</li>
     * </ul>
     * @param {Pointer<IRawElementProviderSimple>} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * The provider node where the text change occurred.
     * @param {Integer} textEditChangeType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-texteditchangetype">TextEditChangeType</a></b>
     * 
     * The type of text-edit change that occurred.
     * @param {Pointer<SAFEARRAY>} pChangedData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-workingwithsafearrays">SAFEARRAY</a>*</b>
     * 
     * The event data. Should be assignable as a <b>VAR</b> of type <b>VT_BSTR</b>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraisetextedittextchangedevent
     * @since windows8.1
     */
    static UiaRaiseTextEditTextChangedEvent(pProvider, textEditChangeType, pChangedData) {
        result := DllCall("UIAutomationCore.dll\UiaRaiseTextEditTextChangedEvent", "ptr", pProvider, "int", textEditChangeType, "ptr", pChangedData, "int")
        return result
    }

    /**
     * Called by providers to notify the Microsoft UI Automation core that a change has occurred.
     * @param {Pointer<IRawElementProviderSimple>} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * The provider node where the change event occurred.
     * @param {Integer} eventIdCount The number of changes that occurred. This is the number of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiachangeinfo">UiaChangeInfo</a> structures pointed to by the <i>pUiaChanges</i> parameter.
     * @param {Pointer<UiaChangeInfo>} pUiaChanges A collection of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiachangeinfo">UiaChangeInfo</a> structures.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a> value indicating success or failure.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraisechangesevent
     * @since windows10.0.10240
     */
    static UiaRaiseChangesEvent(pProvider, eventIdCount, pUiaChanges) {
        result := DllCall("UIAutomationCore.dll\UiaRaiseChangesEvent", "ptr", pProvider, "int", eventIdCount, "ptr", pUiaChanges, "int")
        return result
    }

    /**
     * Called by providers to initiate a notification event.
     * @remarks
     * If your window uses the [`WS_POPUP`](/windows/win32/winmsg/window-styles) style, it must also implement the [Window Control Pattern](/windows/win32/winauto/uiauto-implementingwindow) and handle the [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message (see [How to Expose a Server-Side UI Automation Provider](/windows/win32/winauto/uiauto-howto-expose-serverside-uiautomation-provider) for more details).
     * @param {Pointer<IRawElementProviderSimple>} provider The provider node where the notification event occurred.
     * @param {Integer} notificationKind The type of notification, as a [NotificationKind enumeration](../uiautomationcore/ne-uiautomationcore-notificationkind.md) value.
     * @param {Integer} notificationProcessing The preferred way to process a notification, as a [NotificationProcessing enumeration](../uiautomationcore/ne-uiautomationcore-notificationprocessing.md) value.
     * @param {Pointer<BSTR>} displayString A string to display in the notification message.
     * @param {Pointer<BSTR>} activityId A unique non-localized string to identify an action or group of actions. Use this to pass additional information to the event handler.
     * @returns {Integer} If this function succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraisenotificationevent
     * @since windows10.0.16299
     */
    static UiaRaiseNotificationEvent(provider, notificationKind, notificationProcessing, displayString, activityId) {
        result := DllCall("UIAutomationCore.dll\UiaRaiseNotificationEvent", "ptr", provider, "int", notificationKind, "int", notificationProcessing, "ptr", displayString, "ptr", activityId, "int")
        return result
    }

    /**
     * Called by a provider to notify the Microsoft UI Automation core that a text control has programmatically changed text. (UiaRaiseActiveTextPositionChangedEvent)
     * @param {Pointer<IRawElementProviderSimple>} provider Type: <b><a href="https://docs.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * The provider node where the position change within the text occurred.
     * @param {Pointer<ITextRangeProvider>} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>*</b>
     * 
     * The text range change that occurred, if applicable.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraiseactivetextpositionchangedevent
     * @since windows8.1
     */
    static UiaRaiseActiveTextPositionChangedEvent(provider, textRange) {
        result := DllCall("UIAutomationCore.dll\UiaRaiseActiveTextPositionChangedEvent", "ptr", provider, "ptr", textRange, "int")
        return result
    }

    /**
     * Adds a listener for events on a node in the UI Automation tree.
     * @param {Pointer<HUIANODE>} hnode Type: <b>HUIANODE</b>
     * 
     * The node to add an event listener to.
     * @param {Integer} eventId Type: <b>EVENTID</b>
     * 
     * The identifier of the event to listen for. For a list of event IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     * @param {Pointer<UiaEventCallback>} pCallback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nc-uiautomationcoreapi-uiaeventcallback">UiaEventCallback</a>*</b>
     * 
     * The address of the application-defined <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nc-uiautomationcoreapi-uiaeventcallback">UiaEventCallback</a> callback function that is called when the event is raised.
     * @param {Integer} scope Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope</a>*</b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope</a> enumerated type indicating the scope of events to be handled; that is, whether they are on the element itself, 
     * 				or on its ancestors and children.
     * @param {Pointer<Int32>} pProperties Type: <b>PROPERTYID*</b>
     * 
     * The address of an array that contains the identifiers of the properties to monitor for change events, when <i>eventId</i> is the EVENTID derived from AutomationPropertyChanged_Event_GUID; otherwise this parameter is <b>NULL</b>. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {Integer} cProperties Type: <b>int</b>
     * 
     * The count of elements in the <i>pProperties</i> array.
     * @param {Pointer<UiaCacheRequest>} pRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a>*</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a> structure that defines the cache request in effect for nodes that are returned with events.
     * @param {Pointer<HUIAEVENT>} phEvent Type: <b>HUIEVENT*</b>
     * 
     * When this function returns, contains 
     * 				a pointer to the event that is added. 
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaaddevent
     * @since windows5.1.2600
     */
    static UiaAddEvent(hnode, eventId, pCallback, scope, pProperties, cProperties, pRequest, phEvent) {
        result := DllCall("UIAutomationCore.dll\UiaAddEvent", "ptr", hnode, "int", eventId, "ptr", pCallback, "int", scope, "ptr", pProperties, "int", cProperties, "ptr", pRequest, "ptr", phEvent, "int")
        return result
    }

    /**
     * Removes a listener for events on a node in the UI Automation tree.
     * @remarks
     * The callback pointer, the scope, the node, and the list of properties must match exactly the parameters that were sent to the 
     * corresponding <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaaddevent">UiaAddEvent</a>.
     * @param {Pointer<HUIAEVENT>} hEvent Type: <b>HUIAEVENT</b>
     * 
     * The event to remove. This value was retrieved from <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaaddevent">UiaAddEvent</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaremoveevent
     * @since windows5.1.2600
     */
    static UiaRemoveEvent(hEvent) {
        result := DllCall("UIAutomationCore.dll\UiaRemoveEvent", "ptr", hEvent, "int")
        return result
    }

    /**
     * Adds a window to the event listener.
     * @param {Pointer<HUIAEVENT>} hEvent Type: <b>HUIAEVENT</b>
     * 
     * The event being listened for. This event was retrieved from <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaaddevent">UiaAddEvent</a>.
     * @param {Pointer<HWND>} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The handle of the window to add.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaeventaddwindow
     * @since windows5.1.2600
     */
    static UiaEventAddWindow(hEvent, hwnd) {
        result := DllCall("UIAutomationCore.dll\UiaEventAddWindow", "ptr", hEvent, "ptr", hwnd, "int")
        return result
    }

    /**
     * Removes a window from the event listener.
     * @param {Pointer<HUIAEVENT>} hEvent Type: <b>HUIAEVENT</b>
     * 
     * The event being listened for. This event was retrieved from <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaaddevent">UiaAddEvent</a>.
     * @param {Pointer<HWND>} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The handle of the window to remove.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaeventremovewindow
     * @since windows5.1.2600
     */
    static UiaEventRemoveWindow(hEvent, hwnd) {
        result := DllCall("UIAutomationCore.dll\UiaEventRemoveWindow", "ptr", hEvent, "ptr", hwnd, "int")
        return result
    }

    /**
     * Docks the UI Automation element at the requested dockPosition within a docking container.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The <i>control pattern</i> object.
     * @param {Integer} dockPosition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-dockposition">DockPosition</a></b>
     * 
     * The location to dock the control to.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-dockpattern_setdockposition
     * @since windows5.1.2600
     */
    static DockPattern_SetDockPosition(hobj, dockPosition) {
        result := DllCall("UIAutomationCore.dll\DockPattern_SetDockPosition", "ptr", hobj, "int", dockPosition, "int")
        return result
    }

    /**
     * Hides all descendant nodes, controls, or content of the UI Automation element.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The <i>control pattern</i> object.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-expandcollapsepattern_collapse
     * @since windows5.1.2600
     */
    static ExpandCollapsePattern_Collapse(hobj) {
        result := DllCall("UIAutomationCore.dll\ExpandCollapsePattern_Collapse", "ptr", hobj, "int")
        return result
    }

    /**
     * Expands a control on the screen so that it shows more information.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The <i>control pattern</i> object.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-expandcollapsepattern_expand
     * @since windows5.1.2600
     */
    static ExpandCollapsePattern_Expand(hobj) {
        result := DllCall("UIAutomationCore.dll\ExpandCollapsePattern_Expand", "ptr", hobj, "int")
        return result
    }

    /**
     * Gets the node for an item in a grid.
     * @remarks
     * Row 0, column 0 is the first item in a grid.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The <i>control pattern</i> object.
     * @param {Integer} row Type: <b>int</b>
     * 
     * The row of the node being requested.
     * @param {Integer} column Type: <b>int</b>
     * 
     * The column of the node being requested.
     * @param {Pointer<HUIANODE>} pResult Type: <b>HUIANODE*</b>
     * 
     * When this function returns, contains a pointer to the node for the cell 
     * 				at the specified location. This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-gridpattern_getitem
     * @since windows5.1.2600
     */
    static GridPattern_GetItem(hobj, row, column, pResult) {
        result := DllCall("UIAutomationCore.dll\GridPattern_GetItem", "ptr", hobj, "int", row, "int", column, "ptr", pResult, "int")
        return result
    }

    /**
     * Sends a request to activate a control and initiate its single, unambiguous action. (InvokePattern_Invoke)
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The <i>control pattern</i> object.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-invokepattern_invoke
     * @since windows5.1.2600
     */
    static InvokePattern_Invoke(hobj) {
        result := DllCall("UIAutomationCore.dll\InvokePattern_Invoke", "ptr", hobj, "int")
        return result
    }

    /**
     * Retrieves the name of a control-specific view. (MultipleViewPattern_GetViewName)
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The <i>control pattern</i> object.
     * @param {Integer} viewId Type: <b>int</b>
     * 
     * The integer identifier for the view.
     * @param {Pointer<BSTR>} ppStr Type: <b>BSTR*</b>
     * 
     * When this function returns, contains a pointer to the string containing the name of the view. 
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-multipleviewpattern_getviewname
     * @since windows5.1.2600
     */
    static MultipleViewPattern_GetViewName(hobj, viewId, ppStr) {
        result := DllCall("UIAutomationCore.dll\MultipleViewPattern_GetViewName", "ptr", hobj, "int", viewId, "ptr", ppStr, "int")
        return result
    }

    /**
     * Sets a control to a different layout.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The control pattern object.
     * @param {Integer} viewId Type: <b>int</b>
     * 
     * The control-specific identifier for the view.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-multipleviewpattern_setcurrentview
     * @since windows5.1.2600
     */
    static MultipleViewPattern_SetCurrentView(hobj, viewId) {
        result := DllCall("UIAutomationCore.dll\MultipleViewPattern_SetCurrentView", "ptr", hobj, "int", viewId, "int")
        return result
    }

    /**
     * Sets the value of a control that has a numerical range.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The control pattern object.
     * @param {Float} val Type: <b>double</b>
     * 
     * The value to set.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-rangevaluepattern_setvalue
     * @since windows5.1.2600
     */
    static RangeValuePattern_SetValue(hobj, val) {
        result := DllCall("UIAutomationCore.dll\RangeValuePattern_SetValue", "ptr", hobj, "double", val, "int")
        return result
    }

    /**
     * Scrolls the content area of a container object in order to display the UI Automation element within the visible region (viewport) of the container.
     * @remarks
     * This method does not guarantee the position of the UI Automation element 
     *             within the visible region (viewport) of the container.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The control pattern object.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-scrollitempattern_scrollintoview
     * @since windows5.1.2600
     */
    static ScrollItemPattern_ScrollIntoView(hobj) {
        result := DllCall("UIAutomationCore.dll\ScrollItemPattern_ScrollIntoView", "ptr", hobj, "int")
        return result
    }

    /**
     * Scrolls the currently visible region of the content area the specified ScrollAmount, horizontally, vertically, or both.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The control pattern object.
     * @param {Integer} horizontalAmount Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-scrollamount">ScrollAmount</a></b>
     * 
     * The amount to scroll the container on the horizontal axis, as a percentage.
     * @param {Integer} verticalAmount Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-scrollamount">ScrollAmount</a></b>
     * 
     * The amount to scroll the container on the vertical axis, as a percentage.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-scrollpattern_scroll
     * @since windows5.1.2600
     */
    static ScrollPattern_Scroll(hobj, horizontalAmount, verticalAmount) {
        result := DllCall("UIAutomationCore.dll\ScrollPattern_Scroll", "ptr", hobj, "int", horizontalAmount, "int", verticalAmount, "int")
        return result
    }

    /**
     * Scrolls a container to a specific position horizontally, vertically, or both.
     * @remarks
     * The scroll area is normalized to range from 0.0 to 100.0. If the position is set to 0.0, the control 
     * scrolls to the beginning of the 
     * visible region, and if the position is set to 100.0, it  scrolls to the end of the visible region. 
     * Pass -1.0 for the percent parameters if no scrolling occurs on that axis.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The control pattern object.
     * @param {Float} horizontalPercent Type: <b>double</b>
     * 
     * The horizontal position to scroll to.
     * @param {Float} verticalPercent Type: <b>double</b>
     * 
     * The vertical position to scroll to.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-scrollpattern_setscrollpercent
     * @since windows5.1.2600
     */
    static ScrollPattern_SetScrollPercent(hobj, horizontalPercent, verticalPercent) {
        result := DllCall("UIAutomationCore.dll\ScrollPattern_SetScrollPercent", "ptr", hobj, "double", horizontalPercent, "double", verticalPercent, "int")
        return result
    }

    /**
     * Adds an unselected element to a selection in a control.
     * @remarks
     * In a control that supports multiple selection, this function adds an item to the selection. In a single-selection control,
     * it deselects the currently selected item and selects the specified item.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The control pattern object.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-selectionitempattern_addtoselection
     * @since windows5.1.2600
     */
    static SelectionItemPattern_AddToSelection(hobj) {
        result := DllCall("UIAutomationCore.dll\SelectionItemPattern_AddToSelection", "ptr", hobj, "int")
        return result
    }

    /**
     * Removes an element from the selection in a selection container.
     * @remarks
     * The function has no effect if an attempt is made to remove the last selected element in a control that requires at
     * least one element to be selected.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The control pattern object.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-selectionitempattern_removefromselection
     * @since windows5.1.2600
     */
    static SelectionItemPattern_RemoveFromSelection(hobj) {
        result := DllCall("UIAutomationCore.dll\SelectionItemPattern_RemoveFromSelection", "ptr", hobj, "int")
        return result
    }

    /**
     * Selects an element in a selection container.
     * @remarks
     * All other elements are deselected. 
     * To select an element without deselecting others, use <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-selectionitempattern_addtoselection">SelectionItemPattern_AddToSelection</a>.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The control pattern object.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-selectionitempattern_select
     * @since windows5.1.2600
     */
    static SelectionItemPattern_Select(hobj) {
        result := DllCall("UIAutomationCore.dll\SelectionItemPattern_Select", "ptr", hobj, "int")
        return result
    }

    /**
     * Toggles a control to its next supported state.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The control pattern object.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-togglepattern_toggle
     * @since windows5.1.2600
     */
    static TogglePattern_Toggle(hobj) {
        result := DllCall("UIAutomationCore.dll\TogglePattern_Toggle", "ptr", hobj, "int")
        return result
    }

    /**
     * Moves an element to a specified location on the screen.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The control pattern object.
     * @param {Float} x Type: <b>double</b>
     * 
     * The horizontal screen coordinate to move the element to.
     * @param {Float} y Type: <b>double</b>
     * 
     * The vertical screen coordinate to move the element to.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-transformpattern_move
     * @since windows5.1.2600
     */
    static TransformPattern_Move(hobj, x, y) {
        result := DllCall("UIAutomationCore.dll\TransformPattern_Move", "ptr", hobj, "double", x, "double", y, "int")
        return result
    }

    /**
     * Resizes an element on the screen.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The control pattern object.
     * @param {Float} width Type: <b>double</b>
     * 
     * The width, in pixels, to resize the element to.
     * @param {Float} height Type: <b>double</b>
     * 
     * The height, in pixels, to resize the element to.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-transformpattern_resize
     * @since windows5.1.2600
     */
    static TransformPattern_Resize(hobj, width, height) {
        result := DllCall("UIAutomationCore.dll\TransformPattern_Resize", "ptr", hobj, "double", width, "double", height, "int")
        return result
    }

    /**
     * Rotates an element on the screen.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The control pattern object.
     * @param {Float} degrees Type: <b>double</b>
     * 
     * The number of degrees to rotate the control. 
     * 				Positive values are clockwise; negative values are counterclockwise.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-transformpattern_rotate
     * @since windows5.1.2600
     */
    static TransformPattern_Rotate(hobj, degrees) {
        result := DllCall("UIAutomationCore.dll\TransformPattern_Rotate", "ptr", hobj, "double", degrees, "int")
        return result
    }

    /**
     * Sets the text value of an element.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The control pattern object.
     * @param {Pointer<PWSTR>} pVal Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * The string to set the element's content to.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-valuepattern_setvalue
     * @since windows5.1.2600
     */
    static ValuePattern_SetValue(hobj, pVal) {
        pVal := pVal is String? StrPtr(pVal) : pVal

        result := DllCall("UIAutomationCore.dll\ValuePattern_SetValue", "ptr", hobj, "ptr", pVal, "int")
        return result
    }

    /**
     * Closes an open window.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The control pattern object.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-windowpattern_close
     * @since windows5.1.2600
     */
    static WindowPattern_Close(hobj) {
        result := DllCall("UIAutomationCore.dll\WindowPattern_Close", "ptr", hobj, "int")
        return result
    }

    /**
     * Sets the visual state of a window; for example, to maximize a window.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The control pattern object.
     * @param {Integer} state Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-windowvisualstate">WindowVisualState</a></b>
     * 
     * The visual state to set the window to.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-windowpattern_setwindowvisualstate
     * @since windows5.1.2600
     */
    static WindowPattern_SetWindowVisualState(hobj, state) {
        result := DllCall("UIAutomationCore.dll\WindowPattern_SetWindowVisualState", "ptr", hobj, "int", state, "int")
        return result
    }

    /**
     * Causes the calling code to block for the specified time or until the associated process enters an idle state, whichever completes first. (WindowPattern_WaitForInputIdle)
     * @remarks
     * This method is typically used in conjunction with the handling of a WindowOpenedEvent 
     *         (<i>Window_WindowOpened_Event_GUID</i>).
     *         The implementation is dependent on the underlying application framework; 
     *         therefore this method may return some time after the window is ready for user input. 
     *         The calling code should not rely on this method to ascertain exactly when the window has become idle. 
     *         Use the value of <i>pResult</i> to determine if the window is ready for input or if the method timed out.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The control pattern object.
     * @param {Integer} milliseconds Type: <b>int</b>
     * 
     * The number of milliseconds to wait before retrieving <i>pResult</i>.
     * @param {Pointer<Int32>} pResult Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * <b>TRUE</b> if the window is ready to accept user input; otherwise <b>FALSE</b>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-windowpattern_waitforinputidle
     * @since windows5.1.2600
     */
    static WindowPattern_WaitForInputIdle(hobj, milliseconds, pResult) {
        result := DllCall("UIAutomationCore.dll\WindowPattern_WaitForInputIdle", "ptr", hobj, "int", milliseconds, "ptr", pResult, "int")
        return result
    }

    /**
     * Gets the current range of selected text from a text container supporting the text pattern.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * A control pattern object.
     * @param {Pointer<SAFEARRAY>} pRetVal Type: <b>HUIATEXTRANGE*</b>
     * 
     * When this function returns, contains 
     * 				the text range spanning the currently selected text in the container. 
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textpattern_getselection
     * @since windows5.1.2600
     */
    static TextPattern_GetSelection(hobj, pRetVal) {
        result := DllCall("UIAutomationCore.dll\TextPattern_GetSelection", "ptr", hobj, "ptr", pRetVal, "int")
        return result
    }

    /**
     * Retrieves an array of disjoint text ranges from a text container where each text range begins with the first partially visible line through to the end of the last partially visible line.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * A control pattern object.
     * @param {Pointer<SAFEARRAY>} pRetVal Type: <b>HUIATEXTRANGE*</b>
     * 
     * When this function returns, contains
     * 				an array of text ranges spanning the visible text within the text container. 
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textpattern_getvisibleranges
     * @since windows5.1.2600
     */
    static TextPattern_GetVisibleRanges(hobj, pRetVal) {
        result := DllCall("UIAutomationCore.dll\TextPattern_GetVisibleRanges", "ptr", hobj, "ptr", pRetVal, "int")
        return result
    }

    /**
     * Gets the text range that a given node spans.
     * @remarks
     * As an example of how this function might be used, 
     * a client can pass in an embedded hyperlink control and receive the range of text that it spans.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * A control pattern object.
     * @param {Pointer<HUIANODE>} hnodeChild Type: <b>HUIANODE</b>
     * 
     * Reference to a node that the client wants the text range for.
     * @param {Pointer<HUIATEXTRANGE>} pRetVal Type: <b>HUIATEXTRANGE*</b>
     * 
     * When this function returns, contains the text range that the node spans. 
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textpattern_rangefromchild
     * @since windows5.1.2600
     */
    static TextPattern_RangeFromChild(hobj, hnodeChild, pRetVal) {
        result := DllCall("UIAutomationCore.dll\TextPattern_RangeFromChild", "ptr", hobj, "ptr", hnodeChild, "ptr", pRetVal, "int")
        return result
    }

    /**
     * Retrieves the degenerate (empty) text range nearest to the specified screen coordinates. (TextPattern_RangeFromPoint)
     * @remarks
     * A text range that wraps a child object is returned if the screen coordinates are within the coordinates of an image, hyperlink, Microsoft Excel spreadsheet, or other embedded object.
     * 
     * Because hidden text is not ignored, this method retrieves a degenerate range from the visible text closest to the specified coordinates.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * A control pattern object.
     * @param {Pointer} point Type: <b>HiaPoint</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiapoint">UiaPoint</a> structure that contains the location in screen coordinates.
     * @param {Pointer<HUIATEXTRANGE>} pRetVal Type: <b>HUIATEXTRANGE*</b>
     * 
     * When this function returns, contains the text range that the node spans. 
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textpattern_rangefrompoint
     * @since windows5.1.2600
     */
    static TextPattern_RangeFromPoint(hobj, point, pRetVal) {
        result := DllCall("UIAutomationCore.dll\TextPattern_RangeFromPoint", "ptr", hobj, "ptr", point, "ptr", pRetVal, "int")
        return result
    }

    /**
     * Gets the text range for the entire document.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * A control pattern object.
     * @param {Pointer<HUIATEXTRANGE>} pRetVal Type: <b>HUIATEXTRANGE*</b>
     * 
     * When this function returns, contains 
     * 				the text range spanning the entire document contents of the text container. 
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textpattern_get_documentrange
     * @since windows5.1.2600
     */
    static TextPattern_get_DocumentRange(hobj, pRetVal) {
        result := DllCall("UIAutomationCore.dll\TextPattern_get_DocumentRange", "ptr", hobj, "ptr", pRetVal, "int")
        return result
    }

    /**
     * Ascertains whether the text container's contents can be selected and deselected.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * A control pattern object.
     * @param {Pointer<Int32>} pRetVal Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * When this function returns, contains a value indicating whether the text container can have its contents selected and deselected.
     * 
     * This parameter is passed uninitialized.
     * @returns {Integer} Type: **[HRESULT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textpattern_get_supportedtextselection
     * @since windows5.1.2600
     */
    static TextPattern_get_SupportedTextSelection(hobj, pRetVal) {
        result := DllCall("UIAutomationCore.dll\TextPattern_get_SupportedTextSelection", "ptr", hobj, "ptr", pRetVal, "int")
        return result
    }

    /**
     * Copies a text range.
     * @remarks
     * The method never returns <b>NULL</b> (Nothing in Microsoft Visual Basic .NET).
     * 
     * The new range can be manipulated independently from the original.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * A text range object.
     * @param {Pointer<HUIATEXTRANGE>} pRetVal Type: <b>HUIATEXTRANGE*</b>
     * 
     * When this function returns, contains the copy. 
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_clone
     * @since windows5.1.2600
     */
    static TextRange_Clone(hobj, pRetVal) {
        result := DllCall("UIAutomationCore.dll\TextRange_Clone", "ptr", hobj, "ptr", pRetVal, "int")
        return result
    }

    /**
     * Compares two text ranges.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * The first text range to compare.
     * @param {Pointer<HUIATEXTRANGE>} range Type: <b>HUIATEXTRANGE</b>
     * 
     * The second text range to compare.
     * @param {Pointer<Int32>} pRetVal Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * When this function returns, contains <b>TRUE</b> if the two objects span the same text; otherwise <b>FALSE</b>. 
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_compare
     * @since windows5.1.2600
     */
    static TextRange_Compare(hobj, range, pRetVal) {
        result := DllCall("UIAutomationCore.dll\TextRange_Compare", "ptr", hobj, "ptr", range, "ptr", pRetVal, "int")
        return result
    }

    /**
     * Returns a value indicating whether two text ranges have identical endpoints.
     * @remarks
     * The returned value is &lt;0 if the caller's endpoint occurs earlier in the text than the target endpoint; 
     * 			0 if the caller's endpoint is at the same location as the target endpoint; and 
     * 			&gt;0 if the caller's endpoint occurs later in the text than the target endpoint.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * A text range object.
     * @param {Integer} endpoint Type: <b>TextPatternRangeEndpoint</b>
     * 
     * The starting or ending endpoint of <i>hobj</i>.
     * @param {Pointer<HUIATEXTRANGE>} targetRange Type: <b>ITextRangeInteropProvider*</b>
     * 
     * The text range that is being compared against.
     * @param {Integer} targetEndpoint Type: <b>TextPatternRangeEndpoint</b>
     * 
     * The starting or ending endpoint of <i>targetRange</i>.
     * @param {Pointer<Int32>} pRetVal Type: <b>int*</b>
     * 
     * The address of a variable that receives a pointer to a value that indicates whether two text ranges have identical endpoints.
     * 				 This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_compareendpoints
     * @since windows5.1.2600
     */
    static TextRange_CompareEndpoints(hobj, endpoint, targetRange, targetEndpoint, pRetVal) {
        result := DllCall("UIAutomationCore.dll\TextRange_CompareEndpoints", "ptr", hobj, "int", endpoint, "ptr", targetRange, "int", targetEndpoint, "ptr", pRetVal, "int")
        return result
    }

    /**
     * Expands the text range to a larger or smaller unit such as Character, Word, Line, or Page.
     * @remarks
     * If the range is already an integral number of the specified units, it remains unchanged.
     * 
     * If the starting endpoint is not at a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-textunit">TextUnit</a> boundary, it is moved backward until it is at a boundary. 
     * 			Subsequently, if the ending endpoint is not at a boundary, or if it is at the same boundary as the starting endpoint, 
     * 			the ending endpoint is moved forward until it is at a boundary.
     * 
     * <div class="alert"><b>Note</b>  It is common for a screen reader to read out a full word, entire paragraph, and so on, 
     * 			at the insertion point or any virtual cursor position.
     * </div>
     * <div> </div>
     * <b>TextRange_ExpandToEnclosingUnit</b> respects both hidden and visible text. The UI Automationclient can check the is-hidden attribute (Text_IsHidden_Attribute_GUID) for text visibility.
     * 
     * <b>TextRange_ExpandToEnclosingUnit</b> defaults up to the next supported <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-textunit">TextUnit</a> if the given <b>TextUnit</b> is not supported by the control.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * A text range object.
     * @param {Integer} unit Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-textunit">TextUnit</a></b>
     * 
     * The unit that the provider must expand the text range to.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_expandtoenclosingunit
     * @since windows5.1.2600
     */
    static TextRange_ExpandToEnclosingUnit(hobj, unit) {
        result := DllCall("UIAutomationCore.dll\TextRange_ExpandToEnclosingUnit", "ptr", hobj, "int", unit, "int")
        return result
    }

    /**
     * Gets the value of a text attribute for a text range.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * A text range object.
     * @param {Integer} attributeId Type: <b>TEXTATTRIBUTEID</b>
     * 
     * The text attribute whose value is wanted. For a list of text attribute IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">Text Attribute Identifiers</a>.
     * @param {Pointer<VARIANT>} pRetVal Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>*</b>
     * 
     * When this function returns, contains 
     * 				the value of the attribute for the text range.
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_getattributevalue
     * @since windows5.1.2600
     */
    static TextRange_GetAttributeValue(hobj, attributeId, pRetVal) {
        result := DllCall("UIAutomationCore.dll\TextRange_GetAttributeValue", "ptr", hobj, "int", attributeId, "ptr", pRetVal, "int")
        return result
    }

    /**
     * Searches in a specified direction for the first piece of text supporting a specified text attribute.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * The text range to search.
     * @param {Integer} attributeId Type: <b>TEXTATTRIBUTEID</b>
     * 
     * The text attribute to search for. For a list of text attribute IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">Text Attribute Identifiers</a>.
     * @param {Pointer} val Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
     * 
     * The value of the attribute that the client wants to find.
     * @param {Integer} backward Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> to search backward, otherwise <b>FALSE</b>.
     * @param {Pointer<HUIATEXTRANGE>} pRetVal Type: <b>HUITEXTRANGE*</b>
     * 
     * When this function returns, contains 
     * 				the first matching text range.
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_findattribute
     * @since windows5.1.2600
     */
    static TextRange_FindAttribute(hobj, attributeId, val, backward, pRetVal) {
        result := DllCall("UIAutomationCore.dll\TextRange_FindAttribute", "ptr", hobj, "int", attributeId, "ptr", val, "int", backward, "ptr", pRetVal, "int")
        return result
    }

    /**
     * Returns the first text range in the specified direction that contains the text the client is searching for.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * The text range to search.
     * @param {Pointer<BSTR>} text Type: <b>BSTR</b>
     * 
     * The string to search for.
     * @param {Integer} backward Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> to search backward; otherwise <b>FALSE</b>.
     * @param {Integer} ignoreCase Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> to specify a case-insensitive search; otherwise <b>FALSE</b>.
     * @param {Pointer<HUIATEXTRANGE>} pRetVal Type: <b>HUITEXTRANGE*</b>
     * 
     * When this function returns, contains 
     * 				the text range for the first span of text that matches the string 
     * 				the client is searching for.
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_findtext
     * @since windows5.1.2600
     */
    static TextRange_FindText(hobj, text, backward, ignoreCase, pRetVal) {
        result := DllCall("UIAutomationCore.dll\TextRange_FindText", "ptr", hobj, "ptr", text, "int", backward, "int", ignoreCase, "ptr", pRetVal, "int")
        return result
    }

    /**
     * Retrieves the minimum number of bounding rectangles that can enclose the range, one rectangle per line.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * A text range object.
     * @param {Pointer<SAFEARRAY>} pRetVal Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * When this function returns, contains 
     * 				an array of rectangle coordinates for the lines of text that the range spans. 
     * 				This parameter is passed uninitialized.
     * 				The SAFEARRAY contains VARIANTs of type VT_I4.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_getboundingrectangles
     * @since windows5.1.2600
     */
    static TextRange_GetBoundingRectangles(hobj, pRetVal) {
        result := DllCall("UIAutomationCore.dll\TextRange_GetBoundingRectangles", "ptr", hobj, "ptr", pRetVal, "int")
        return result
    }

    /**
     * Returns the node for the next smallest provider that covers the range.
     * @remarks
     * The enclosing element is typically the text provider that supplies the text range. However,
     * 		if the text provider supports child elements such as tables or hyperlinks, 
     * 		the enclosing element could be a descendant of the text provider.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * A text range object.
     * @param {Pointer<HUIANODE>} pRetVal Type: <b>HUIANODE*</b>
     * 
     * When this function returns, contains 
     * 				the node for the next smallest element that encloses the range.
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_getenclosingelement
     * @since windows5.1.2600
     */
    static TextRange_GetEnclosingElement(hobj, pRetVal) {
        result := DllCall("UIAutomationCore.dll\TextRange_GetEnclosingElement", "ptr", hobj, "ptr", pRetVal, "int")
        return result
    }

    /**
     * Returns the text in a text range, up to a specified number of characters.
     * @remarks
     * If <i>maxLength</i> is -1, all of the text within the text range is returned. 
     * If <i>maxLength</i> is larger than the length of the text range, the returned string contains all of the text in the text range.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * A text range object.
     * @param {Integer} maxLength Type: <b>int</b>
     * 
     * The number of characters to return, beginning with the character at the starting endpoint of the text range.
     * @param {Pointer<BSTR>} pRetVal Type: <b>BSTR*</b>
     * 
     * When this function returns, this parameter contains 
     * 				a pointer to the returned text.
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_gettext
     * @since windows5.1.2600
     */
    static TextRange_GetText(hobj, maxLength, pRetVal) {
        result := DllCall("UIAutomationCore.dll\TextRange_GetText", "ptr", hobj, "int", maxLength, "ptr", pRetVal, "int")
        return result
    }

    /**
     * Moves the text range the specified number of units requested by the client.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * A text range object.
     * @param {Integer} unit Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-textunit">TextUnit</a></b>
     * 
     * The unit, such as Page, Line, or Word.
     * @param {Integer} count Type: <b>int</b>
     * 
     * The number of units to move. Positive numbers move the range forward, 
     * 				and negative numbers move the range backward.
     * @param {Pointer<Int32>} pRetVal Type: <b>int*</b>
     * 
     * When this function returns, contains 
     * 				the number of units actually moved.
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_move
     * @since windows5.1.2600
     */
    static TextRange_Move(hobj, unit, count, pRetVal) {
        result := DllCall("UIAutomationCore.dll\TextRange_Move", "ptr", hobj, "int", unit, "int", count, "ptr", pRetVal, "int")
        return result
    }

    /**
     * Moves an endpoint of the range the specified number of units.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * A text range object.
     * @param {Integer} endpoint Type: <b>TextPatternRangeEndpoint</b>
     * 
     * The endpoint to move (either the start or the end).
     * @param {Integer} unit Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-textunit">TextUnit</a></b>
     * 
     * The unit, such as Page, Line, or Word.
     * @param {Integer} count Type: <b>int</b>
     * 
     * The number of units to move. A positive value moves the range forward; a negative value
     * 				moves it backward.
     * @param {Pointer<Int32>} pRetVal Type: <b>int*</b>
     * 
     * When this function returns, contains 
     * 				the number of units the endpoint actually moved.
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_moveendpointbyunit
     * @since windows5.1.2600
     */
    static TextRange_MoveEndpointByUnit(hobj, endpoint, unit, count, pRetVal) {
        result := DllCall("UIAutomationCore.dll\TextRange_MoveEndpointByUnit", "ptr", hobj, "int", endpoint, "int", unit, "int", count, "ptr", pRetVal, "int")
        return result
    }

    /**
     * Moves an endpoint of one range to the endpoint of another range.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * The text range object whose endpoint is to move.
     * @param {Integer} endpoint Type: <b>TextPatternRangeEndpoint</b>
     * 
     * The endpoint to move (either the start or the end).
     * @param {Pointer<HUIATEXTRANGE>} targetRange Type: <b>HUIATEXTRANGE</b>
     * 
     * The text range that contains the target endpoint.
     * @param {Integer} targetEndpoint Type: <b>TextPatternRangeEndpoint</b>
     * 
     * The target endpoint to move to (either the start or the end).
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_moveendpointbyrange
     * @since windows5.1.2600
     */
    static TextRange_MoveEndpointByRange(hobj, endpoint, targetRange, targetEndpoint) {
        result := DllCall("UIAutomationCore.dll\TextRange_MoveEndpointByRange", "ptr", hobj, "int", endpoint, "ptr", targetRange, "int", targetEndpoint, "int")
        return result
    }

    /**
     * Selects a text range.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * A text range object.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_select
     * @since windows5.1.2600
     */
    static TextRange_Select(hobj) {
        result := DllCall("UIAutomationCore.dll\TextRange_Select", "ptr", hobj, "int")
        return result
    }

    /**
     * Adds to the existing collection of highlighted text in a text container that supports multiple, disjoint selections by highlighting supplementary text corresponding to the calling text range Start and End endpoints.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * A text range object.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_addtoselection
     * @since windows5.1.2600
     */
    static TextRange_AddToSelection(hobj) {
        result := DllCall("UIAutomationCore.dll\TextRange_AddToSelection", "ptr", hobj, "int")
        return result
    }

    /**
     * Removes the selected text, corresponding to the calling text range TextPatternRangeEndpoint_Start and TextPatternRangeEndpoint_End endpoints, from an existing collection of selected text in a text container that supports multiple, disjoint selections.
     * @remarks
     * The text insertion point will move to the area of the new selection.
     *             
     * 
     * Providing a degenerate text range will move the text insertion point.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * A text range object.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_removefromselection
     * @since windows5.1.2600
     */
    static TextRange_RemoveFromSelection(hobj) {
        result := DllCall("UIAutomationCore.dll\TextRange_RemoveFromSelection", "ptr", hobj, "int")
        return result
    }

    /**
     * Scrolls the text so the specified range is visible in the viewport.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * The text range to scroll.
     * @param {Integer} alignToTop Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * TRUE to align the top of the text range with the top of the viewport; 
     * 				FALSE to align the bottom of the text range with the bottom of the viewport.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_scrollintoview
     * @since windows5.1.2600
     */
    static TextRange_ScrollIntoView(hobj, alignToTop) {
        result := DllCall("UIAutomationCore.dll\TextRange_ScrollIntoView", "ptr", hobj, "int", alignToTop, "int")
        return result
    }

    /**
     * Returns all UI Automation elements contained within the specified text range.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * A text range object.
     * @param {Pointer<SAFEARRAY>} pRetVal Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * When this function returns, contains 
     * 				an array of nodes that are children of the text range in the UI Automation tree.
     * 				This parameter is passed uninitialized.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_getchildren
     * @since windows5.1.2600
     */
    static TextRange_GetChildren(hobj, pRetVal) {
        result := DllCall("UIAutomationCore.dll\TextRange_GetChildren", "ptr", hobj, "ptr", pRetVal, "int")
        return result
    }

    /**
     * Retrieves a node within a containing node, based on a specified property value.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The <i>control pattern</i> object.
     * @param {Pointer<HUIANODE>} hnodeStartAfter Type: <b>HUIANODE</b>
     * 
     * The node after which to start the search.
     * @param {Integer} propertyId Type: <b>PROPERTYID</b>
     * 
     * The property identifier. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {Pointer} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
     * 
     * The value of the <i>propertyId</i> property.
     * @param {Pointer<HUIANODE>} pFound Type: <b>HUIANODE*</b>
     * 
     * The node of the matching element.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-itemcontainerpattern_finditembyproperty
     * @since windows6.1
     */
    static ItemContainerPattern_FindItemByProperty(hobj, hnodeStartAfter, propertyId, value, pFound) {
        result := DllCall("UIAutomationCore.dll\ItemContainerPattern_FindItemByProperty", "ptr", hobj, "ptr", hnodeStartAfter, "int", propertyId, "ptr", value, "ptr", pFound, "int")
        return result
    }

    /**
     * Performs a Microsoft Active Accessibility selection. (LegacyIAccessiblePattern_Select)
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The <i>control pattern</i> object.
     * @param {Integer} flagsSelect Type: <b>long</b>
     * 
     * Specifies which selection or focus operations are to be performed. This parameter must have a combination of the values described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/selflag">SELFLAG Constants</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-legacyiaccessiblepattern_select
     * @since windows6.1
     */
    static LegacyIAccessiblePattern_Select(hobj, flagsSelect) {
        result := DllCall("UIAutomationCore.dll\LegacyIAccessiblePattern_Select", "ptr", hobj, "int", flagsSelect, "int")
        return result
    }

    /**
     * Performs the Microsoft Active Accessibility default action for the element. (LegacyIAccessiblePattern_DoDefaultAction)
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The <i>control pattern</i> object.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-legacyiaccessiblepattern_dodefaultaction
     * @since windows6.1
     */
    static LegacyIAccessiblePattern_DoDefaultAction(hobj) {
        result := DllCall("UIAutomationCore.dll\LegacyIAccessiblePattern_DoDefaultAction", "ptr", hobj, "int")
        return result
    }

    /**
     * Sets the Microsoft Active Accessibility value property for the node.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The <i>control pattern</i> object.
     * @param {Pointer<PWSTR>} szValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * A localized string that contains the value.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-legacyiaccessiblepattern_setvalue
     * @since windows6.1
     */
    static LegacyIAccessiblePattern_SetValue(hobj, szValue) {
        szValue := szValue is String? StrPtr(szValue) : szValue

        result := DllCall("UIAutomationCore.dll\LegacyIAccessiblePattern_SetValue", "ptr", hobj, "ptr", szValue, "int")
        return result
    }

    /**
     * Retrieves an IAccessible object that corresponds to the UI Automation element.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * A control pattern object.
     * @param {Pointer<IAccessible>} pAccessible Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>**</b>
     * 
     * The address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface for the accessible object.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-legacyiaccessiblepattern_getiaccessible
     * @since windows6.1
     */
    static LegacyIAccessiblePattern_GetIAccessible(hobj, pAccessible) {
        result := DllCall("UIAutomationCore.dll\LegacyIAccessiblePattern_GetIAccessible", "ptr", hobj, "ptr", pAccessible, "int")
        return result
    }

    /**
     * Causes the UI Automation provider to start listening for mouse or keyboard input.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The <i>control pattern</i> object.
     * @param {Integer} inputType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-synchronizedinputtype">SynchronizedInputType</a></b>
     * 
     * A combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-synchronizedinputtype">SynchronizedInputType</a> enumerated type specifying the type of input for which to listen.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-synchronizedinputpattern_startlistening
     * @since windows6.1
     */
    static SynchronizedInputPattern_StartListening(hobj, inputType) {
        result := DllCall("UIAutomationCore.dll\SynchronizedInputPattern_StartListening", "ptr", hobj, "int", inputType, "int")
        return result
    }

    /**
     * Causes the UI Automation provider to stop listening for mouse or keyboard input.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The <i>control pattern</i> object.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-synchronizedinputpattern_cancel
     * @since windows6.1
     */
    static SynchronizedInputPattern_Cancel(hobj) {
        result := DllCall("UIAutomationCore.dll\SynchronizedInputPattern_Cancel", "ptr", hobj, "int")
        return result
    }

    /**
     * Makes the virtual item fully accessible as a UI Automation element. (VirtualizedItemPattern_Realize)
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The <i>control pattern</i> object.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-virtualizeditempattern_realize
     * @since windows6.1
     */
    static VirtualizedItemPattern_Realize(hobj) {
        result := DllCall("UIAutomationCore.dll\VirtualizedItemPattern_Realize", "ptr", hobj, "int")
        return result
    }

    /**
     * Deletes an allocated pattern object from memory.
     * @param {Pointer<HUIAPATTERNOBJECT>} hobj Type: <b>HUIAPATTERNOBJECT</b>
     * 
     * The pattern object to be deleted.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the pattern was successfully deleted; otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiapatternrelease
     * @since windows5.1.2600
     */
    static UiaPatternRelease(hobj) {
        result := DllCall("UIAutomationCore.dll\UiaPatternRelease", "ptr", hobj, "int")
        return result
    }

    /**
     * Deletes an allocated text range object from memory.
     * @param {Pointer<HUIATEXTRANGE>} hobj Type: <b>HUIATEXTRANGE</b>
     * 
     * The text range object to be deleted.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if object was deleted; otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiatextrangerelease
     * @since windows5.1.2600
     */
    static UiaTextRangeRelease(hobj) {
        result := DllCall("UIAutomationCore.dll\UiaTextRangeRelease", "ptr", hobj, "int")
        return result
    }

    /**
     * Gets an interface to the UI Automation provider for a window.
     * @remarks
     * This function is called by a control when it receives the [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message, to provide UI Automation with the UI Automation provider for the control. The control should pass the <i>wParam</i> and <i>lParam</i> parameters to the <b>UiaReturnRawElementProvider</b> function without filtering them first, because filtering can cause problems with Microsoft Active Accessibility clients. The control's window procedure should return the result of calling <b>UiaReturnRawElementProvider</b>.
     * 
     * When Microsoft Active Accessibility clients are listening to events raised by a UI Automation provider, UI Automation maintains a map of the providers that have raised events. When the Microsoft Active Accessibility clients request further information, UI Automation uses the map to route the requests to the appropriate providers. When a window that previously returned providers has been destroyed, you should notify UI Automation by calling the <b>UiaReturnRawElementProvider</b> function as follows: <c>UiaReturnRawElementProvider(hwnd, 0, 0, NULL)</c>. This call tells UI Automation that it can safely remove all map entries that refer to the specified window. This call can save memory because it releases references to the providers being held by the raised-event map. The function returns zero when called with these special parameters. Microsoft recommends making this call from the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-destroy">WM_DESTROY</a> message handler of the window that returns the UI Automation providers.
     * @param {Pointer<HWND>} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The handle of the window containing the element served by the provider.
     * @param {Pointer} wParam Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WPARAM</a></b>
     * 
     * The <i>wParam</i> argument of the [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message.
     * @param {Pointer} lParam Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * The <i>lParam</i> argument of the [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message.
     * @param {Pointer<IRawElementProviderSimple>} el Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * The UI Automation provider.
     * @returns {Pointer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LRESULT</a></b>
     * 
     * The key for the client process to connect to the server process through UI Automation.
     * 
     * This function returns zero when it is used to notify UI Automation that it is safe to remove the provider raised-event map. For more information, see Remarks.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiareturnrawelementprovider
     * @since windows5.1.2600
     */
    static UiaReturnRawElementProvider(hwnd, wParam, lParam, el) {
        result := DllCall("UIAutomationCore.dll\UiaReturnRawElementProvider", "ptr", hwnd, "ptr", wParam, "ptr", lParam, "ptr", el, "ptr")
        return result
    }

    /**
     * Gets the host provider for a window.
     * @remarks
     * The object retrieved by this function is useful only for responding to calls to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementprovidersimple-get_hostrawelementprovider">IRawElementProviderSimple::get_HostRawElementProvider</a> method. You cannot use the object to raise events, provide properties, and so on.  If you need to raise events or provide properties, you must create a provider object that fully implements the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> interface.
     * @param {Pointer<HWND>} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The window containing the element served by the provider.
     * @param {Pointer<IRawElementProviderSimple>} ppProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>**</b>
     * 
     * The host provider for the window.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiahostproviderfromhwnd
     * @since windows5.1.2600
     */
    static UiaHostProviderFromHwnd(hwnd, ppProvider) {
        result := DllCall("UIAutomationCore.dll\UiaHostProviderFromHwnd", "ptr", hwnd, "ptr", ppProvider, "int")
        return result
    }

    /**
     * Gets the provider for the entire non-client area of a window, or for a control in the non-client area of a window.
     * @remarks
     * This function returns the default Microsoft UI Automation provider for the non-client area of a window.  UI Automation supports the non-client area without any explicit help from the window. You can override and customize the support by using the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> interface that is retrieved by this function.  
     * 
     * This function is particularly useful when you use it with the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-provideroptions">ProviderOptions_RefuseNonClientSupport</a> flag, which disables the UI Automation default provider for the non-client area so that the window can supply  its own provider.
     * 
     * 
     * 
     * The supported object IDs for controls in the non-client area include <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_WINDOW</a><a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">, OBJID_VSCROLL</a>, <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_HSCROLL</a>, <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_TITLEBAR</a>, <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_MENU</a>, and <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_SIZEGRIP</a>.  For <b>OBJID_TITLEBAR</b>, use the child ID to distinguish between the entire title bar and the buttons that it contains.
     * @param {Pointer<HWND>} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The window that owns the non-client area or non-client control.
     * @param {Integer} idObject Type: <b>long</b>
     * 
     * The object identifier of the non-client control, or <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_WINDOW</a> for the entire non-client area. For a list of possible values, see <b>Object Identifiers</b>.
     * @param {Integer} idChild Type: <b>long</b>
     * 
     * The child identifier of the non-client control.
     * @param {Pointer<IRawElementProviderSimple>} ppProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>**</b>
     * 
     * Receives the provider for the non-client area or non-client control.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaproviderfornonclient
     * @since windows8.0
     */
    static UiaProviderForNonClient(hwnd, idObject, idChild, ppProvider) {
        result := DllCall("UIAutomationCore.dll\UiaProviderForNonClient", "ptr", hwnd, "int", idObject, "int", idChild, "ptr", ppProvider, "int")
        return result
    }

    /**
     * Retrieves an IAccessible implementation that provides Microsoft Active Accessibility data on behalf of a Microsoft UI Automation provider.
     * @remarks
     * In most cases, this function retrieves a wrapper object, provided by Windows, that implements <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> on behalf of the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> object.  If the provided <b>IRawElementProviderSimple</b> pointer is itself a wrapper object, this function retrieves the wrapped <b>IAccessible</b> pointer and returns that instead, to prevent the creation of multiple layers of wrappers.
     * @param {Pointer<IRawElementProviderSimple>} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * A pointer to the UI Automation object.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * @param {Pointer<IAccessible>} ppAccessible Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>**</b>
     * 
     * Receives the pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> implementation for the provider.
     * @param {Pointer<VARIANT>} pvarChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>*</b>
     * 
     * Receives the child identifier of the accessible element in the <b>lVal</b> member.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaiaccessiblefromprovider
     * @since windows8.0
     */
    static UiaIAccessibleFromProvider(pProvider, dwFlags, ppAccessible, pvarChild) {
        result := DllCall("UIAutomationCore.dll\UiaIAccessibleFromProvider", "ptr", pProvider, "uint", dwFlags, "ptr", ppAccessible, "ptr", pvarChild, "int")
        return result
    }

    /**
     * Creates a Microsoft UI Automation provider based on the specified Microsoft Active Accessibility object.
     * @remarks
     * UI Automation provides backward compatibility for Microsoft Active Accessibility providers by supplying a proxy for them, called the Microsoft Active Accessibility to UI Automation proxy.  This proxy is created automatically when a window responds to a [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message by returning a Microsoft Active Accessibility provider.  Use <b>UiaProviderFromIAccessible</b> when you need to create a Microsoft Active Accessibility to UI Automation proxy manually; for example, when implementing the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iaccessibleex">IAccessibleEx</a> interface.  
     * 
     * Some properties, such as LabeledBy, must be expressed as a UI Automation provider.  An <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iaccessibleex">IAccessibleEx</a> provider can use <b>UiaProviderFromIAccessible</b> to wrap an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> object to return it as the value of the LabeledBy property.
     * @param {Pointer<IAccessible>} pAccessible Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>*</b>
     * 
     * A pointer to the Microsoft Active Accessibility object.
     * @param {Integer} idChild Type: <b>long</b>
     * 
     * The child ID of the Microsoft Active Accessibility object.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * @param {Pointer<IRawElementProviderSimple>} ppProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>**</b>
     * 
     * The new UI Automation provider.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaproviderfromiaccessible
     * @since windows8.0
     */
    static UiaProviderFromIAccessible(pAccessible, idChild, dwFlags, ppProvider) {
        result := DllCall("UIAutomationCore.dll\UiaProviderFromIAccessible", "ptr", pAccessible, "int", idChild, "uint", dwFlags, "ptr", ppProvider, "int")
        return result
    }

    /**
     * Releases all Microsoft UI Automation resources that are held by all providers associated with the calling process.
     * @remarks
     * A provider application should use this function to release UI Automation resources before shutting down.
     * 
     * This function cannot be called in response to a call to the <a href="https://docs.microsoft.com/windows/desktop/DevNotes/-sendmessage">SendMessage</a> function. An application cannot make outbound Component Object Model (COM) calls in response to a call to <b>SendMessage</b>, and releasing a provider is typically an outbound COM call.  The <b>UiaDisconnectAllProviders</b> function returns RPC_E_CANTCALLOUT_ININPUTSYNCCALL if the function is called in response to a <b>SendMessage</b> call.  You can use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-insendmessageex">InSendMessageEx</a> function to determine whether a particular message is being handled in response to a <b>SendMessage</b> call.
     * 
     * 
     * An application that calls <b>UiaDisconnectAllProviders</b> should not respond to a re-entrant [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message by returning a pointer to the provider that it is trying to disconnect.  If the application tries to disconnect a provider, but then calls the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiareturnrawelementprovider">UiaReturnRawElementProvider</a> function with that same provider during the disconnect attempt, the provider might not be fully disconnected.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiadisconnectallproviders
     * @since windows8.0
     */
    static UiaDisconnectAllProviders() {
        result := DllCall("UIAutomationCore.dll\UiaDisconnectAllProviders", "int")
        return result
    }

    /**
     * Releases all references that a particular provider holds to Microsoft UI Automation objects.
     * @remarks
     * A provider should call this function to clean up UI Automation resources that are associated with a UI element that was destroyed.  The DLL  associated with the UI element can be safely unloaded after the function returns.
     * 
     * After this function returns, all client requests that are associated with the disconnected provider receive the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-error-codes">UIA_E_ELEMENTNOTAVAILABLE</a> 
     * error code.
     * 
     * This function cannot be called in response to a call to the <a href="https://docs.microsoft.com/windows/desktop/DevNotes/-sendmessage">SendMessage</a> function. An application cannot make outbound Component Object Model (COM) calls in response to a call to <b>SendMessage</b>, and releasing a provider is typically an outbound COM call.  The <b>UiaDisconnectProvider</b> function returns RPC_E_CANTCALLOUT_ININPUTSYNCCALL if the function is called in response to a <b>SendMessage</b> call.  You can use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-insendmessageex">InSendMessageEx</a> function to determine whether a particular message is being handled in response to a <b>SendMessage</b> call.
     * 
     * 
     * An application that calls <b>UiaDisconnectProvider</b> should not respond to a re-entrant [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message by returning a pointer to the provider that it is trying to disconnect.  If the application tries to disconnect a provider, but then calls the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiareturnrawelementprovider">UiaReturnRawElementProvider</a> function with that same provider during the disconnect attempt, the provider might not be fully disconnected.
     * @param {Pointer<IRawElementProviderSimple>} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * The provider to be disconnected.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiadisconnectprovider
     * @since windows8.0
     */
    static UiaDisconnectProvider(pProvider) {
        result := DllCall("UIAutomationCore.dll\UiaDisconnectProvider", "ptr", pProvider, "int")
        return result
    }

    /**
     * Ascertains whether a window has a Microsoft UI Automation provider implementation.
     * @param {Pointer<HWND>} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Handle of the window.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the window has a UI Automation provider implementation; otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiahasserversideprovider
     * @since windows5.1.2600
     */
    static UiaHasServerSideProvider(hwnd) {
        result := DllCall("UIAutomationCore.dll\UiaHasServerSideProvider", "ptr", hwnd, "int")
        return result
    }

    /**
     * Allows the caller to register a target window to which all pointer input of the specified type is redirected.
     * @remarks
     * An application with the UI Access privilege can use this function to register its own window to receive all input of the specified pointer input type. Each desktop allows only one such global redirection target window for each pointer input type at any given time. The first window to successfully register remains in effect until the window is unregistered or destroyed, at which point the role is available to the next qualified caller.
     * 
     * While the registration is in effect, all input of the specified pointer type, whether from an input device or injected by an application, is redirected to the registered window. However, when the process that owns the registered window injects input of the specified pointer type, such injected is not redirected but is instead processed normally.
     * 
     * An application that wishes to register the same window as a global redirection target for multiple pointer input types must call the <b>RegisterPointerInputTarget</b> function multiple times, once for each pointer input type of interest.
     * 
     * If the calling thread does not have the UI Access privilege, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>.
     * 
     * If the specified pointer input type is not valid, this function fails with the last error set to <b>ERROR_INVALID_PARAMETER</b>.
     * 
     * If the calling thread does not own the specified window, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>.
     * 
     * If the specified window’s desktop already has a registered global redirection target for the specified pointer input type, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>.
     * @param {Pointer<HWND>} hwnd The window to register as a global redirection target.
     * 
     * Redirection can cause the foreground window to lose activation (focus). To avoid this, ensure the window is a message-only window or has the <a href="https://docs.microsoft.com/windows/desktop/winmsg/extended-window-styles">WS_EX_NOACTIVATE</a> style set.
     * @param {Integer} pointerType Type of pointer input to be redirected to the specified  window. This is any valid and supported value from the <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">POINTER_INPUT_TYPE</a> enumeration. Note that the generic <b>PT_POINTER</b> type and the <b>PT_MOUSE</b> type are not valid in this parameter.
     * @returns {Integer} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-registerpointerinputtarget
     * @since windows8.0
     */
    static RegisterPointerInputTarget(hwnd, pointerType) {
        A_LastError := 0

        result := DllCall("USER32.dll\RegisterPointerInputTarget", "ptr", hwnd, "int", pointerType, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allows the caller to unregister a target window to which all pointer input of the specified type is redirected.
     * @remarks
     * An application that has successfully called the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerpointerinputtarget">RegisterPointerInputTarget</a> function can call this function to un-register the window from the role of global redirected target for the specified pointer type.
     * 
     * An application that has registered the same window as a global redirection target for multiple pointer input types can call the <b>UnregisterPointerInputTarget</b> to un-register the window for one of those types while leaving the window registered for the remaining types.
     * 
     * If the calling thread does not have the UI Access privilege, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>.
     * 
     * If the specified pointer input type is not valid, this function fails with the last error set to <b>ERROR_INVALID_PARAMETER</b>.
     * 
     * If the calling thread does not own the specified window, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>.
     * 
     * If the specified window is not the registered global redirection target for the specified pointer input type on its desktop, this function takes no action and returns success.
     * @param {Pointer<HWND>} hwnd Window to be un-registered as a global redirection target on its desktop.
     * @param {Integer} pointerType Type of pointer input to no longer be redirected to the specified window. This is any valid and supported value from the <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">POINTER_INPUT_TYPE </a> enumeration. Note that the generic <b>PT_POINTER</b> type and the<b> PT_MOUSE</b> type are not valid in this parameter.
     * @returns {Integer} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-unregisterpointerinputtarget
     * @since windows8.0
     */
    static UnregisterPointerInputTarget(hwnd, pointerType) {
        A_LastError := 0

        result := DllCall("USER32.dll\UnregisterPointerInputTarget", "ptr", hwnd, "int", pointerType, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * RegisterPointerInputTargetEx may be altered or unavailable. Instead, use RegisterPointerInputTarget.
     * @param {Pointer<HWND>} hwnd Not supported.
     * @param {Integer} pointerType Not supported.
     * @param {Integer} fObserve Not supported.
     * @returns {Integer} Not supported.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-registerpointerinputtargetex
     * @since windows10.0.10240
     */
    static RegisterPointerInputTargetEx(hwnd, pointerType, fObserve) {
        result := DllCall("USER32.dll\RegisterPointerInputTargetEx", "ptr", hwnd, "int", pointerType, "int", fObserve, "int")
        return result
    }

    /**
     * UnregisterPointerInputTargetEx may be altered or unavailable. Instead, use UnregisterPointerInputTarget.
     * @param {Pointer<HWND>} hwnd Not supported.
     * @param {Integer} pointerType Not supported.
     * @returns {Integer} Not supported.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-unregisterpointerinputtargetex
     * @since windows10.0.10240
     */
    static UnregisterPointerInputTargetEx(hwnd, pointerType) {
        result := DllCall("USER32.dll\UnregisterPointerInputTargetEx", "ptr", hwnd, "int", pointerType, "int")
        return result
    }

    /**
     * Signals the system that a predefined event occurred. If any client applications have registered a hook function for the event, the system calls the client's hook function.
     * @remarks
     * Servers call this function to notify the system that an event has occurred. Microsoft Active Accessibility checks to see if any client applications have set hook procedures for the event and, if so, calls the appropriate hook procedures.
     * 
     * If no hook procedures are registered for the event, the performance penalty for calling this function is minor.
     * 
     * Servers call <b>NotifyWinEvent</b> to announce the event to the system after the event has occurred; they must never notify the system of an event before the event has occurred.
     * 
     * When the client's hook procedure is called, it receives a number of parameters that describe the event and the object that generated the event. The hook procedure uses the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-accessibleobjectfromevent">AccessibleObjectFromEvent</a> function to retrieve a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface of the object that generated the event.
     * 
     * Servers may receive a [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message immediately after calling this function. This can happen if there are any in-context clients that call <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-accessibleobjectfromevent">AccessibleObjectFromEvent</a> in the event callback.
     * 
     * When servers call this function, they must be ready to handle [WM_GETOBJECT](/windows/win32/winauto/wm-getobject), return an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface pointer, and handle any of the <b>IAccessible</b> methods.
     * 
     * <b>Note to Server Developers:  </b>When you call <b>NotifyWinEvent</b>, if any clients are listening for that event in-context, their event handlers, which typically send [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) and call <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> methods, will execute before <b>NotifyWinEvent</b> returns. When you call <b>NotifyWinEvent</b>, you should be prepared to handle these calls, if they occur. If you need to do extra setup to allow for this, you should do so before you call <b>NotifyWinEvent</b>, not after.
     * @param {Integer} event Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the event that occurred. This value must be one of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/event-constants">event constants</a>.
     * @param {Pointer<HWND>} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Handle to the window that contains the object that generated the event.
     * @param {Integer} idObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Identifies the object that generated the event. This value is either one of the predefined <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">object identifiers</a> or a custom object ID value.
     * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Identifies whether the event was generated by an object or by a child element of the object. If this value is CHILDID_SELF, the event was generated by the object itself. If not CHILDID_SELF, this value is the child ID of the element that generated the event.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-notifywinevent
     * @since windows5.0
     */
    static NotifyWinEvent(event, hwnd, idObject, idChild) {
        DllCall("USER32.dll\NotifyWinEvent", "uint", event, "ptr", hwnd, "int", idObject, "int", idChild)
    }

    /**
     * Sets an event hook function for a range of events.
     * @remarks
     * This function allows clients to specify which processes and threads they are interested in.
     * 
     * If the <i>idProcess</i> parameter is nonzero and <i>idThread</i> is zero, the hook function receives the specified events from all threads in that process. If the <i>idProcess</i> parameter is zero and <i>idThread</i> is nonzero, the hook function receives the specified events only from the thread specified by <i>idThread</i>. If both are zero, the hook function receives the specified events from all threads and processes.
     * 
     * Clients can call <b>SetWinEventHook</b> multiple times if they want to register additional hook functions or listen for additional events.
     * 
     * The client thread that calls <b>SetWinEventHook</b> must have a message loop in order to receive events.
     * 
     * When you use <b>SetWinEventHook</b> to set a callback in managed code, you should use the <a href="https://docs.microsoft.com/dotnet/api/system.runtime.interopservices.gchandle">GCHandle</a> structure to avoid exceptions. This tells the garbage collector not to move the callback.
     * 
     * For out-of-context events, the event is delivered on the same thread that called <b>SetWinEventHook</b>. In some situations, even if you request WINEVENT_INCONTEXT events, the events will still be delivered out-of-context. These scenarios include events from console windows and events from processes that have a different bit-depth (64 bit versus 32 bits) than the caller. 
     * 
     * 
     * 
     * While a hook function processes an event, additional events may be triggered, which may cause the hook function to reenter before the processing for the original event is finished. The problem with reentrancy in hook functions is that events are completed out of sequence unless the hook function handles this situation. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/guarding-against-reentrancy-in-hook-functions">Guarding Against Reentrancy</a>.
     * 
     * <b>Windows Store app development</b> If dwFlags is WINEVENT_INCONTEXT AND (idProcess = 0 | idThread = 0), then window hook DLLs are not loaded in-process for the Windows Store app processes and the Windows Runtime broker process unless they are installed by UIAccess processes (accessibility tools). The notification is delivered on the installer's thread.
     * 
     * This behavior is similar to what happens when there is an architecture mismatch between the hook DLL and the target application process, for example, when the hook DLL is 32-bit and the application process 64-bit.
     * @param {Integer} eventMin Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/event-constants">event constant</a> for the lowest event value in the range of events that are handled by the hook function. This parameter can be set to <b>EVENT_MIN</b> to indicate the lowest possible event value.
     * @param {Integer} eventMax Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the event constant for the highest event value in the range of events that are handled by the hook function. This parameter can be  set to <a href="https://docs.microsoft.com/windows/desktop/WinAuto/event-constants">EVENT_MAX</a> to indicate the highest possible event value.
     * @param {Pointer<HMODULE>} hmodWinEventProc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMODULE</a></b>
     * 
     * Handle to the DLL that contains the hook function at <i>lpfnWinEventProc</i>, if the WINEVENT_INCONTEXT flag is specified in the <i>dwFlags</i> parameter. If the hook function is not located in a DLL, or if the WINEVENT_OUTOFCONTEXT flag is specified, this parameter is <b>NULL</b>.
     * @param {Pointer<WINEVENTPROC>} pfnWinEventProc Type: <b>WINEVENTPROC</b>
     * 
     * Pointer to the event hook function. For more information about this function, see <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-wineventproc">WinEventProc</a>.
     * @param {Integer} idProcess Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the ID of the process from which the hook function receives events. Specify zero (0) to receive events from all processes on the current desktop.
     * @param {Integer} idThread Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the ID of the thread from which the hook function receives events. If this parameter is zero, the hook function is associated with all existing threads on the current desktop.
     * @param {Integer} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 
     * Flag values that specify the location of the hook function and of the events to be skipped. The following flags are valid:
     * 			 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINEVENT_INCONTEXT"></a><a id="winevent_incontext"></a><dl>
     * <dt><b>WINEVENT_INCONTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DLL that contains the callback function is mapped into the address space of the process that generates the event. With this flag, the system sends event notifications to the callback function as they occur. The hook function must be in a DLL when this flag is specified. This flag has no effect when both the calling process and the generating process are not 32-bit or 64-bit processes, or when the generating process is a console application. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/in-context-hook-functions">In-Context Hook Functions</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINEVENT_OUTOFCONTEXT"></a><a id="winevent_outofcontext"></a><dl>
     * <dt><b>WINEVENT_OUTOFCONTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The callback function is not mapped into the address space of the process that generates the event. Because the hook function is called across process boundaries, the system must queue events. Although this method is asynchronous, events are guaranteed to be in sequential order. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/out-of-context-hook-functions">Out-of-Context Hook Functions</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINEVENT_SKIPOWNPROCESS"></a><a id="winevent_skipownprocess"></a><dl>
     * <dt><b>WINEVENT_SKIPOWNPROCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prevents this instance of the hook from receiving the events that are generated by threads in this process. This flag does not prevent threads from generating events.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINEVENT_SKIPOWNTHREAD"></a><a id="winevent_skipownthread"></a><dl>
     * <dt><b>WINEVENT_SKIPOWNTHREAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prevents this instance of the hook from receiving the events that are generated by the thread that is registering this hook.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The following flag combinations are valid:
     * 
     * <ul>
     * <li>WINEVENT_INCONTEXT | WINEVENT_SKIPOWNPROCESS</li>
     * <li>WINEVENT_INCONTEXT | WINEVENT_SKIPOWNTHREAD</li>
     * <li>WINEVENT_OUTOFCONTEXT | WINEVENT_SKIPOWNPROCESS</li>
     * <li>WINEVENT_OUTOFCONTEXT | WINEVENT_SKIPOWNTHREAD</li>
     * </ul>
     * Additionally, client applications can specify WINEVENT_INCONTEXT, or WINEVENT_OUTOFCONTEXT alone.
     * 
     * See Remarks section for information on Windows Store app development.
     * @returns {Pointer<HWINEVENTHOOK>} Type: <b>HWINEVENTHOOK</b>
     * 
     * If successful, returns an <a href="https://docs.microsoft.com/windows/desktop/WinAuto/hwineventhook">HWINEVENTHOOK</a> value that identifies this event hook instance. Applications save this return value to use it with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-unhookwinevent">UnhookWinEvent</a> function.
     * 
     * If unsuccessful, returns zero.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setwineventhook
     * @since windows5.0
     */
    static SetWinEventHook(eventMin, eventMax, hmodWinEventProc, pfnWinEventProc, idProcess, idThread, dwFlags) {
        result := DllCall("USER32.dll\SetWinEventHook", "uint", eventMin, "uint", eventMax, "ptr", hmodWinEventProc, "ptr", pfnWinEventProc, "uint", idProcess, "uint", idThread, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * Determines whether there is an installed WinEvent hook that might be notified of a specified event.
     * @remarks
     * This method is guaranteed to never return a false negative. If this method returns <b>FALSE</b>, it means that no hooks in the system would be notified of the event. However, this method may return a false positive. In other words, it may return <b>TRUE</b> even though there are no hooks that would be notified. Thus, it is safe for components to circumvent some work if this method returns <b>FALSE</b>. 
     * 
     * Event hooks can be installed at any time, so server developers should not cache the return value for long periods of time.
     * @param {Integer} event Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The event constant that hooks might be notified of. The function checks whether there is an installed hook for this event constant.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * If there is a hook to be notified of the specified event, the return value is <b>TRUE</b>.
     * 
     * If there are no hooks to be notified of the specified event, the return value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-iswineventhookinstalled
     * @since windows5.1.2600
     */
    static IsWinEventHookInstalled(event) {
        result := DllCall("USER32.dll\IsWinEventHookInstalled", "uint", event, "int")
        return result
    }

    /**
     * Removes an event hook function created by a previous call to SetWinEventHook.
     * @remarks
     * This function removes the event hook specified by <i>hWinEventHook</i> that prevents the corresponding callback function from receiving further event notifications. If the client's thread ends, the system automatically calls this function.
     * 
     * Call this function from the same thread that installed the event hook. <b>UnhookWinEvent</b> fails if called from a thread different from the call that corresponds to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwineventhook">SetWinEventHook</a>.
     * 
     * If WINEVENT_INCONTEXT was specified when this event hook was installed, the system attempts to unload the corresponding DLL from all processes that loaded it. Although unloading does not occur immediately, the hook function is not called after <b>UnhookWinEvent</b> returns. For more information on WINEVENT_INCONTEXT, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/in-context-hook-functions">In-Context Hook Functions</a>.
     * @param {Pointer<HWINEVENTHOOK>} hWinEventHook Type: <b>HWINEVENTHOOK</b>
     * 
     * Handle to the event hook returned in the previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwineventhook">SetWinEventHook</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * If successful, returns <b>TRUE</b>; otherwise, returns <b>FALSE</b>.
     * 
     * Three common errors cause this function to fail:
     * 
     * <ul>
     * <li>The <i>hWinEventHook</i> parameter is <b>NULL</b> or not valid.</li>
     * <li>The event hook specified by <i>hWinEventHook</i> was already removed.</li>
     * <li><b>UnhookWinEvent</b> is called from a thread that is different from the original call to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwineventhook">SetWinEventHook</a>.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-unhookwinevent
     * @since windows5.0
     */
    static UnhookWinEvent(hWinEventHook) {
        result := DllCall("USER32.dll\UnhookWinEvent", "ptr", hWinEventHook, "int")
        return result
    }

;@endregion Methods
}
