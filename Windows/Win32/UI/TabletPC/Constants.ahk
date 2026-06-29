#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.UI.TabletPC
 */

;@region Constants

/**
 * @type {String}
 */
export global MICROSOFT_URL_EXPERIENCE_PROPERTY := "Microsoft TIP URL Experience"

/**
 * @type {String}
 */
export global MICROSOFT_TIP_NO_INSERT_BUTTON_PROPERTY := "Microsoft TIP No Insert Option"

/**
 * @type {String}
 */
export global MICROSOFT_TIP_COMBOBOXLIST_PROPERTY := "Microsoft TIP ComboBox List Window Identifier"

/**
 * @type {String}
 */
export global MICROSOFT_TIP_OPENING_MSG := "TabletInputPanelOpening"

/**
 * @type {Integer (UInt32)}
 */
export global SAFE_PARTIAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global BEST_COMPLETE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAX_VENDORNAME := 32

/**
 * @type {Integer (UInt32)}
 */
export global MAX_FRIENDLYNAME := 64

/**
 * @type {Integer (UInt32)}
 */
export global MAX_LANGUAGES := 64

/**
 * @type {Integer (UInt32)}
 */
export global CAC_FULL := 0

/**
 * @type {Integer (UInt32)}
 */
export global CAC_PREFIX := 1

/**
 * @type {Integer (UInt32)}
 */
export global CAC_RANDOM := 2

/**
 * @type {Integer (UInt32)}
 */
export global ASYNC_RECO_INTERRUPTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global ASYNC_RECO_PROCESS_FAILED := 2

/**
 * @type {Integer (UInt32)}
 */
export global ASYNC_RECO_ADDSTROKE_FAILED := 4

/**
 * @type {Integer (UInt32)}
 */
export global ASYNC_RECO_SETCACMODE_FAILED := 8

/**
 * @type {Integer (UInt32)}
 */
export global ASYNC_RECO_RESETCONTEXT_FAILED := 16

/**
 * @type {Integer (UInt32)}
 */
export global ASYNC_RECO_SETGUIDE_FAILED := 32

/**
 * @type {Integer (UInt32)}
 */
export global ASYNC_RECO_SETFLAGS_FAILED := 64

/**
 * @type {Integer (UInt32)}
 */
export global ASYNC_RECO_SETFACTOID_FAILED := 128

/**
 * @type {Integer (UInt32)}
 */
export global ASYNC_RECO_SETTEXTCONTEXT_FAILED := 256

/**
 * @type {Integer (UInt32)}
 */
export global ASYNC_RECO_SETWORDLIST_FAILED := 512

/**
 * @type {Integer (Int32)}
 */
export global RF_DONTCARE := 1

/**
 * @type {Integer (Int32)}
 */
export global RF_OBJECT := 2

/**
 * @type {Integer (Int32)}
 */
export global RF_FREE_INPUT := 4

/**
 * @type {Integer (Int32)}
 */
export global RF_LINED_INPUT := 8

/**
 * @type {Integer (Int32)}
 */
export global RF_BOXED_INPUT := 16

/**
 * @type {Integer (Int32)}
 */
export global RF_CAC_INPUT := 32

/**
 * @type {Integer (Int32)}
 */
export global RF_RIGHT_AND_DOWN := 64

/**
 * @type {Integer (Int32)}
 */
export global RF_LEFT_AND_DOWN := 128

/**
 * @type {Integer (Int32)}
 */
export global RF_DOWN_AND_LEFT := 256

/**
 * @type {Integer (Int32)}
 */
export global RF_DOWN_AND_RIGHT := 512

/**
 * @type {Integer (Int32)}
 */
export global RF_ARBITRARY_ANGLE := 1024

/**
 * @type {Integer (Int32)}
 */
export global RF_LATTICE := 2048

/**
 * @type {Integer (Int32)}
 */
export global RF_ADVISEINKCHANGE := 4096

/**
 * @type {Integer (Int32)}
 */
export global RF_STROKEREORDER := 8192

/**
 * @type {Integer (Int32)}
 */
export global RF_PERSONALIZABLE := 16384

/**
 * @type {Integer (Int32)}
 */
export global RF_PERFORMSLINEBREAKING := 65536

/**
 * @type {Integer (Int32)}
 */
export global RF_REQUIRESSEGMENTATIONBREAKING := 131072

/**
 * @type {Integer (UInt32)}
 */
