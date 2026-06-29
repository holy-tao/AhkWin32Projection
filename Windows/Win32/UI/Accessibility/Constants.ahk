#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.UI.Accessibility
 */

;@region Constants

/**
 * @type {Guid}
 */
export global LIBID_Accessibility := Guid("{1ea4dbf0-3c3b-11cf-810c-00aa00389b71}")

/**
 * @type {Guid}
 */
export global CLSID_AccPropServices := Guid("{b5f8350b-0548-48b1-a6ee-88bd00b4a5e7}")

/**
 * @type {Guid}
 */
export global IIS_IsOleaccProxy := Guid("{902697fa-80e4-4560-802a-a13f22a64709}")

/**
 * @type {Guid}
 */
export global IIS_ControlAccessible := Guid("{38c682a6-9731-43f2-9fae-e901e641b101}")

/**
 * @type {Integer (UInt32)}
 */
export global ANRUS_PRIORITY_AUDIO_DYNAMIC_DUCK := 16

/**
 * @type {Integer (Int32)}
 */
export global MSAA_MENU_SIG := -1441927155

/**
 * @type {Guid}
 */
export global PROPID_ACC_NAME := Guid("{608d3df8-8128-4aa7-a428-f55e49267291}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_VALUE := Guid("{123fe443-211a-4615-9527-c45a7e93717a}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_DESCRIPTION := Guid("{4d48dfe4-bd3f-491f-a648-492d6f20c588}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_ROLE := Guid("{cb905ff2-7bd1-4c05-b3c8-e6c241364d70}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_STATE := Guid("{a8d4d5b0-0a21-42d0-a5c0-514e984f457b}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_HELP := Guid("{c831e11f-44db-4a99-9768-cb8f978b7231}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_KEYBOARDSHORTCUT := Guid("{7d9bceee-7d1e-4979-9382-5180f4172c34}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_DEFAULTACTION := Guid("{180c072b-c27f-43c7-9922-f63562a4632b}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_HELPTOPIC := Guid("{787d1379-8ede-440b-8aec-11f7bf9030b3}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_FOCUS := Guid("{6eb335df-1c29-4127-b12c-dee9fd157f2b}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_SELECTION := Guid("{b99d073c-d731-405b-9061-d95e8f842984}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_PARENT := Guid("{474c22b6-ffc2-467a-b1b5-e958b4657330}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_NAV_UP := Guid("{016e1a2b-1a4e-4767-8612-3386f66935ec}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_NAV_DOWN := Guid("{031670ed-3cdf-48d2-9613-138f2dd8a668}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_NAV_LEFT := Guid("{228086cb-82f1-4a39-8705-dcdc0fff92f5}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_NAV_RIGHT := Guid("{cd211d9f-e1cb-4fe5-a77c-920b884d095b}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_NAV_PREV := Guid("{776d3891-c73b-4480-b3f6-076a16a15af6}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_NAV_NEXT := Guid("{1cdc5455-8cd9-4c92-a371-3939a2fe3eee}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_NAV_FIRSTCHILD := Guid("{cfd02558-557b-4c67-84f9-2a09fce40749}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_NAV_LASTCHILD := Guid("{302ecaa5-48d5-4f8d-b671-1a8d20a77832}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_ROLEMAP := Guid("{f79acda2-140d-4fe6-8914-208476328269}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_VALUEMAP := Guid("{da1c3d79-fc5c-420e-b399-9d1533549e75}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_STATEMAP := Guid("{43946c5e-0ac0-4042-b525-07bbdbe17fa7}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_DESCRIPTIONMAP := Guid("{1ff1435f-8a14-477b-b226-a0abe279975d}")

/**
 * @type {Guid}
 */
export global PROPID_ACC_DODEFAULTACTION := Guid("{1ba09523-2e3b-49a6-a059-59682a3c48fd}")

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_PARENT := -5000

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_CHILDCOUNT := -5001

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_CHILD := -5002

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_NAME := -5003

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_VALUE := -5004

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_DESCRIPTION := -5005

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_ROLE := -5006

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_STATE := -5007

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_HELP := -5008

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_HELPTOPIC := -5009

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_KEYBOARDSHORTCUT := -5010

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_FOCUS := -5011

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_SELECTION := -5012

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_DEFAULTACTION := -5013

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_SELECT := -5014

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_LOCATION := -5015

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_NAVIGATE := -5016

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_HITTEST := -5017

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACC_DODEFAULTACTION := -5018

/**
 * @type {Integer (UInt32)}
 */
export global NAVDIR_MIN := 0

/**
 * @type {Integer (UInt32)}
 */
export global NAVDIR_UP := 1

/**
 * @type {Integer (UInt32)}
 */
export global NAVDIR_DOWN := 2

/**
 * @type {Integer (UInt32)}
 */
export global NAVDIR_LEFT := 3

/**
 * @type {Integer (UInt32)}
 */
export global NAVDIR_RIGHT := 4

/**
 * @type {Integer (UInt32)}
 */
export global NAVDIR_NEXT := 5

/**
 * @type {Integer (UInt32)}
 */
export global NAVDIR_PREVIOUS := 6

/**
 * @type {Integer (UInt32)}
 */
export global NAVDIR_FIRSTCHILD := 7

/**
 * @type {Integer (UInt32)}
 */
export global NAVDIR_LASTCHILD := 8

/**
 * @type {Integer (UInt32)}
 */
export global NAVDIR_MAX := 9

/**
 * @type {Integer (UInt32)}
 */
export global SELFLAG_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SELFLAG_TAKEFOCUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SELFLAG_TAKESELECTION := 2

/**
 * @type {Integer (UInt32)}
 */
export global SELFLAG_EXTENDSELECTION := 4

/**
 * @type {Integer (UInt32)}
 */
export global SELFLAG_ADDSELECTION := 8

/**
 * @type {Integer (UInt32)}
 */
export global SELFLAG_REMOVESELECTION := 16

/**
 * @type {Integer (UInt32)}
 */
export global SELFLAG_VALID := 31

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_HASPOPUP := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_TITLEBAR := 1

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_MENUBAR := 2

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_SCROLLBAR := 3

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_GRIP := 4

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_SOUND := 5

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_CURSOR := 6

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_CARET := 7

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_ALERT := 8

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_WINDOW := 9

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_CLIENT := 10

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_MENUPOPUP := 11

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_MENUITEM := 12

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_TOOLTIP := 13

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_APPLICATION := 14

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_DOCUMENT := 15

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_PANE := 16

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_CHART := 17

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_DIALOG := 18

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_BORDER := 19

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_GROUPING := 20

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_SEPARATOR := 21

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_TOOLBAR := 22

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_STATUSBAR := 23

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_TABLE := 24

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_COLUMNHEADER := 25

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_ROWHEADER := 26

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_COLUMN := 27

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_ROW := 28

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_CELL := 29

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_LINK := 30

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_HELPBALLOON := 31

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_CHARACTER := 32

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_LIST := 33

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_LISTITEM := 34

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_OUTLINE := 35

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_OUTLINEITEM := 36

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_PAGETAB := 37

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_PROPERTYPAGE := 38

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_INDICATOR := 39

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_GRAPHIC := 40

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_STATICTEXT := 41

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_TEXT := 42

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_PUSHBUTTON := 43

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_CHECKBUTTON := 44

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_RADIOBUTTON := 45

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_COMBOBOX := 46

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_DROPLIST := 47

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_PROGRESSBAR := 48

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_DIAL := 49

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_HOTKEYFIELD := 50

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_SLIDER := 51

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_SPINBUTTON := 52

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_DIAGRAM := 53

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_ANIMATION := 54

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_EQUATION := 55

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_BUTTONDROPDOWN := 56

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_BUTTONMENU := 57

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_BUTTONDROPDOWNGRID := 58

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_WHITESPACE := 59

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_PAGETABLIST := 60

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_CLOCK := 61

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_SPLITBUTTON := 62

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_IPADDRESS := 63

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_SYSTEM_OUTLINEBUTTON := 64

/**
 * @type {Integer (UInt32)}
 */
export global UIA_E_ELEMENTNOTENABLED := 2147746304

/**
 * @type {Integer (UInt32)}
 */
export global UIA_E_ELEMENTNOTAVAILABLE := 2147746305

/**
 * @type {Integer (UInt32)}
 */
export global UIA_E_NOCLICKABLEPOINT := 2147746306

/**
 * @type {Integer (UInt32)}
 */
export global UIA_E_PROXYASSEMBLYNOTLOADED := 2147746307

/**
 * @type {Integer (UInt32)}
 */
export global UIA_E_NOTSUPPORTED := 2147746308

/**
 * @type {Integer (UInt32)}
 */
export global UIA_E_INVALIDOPERATION := 2148734217

/**
 * @type {Integer (UInt32)}
 */
export global UIA_E_TIMEOUT := 2148734213

/**
 * @type {Integer (UInt32)}
 */
export global UiaAppendRuntimeId := 3

/**
 * @type {Integer (Int32)}
 */
export global UiaRootObjectId := -25

/**
 * @type {Guid}
 */
export global RuntimeId_Property_GUID := Guid("{a39eebfa-7fba-4c89-b4d4-b99e2de7d160}")

/**
 * @type {Guid}
 */
export global BoundingRectangle_Property_GUID := Guid("{7bbfe8b2-3bfc-48dd-b729-c794b846e9a1}")

/**
 * @type {Guid}
 */
export global ProcessId_Property_GUID := Guid("{40499998-9c31-4245-a403-87320e59eaf6}")

/**
 * @type {Guid}
 */
export global ControlType_Property_GUID := Guid("{ca774fea-28ac-4bc2-94ca-acec6d6c10a3}")

/**
 * @type {Guid}
 */
export global LocalizedControlType_Property_GUID := Guid("{8763404f-a1bd-452a-89c4-3f01d3833806}")

/**
 * @type {Guid}
 */
export global Name_Property_GUID := Guid("{c3a6921b-4a99-44f1-bca6-61187052c431}")

/**
 * @type {Guid}
 */
export global AcceleratorKey_Property_GUID := Guid("{514865df-2557-4cb9-aeed-6ced084ce52c}")

/**
 * @type {Guid}
 */
export global AccessKey_Property_GUID := Guid("{06827b12-a7f9-4a15-917c-ffa5ad3eb0a7}")

/**
 * @type {Guid}
 */
export global HasKeyboardFocus_Property_GUID := Guid("{cf8afd39-3f46-4800-9656-b2bf12529905}")

/**
 * @type {Guid}
 */
export global IsKeyboardFocusable_Property_GUID := Guid("{f7b8552a-0859-4b37-b9cb-51e72092f29f}")

/**
 * @type {Guid}
 */
export global IsEnabled_Property_GUID := Guid("{2109427f-da60-4fed-bf1b-264bdce6eb3a}")

/**
 * @type {Guid}
 */
export global AutomationId_Property_GUID := Guid("{c82c0500-b60e-4310-a267-303c531f8ee5}")

/**
 * @type {Guid}
 */
export global ClassName_Property_GUID := Guid("{157b7215-894f-4b65-84e2-aac0da08b16b}")

/**
 * @type {Guid}
 */
export global HelpText_Property_GUID := Guid("{08555685-0977-45c7-a7a6-abaf5684121a}")

/**
 * @type {Guid}
 */
export global ClickablePoint_Property_GUID := Guid("{0196903b-b203-4818-a9f3-f08e675f2341}")

/**
 * @type {Guid}
 */
export global Culture_Property_GUID := Guid("{e2d74f27-3d79-4dc2-b88b-3044963a8afb}")

/**
 * @type {Guid}
 */
export global IsControlElement_Property_GUID := Guid("{95f35085-abcc-4afd-a5f4-dbb46c230fdb}")

/**
 * @type {Guid}
 */
export global IsContentElement_Property_GUID := Guid("{4bda64a8-f5d8-480b-8155-ef2e89adb672}")

/**
 * @type {Guid}
 */
export global LabeledBy_Property_GUID := Guid("{e5b8924b-fc8a-4a35-8031-cf78ac43e55e}")

/**
 * @type {Guid}
 */
export global IsPassword_Property_GUID := Guid("{e8482eb1-687c-497b-bebc-03be53ec1454}")

/**
 * @type {Guid}
 */
export global NewNativeWindowHandle_Property_GUID := Guid("{5196b33b-380a-4982-95e1-91f3ef60e024}")

/**
 * @type {Guid}
 */
export global ItemType_Property_GUID := Guid("{cdda434d-6222-413b-a68a-325dd1d40f39}")

/**
 * @type {Guid}
 */
export global IsOffscreen_Property_GUID := Guid("{03c3d160-db79-42db-a2ef-1c231eede507}")

/**
 * @type {Guid}
 */
export global Orientation_Property_GUID := Guid("{a01eee62-3884-4415-887e-678ec21e39ba}")

/**
 * @type {Guid}
 */
export global FrameworkId_Property_GUID := Guid("{dbfd9900-7e1a-4f58-b61b-7063120f773b}")

/**
 * @type {Guid}
 */
export global IsRequiredForForm_Property_GUID := Guid("{4f5f43cf-59fb-4bde-a270-602e5e1141e9}")

/**
 * @type {Guid}
 */
export global ItemStatus_Property_GUID := Guid("{51de0321-3973-43e7-8913-0b08e813c37f}")

/**
 * @type {Guid}
 */
export global AriaRole_Property_GUID := Guid("{dd207b95-be4a-4e0d-b727-63ace94b6916}")

/**
 * @type {Guid}
 */
export global AriaProperties_Property_GUID := Guid("{4213678c-e025-4922-beb5-e43ba08e6221}")

/**
 * @type {Guid}
 */
export global IsDataValidForForm_Property_GUID := Guid("{445ac684-c3fc-4dd9-acf8-845a579296ba}")

/**
 * @type {Guid}
 */
export global ControllerFor_Property_GUID := Guid("{51124c8a-a5d2-4f13-9be6-7fa8ba9d3a90}")

/**
 * @type {Guid}
 */
export global DescribedBy_Property_GUID := Guid("{7c5865b8-9992-40fd-8db0-6bf1d317f998}")

/**
 * @type {Guid}
 */
export global FlowsTo_Property_GUID := Guid("{e4f33d20-559a-47fb-a830-f9cb4ff1a70a}")

/**
 * @type {Guid}
 */
export global ProviderDescription_Property_GUID := Guid("{dca5708a-c16b-4cd9-b889-beb16a804904}")

/**
 * @type {Guid}
 */
export global OptimizeForVisualContent_Property_GUID := Guid("{6a852250-c75a-4e5d-b858-e381b0f78861}")

/**
 * @type {Guid}
 */
export global IsDockPatternAvailable_Property_GUID := Guid("{2600a4c4-2ff8-4c96-ae31-8fe619a13c6c}")

/**
 * @type {Guid}
 */
export global IsExpandCollapsePatternAvailable_Property_GUID := Guid("{929d3806-5287-4725-aa16-222afc63d595}")

/**
 * @type {Guid}
 */
export global IsGridItemPatternAvailable_Property_GUID := Guid("{5a43e524-f9a2-4b12-84c8-b48a3efedd34}")

/**
 * @type {Guid}
 */
export global IsGridPatternAvailable_Property_GUID := Guid("{5622c26c-f0ef-4f3b-97cb-714c0868588b}")

/**
 * @type {Guid}
 */
export global IsInvokePatternAvailable_Property_GUID := Guid("{4e725738-8364-4679-aa6c-f3f41931f750}")

/**
 * @type {Guid}
 */
export global IsMultipleViewPatternAvailable_Property_GUID := Guid("{ff0a31eb-8e25-469d-8d6e-e771a27c1b90}")

/**
 * @type {Guid}
 */
export global IsRangeValuePatternAvailable_Property_GUID := Guid("{fda4244a-eb4d-43ff-b5ad-ed36d373ec4c}")

/**
 * @type {Guid}
 */
export global IsScrollPatternAvailable_Property_GUID := Guid("{3ebb7b4a-828a-4b57-9d22-2fea1632ed0d}")

/**
 * @type {Guid}
 */
export global IsScrollItemPatternAvailable_Property_GUID := Guid("{1cad1a05-0927-4b76-97e1-0fcdb209b98a}")

/**
 * @type {Guid}
 */
export global IsSelectionItemPatternAvailable_Property_GUID := Guid("{8becd62d-0bc3-4109-bee2-8e6715290e68}")

/**
 * @type {Guid}
 */
export global IsSelectionPatternAvailable_Property_GUID := Guid("{f588acbe-c769-4838-9a60-2686dc1188c4}")

/**
 * @type {Guid}
 */
export global IsTablePatternAvailable_Property_GUID := Guid("{cb83575f-45c2-4048-9c76-159715a139df}")

/**
 * @type {Guid}
 */
export global IsTableItemPatternAvailable_Property_GUID := Guid("{eb36b40d-8ea4-489b-a013-e60d5951fe34}")

/**
 * @type {Guid}
 */
export global IsTextPatternAvailable_Property_GUID := Guid("{fbe2d69d-aff6-4a45-82e2-fc92a82f5917}")

/**
 * @type {Guid}
 */
export global IsTogglePatternAvailable_Property_GUID := Guid("{78686d53-fcd0-4b83-9b78-5832ce63bb5b}")

/**
 * @type {Guid}
 */
export global IsTransformPatternAvailable_Property_GUID := Guid("{a7f78804-d68b-4077-a5c6-7a5ea1ac31c5}")

/**
 * @type {Guid}
 */
export global IsValuePatternAvailable_Property_GUID := Guid("{0b5020a7-2119-473b-be37-5ceb98bbfb22}")

/**
 * @type {Guid}
 */
export global IsWindowPatternAvailable_Property_GUID := Guid("{e7a57bb1-5888-4155-98dc-b422fd57f2bc}")

/**
 * @type {Guid}
 */
export global IsLegacyIAccessiblePatternAvailable_Property_GUID := Guid("{d8ebd0c7-929a-4ee7-8d3a-d3d94413027b}")

/**
 * @type {Guid}
 */
export global IsItemContainerPatternAvailable_Property_GUID := Guid("{624b5ca7-fe40-4957-a019-20c4cf11920f}")

/**
 * @type {Guid}
 */
export global IsVirtualizedItemPatternAvailable_Property_GUID := Guid("{302cb151-2ac8-45d6-977b-d2b3a5a53f20}")

/**
 * @type {Guid}
 */
export global IsSynchronizedInputPatternAvailable_Property_GUID := Guid("{75d69cc5-d2bf-4943-876e-b45b62a6cc66}")

/**
 * @type {Guid}
 */
export global IsObjectModelPatternAvailable_Property_GUID := Guid("{6b21d89b-2841-412f-8ef2-15ca952318ba}")

/**
 * @type {Guid}
 */
export global IsAnnotationPatternAvailable_Property_GUID := Guid("{0b5b3238-6d5c-41b6-bcc4-5e807f6551c4}")

/**
 * @type {Guid}
 */
export global IsTextPattern2Available_Property_GUID := Guid("{41cf921d-e3f1-4b22-9c81-e1c3ed331c22}")

/**
 * @type {Guid}
 */
export global IsTextEditPatternAvailable_Property_GUID := Guid("{7843425c-8b32-484c-9ab5-e3200571ffda}")

/**
 * @type {Guid}
 */
export global IsCustomNavigationPatternAvailable_Property_GUID := Guid("{8f8e80d4-2351-48e0-874a-54aa7313889a}")

/**
 * @type {Guid}
 */
export global IsStylesPatternAvailable_Property_GUID := Guid("{27f353d3-459c-4b59-a490-50611dacafb5}")

/**
 * @type {Guid}
 */
export global IsSpreadsheetPatternAvailable_Property_GUID := Guid("{6ff43732-e4b4-4555-97bc-ecdbbc4d1888}")

/**
 * @type {Guid}
 */
export global IsSpreadsheetItemPatternAvailable_Property_GUID := Guid("{9fe79b2a-2f94-43fd-996b-549e316f4acd}")

/**
 * @type {Guid}
 */
export global IsTransformPattern2Available_Property_GUID := Guid("{25980b4b-be04-4710-ab4a-fda31dbd2895}")

/**
 * @type {Guid}
 */
export global IsTextChildPatternAvailable_Property_GUID := Guid("{559e65df-30ff-43b5-b5ed-5b283b80c7e9}")

/**
 * @type {Guid}
 */
export global IsDragPatternAvailable_Property_GUID := Guid("{e997a7b7-1d39-4ca7-be0f-277fcf5605cc}")

/**
 * @type {Guid}
 */
export global IsDropTargetPatternAvailable_Property_GUID := Guid("{0686b62e-8e19-4aaf-873d-384f6d3b92be}")

/**
 * @type {Guid}
 */
export global IsStructuredMarkupPatternAvailable_Property_GUID := Guid("{b0d4c196-2c0b-489c-b165-a405928c6f3d}")

/**
 * @type {Guid}
 */
export global IsPeripheral_Property_GUID := Guid("{da758276-7ed5-49d4-8e68-ecc9a2d300dd}")

/**
 * @type {Guid}
 */
export global PositionInSet_Property_GUID := Guid("{33d1dc54-641e-4d76-a6b1-13f341c1f896}")

/**
 * @type {Guid}
 */
export global SizeOfSet_Property_GUID := Guid("{1600d33c-3b9f-4369-9431-aa293f344cf1}")

/**
 * @type {Guid}
 */
export global Level_Property_GUID := Guid("{242ac529-cd36-400f-aad9-7876ef3af627}")

/**
 * @type {Guid}
 */
export global AnnotationTypes_Property_GUID := Guid("{64b71f76-53c4-4696-a219-20e940c9a176}")

/**
 * @type {Guid}
 */
export global AnnotationObjects_Property_GUID := Guid("{310910c8-7c6e-4f20-becd-4aaf6d191156}")

/**
 * @type {Guid}
 */
export global LandmarkType_Property_GUID := Guid("{454045f2-6f61-49f7-a4f8-b5f0cf82da1e}")

/**
 * @type {Guid}
 */
export global LocalizedLandmarkType_Property_GUID := Guid("{7ac81980-eafb-4fb2-bf91-f485bef5e8e1}")

/**
 * @type {Guid}
 */
export global FullDescription_Property_GUID := Guid("{0d4450ff-6aef-4f33-95dd-7befa72a4391}")

/**
 * @type {Guid}
 */
export global Value_Value_Property_GUID := Guid("{e95f5e64-269f-4a85-ba99-4092c3ea2986}")

/**
 * @type {Guid}
 */
export global Value_IsReadOnly_Property_GUID := Guid("{eb090f30-e24c-4799-a705-0d247bc037f8}")

/**
 * @type {Guid}
 */
export global RangeValue_Value_Property_GUID := Guid("{131f5d98-c50c-489d-abe5-ae220898c5f7}")

/**
 * @type {Guid}
 */
export global RangeValue_IsReadOnly_Property_GUID := Guid("{25fa1055-debf-4373-a79e-1f1a1908d3c4}")

/**
 * @type {Guid}
 */
export global RangeValue_Minimum_Property_GUID := Guid("{78cbd3b2-684d-4860-af93-d1f95cb022fd}")

/**
 * @type {Guid}
 */
export global RangeValue_Maximum_Property_GUID := Guid("{19319914-f979-4b35-a1a6-d37e05433473}")

/**
 * @type {Guid}
 */
export global RangeValue_LargeChange_Property_GUID := Guid("{a1f96325-3a3d-4b44-8e1f-4a46d9844019}")

/**
 * @type {Guid}
 */
export global RangeValue_SmallChange_Property_GUID := Guid("{81c2c457-3941-4107-9975-139760f7c072}")

/**
 * @type {Guid}
 */
export global Scroll_HorizontalScrollPercent_Property_GUID := Guid("{c7c13c0e-eb21-47ff-acc4-b5a3350f5191}")

/**
 * @type {Guid}
 */
export global Scroll_HorizontalViewSize_Property_GUID := Guid("{70c2e5d4-fcb0-4713-a9aa-af92ff79e4cd}")

/**
 * @type {Guid}
 */
export global Scroll_VerticalScrollPercent_Property_GUID := Guid("{6c8d7099-b2a8-4948-bff7-3cf9058bfefb}")

/**
 * @type {Guid}
 */
export global Scroll_VerticalViewSize_Property_GUID := Guid("{de6a2e22-d8c7-40c5-83ba-e5f681d53108}")

/**
 * @type {Guid}
 */
export global Scroll_HorizontallyScrollable_Property_GUID := Guid("{8b925147-28cd-49ae-bd63-f44118d2e719}")

/**
 * @type {Guid}
 */
export global Scroll_VerticallyScrollable_Property_GUID := Guid("{89164798-0068-4315-b89a-1e7cfbbc3dfc}")

/**
 * @type {Guid}
 */
export global Selection_Selection_Property_GUID := Guid("{aa6dc2a2-0e2b-4d38-96d5-34e470b81853}")

/**
 * @type {Guid}
 */
export global Selection_CanSelectMultiple_Property_GUID := Guid("{49d73da5-c883-4500-883d-8fcf8daf6cbe}")

/**
 * @type {Guid}
 */
export global Selection_IsSelectionRequired_Property_GUID := Guid("{b1ae4422-63fe-44e7-a5a5-a738c829b19a}")

/**
 * @type {Guid}
 */
export global Grid_RowCount_Property_GUID := Guid("{2a9505bf-c2eb-4fb6-b356-8245ae53703e}")

/**
 * @type {Guid}
 */
export global Grid_ColumnCount_Property_GUID := Guid("{fe96f375-44aa-4536-ac7a-2a75d71a3efc}")

/**
 * @type {Guid}
 */
export global GridItem_Row_Property_GUID := Guid("{6223972a-c945-4563-9329-fdc974af2553}")

/**
 * @type {Guid}
 */
export global GridItem_Column_Property_GUID := Guid("{c774c15c-62c0-4519-8bdc-47be573c8ad5}")

/**
 * @type {Guid}
 */
export global GridItem_RowSpan_Property_GUID := Guid("{4582291c-466b-4e93-8e83-3d1715ec0c5e}")

/**
 * @type {Guid}
 */
export global GridItem_ColumnSpan_Property_GUID := Guid("{583ea3f5-86d0-4b08-a6ec-2c5463ffc109}")

/**
 * @type {Guid}
 */
export global GridItem_Parent_Property_GUID := Guid("{9d912252-b97f-4ecc-8510-ea0e33427c72}")

/**
 * @type {Guid}
 */
export global Dock_DockPosition_Property_GUID := Guid("{6d67f02e-c0b0-4b10-b5b9-18d6ecf98760}")

/**
 * @type {Guid}
 */
export global ExpandCollapse_ExpandCollapseState_Property_GUID := Guid("{275a4c48-85a7-4f69-aba0-af157610002b}")

/**
 * @type {Guid}
 */
export global MultipleView_CurrentView_Property_GUID := Guid("{7a81a67a-b94f-4875-918b-65c8d2f998e5}")

/**
 * @type {Guid}
 */
export global MultipleView_SupportedViews_Property_GUID := Guid("{8d5db9fd-ce3c-4ae7-b788-400a3c645547}")

/**
 * @type {Guid}
 */
export global Window_CanMaximize_Property_GUID := Guid("{64fff53f-635d-41c1-950c-cb5adfbe28e3}")

/**
 * @type {Guid}
 */
export global Window_CanMinimize_Property_GUID := Guid("{b73b4625-5988-4b97-b4c2-a6fe6e78c8c6}")

/**
 * @type {Guid}
 */
export global Window_WindowVisualState_Property_GUID := Guid("{4ab7905f-e860-453e-a30a-f6431e5daad5}")

/**
 * @type {Guid}
 */
export global Window_WindowInteractionState_Property_GUID := Guid("{4fed26a4-0455-4fa2-b21c-c4da2db1ff9c}")

/**
 * @type {Guid}
 */
export global Window_IsModal_Property_GUID := Guid("{ff4e6892-37b9-4fca-8532-ffe674ecfeed}")

/**
 * @type {Guid}
 */
export global Window_IsTopmost_Property_GUID := Guid("{ef7d85d3-0937-4962-9241-b62345f24041}")

/**
 * @type {Guid}
 */
export global SelectionItem_IsSelected_Property_GUID := Guid("{f122835f-cd5f-43df-b79d-4b849e9e6020}")

/**
 * @type {Guid}
 */
export global SelectionItem_SelectionContainer_Property_GUID := Guid("{a4365b6e-9c1e-4b63-8b53-c2421dd1e8fb}")

/**
 * @type {Guid}
 */
export global Table_RowHeaders_Property_GUID := Guid("{d9e35b87-6eb8-4562-aac6-a8a9075236a8}")

/**
 * @type {Guid}
 */
export global Table_ColumnHeaders_Property_GUID := Guid("{aff1d72b-968d-42b1-b459-150b299da664}")

/**
 * @type {Guid}
 */
export global Table_RowOrColumnMajor_Property_GUID := Guid("{83be75c3-29fe-4a30-85e1-2a6277fd106e}")

/**
 * @type {Guid}
 */
export global TableItem_RowHeaderItems_Property_GUID := Guid("{b3f853a0-0574-4cd8-bcd7-ed5923572d97}")

/**
 * @type {Guid}
 */
export global TableItem_ColumnHeaderItems_Property_GUID := Guid("{967a56a3-74b6-431e-8de6-99c411031c58}")

/**
 * @type {Guid}
 */
export global Toggle_ToggleState_Property_GUID := Guid("{b23cdc52-22c2-4c6c-9ded-f5c422479ede}")

/**
 * @type {Guid}
 */
export global Transform_CanMove_Property_GUID := Guid("{1b75824d-208b-4fdf-bccd-f1f4e5741f4f}")

/**
 * @type {Guid}
 */
export global Transform_CanResize_Property_GUID := Guid("{bb98dca5-4c1a-41d4-a4f6-ebc128644180}")

/**
 * @type {Guid}
 */
export global Transform_CanRotate_Property_GUID := Guid("{10079b48-3849-476f-ac96-44a95c8440d9}")

/**
 * @type {Guid}
 */
export global LegacyIAccessible_ChildId_Property_GUID := Guid("{9a191b5d-9ef2-4787-a459-dcde885dd4e8}")

/**
 * @type {Guid}
 */
export global LegacyIAccessible_Name_Property_GUID := Guid("{caeb063d-40ae-4869-aa5a-1b8e5d666739}")

/**
 * @type {Guid}
 */
export global LegacyIAccessible_Value_Property_GUID := Guid("{b5c5b0b6-8217-4a77-97a5-190a85ed0156}")

/**
 * @type {Guid}
 */
export global LegacyIAccessible_Description_Property_GUID := Guid("{46448418-7d70-4ea9-9d27-b7e775cf2ad7}")

/**
 * @type {Guid}
 */
export global LegacyIAccessible_Role_Property_GUID := Guid("{6856e59f-cbaf-4e31-93e8-bcbf6f7e491c}")

/**
 * @type {Guid}
 */
export global LegacyIAccessible_State_Property_GUID := Guid("{df985854-2281-4340-ab9c-c60e2c5803f6}")

/**
 * @type {Guid}
 */
export global LegacyIAccessible_Help_Property_GUID := Guid("{94402352-161c-4b77-a98d-a872cc33947a}")

/**
 * @type {Guid}
 */
export global LegacyIAccessible_KeyboardShortcut_Property_GUID := Guid("{8f6909ac-00b8-4259-a41c-966266d43a8a}")

/**
 * @type {Guid}
 */
export global LegacyIAccessible_Selection_Property_GUID := Guid("{8aa8b1e0-0891-40cc-8b06-90d7d4166219}")

/**
 * @type {Guid}
 */
export global LegacyIAccessible_DefaultAction_Property_GUID := Guid("{3b331729-eaad-4502-b85f-92615622913c}")

/**
 * @type {Guid}
 */
export global Annotation_AnnotationTypeId_Property_GUID := Guid("{20ae484f-69ef-4c48-8f5b-c4938b206ac7}")

/**
 * @type {Guid}
 */
export global Annotation_AnnotationTypeName_Property_GUID := Guid("{9b818892-5ac9-4af9-aa96-f58a77b058e3}")

/**
 * @type {Guid}
 */
export global Annotation_Author_Property_GUID := Guid("{7a528462-9c5c-4a03-a974-8b307a9937f2}")

/**
 * @type {Guid}
 */
export global Annotation_DateTime_Property_GUID := Guid("{99b5ca5d-1acf-414b-a4d0-6b350b047578}")

/**
 * @type {Guid}
 */
export global Annotation_Target_Property_GUID := Guid("{b71b302d-2104-44ad-9c5c-092b4907d70f}")

/**
 * @type {Guid}
 */
export global Styles_StyleId_Property_GUID := Guid("{da82852f-3817-4233-82af-02279e72cc77}")

/**
 * @type {Guid}
 */
export global Styles_StyleName_Property_GUID := Guid("{1c12b035-05d1-4f55-9e8e-1489f3ff550d}")

/**
 * @type {Guid}
 */
export global Styles_FillColor_Property_GUID := Guid("{63eff97a-a1c5-4b1d-84eb-b765f2edd632}")

/**
 * @type {Guid}
 */
export global Styles_FillPatternStyle_Property_GUID := Guid("{81cf651f-482b-4451-a30a-e1545e554fb8}")

/**
 * @type {Guid}
 */
export global Styles_Shape_Property_GUID := Guid("{c71a23f8-778c-400d-8458-3b543e526984}")

/**
 * @type {Guid}
 */
export global Styles_FillPatternColor_Property_GUID := Guid("{939a59fe-8fbd-4e75-a271-ac4595195163}")

/**
 * @type {Guid}
 */
export global Styles_ExtendedProperties_Property_GUID := Guid("{f451cda0-ba0a-4681-b0b0-0dbdb53e58f3}")

/**
 * @type {Guid}
 */
export global SpreadsheetItem_Formula_Property_GUID := Guid("{e602e47d-1b47-4bea-87cf-3b0b0b5c15b6}")

/**
 * @type {Guid}
 */
export global SpreadsheetItem_AnnotationObjects_Property_GUID := Guid("{a3194c38-c9bc-4604-9396-ae3f9f457f7b}")

/**
 * @type {Guid}
 */
export global SpreadsheetItem_AnnotationTypes_Property_GUID := Guid("{c70c51d0-d602-4b45-afbc-b4712b96d72b}")

/**
 * @type {Guid}
 */
export global Transform2_CanZoom_Property_GUID := Guid("{f357e890-a756-4359-9ca6-86702bf8f381}")

/**
 * @type {Guid}
 */
export global LiveSetting_Property_GUID := Guid("{c12bcd8e-2a8e-4950-8ae7-3625111d58eb}")

/**
 * @type {Guid}
 */
export global Drag_IsGrabbed_Property_GUID := Guid("{45f206f3-75cc-4cca-a9b9-fcdfb982d8a2}")

/**
 * @type {Guid}
 */
export global Drag_GrabbedItems_Property_GUID := Guid("{77c1562c-7b86-4b21-9ed7-3cefda6f4c43}")

/**
 * @type {Guid}
 */
export global Drag_DropEffect_Property_GUID := Guid("{646f2779-48d3-4b23-8902-4bf100005df3}")

/**
 * @type {Guid}
 */
export global Drag_DropEffects_Property_GUID := Guid("{f5d61156-7ce6-49be-a836-9269dcec920f}")

/**
 * @type {Guid}
 */
export global DropTarget_DropTargetEffect_Property_GUID := Guid("{8bb75975-a0ca-4981-b818-87fc66e9509d}")

/**
 * @type {Guid}
 */
export global DropTarget_DropTargetEffects_Property_GUID := Guid("{bc1dd4ed-cb89-45f1-a592-e03b08ae790f}")

/**
 * @type {Guid}
 */
export global Transform2_ZoomLevel_Property_GUID := Guid("{eee29f1a-f4a2-4b5b-ac65-95cf93283387}")

/**
 * @type {Guid}
 */
export global Transform2_ZoomMinimum_Property_GUID := Guid("{742ccc16-4ad1-4e07-96fe-b122c6e6b22b}")

/**
 * @type {Guid}
 */
export global Transform2_ZoomMaximum_Property_GUID := Guid("{42ab6b77-ceb0-4eca-b82a-6cfa5fa1fc08}")

/**
 * @type {Guid}
 */
export global FlowsFrom_Property_GUID := Guid("{05c6844f-19de-48f8-95fa-880d5b0fd615}")

/**
 * @type {Guid}
 */
export global FillColor_Property_GUID := Guid("{6e0ec4d0-e2a8-4a56-9de7-953389933b39}")

/**
 * @type {Guid}
 */
export global OutlineColor_Property_GUID := Guid("{c395d6c0-4b55-4762-a073-fd303a634f52}")

/**
 * @type {Guid}
 */
export global FillType_Property_GUID := Guid("{c6fc74e4-8cb9-429c-a9e1-9bc4ac372b62}")

/**
 * @type {Guid}
 */
export global VisualEffects_Property_GUID := Guid("{e61a8565-aad9-46d7-9e70-4e8a8420d420}")

/**
 * @type {Guid}
 */
export global OutlineThickness_Property_GUID := Guid("{13e67cc7-dac2-4888-bdd3-375c62fa9618}")

/**
 * @type {Guid}
 */
export global CenterPoint_Property_GUID := Guid("{0cb00c08-540c-4edb-9445-26359ea69785}")

/**
 * @type {Guid}
 */
export global Rotation_Property_GUID := Guid("{767cdc7d-aec0-4110-ad32-30edd403492e}")

/**
 * @type {Guid}
 */
export global Size_Property_GUID := Guid("{2b5f761d-f885-4404-973f-9b1d98e36d8f}")

/**
 * @type {Guid}
 */
export global ToolTipOpened_Event_GUID := Guid("{3f4b97ff-2edc-451d-bca4-95a3188d5b03}")

/**
 * @type {Guid}
 */
export global ToolTipClosed_Event_GUID := Guid("{276d71ef-24a9-49b6-8e97-da98b401bbcd}")

/**
 * @type {Guid}
 */
export global StructureChanged_Event_GUID := Guid("{59977961-3edd-4b11-b13b-676b2a2a6ca9}")

/**
 * @type {Guid}
 */
export global MenuOpened_Event_GUID := Guid("{ebe2e945-66ca-4ed1-9ff8-2ad7df0a1b08}")

/**
 * @type {Guid}
 */
export global AutomationPropertyChanged_Event_GUID := Guid("{2527fba1-8d7a-4630-a4cc-e66315942f52}")

/**
 * @type {Guid}
 */
export global AutomationFocusChanged_Event_GUID := Guid("{b68a1f17-f60d-41a7-a3cc-b05292155fe0}")

/**
 * @type {Guid}
 */
export global ActiveTextPositionChanged_Event_GUID := Guid("{a5c09e9c-c77d-4f25-b491-e5bb7017cbd4}")

/**
 * @type {Guid}
 */
export global AsyncContentLoaded_Event_GUID := Guid("{5fdee11c-d2fa-4fb9-904e-5cbee894d5ef}")

/**
 * @type {Guid}
 */
export global MenuClosed_Event_GUID := Guid("{3cf1266e-1582-4041-acd7-88a35a965297}")

/**
 * @type {Guid}
 */
export global LayoutInvalidated_Event_GUID := Guid("{ed7d6544-a6bd-4595-9bae-3d28946cc715}")

/**
 * @type {Guid}
 */
export global Invoke_Invoked_Event_GUID := Guid("{dfd699f0-c915-49dd-b422-dde785c3d24b}")

/**
 * @type {Guid}
 */
export global SelectionItem_ElementAddedToSelectionEvent_Event_GUID := Guid("{3c822dd1-c407-4dba-91dd-79d4aed0aec6}")

/**
 * @type {Guid}
 */
export global SelectionItem_ElementRemovedFromSelectionEvent_Event_GUID := Guid("{097fa8a9-7079-41af-8b9c-0934d8305e5c}")

/**
 * @type {Guid}
 */
export global SelectionItem_ElementSelectedEvent_Event_GUID := Guid("{b9c7dbfb-4ebe-4532-aaf4-008cf647233c}")

/**
 * @type {Guid}
 */
export global Selection_InvalidatedEvent_Event_GUID := Guid("{cac14904-16b4-4b53-8e47-4cb1df267bb7}")

/**
 * @type {Guid}
 */
export global Text_TextSelectionChangedEvent_Event_GUID := Guid("{918edaa1-71b3-49ae-9741-79beb8d358f3}")

/**
 * @type {Guid}
 */
export global Text_TextChangedEvent_Event_GUID := Guid("{4a342082-f483-48c4-ac11-a84b435e2a84}")

/**
 * @type {Guid}
 */
export global Window_WindowOpened_Event_GUID := Guid("{d3e81d06-de45-4f2f-9633-de9e02fb65af}")

/**
 * @type {Guid}
 */
export global Window_WindowClosed_Event_GUID := Guid("{edf141f8-fa67-4e22-bbf7-944e05735ee2}")

/**
 * @type {Guid}
 */
export global MenuModeStart_Event_GUID := Guid("{18d7c631-166a-4ac9-ae3b-ef4b5420e681}")

/**
 * @type {Guid}
 */
export global MenuModeEnd_Event_GUID := Guid("{9ecd4c9f-80dd-47b8-8267-5aec06bb2cff}")

/**
 * @type {Guid}
 */
export global InputReachedTarget_Event_GUID := Guid("{93ed549a-0549-40f0-bedb-28e44f7de2a3}")

/**
 * @type {Guid}
 */
export global InputReachedOtherElement_Event_GUID := Guid("{ed201d8a-4e6c-415e-a874-2460c9b66ba8}")

/**
 * @type {Guid}
 */
export global InputDiscarded_Event_GUID := Guid("{7f36c367-7b18-417c-97e3-9d58ddc944ab}")

/**
 * @type {Guid}
 */
export global SystemAlert_Event_GUID := Guid("{d271545d-7a3a-47a7-8474-81d29a2451c9}")

/**
 * @type {Guid}
 */
export global LiveRegionChanged_Event_GUID := Guid("{102d5e90-e6a9-41b6-b1c5-a9b1929d9510}")

/**
 * @type {Guid}
 */
export global HostedFragmentRootsInvalidated_Event_GUID := Guid("{e6bdb03e-0921-4ec5-8dcf-eae877b0426b}")

/**
 * @type {Guid}
 */
export global Drag_DragStart_Event_GUID := Guid("{883a480b-3aa9-429d-95e4-d9c8d011f0dd}")

/**
 * @type {Guid}
 */
export global Drag_DragCancel_Event_GUID := Guid("{c3ede6fa-3451-4e0f-9e71-df9c280a4657}")

/**
 * @type {Guid}
 */
export global Drag_DragComplete_Event_GUID := Guid("{38e96188-ef1f-463e-91ca-3a7792c29caf}")

/**
 * @type {Guid}
 */
export global DropTarget_DragEnter_Event_GUID := Guid("{aad9319b-032c-4a88-961d-1cf579581e34}")

/**
 * @type {Guid}
 */
export global DropTarget_DragLeave_Event_GUID := Guid("{0f82eb15-24a2-4988-9217-de162aee272b}")

/**
 * @type {Guid}
 */
export global DropTarget_Dropped_Event_GUID := Guid("{622cead8-1edb-4a3d-abbc-be2211ff68b5}")

/**
 * @type {Guid}
 */
export global StructuredMarkup_CompositionComplete_Event_GUID := Guid("{c48a3c17-677a-4047-a68d-fc1257528aef}")

/**
 * @type {Guid}
 */
export global StructuredMarkup_Deleted_Event_GUID := Guid("{f9d0a020-e1c1-4ecf-b9aa-52efde7e41e1}")

/**
 * @type {Guid}
 */
export global StructuredMarkup_SelectionChanged_Event_GUID := Guid("{a7c815f7-ff9f-41c7-a3a7-ab6cbfdb4903}")

/**
 * @type {Guid}
 */
export global Invoke_Pattern_GUID := Guid("{d976c2fc-66ea-4a6e-b28f-c24c7546ad37}")

/**
 * @type {Guid}
 */
export global Selection_Pattern_GUID := Guid("{66e3b7e8-d821-4d25-8761-435d2c8b253f}")

/**
 * @type {Guid}
 */
export global Value_Pattern_GUID := Guid("{17faad9e-c877-475b-b933-77332779b637}")

/**
 * @type {Guid}
 */
export global RangeValue_Pattern_GUID := Guid("{18b00d87-b1c9-476a-bfbd-5f0bdb926f63}")

/**
 * @type {Guid}
 */
export global Scroll_Pattern_GUID := Guid("{895fa4b4-759d-4c50-8e15-03460672003c}")

/**
 * @type {Guid}
 */
export global ExpandCollapse_Pattern_GUID := Guid("{ae05efa2-f9d1-428a-834c-53a5c52f9b8b}")

/**
 * @type {Guid}
 */
export global Grid_Pattern_GUID := Guid("{260a2ccb-93a8-4e44-a4c1-3df397f2b02b}")

/**
 * @type {Guid}
 */
export global GridItem_Pattern_GUID := Guid("{f2d5c877-a462-4957-a2a5-2c96b303bc63}")

/**
 * @type {Guid}
 */
export global MultipleView_Pattern_GUID := Guid("{547a6ae4-113f-47c4-850f-db4dfa466b1d}")

/**
 * @type {Guid}
 */
export global Window_Pattern_GUID := Guid("{27901735-c760-4994-ad11-5919e606b110}")

/**
 * @type {Guid}
 */
export global SelectionItem_Pattern_GUID := Guid("{9bc64eeb-87c7-4b28-94bb-4d9fa437b6ef}")

/**
 * @type {Guid}
 */
export global Dock_Pattern_GUID := Guid("{9cbaa846-83c8-428d-827f-7e6063fe0620}")

/**
 * @type {Guid}
 */
export global Table_Pattern_GUID := Guid("{c415218e-a028-461e-aa92-8f925cf79351}")

/**
 * @type {Guid}
 */
export global TableItem_Pattern_GUID := Guid("{df1343bd-1888-4a29-a50c-b92e6de37f6f}")

/**
 * @type {Guid}
 */
export global Text_Pattern_GUID := Guid("{8615f05d-7de5-44fd-a679-2ca4b46033a8}")

/**
 * @type {Guid}
 */
export global Toggle_Pattern_GUID := Guid("{0b419760-e2f4-43ff-8c5f-9457c82b56e9}")

/**
 * @type {Guid}
 */
export global Transform_Pattern_GUID := Guid("{24b46fdb-587e-49f1-9c4a-d8e98b664b7b}")

/**
 * @type {Guid}
 */
export global ScrollItem_Pattern_GUID := Guid("{4591d005-a803-4d5c-b4d5-8d2800f906a7}")

/**
 * @type {Guid}
 */
export global LegacyIAccessible_Pattern_GUID := Guid("{54cc0a9f-3395-48af-ba8d-73f85690f3e0}")

/**
 * @type {Guid}
 */
export global ItemContainer_Pattern_GUID := Guid("{3d13da0f-8b9a-4a99-85fa-c5c9a69f1ed4}")

/**
 * @type {Guid}
 */
export global VirtualizedItem_Pattern_GUID := Guid("{f510173e-2e71-45e9-a6e5-62f6ed8289d5}")

/**
 * @type {Guid}
 */
export global SynchronizedInput_Pattern_GUID := Guid("{05c288a6-c47b-488b-b653-33977a551b8b}")

/**
 * @type {Guid}
 */
export global ObjectModel_Pattern_GUID := Guid("{3e04acfe-08fc-47ec-96bc-353fa3b34aa7}")

/**
 * @type {Guid}
 */
export global Annotation_Pattern_GUID := Guid("{f6c72ad7-356c-4850-9291-316f608a8c84}")

/**
 * @type {Guid}
 */
export global Text_Pattern2_GUID := Guid("{498479a2-5b22-448d-b6e4-647490860698}")

/**
 * @type {Guid}
 */
export global TextEdit_Pattern_GUID := Guid("{69f3ff89-5af9-4c75-9340-f2de292e4591}")

/**
 * @type {Guid}
 */
export global CustomNavigation_Pattern_GUID := Guid("{afea938a-621e-4054-bb2c-2f46114dac3f}")

/**
 * @type {Guid}
 */
export global Styles_Pattern_GUID := Guid("{1ae62655-da72-4d60-a153-e5aa6988e3bf}")

/**
 * @type {Guid}
 */
export global Spreadsheet_Pattern_GUID := Guid("{6a5b24c9-9d1e-4b85-9e44-c02e3169b10b}")

/**
 * @type {Guid}
 */
export global SpreadsheetItem_Pattern_GUID := Guid("{32cf83ff-f1a8-4a8c-8658-d47ba74e20ba}")

/**
 * @type {Guid}
 */
export global Tranform_Pattern2_GUID := Guid("{8afcfd07-a369-44de-988b-2f7ff49fb8a8}")

/**
 * @type {Guid}
 */
export global TextChild_Pattern_GUID := Guid("{7533cab7-3bfe-41ef-9e85-e2638cbe169e}")

/**
 * @type {Guid}
 */
export global Drag_Pattern_GUID := Guid("{c0bee21f-ccb3-4fed-995b-114f6e3d2728}")

/**
 * @type {Guid}
 */
export global DropTarget_Pattern_GUID := Guid("{0bcbec56-bd34-4b7b-9fd5-2659905ea3dc}")

/**
 * @type {Guid}
 */
export global StructuredMarkup_Pattern_GUID := Guid("{abbd0878-8665-4f5c-94fc-36e7d8bb706b}")

/**
 * @type {Guid}
 */
export global Button_Control_GUID := Guid("{5a78e369-c6a1-4f33-a9d7-79f20d0c788e}")

/**
 * @type {Guid}
 */
export global Calendar_Control_GUID := Guid("{8913eb88-00e5-46bc-8e4e-14a786e165a1}")

/**
 * @type {Guid}
 */
export global CheckBox_Control_GUID := Guid("{fb50f922-a3db-49c0-8bc3-06dad55778e2}")

/**
 * @type {Guid}
 */
export global ComboBox_Control_GUID := Guid("{54cb426c-2f33-4fff-aaa1-aef60dac5deb}")

/**
 * @type {Guid}
 */
export global Edit_Control_GUID := Guid("{6504a5c8-2c86-4f87-ae7b-1abddc810cf9}")

/**
 * @type {Guid}
 */
export global Hyperlink_Control_GUID := Guid("{8a56022c-b00d-4d15-8ff0-5b6b266e5e02}")

/**
 * @type {Guid}
 */
export global Image_Control_GUID := Guid("{2d3736e4-6b16-4c57-a962-f93260a75243}")

/**
 * @type {Guid}
 */
export global ListItem_Control_GUID := Guid("{7b3717f2-44d1-4a58-98a8-f12a9b8f78e2}")

/**
 * @type {Guid}
 */
export global List_Control_GUID := Guid("{9b149ee1-7cca-4cfc-9af1-cac7bddd3031}")

/**
 * @type {Guid}
 */
export global Menu_Control_GUID := Guid("{2e9b1440-0ea8-41fd-b374-c1ea6f503cd1}")

/**
 * @type {Guid}
 */
export global MenuBar_Control_GUID := Guid("{cc384250-0e7b-4ae8-95ae-a08f261b52ee}")

/**
 * @type {Guid}
 */
export global MenuItem_Control_GUID := Guid("{f45225d3-d0a0-49d8-9834-9a000d2aeddc}")

/**
 * @type {Guid}
 */
export global ProgressBar_Control_GUID := Guid("{228c9f86-c36c-47bb-9fb6-a5834bfc53a4}")

/**
 * @type {Guid}
 */
export global RadioButton_Control_GUID := Guid("{3bdb49db-fe2c-4483-b3e1-e57f219440c6}")

/**
 * @type {Guid}
 */
export global ScrollBar_Control_GUID := Guid("{daf34b36-5065-4946-b22f-92595fc0751a}")

/**
 * @type {Guid}
 */
export global Slider_Control_GUID := Guid("{b033c24b-3b35-4cea-b609-763682fa660b}")

/**
 * @type {Guid}
 */
export global Spinner_Control_GUID := Guid("{60cc4b38-3cb1-4161-b442-c6b726c17825}")

/**
 * @type {Guid}
 */
export global StatusBar_Control_GUID := Guid("{d45e7d1b-5873-475f-95a4-0433e1f1b00a}")

/**
 * @type {Guid}
 */
export global Tab_Control_GUID := Guid("{38cd1f2d-337a-4bd2-a5e3-adb469e30bd3}")

/**
 * @type {Guid}
 */
export global TabItem_Control_GUID := Guid("{2c6a634f-921b-4e6e-b26e-08fcb0798f4c}")

/**
 * @type {Guid}
 */
export global Text_Control_GUID := Guid("{ae9772dc-d331-4f09-be20-7e6dfaf07b0a}")

/**
 * @type {Guid}
 */
export global ToolBar_Control_GUID := Guid("{8f06b751-e182-4e98-8893-2284543a7dce}")

/**
 * @type {Guid}
 */
export global ToolTip_Control_GUID := Guid("{05ddc6d1-2137-4768-98ea-73f52f7134f3}")

/**
 * @type {Guid}
 */
export global Tree_Control_GUID := Guid("{7561349c-d241-43f4-9908-b5f091bee611}")

/**
 * @type {Guid}
 */
export global TreeItem_Control_GUID := Guid("{62c9feb9-8ffc-4878-a3a4-96b030315c18}")

/**
 * @type {Guid}
 */
export global Custom_Control_GUID := Guid("{f29ea0c3-adb7-430a-ba90-e52c7313e6ed}")

/**
 * @type {Guid}
 */
export global Group_Control_GUID := Guid("{ad50aa1c-e8c8-4774-ae1b-dd86df0b3bdc}")

/**
 * @type {Guid}
 */
export global Thumb_Control_GUID := Guid("{701ca877-e310-4dd6-b644-797e4faea213}")

/**
 * @type {Guid}
 */
export global DataGrid_Control_GUID := Guid("{84b783af-d103-4b0a-8415-e73942410f4b}")

/**
 * @type {Guid}
 */
export global DataItem_Control_GUID := Guid("{a0177842-d94f-42a5-814b-6068addc8da5}")

/**
 * @type {Guid}
 */
export global Document_Control_GUID := Guid("{3cd6bb6f-6f08-4562-b229-e4e2fc7a9eb4}")

/**
 * @type {Guid}
 */
export global SplitButton_Control_GUID := Guid("{7011f01f-4ace-4901-b461-920a6f1ca650}")

/**
 * @type {Guid}
 */
export global Window_Control_GUID := Guid("{e13a7242-f462-4f4d-aec1-53b28d6c3290}")

/**
 * @type {Guid}
 */
export global Pane_Control_GUID := Guid("{5c2b3f5b-9182-42a3-8dec-8c04c1ee634d}")

/**
 * @type {Guid}
 */
export global Header_Control_GUID := Guid("{5b90cbce-78fb-4614-82b6-554d74718e67}")

/**
 * @type {Guid}
 */
export global HeaderItem_Control_GUID := Guid("{e6bc12cb-7c8e-49cf-b168-4a93a32bebb0}")

/**
 * @type {Guid}
 */
export global Table_Control_GUID := Guid("{773bfa0e-5bc4-4deb-921b-de7b3206229e}")

/**
 * @type {Guid}
 */
export global TitleBar_Control_GUID := Guid("{98aa55bf-3bb0-4b65-836e-2ea30dbc171f}")

/**
 * @type {Guid}
 */
export global Separator_Control_GUID := Guid("{8767eba3-2a63-4ab0-ac8d-aa50e23de978}")

/**
 * @type {Guid}
 */
export global SemanticZoom_Control_GUID := Guid("{5fd34a43-061e-42c8-b589-9dccf74bc43a}")

/**
 * @type {Guid}
 */
export global AppBar_Control_GUID := Guid("{6114908d-cc02-4d37-875b-b530c7139554}")

/**
 * @type {Guid}
 */
export global Text_AnimationStyle_Attribute_GUID := Guid("{628209f0-7c9a-4d57-be64-1f1836571ff5}")

/**
 * @type {Guid}
 */
export global Text_BackgroundColor_Attribute_GUID := Guid("{fdc49a07-583d-4f17-ad27-77fc832a3c0b}")

/**
 * @type {Guid}
 */
export global Text_BulletStyle_Attribute_GUID := Guid("{c1097c90-d5c4-4237-9781-3bec8ba54e48}")

/**
 * @type {Guid}
 */
export global Text_CapStyle_Attribute_GUID := Guid("{fb059c50-92cc-49a5-ba8f-0aa872bba2f3}")

/**
 * @type {Guid}
 */
export global Text_Culture_Attribute_GUID := Guid("{c2025af9-a42d-4ced-a1fb-c6746315222e}")

/**
 * @type {Guid}
 */
export global Text_FontName_Attribute_GUID := Guid("{64e63ba8-f2e5-476e-a477-1734feaaf726}")

/**
 * @type {Guid}
 */
export global Text_FontSize_Attribute_GUID := Guid("{dc5eeeff-0506-4673-93f2-377e4a8e01f1}")

/**
 * @type {Guid}
 */
export global Text_FontWeight_Attribute_GUID := Guid("{6fc02359-b316-4f5f-b401-f1ce55741853}")

/**
 * @type {Guid}
 */
export global Text_ForegroundColor_Attribute_GUID := Guid("{72d1c95d-5e60-471a-96b1-6c1b3b77a436}")

/**
 * @type {Guid}
 */
export global Text_HorizontalTextAlignment_Attribute_GUID := Guid("{04ea6161-fba3-477a-952a-bb326d026a5b}")

/**
 * @type {Guid}
 */
export global Text_IndentationFirstLine_Attribute_GUID := Guid("{206f9ad5-c1d3-424a-8182-6da9a7f3d632}")

/**
 * @type {Guid}
 */
export global Text_IndentationLeading_Attribute_GUID := Guid("{5cf66bac-2d45-4a4b-b6c9-f7221d2815b0}")

/**
 * @type {Guid}
 */
export global Text_IndentationTrailing_Attribute_GUID := Guid("{97ff6c0f-1ce4-408a-b67b-94d83eb69bf2}")

/**
 * @type {Guid}
 */
export global Text_IsHidden_Attribute_GUID := Guid("{360182fb-bdd7-47f6-ab69-19e33f8a3344}")

/**
 * @type {Guid}
 */
export global Text_IsItalic_Attribute_GUID := Guid("{fce12a56-1336-4a34-9663-1bab47239320}")

/**
 * @type {Guid}
 */
export global Text_IsReadOnly_Attribute_GUID := Guid("{a738156b-ca3e-495e-9514-833c440feb11}")

/**
 * @type {Guid}
 */
export global Text_IsSubscript_Attribute_GUID := Guid("{f0ead858-8f53-413c-873f-1a7d7f5e0de4}")

/**
 * @type {Guid}
 */
export global Text_IsSuperscript_Attribute_GUID := Guid("{da706ee4-b3aa-4645-a41f-cd25157dea76}")

/**
 * @type {Guid}
 */
export global Text_MarginBottom_Attribute_GUID := Guid("{7ee593c4-72b4-4cac-9271-3ed24b0e4d42}")

/**
 * @type {Guid}
 */
export global Text_MarginLeading_Attribute_GUID := Guid("{9e9242d0-5ed0-4900-8e8a-eecc03835afc}")

/**
 * @type {Guid}
 */
export global Text_MarginTop_Attribute_GUID := Guid("{683d936f-c9b9-4a9a-b3d9-d20d33311e2a}")

/**
 * @type {Guid}
 */
export global Text_MarginTrailing_Attribute_GUID := Guid("{af522f98-999d-40af-a5b2-0169d0342002}")

/**
 * @type {Guid}
 */
export global Text_OutlineStyles_Attribute_GUID := Guid("{5b675b27-db89-46fe-970c-614d523bb97d}")

/**
 * @type {Guid}
 */
export global Text_OverlineColor_Attribute_GUID := Guid("{83ab383a-fd43-40da-ab3e-ecf8165cbb6d}")

/**
 * @type {Guid}
 */
export global Text_OverlineStyle_Attribute_GUID := Guid("{0a234d66-617e-427f-871d-e1ff1e0c213f}")

/**
 * @type {Guid}
 */
export global Text_StrikethroughColor_Attribute_GUID := Guid("{bfe15a18-8c41-4c5a-9a0b-04af0e07f487}")

/**
 * @type {Guid}
 */
export global Text_StrikethroughStyle_Attribute_GUID := Guid("{72913ef1-da00-4f01-899c-ac5a8577a307}")

/**
 * @type {Guid}
 */
export global Text_Tabs_Attribute_GUID := Guid("{2e68d00b-92fe-42d8-899a-a784aa4454a1}")

/**
 * @type {Guid}
 */
export global Text_TextFlowDirections_Attribute_GUID := Guid("{8bdf8739-f420-423e-af77-20a5d973a907}")

/**
 * @type {Guid}
 */
export global Text_UnderlineColor_Attribute_GUID := Guid("{bfa12c73-fde2-4473-bf64-1036d6aa0f45}")

/**
 * @type {Guid}
 */
export global Text_UnderlineStyle_Attribute_GUID := Guid("{5f3b21c0-ede4-44bd-9c36-3853038cbfeb}")

/**
 * @type {Guid}
 */
export global Text_AnnotationTypes_Attribute_GUID := Guid("{ad2eb431-ee4e-4be1-a7ba-5559155a73ef}")

/**
 * @type {Guid}
 */
export global Text_AnnotationObjects_Attribute_GUID := Guid("{ff41cf68-e7ab-40b9-8c72-72a8ed94017d}")

/**
 * @type {Guid}
 */
export global Text_StyleName_Attribute_GUID := Guid("{22c9e091-4d66-45d8-a828-737bab4c98a7}")

/**
 * @type {Guid}
 */
export global Text_StyleId_Attribute_GUID := Guid("{14c300de-c32b-449b-ab7c-b0e0789aea5d}")

/**
 * @type {Guid}
 */
export global Text_Link_Attribute_GUID := Guid("{b38ef51d-9e8d-4e46-9144-56ebe177329b}")

/**
 * @type {Guid}
 */
export global Text_IsActive_Attribute_GUID := Guid("{f5a4e533-e1b8-436b-935d-b57aa3f558c4}")

/**
 * @type {Guid}
 */
export global Text_SelectionActiveEnd_Attribute_GUID := Guid("{1f668cc3-9bbf-416b-b0a2-f89f86f6612c}")

/**
 * @type {Guid}
 */
export global Text_CaretPosition_Attribute_GUID := Guid("{b227b131-9889-4752-a91b-733efdc5c5a0}")

/**
 * @type {Guid}
 */
export global Text_CaretBidiMode_Attribute_GUID := Guid("{929ee7a6-51d3-4715-96dc-b694fa24a168}")

/**
 * @type {Guid}
 */
export global Text_BeforeParagraphSpacing_Attribute_GUID := Guid("{be7b0ab1-c822-4a24-85e9-c8f2650fc79c}")

/**
 * @type {Guid}
 */
export global Text_AfterParagraphSpacing_Attribute_GUID := Guid("{588cbb38-e62f-497c-b5d1-ccdf0ee823d8}")

/**
 * @type {Guid}
 */
export global Text_LineSpacing_Attribute_GUID := Guid("{63ff70ae-d943-4b47-8ab7-a7a033d3214b}")

/**
 * @type {Guid}
 */
export global Text_BeforeSpacing_Attribute_GUID := Guid("{be7b0ab1-c822-4a24-85e9-c8f2650fc79c}")

/**
 * @type {Guid}
 */
export global Text_AfterSpacing_Attribute_GUID := Guid("{588cbb38-e62f-497c-b5d1-ccdf0ee823d8}")

/**
 * @type {Guid}
 */
export global Text_SayAsInterpretAs_Attribute_GUID := Guid("{b38ad6ac-eee1-4b6e-88cc-014cefa93fcb}")

/**
 * @type {Guid}
 */
export global TextEdit_TextChanged_Event_GUID := Guid("{120b0308-ec22-4eb8-9c98-9867cda1b165}")

/**
 * @type {Guid}
 */
export global TextEdit_ConversionTargetChanged_Event_GUID := Guid("{3388c183-ed4f-4c8b-9baa-364d51d8847f}")

/**
 * @type {Guid}
 */
export global Changes_Event_GUID := Guid("{7df26714-614f-4e05-9488-716c5ba19436}")

/**
 * @type {Guid}
 */
export global Annotation_Custom_GUID := Guid("{9ec82750-3931-4952-85bc-1dbff78a43e3}")

/**
 * @type {Guid}
 */
export global Annotation_SpellingError_GUID := Guid("{ae85567e-9ece-423f-81b7-96c43d53e50e}")

/**
 * @type {Guid}
 */
export global Annotation_GrammarError_GUID := Guid("{757a048d-4518-41c6-854c-dc009b7cfb53}")

/**
 * @type {Guid}
 */
export global Annotation_Comment_GUID := Guid("{fd2fda30-26b3-4c06-8bc7-98f1532e46fd}")

/**
 * @type {Guid}
 */
export global Annotation_FormulaError_GUID := Guid("{95611982-0cab-46d5-a2f0-e30d1905f8bf}")

/**
 * @type {Guid}
 */
export global Annotation_TrackChanges_GUID := Guid("{21e6e888-dc14-4016-ac27-190553c8c470}")

/**
 * @type {Guid}
 */
export global Annotation_Header_GUID := Guid("{867b409b-b216-4472-a219-525e310681f8}")

/**
 * @type {Guid}
 */
export global Annotation_Footer_GUID := Guid("{cceab046-1833-47aa-8080-701ed0b0c832}")

/**
 * @type {Guid}
 */
export global Annotation_Highlighted_GUID := Guid("{757c884e-8083-4081-8b9c-e87f5072f0e4}")

/**
 * @type {Guid}
 */
export global Annotation_Endnote_GUID := Guid("{7565725c-2d99-4839-960d-33d3b866aba5}")

/**
 * @type {Guid}
 */
export global Annotation_Footnote_GUID := Guid("{3de10e21-4125-42db-8620-be8083080624}")

/**
 * @type {Guid}
 */
export global Annotation_InsertionChange_GUID := Guid("{0dbeb3a6-df15-4164-a3c0-e21a8ce931c4}")

/**
 * @type {Guid}
 */
export global Annotation_DeletionChange_GUID := Guid("{be3d5b05-951d-42e7-901d-adc8c2cf34d0}")

/**
 * @type {Guid}
 */
export global Annotation_MoveChange_GUID := Guid("{9da587eb-23e5-4490-b385-1a22ddc8b187}")

/**
 * @type {Guid}
 */
export global Annotation_FormatChange_GUID := Guid("{eb247345-d4f1-41ce-8e52-f79b69635e48}")

/**
 * @type {Guid}
 */
export global Annotation_UnsyncedChange_GUID := Guid("{1851116a-0e47-4b30-8cb5-d7dae4fbcd1b}")

/**
 * @type {Guid}
 */
export global Annotation_EditingLockedChange_GUID := Guid("{c31f3e1c-7423-4dac-8348-41f099ff6f64}")

/**
 * @type {Guid}
 */
export global Annotation_ExternalChange_GUID := Guid("{75a05b31-5f11-42fd-887d-dfa010db2392}")

/**
 * @type {Guid}
 */
export global Annotation_ConflictingChange_GUID := Guid("{98af8802-517c-459f-af13-016d3fab877e}")

/**
 * @type {Guid}
 */
export global Annotation_Author_GUID := Guid("{f161d3a7-f81b-4128-b17f-71f690914520}")

/**
 * @type {Guid}
 */
export global Annotation_AdvancedProofingIssue_GUID := Guid("{dac7b72c-c0f2-4b84-b90d-5fafc0f0ef1c}")

/**
 * @type {Guid}
 */
export global Annotation_DataValidationError_GUID := Guid("{c8649fa8-9775-437e-ad46-e709d93c2343}")

/**
 * @type {Guid}
 */
export global Annotation_CircularReferenceError_GUID := Guid("{25bd9cf4-1745-4659-ba67-727f0318c616}")

/**
 * @type {Guid}
 */
export global Annotation_Mathematics_GUID := Guid("{eaab634b-26d0-40c1-8073-57ca1c633c9b}")

/**
 * @type {Guid}
 */
export global Annotation_Sensitive_GUID := Guid("{37f4c04f-0f12-4464-929c-828fd15292e3}")

/**
 * @type {Guid}
 */
export global Changes_Summary_GUID := Guid("{313d65a6-e60f-4d62-9861-55afd728d207}")

/**
 * @type {Guid}
 */
export global StyleId_Custom_GUID := Guid("{ef2edd3e-a999-4b7c-a378-09bbd52a3516}")

/**
 * @type {Guid}
 */
export global StyleId_Heading1_GUID := Guid("{7f7e8f69-6866-4621-930c-9a5d0ca5961c}")

/**
 * @type {Guid}
 */
export global StyleId_Heading2_GUID := Guid("{baa9b241-5c69-469d-85ad-474737b52b14}")

/**
 * @type {Guid}
 */
export global StyleId_Heading3_GUID := Guid("{bf8be9d2-d8b8-4ec5-8c52-9cfb0d035970}")

/**
 * @type {Guid}
 */
export global StyleId_Heading4_GUID := Guid("{8436ffc0-9578-45fc-83a4-ff40053315dd}")

/**
 * @type {Guid}
 */
export global StyleId_Heading5_GUID := Guid("{909f424d-0dbf-406e-97bb-4e773d9798f7}")

/**
 * @type {Guid}
 */
export global StyleId_Heading6_GUID := Guid("{89d23459-5d5b-4824-a420-11d3ed82e40f}")

/**
 * @type {Guid}
 */
export global StyleId_Heading7_GUID := Guid("{a3790473-e9ae-422d-b8e3-3b675c6181a4}")

/**
 * @type {Guid}
 */
export global StyleId_Heading8_GUID := Guid("{2bc14145-a40c-4881-84ae-f2235685380c}")

/**
 * @type {Guid}
 */
export global StyleId_Heading9_GUID := Guid("{c70d9133-bb2a-43d3-8ac6-33657884b0f0}")

/**
 * @type {Guid}
 */
export global StyleId_Title_GUID := Guid("{15d8201a-ffcf-481f-b0a1-30b63be98f07}")

/**
 * @type {Guid}
 */
export global StyleId_Subtitle_GUID := Guid("{b5d9fc17-5d6f-4420-b439-7cb19ad434e2}")

/**
 * @type {Guid}
 */
export global StyleId_Normal_GUID := Guid("{cd14d429-e45e-4475-a1c5-7f9e6be96eba}")

/**
 * @type {Guid}
 */
export global StyleId_Emphasis_GUID := Guid("{ca6e7dbe-355e-4820-95a0-925f041d3470}")

/**
 * @type {Guid}
 */
export global StyleId_Quote_GUID := Guid("{5d1c21ea-8195-4f6c-87ea-5dabece64c1d}")

/**
 * @type {Guid}
 */
export global StyleId_BulletedList_GUID := Guid("{5963ed64-6426-4632-8caf-a32ad402d91a}")

/**
 * @type {Guid}
 */
export global StyleId_NumberedList_GUID := Guid("{1e96dbd5-64c3-43d0-b1ee-b53b06e3eddf}")

/**
 * @type {Guid}
 */
export global Notification_Event_GUID := Guid("{72c5a2f7-9788-480f-b8eb-4dee00f6186f}")

/**
 * @type {Guid}
 */
export global SID_IsUIAutomationObject := Guid("{b96fdb85-7204-4724-842b-c7059dedb9d0}")

/**
 * @type {Guid}
 */
export global SID_ControlElementProvider := Guid("{f4791d68-e254-4ba3-9a53-26a5c5497946}")

/**
 * @type {Guid}
 */
export global IsSelectionPattern2Available_Property_GUID := Guid("{490806fb-6e89-4a47-8319-d266e511f021}")

/**
 * @type {Guid}
 */
export global Selection2_FirstSelectedItem_Property_GUID := Guid("{cc24ea67-369c-4e55-9ff7-38da69540c29}")

/**
 * @type {Guid}
 */
export global Selection2_LastSelectedItem_Property_GUID := Guid("{cf7bda90-2d83-49f8-860c-9ce394cf89b4}")

/**
 * @type {Guid}
 */
export global Selection2_CurrentSelectedItem_Property_GUID := Guid("{34257c26-83b5-41a6-939c-ae841c136236}")

/**
 * @type {Guid}
 */
export global Selection2_ItemCount_Property_GUID := Guid("{bb49eb9f-456d-4048-b591-9c2026b84636}")

/**
 * @type {Guid}
 */
export global Selection_Pattern2_GUID := Guid("{fba25cab-ab98-49f7-a7dc-fe539dc15be7}")

/**
 * @type {Guid}
 */
export global HeadingLevel_Property_GUID := Guid("{29084272-aaaf-4a30-8796-3c12f62b6bbb}")

/**
 * @type {Guid}
 */
export global IsDialog_Property_GUID := Guid("{9d0dfb9b-8436-4501-bbbb-e534a4fb3b3f}")

/**
 * @type {Integer (UInt32)}
 */
export global UIA_IAFP_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global UIA_IAFP_UNWRAP_BRIDGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global UIA_PFIA_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global UIA_PFIA_UNWRAP_BRIDGE := 1

/**
 * @type {Float}
 */
export global UIA_ScrollPatternNoScroll := -1
;@endregion Constants