export global FLICK_WM_HANDLED_MASK := 1

/**
 * @type {Integer (UInt32)}
 */
export global NUM_FLICK_DIRECTIONS := 8

/**
 * @type {Integer (UInt32)}
 */
export global WM_TABLET_DEFBASE := 704

/**
 * @type {Integer (UInt32)}
 */
export global WM_TABLET_MAXOFFSET := 32

/**
 * @type {Integer (UInt32)}
 */
export global WM_TABLET_ADDED := 712

/**
 * @type {Integer (UInt32)}
 */
export global WM_TABLET_DELETED := 713

/**
 * @type {Integer (UInt32)}
 */
export global WM_TABLET_FLICK := 715

/**
 * @type {Integer (UInt32)}
 */
export global WM_TABLET_QUERYSYSTEMGESTURESTATUS := 716

/**
 * @type {Integer (UInt32)}
 */
export global TABLET_DISABLE_PRESSANDHOLD := 1

/**
 * @type {Integer (UInt32)}
 */
export global TABLET_DISABLE_PENTAPFEEDBACK := 8

/**
 * @type {Integer (UInt32)}
 */
export global TABLET_DISABLE_PENBARRELFEEDBACK := 16

/**
 * @type {Integer (UInt32)}
 */
export global TABLET_DISABLE_TOUCHUIFORCEON := 256

/**
 * @type {Integer (UInt32)}
 */
export global TABLET_DISABLE_TOUCHUIFORCEOFF := 512

/**
 * @type {Integer (UInt32)}
 */
export global TABLET_DISABLE_TOUCHSWITCH := 32768

/**
 * @type {Integer (UInt32)}
 */
export global TABLET_DISABLE_FLICKS := 65536

/**
 * @type {Integer (UInt32)}
 */
export global TABLET_ENABLE_FLICKSONCONTEXT := 131072

/**
 * @type {Integer (UInt32)}
 */
export global TABLET_ENABLE_FLICKLEARNINGMODE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global TABLET_DISABLE_SMOOTHSCROLLING := 524288

/**
 * @type {Integer (UInt32)}
 */
export global TABLET_DISABLE_FLICKFALLBACKKEYS := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global TABLET_ENABLE_MULTITOUCHDATA := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global MAX_PACKET_PROPERTY_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global MAX_PACKET_BUTTON_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global IP_CURSOR_DOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global IP_INVERTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global IP_MARGIN := 4

/**
 * @type {String}
 */
export global INK_SERIALIZED_FORMAT := "Ink Serialized Format"

/**
 * @type {String}
 */
export global STR_GUID_X := "{598A6A8F-52C0-4BA0-93AF-AF357411A561}"

/**
 * @type {String}
 */
export global STR_GUID_Y := "{B53F9F75-04E0-4498-A7EE-C30DBB5A9011}"

/**
 * @type {String}
 */
export global STR_GUID_Z := "{735ADB30-0EBB-4788-A0E4-0F316490055D}"

/**
 * @type {String}
 */
export global STR_GUID_PAKETSTATUS := "{6E0E07BF-AFE7-4CF7-87D1-AF6446208418}"

/**
 * @type {String}
 */
export global STR_GUID_TIMERTICK := "{436510C5-FED3-45D1-8B76-71D3EA7A829D}"

/**
 * @type {String}
 */
export global STR_GUID_SERIALNUMBER := "{78A81B56-0935-4493-BAAE-00541A8A16C4}"

/**
 * @type {String}
 */
export global STR_GUID_NORMALPRESSURE := "{7307502D-F9F4-4E18-B3F2-2CE1B1A3610C}"

/**
 * @type {String}
 */
export global STR_GUID_TANGENTPRESSURE := "{6DA4488B-5244-41EC-905B-32D89AB80809}"

/**
 * @type {String}
 */
export global STR_GUID_BUTTONPRESSURE := "{8B7FEFC4-96AA-4BFE-AC26-8A5F0BE07BF5}"

/**
 * @type {String}
 */
export global STR_GUID_XTILTORIENTATION := "{A8D07B3A-8BF0-40B0-95A9-B80A6BB787BF}"

/**
 * @type {String}
 */
export global STR_GUID_YTILTORIENTATION := "{0E932389-1D77-43AF-AC00-5B950D6D4B2D}"

/**
 * @type {String}
 */
export global STR_GUID_AZIMUTHORIENTATION := "{029123B4-8828-410B-B250-A0536595E5DC}"

/**
 * @type {String}
 */
export global STR_GUID_ALTITUDEORIENTATION := "{82DEC5C7-F6BA-4906-894F-66D68DFC456C}"

/**
 * @type {String}
 */
export global STR_GUID_TWISTORIENTATION := "{0D324960-13B2-41E4-ACE6-7AE9D43D2D3B}"

/**
 * @type {String}
 */
export global STR_GUID_PITCHROTATION := "{7F7E57B7-BE37-4BE1-A356-7A84160E1893}"

/**
 * @type {String}
 */
export global STR_GUID_ROLLROTATION := "{5D5D5E56-6BA9-4C5B-9FB0-851C91714E56}"

/**
 * @type {String}
 */
export global STR_GUID_YAWROTATION := "{6A849980-7C3A-45B7-AA82-90A262950E89}"

/**
 * @type {String}
 */
export global STR_GUID_WIDTH := "{BAABE94D-2712-48F5-BE9D-8F8B5EA0711A}"

/**
 * @type {String}
 */
export global STR_GUID_HEIGHT := "{E61858D2-E447-4218-9D3F-18865C203DF4}"

/**
 * @type {String}
 */
export global STR_GUID_FINGERCONTACTCONFIDENCE := "{E706C804-57F0-4F00-8A0C-853D57789BE9}"

/**
 * @type {String}
 */
export global STR_GUID_DEVICE_CONTACT_ID := "{02585B91-049B-4750-9615-DF8948AB3C9C}"

/**
 * @type {String}
 */
export global INKRECOGNITIONPROPERTY_LINENUMBER := "{DBF29F2C-5289-4BE8-B3D8-6EF63246253E}"

/**
 * @type {String}
 */
export global INKRECOGNITIONPROPERTY_BOXNUMBER := "{2C243E3A-F733-4EB6-B1F8-B5DC5C2C4CDA}"

/**
 * @type {String}
 */
export global INKRECOGNITIONPROPERTY_SEGMENTATION := "{B3C0FE6C-FB51-4164-BA2F-844AF8F983DA}"

/**
 * @type {String}
 */
export global INKRECOGNITIONPROPERTY_HOTPOINT := "{CA6F40DC-5292-452a-91FB-2181C0BEC0DE}"

/**
 * @type {String}
 */
export global INKRECOGNITIONPROPERTY_MAXIMUMSTROKECOUNT := "{BF0EEC4E-4B7D-47a9-8CFA-234DD24BD22A}"

/**
 * @type {String}
 */
export global INKRECOGNITIONPROPERTY_POINTSPERINCH := "{7ED16B76-889C-468e-8276-0021B770187E}"

/**
 * @type {String}
 */
export global INKRECOGNITIONPROPERTY_CONFIDENCELEVEL := "{7DFE11A7-FB5D-4958-8765-154ADF0D833F}"

/**
 * @type {String}
 */
export global INKRECOGNITIONPROPERTY_LINEMETRICS := "{8CC24B27-30A9-4b96-9056-2D3A90DA0727}"

/**
 * @type {String}
 */
export global FACTOID_NONE := "NONE"

/**
 * @type {String}
 */
export global FACTOID_DEFAULT := "DEFAULT"

/**
 * @type {String}
 */
export global FACTOID_SYSTEMDICTIONARY := "SYSDICT"

/**
 * @type {String}
 */
export global FACTOID_WORDLIST := "WORDLIST"

/**
 * @type {String}
 */
export global FACTOID_EMAIL := "EMAIL"

/**
 * @type {String}
 */
export global FACTOID_WEB := "WEB"

/**
 * @type {String}
 */
export global FACTOID_ONECHAR := "ONECHAR"

/**
 * @type {String}
 */
export global FACTOID_NUMBER := "NUMBER"

/**
 * @type {String}
 */
export global FACTOID_DIGIT := "DIGIT"

/**
 * @type {String}
 */
export global FACTOID_NUMBERSIMPLE := "NUMSIMPLE"

/**
 * @type {String}
 */
export global FACTOID_CURRENCY := "CURRENCY"

/**
 * @type {String}
 */
export global FACTOID_POSTALCODE := "POSTALCODE"

/**
 * @type {String}
 */
export global FACTOID_PERCENT := "PERCENT"

/**
 * @type {String}
 */
export global FACTOID_DATE := "DATE"

/**
 * @type {String}
 */
export global FACTOID_TIME := "TIME"

/**
 * @type {String}
 */
export global FACTOID_TELEPHONE := "TELEPHONE"

/**
 * @type {String}
 */
export global FACTOID_FILENAME := "FILENAME"

/**
 * @type {String}
 */
export global FACTOID_UPPERCHAR := "UPPERCHAR"

/**
 * @type {String}
 */
export global FACTOID_LOWERCHAR := "LOWERCHAR"

/**
 * @type {String}
 */
export global FACTOID_PUNCCHAR := "PUNCCHAR"

/**
 * @type {String}
 */
export global FACTOID_JAPANESECOMMON := "JPN_COMMON"

/**
 * @type {String}
 */
export global FACTOID_CHINESESIMPLECOMMON := "CHS_COMMON"

/**
 * @type {String}
 */
export global FACTOID_CHINESETRADITIONALCOMMON := "CHT_COMMON"

/**
 * @type {String}
 */
export global FACTOID_KOREANCOMMON := "KOR_COMMON"

/**
 * @type {String}
 */
export global FACTOID_HIRAGANA := "HIRAGANA"

/**
 * @type {String}
 */
export global FACTOID_KATAKANA := "KATAKANA"

/**
 * @type {String}
 */
export global FACTOID_KANJICOMMON := "KANJI_COMMON"

/**
 * @type {String}
 */
export global FACTOID_KANJIRARE := "KANJI_RARE"

/**
 * @type {String}
 */
export global FACTOID_BOPOMOFO := "BOPOMOFO"

/**
 * @type {String}
 */
export global FACTOID_JAMO := "JAMO"

/**
 * @type {String}
 */
export global FACTOID_HANGULCOMMON := "HANGUL_COMMON"

/**
 * @type {String}
 */
export global FACTOID_HANGULRARE := "HANGUL_RARE"

/**
 * @type {String}
 */
export global MICROSOFT_PENINPUT_PANEL_PROPERTY_T := "Microsoft PenInputPanel 1.5"

/**
 * @type {String}
 */
export global INKEDIT_CLASSW := "INKEDIT"

/**
 * @type {String}
 */
export global INKEDIT_CLASS := "INKEDIT"

/**
 * @type {Integer (UInt32)}
 */
export global IEC__BASE := 1536

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETINKMODE := 1537

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETINKMODE := 1538

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETINKINSERTMODE := 1539

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETINKINSERTMODE := 1540

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETDRAWATTR := 1541

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETDRAWATTR := 1542

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETRECOTIMEOUT := 1543

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETRECOTIMEOUT := 1544

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETGESTURESTATUS := 1545

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETGESTURESTATUS := 1546

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETRECOGNIZER := 1547

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETRECOGNIZER := 1548

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETFACTOID := 1549

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETFACTOID := 1550

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETSELINK := 1551

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETSELINK := 1552

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETMOUSEICON := 1553

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETMOUSEICON := 1554

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETMOUSEPOINTER := 1555

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETMOUSEPOINTER := 1556

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETSTATUS := 1557

/**
 * @type {Integer (UInt32)}
 */
export global EM_RECOGNIZE := 1558

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETUSEMOUSEFORINPUT := 1559

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETUSEMOUSEFORINPUT := 1560

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETSELINKDISPLAYMODE := 1561

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETSELINKDISPLAYMODE := 1562

/**
 * @type {Integer (UInt32)}
 */
export global IECN__BASE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global IECN_STROKE := 2049

/**
 * @type {Integer (UInt32)}
 */
export global IECN_GESTURE := 2050

/**
 * @type {Integer (UInt32)}
 */
export global IECN_RECOGNITIONRESULT := 2051

/**
 * @type {Integer (UInt32)}
 */
export global RECOFLAG_WORDMODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global RECOFLAG_COERCE := 2

/**
 * @type {Integer (UInt32)}
 */
export global RECOFLAG_SINGLESEG := 4

/**
 * @type {Integer (UInt32)}
 */
export global RECOFLAG_PREFIXOK := 8

/**
 * @type {Integer (UInt32)}
 */
export global RECOFLAG_LINEMODE := 16

/**
 * @type {Integer (UInt32)}
 */
export global RECOFLAG_DISABLEPERSONALIZATION := 32

/**
 * @type {Integer (UInt32)}
 */
export global RECOFLAG_AUTOSPACE := 64

/**
 * @type {Integer (Int32)}
 */
export global RECOCONF_LOWCONFIDENCE := -1

/**
 * @type {Integer (UInt32)}
 */
export global RECOCONF_MEDIUMCONFIDENCE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RECOCONF_HIGHCONFIDENCE := 1

/**
 * @type {Integer (UInt32)}
 */
export global RECOCONF_NOTSET := 128

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_NULL := 61440

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_SCRATCHOUT := 61441

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_TRIANGLE := 61442

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_SQUARE := 61443

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_STAR := 61444

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_CHECK := 61445

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_INFINITY := 61446

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_CROSS := 61447

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_PARAGRAPH := 61448

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_SECTION := 61449

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_BULLET := 61450

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_BULLET_CROSS := 61451

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_SQUIGGLE := 61452

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_SWAP := 61453

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_OPENUP := 61454

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_CLOSEUP := 61455

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_CURLICUE := 61456

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOUBLE_CURLICUE := 61457

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_RECTANGLE := 61458

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_CIRCLE := 61472

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOUBLE_CIRCLE := 61473

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_CIRCLE_TAP := 61474

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_CIRCLE_CIRCLE := 61475

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_CIRCLE_CROSS := 61477

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_CIRCLE_LINE_VERT := 61478

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_CIRCLE_LINE_HORZ := 61479

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_SEMICIRCLE_LEFT := 61480

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_SEMICIRCLE_RIGHT := 61481

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_CHEVRON_UP := 61488

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_CHEVRON_DOWN := 61489

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_CHEVRON_LEFT := 61490

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_CHEVRON_RIGHT := 61491

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_ARROW_UP := 61496

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_ARROW_DOWN := 61497

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_ARROW_LEFT := 61498

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_ARROW_RIGHT := 61499

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOUBLE_ARROW_UP := 61500

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOUBLE_ARROW_DOWN := 61501

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOUBLE_ARROW_LEFT := 61502

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOUBLE_ARROW_RIGHT := 61503

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_UP_ARROW_LEFT := 61504

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_UP_ARROW_RIGHT := 61505

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOWN_ARROW_LEFT := 61506

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOWN_ARROW_RIGHT := 61507

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LEFT_ARROW_UP := 61508

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LEFT_ARROW_DOWN := 61509

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_RIGHT_ARROW_UP := 61510

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_RIGHT_ARROW_DOWN := 61511

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_UP := 61528

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOWN := 61529

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LEFT := 61530

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_RIGHT := 61531

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DIAGONAL_LEFTUP := 61532

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DIAGONAL_RIGHTUP := 61533

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DIAGONAL_LEFTDOWN := 61534

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DIAGONAL_RIGHTDOWN := 61535

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_UP_DOWN := 61536

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOWN_UP := 61537

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LEFT_RIGHT := 61538

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_RIGHT_LEFT := 61539

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_UP_LEFT_LONG := 61540

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_UP_RIGHT_LONG := 61541

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOWN_LEFT_LONG := 61542

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOWN_RIGHT_LONG := 61543

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_UP_LEFT := 61544

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_UP_RIGHT := 61545

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOWN_LEFT := 61546

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOWN_RIGHT := 61547

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LEFT_UP := 61548

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LEFT_DOWN := 61549

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_RIGHT_UP := 61550

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_RIGHT_DOWN := 61551

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_A := 61568

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_B := 61569

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_C := 61570

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_D := 61571

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_E := 61572

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_F := 61573

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_G := 61574

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_H := 61575

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_I := 61576

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_J := 61577

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_K := 61578

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_L := 61579

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_M := 61580

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_N := 61581

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_O := 61582

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_P := 61583

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_Q := 61584

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_R := 61585

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_S := 61586

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_T := 61587

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_U := 61588

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_V := 61589

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_W := 61590

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_X := 61591

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_Y := 61592

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_LETTER_Z := 61593

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DIGIT_0 := 61594

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DIGIT_1 := 61595

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DIGIT_2 := 61596

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DIGIT_3 := 61597

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DIGIT_4 := 61598

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DIGIT_5 := 61599

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DIGIT_6 := 61600

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DIGIT_7 := 61601

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DIGIT_8 := 61602

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DIGIT_9 := 61603

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_EXCLAMATION := 61604

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_QUESTION := 61605

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_SHARP := 61606

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOLLAR := 61607

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_ASTERISK := 61608

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_PLUS := 61609

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOUBLE_UP := 61624

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOUBLE_DOWN := 61625

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOUBLE_LEFT := 61626

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOUBLE_RIGHT := 61627

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_TRIPLE_UP := 61628

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_TRIPLE_DOWN := 61629

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_TRIPLE_LEFT := 61630

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_TRIPLE_RIGHT := 61631

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_BRACKET_OVER := 61668

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_BRACKET_UNDER := 61669

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_BRACKET_LEFT := 61670

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_BRACKET_RIGHT := 61671

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_BRACE_OVER := 61672

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_BRACE_UNDER := 61673

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_BRACE_LEFT := 61674

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_BRACE_RIGHT := 61675

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_TAP := 61680

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_DOUBLE_TAP := 61681

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_TRIPLE_TAP := 61682

/**
 * @type {Integer (UInt32)}
 */
export global GESTURE_QUAD_TAP := 61683

/**
 * @type {Integer (UInt32)}
 */
export global FACILITY_INK := 40

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_X := Guid("{598a6a8f-52c0-4ba0-93af-af357411a561}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_Y := Guid("{b53f9f75-04e0-4498-a7ee-c30dbb5a9011}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_Z := Guid("{735adb30-0ebb-4788-a0e4-0f316490055d}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_PACKET_STATUS := Guid("{6e0e07bf-afe7-4cf7-87d1-af6446208418}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_TIMER_TICK := Guid("{436510c5-fed3-45d1-8b76-71d3ea7a829d}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_SERIAL_NUMBER := Guid("{78a81b56-0935-4493-baae-00541a8a16c4}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_NORMAL_PRESSURE := Guid("{7307502d-f9f4-4e18-b3f2-2ce1b1a3610c}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_TANGENT_PRESSURE := Guid("{6da4488b-5244-41ec-905b-32d89ab80809}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_BUTTON_PRESSURE := Guid("{8b7fefc4-96aa-4bfe-ac26-8a5f0be07bf5}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_X_TILT_ORIENTATION := Guid("{a8d07b3a-8bf0-40b0-95a9-b80a6bb787bf}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_Y_TILT_ORIENTATION := Guid("{0e932389-1d77-43af-ac00-5b950d6d4b2d}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_AZIMUTH_ORIENTATION := Guid("{029123b4-8828-410b-b250-a0536595e5dc}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_ALTITUDE_ORIENTATION := Guid("{82dec5c7-f6ba-4906-894f-66d68dfc456c}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_TWIST_ORIENTATION := Guid("{0d324960-13b2-41e4-ace6-7ae9d43d2d3b}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_PITCH_ROTATION := Guid("{7f7e57b7-be37-4be1-a356-7a84160e1893}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_ROLL_ROTATION := Guid("{5d5d5e56-6ba9-4c5b-9fb0-851c91714e56}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_YAW_ROTATION := Guid("{6a849980-7c3a-45b7-aa82-90a262950e89}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_WIDTH := Guid("{baabe94d-2712-48f5-be9d-8f8b5ea0711a}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_HEIGHT := Guid("{e61858d2-e447-4218-9d3f-18865c203df4}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_FINGERCONTACTCONFIDENCE := Guid("{e706c804-57f0-4f00-8a0c-853d57789be9}")

/**
 * @type {Guid}
 */
export global GUID_PACKETPROPERTY_GUID_DEVICE_CONTACT_ID := Guid("{02585b91-049b-4750-9615-df8948ab3c9c}")

/**
 * @type {Integer (Int32)}
 */
export global InkMinTransparencyValue := 0

/**
 * @type {Integer (Int32)}
 */
export global InkMaxTransparencyValue := 255

/**
 * @type {Integer (Int32)}
 */
export global InkCollectorClipInkToMargin := 0

/**
 * @type {Integer (Int32)}
 */
export global InkCollectorDefaultMargin := -2147483648

/**
 * @type {Guid}
 */
export global GUID_GESTURE_DATA := Guid("{41e4ec0f-26aa-455a-9aa5-2cd36cf63fb9}")

/**
 * @type {Guid}
 */
export global GUID_DYNAMIC_RENDERER_CACHED_DATA := Guid("{bf531b92-25bf-4a95-89ad-0e476b34b4f5}")
;@endregion Constants
