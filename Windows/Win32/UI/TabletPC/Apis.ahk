#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class TabletPC {

;@region Constants

    /**
     * @type {String}
     */
    static MICROSOFT_URL_EXPERIENCE_PROPERTY => "Microsoft TIP URL Experience"

    /**
     * @type {String}
     */
    static MICROSOFT_TIP_NO_INSERT_BUTTON_PROPERTY => "Microsoft TIP No Insert Option"

    /**
     * @type {String}
     */
    static MICROSOFT_TIP_COMBOBOXLIST_PROPERTY => "Microsoft TIP ComboBox List Window Identifier"

    /**
     * @type {String}
     */
    static MICROSOFT_TIP_OPENING_MSG => "TabletInputPanelOpening"

    /**
     * @type {Integer (UInt32)}
     */
    static SAFE_PARTIAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BEST_COMPLETE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_VENDORNAME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_FRIENDLYNAME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_LANGUAGES => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CAC_FULL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CAC_PREFIX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CAC_RANDOM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ASYNC_RECO_INTERRUPTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ASYNC_RECO_PROCESS_FAILED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ASYNC_RECO_ADDSTROKE_FAILED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ASYNC_RECO_SETCACMODE_FAILED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ASYNC_RECO_RESETCONTEXT_FAILED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ASYNC_RECO_SETGUIDE_FAILED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ASYNC_RECO_SETFLAGS_FAILED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ASYNC_RECO_SETFACTOID_FAILED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ASYNC_RECO_SETTEXTCONTEXT_FAILED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ASYNC_RECO_SETWORDLIST_FAILED => 512

    /**
     * @type {Integer (Int32)}
     */
    static RF_DONTCARE => 1

    /**
     * @type {Integer (Int32)}
     */
    static RF_OBJECT => 2

    /**
     * @type {Integer (Int32)}
     */
    static RF_FREE_INPUT => 4

    /**
     * @type {Integer (Int32)}
     */
    static RF_LINED_INPUT => 8

    /**
     * @type {Integer (Int32)}
     */
    static RF_BOXED_INPUT => 16

    /**
     * @type {Integer (Int32)}
     */
    static RF_CAC_INPUT => 32

    /**
     * @type {Integer (Int32)}
     */
    static RF_RIGHT_AND_DOWN => 64

    /**
     * @type {Integer (Int32)}
     */
    static RF_LEFT_AND_DOWN => 128

    /**
     * @type {Integer (Int32)}
     */
    static RF_DOWN_AND_LEFT => 256

    /**
     * @type {Integer (Int32)}
     */
    static RF_DOWN_AND_RIGHT => 512

    /**
     * @type {Integer (Int32)}
     */
    static RF_ARBITRARY_ANGLE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static RF_LATTICE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static RF_ADVISEINKCHANGE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static RF_STROKEREORDER => 8192

    /**
     * @type {Integer (Int32)}
     */
    static RF_PERSONALIZABLE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static RF_PERFORMSLINEBREAKING => 65536

    /**
     * @type {Integer (Int32)}
     */
    static RF_REQUIRESSEGMENTATIONBREAKING => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static FLICK_WM_HANDLED_MASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NUM_FLICK_DIRECTIONS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WM_TABLET_DEFBASE => 704

    /**
     * @type {Integer (UInt32)}
     */
    static WM_TABLET_MAXOFFSET => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WM_TABLET_ADDED => 712

    /**
     * @type {Integer (UInt32)}
     */
    static WM_TABLET_DELETED => 713

    /**
     * @type {Integer (UInt32)}
     */
    static WM_TABLET_FLICK => 715

    /**
     * @type {Integer (UInt32)}
     */
    static WM_TABLET_QUERYSYSTEMGESTURESTATUS => 716

    /**
     * @type {Integer (UInt32)}
     */
    static TABLET_DISABLE_PRESSANDHOLD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TABLET_DISABLE_PENTAPFEEDBACK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TABLET_DISABLE_PENBARRELFEEDBACK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TABLET_DISABLE_TOUCHUIFORCEON => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TABLET_DISABLE_TOUCHUIFORCEOFF => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TABLET_DISABLE_TOUCHSWITCH => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static TABLET_DISABLE_FLICKS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static TABLET_ENABLE_FLICKSONCONTEXT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static TABLET_ENABLE_FLICKLEARNINGMODE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static TABLET_DISABLE_SMOOTHSCROLLING => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static TABLET_DISABLE_FLICKFALLBACKKEYS => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static TABLET_ENABLE_MULTITOUCHDATA => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PACKET_PROPERTY_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PACKET_BUTTON_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IP_CURSOR_DOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IP_INVERTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IP_MARGIN => 4

    /**
     * @type {String}
     */
    static INK_SERIALIZED_FORMAT => "Ink Serialized Format"

    /**
     * @type {String}
     */
    static STR_GUID_X => "{598A6A8F-52C0-4BA0-93AF-AF357411A561}"

    /**
     * @type {String}
     */
    static STR_GUID_Y => "{B53F9F75-04E0-4498-A7EE-C30DBB5A9011}"

    /**
     * @type {String}
     */
    static STR_GUID_Z => "{735ADB30-0EBB-4788-A0E4-0F316490055D}"

    /**
     * @type {String}
     */
    static STR_GUID_PAKETSTATUS => "{6E0E07BF-AFE7-4CF7-87D1-AF6446208418}"

    /**
     * @type {String}
     */
    static STR_GUID_TIMERTICK => "{436510C5-FED3-45D1-8B76-71D3EA7A829D}"

    /**
     * @type {String}
     */
    static STR_GUID_SERIALNUMBER => "{78A81B56-0935-4493-BAAE-00541A8A16C4}"

    /**
     * @type {String}
     */
    static STR_GUID_NORMALPRESSURE => "{7307502D-F9F4-4E18-B3F2-2CE1B1A3610C}"

    /**
     * @type {String}
     */
    static STR_GUID_TANGENTPRESSURE => "{6DA4488B-5244-41EC-905B-32D89AB80809}"

    /**
     * @type {String}
     */
    static STR_GUID_BUTTONPRESSURE => "{8B7FEFC4-96AA-4BFE-AC26-8A5F0BE07BF5}"

    /**
     * @type {String}
     */
    static STR_GUID_XTILTORIENTATION => "{A8D07B3A-8BF0-40B0-95A9-B80A6BB787BF}"

    /**
     * @type {String}
     */
    static STR_GUID_YTILTORIENTATION => "{0E932389-1D77-43AF-AC00-5B950D6D4B2D}"

    /**
     * @type {String}
     */
    static STR_GUID_AZIMUTHORIENTATION => "{029123B4-8828-410B-B250-A0536595E5DC}"

    /**
     * @type {String}
     */
    static STR_GUID_ALTITUDEORIENTATION => "{82DEC5C7-F6BA-4906-894F-66D68DFC456C}"

    /**
     * @type {String}
     */
    static STR_GUID_TWISTORIENTATION => "{0D324960-13B2-41E4-ACE6-7AE9D43D2D3B}"

    /**
     * @type {String}
     */
    static STR_GUID_PITCHROTATION => "{7F7E57B7-BE37-4BE1-A356-7A84160E1893}"

    /**
     * @type {String}
     */
    static STR_GUID_ROLLROTATION => "{5D5D5E56-6BA9-4C5B-9FB0-851C91714E56}"

    /**
     * @type {String}
     */
    static STR_GUID_YAWROTATION => "{6A849980-7C3A-45B7-AA82-90A262950E89}"

    /**
     * @type {String}
     */
    static STR_GUID_WIDTH => "{BAABE94D-2712-48F5-BE9D-8F8B5EA0711A}"

    /**
     * @type {String}
     */
    static STR_GUID_HEIGHT => "{E61858D2-E447-4218-9D3F-18865C203DF4}"

    /**
     * @type {String}
     */
    static STR_GUID_FINGERCONTACTCONFIDENCE => "{E706C804-57F0-4F00-8A0C-853D57789BE9}"

    /**
     * @type {String}
     */
    static STR_GUID_DEVICE_CONTACT_ID => "{02585B91-049B-4750-9615-DF8948AB3C9C}"

    /**
     * @type {String}
     */
    static INKRECOGNITIONPROPERTY_LINENUMBER => "{DBF29F2C-5289-4BE8-B3D8-6EF63246253E}"

    /**
     * @type {String}
     */
    static INKRECOGNITIONPROPERTY_BOXNUMBER => "{2C243E3A-F733-4EB6-B1F8-B5DC5C2C4CDA}"

    /**
     * @type {String}
     */
    static INKRECOGNITIONPROPERTY_SEGMENTATION => "{B3C0FE6C-FB51-4164-BA2F-844AF8F983DA}"

    /**
     * @type {String}
     */
    static INKRECOGNITIONPROPERTY_HOTPOINT => "{CA6F40DC-5292-452a-91FB-2181C0BEC0DE}"

    /**
     * @type {String}
     */
    static INKRECOGNITIONPROPERTY_MAXIMUMSTROKECOUNT => "{BF0EEC4E-4B7D-47a9-8CFA-234DD24BD22A}"

    /**
     * @type {String}
     */
    static INKRECOGNITIONPROPERTY_POINTSPERINCH => "{7ED16B76-889C-468e-8276-0021B770187E}"

    /**
     * @type {String}
     */
    static INKRECOGNITIONPROPERTY_CONFIDENCELEVEL => "{7DFE11A7-FB5D-4958-8765-154ADF0D833F}"

    /**
     * @type {String}
     */
    static INKRECOGNITIONPROPERTY_LINEMETRICS => "{8CC24B27-30A9-4b96-9056-2D3A90DA0727}"

    /**
     * @type {String}
     */
    static FACTOID_NONE => "NONE"

    /**
     * @type {String}
     */
    static FACTOID_DEFAULT => "DEFAULT"

    /**
     * @type {String}
     */
    static FACTOID_SYSTEMDICTIONARY => "SYSDICT"

    /**
     * @type {String}
     */
    static FACTOID_WORDLIST => "WORDLIST"

    /**
     * @type {String}
     */
    static FACTOID_EMAIL => "EMAIL"

    /**
     * @type {String}
     */
    static FACTOID_WEB => "WEB"

    /**
     * @type {String}
     */
    static FACTOID_ONECHAR => "ONECHAR"

    /**
     * @type {String}
     */
    static FACTOID_NUMBER => "NUMBER"

    /**
     * @type {String}
     */
    static FACTOID_DIGIT => "DIGIT"

    /**
     * @type {String}
     */
    static FACTOID_NUMBERSIMPLE => "NUMSIMPLE"

    /**
     * @type {String}
     */
    static FACTOID_CURRENCY => "CURRENCY"

    /**
     * @type {String}
     */
    static FACTOID_POSTALCODE => "POSTALCODE"

    /**
     * @type {String}
     */
    static FACTOID_PERCENT => "PERCENT"

    /**
     * @type {String}
     */
    static FACTOID_DATE => "DATE"

    /**
     * @type {String}
     */
    static FACTOID_TIME => "TIME"

    /**
     * @type {String}
     */
    static FACTOID_TELEPHONE => "TELEPHONE"

    /**
     * @type {String}
     */
    static FACTOID_FILENAME => "FILENAME"

    /**
     * @type {String}
     */
    static FACTOID_UPPERCHAR => "UPPERCHAR"

    /**
     * @type {String}
     */
    static FACTOID_LOWERCHAR => "LOWERCHAR"

    /**
     * @type {String}
     */
    static FACTOID_PUNCCHAR => "PUNCCHAR"

    /**
     * @type {String}
     */
    static FACTOID_JAPANESECOMMON => "JPN_COMMON"

    /**
     * @type {String}
     */
    static FACTOID_CHINESESIMPLECOMMON => "CHS_COMMON"

    /**
     * @type {String}
     */
    static FACTOID_CHINESETRADITIONALCOMMON => "CHT_COMMON"

    /**
     * @type {String}
     */
    static FACTOID_KOREANCOMMON => "KOR_COMMON"

    /**
     * @type {String}
     */
    static FACTOID_HIRAGANA => "HIRAGANA"

    /**
     * @type {String}
     */
    static FACTOID_KATAKANA => "KATAKANA"

    /**
     * @type {String}
     */
    static FACTOID_KANJICOMMON => "KANJI_COMMON"

    /**
     * @type {String}
     */
    static FACTOID_KANJIRARE => "KANJI_RARE"

    /**
     * @type {String}
     */
    static FACTOID_BOPOMOFO => "BOPOMOFO"

    /**
     * @type {String}
     */
    static FACTOID_JAMO => "JAMO"

    /**
     * @type {String}
     */
    static FACTOID_HANGULCOMMON => "HANGUL_COMMON"

    /**
     * @type {String}
     */
    static FACTOID_HANGULRARE => "HANGUL_RARE"

    /**
     * @type {String}
     */
    static MICROSOFT_PENINPUT_PANEL_PROPERTY_T => "Microsoft PenInputPanel 1.5"

    /**
     * @type {String}
     */
    static INKEDIT_CLASSW => "INKEDIT"

    /**
     * @type {String}
     */
    static INKEDIT_CLASS => "INKEDIT"

    /**
     * @type {Integer (UInt32)}
     */
    static IEC__BASE => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETINKMODE => 1537

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETINKMODE => 1538

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETINKINSERTMODE => 1539

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETINKINSERTMODE => 1540

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETDRAWATTR => 1541

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETDRAWATTR => 1542

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETRECOTIMEOUT => 1543

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETRECOTIMEOUT => 1544

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETGESTURESTATUS => 1545

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETGESTURESTATUS => 1546

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETRECOGNIZER => 1547

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETRECOGNIZER => 1548

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETFACTOID => 1549

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETFACTOID => 1550

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETSELINK => 1551

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETSELINK => 1552

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETMOUSEICON => 1553

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETMOUSEICON => 1554

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETMOUSEPOINTER => 1555

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETMOUSEPOINTER => 1556

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETSTATUS => 1557

    /**
     * @type {Integer (UInt32)}
     */
    static EM_RECOGNIZE => 1558

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETUSEMOUSEFORINPUT => 1559

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETUSEMOUSEFORINPUT => 1560

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETSELINKDISPLAYMODE => 1561

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETSELINKDISPLAYMODE => 1562

    /**
     * @type {Integer (UInt32)}
     */
    static IECN__BASE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IECN_STROKE => 2049

    /**
     * @type {Integer (UInt32)}
     */
    static IECN_GESTURE => 2050

    /**
     * @type {Integer (UInt32)}
     */
    static IECN_RECOGNITIONRESULT => 2051

    /**
     * @type {Integer (UInt32)}
     */
    static RECOFLAG_WORDMODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RECOFLAG_COERCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RECOFLAG_SINGLESEG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RECOFLAG_PREFIXOK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RECOFLAG_LINEMODE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RECOFLAG_DISABLEPERSONALIZATION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RECOFLAG_AUTOSPACE => 64

    /**
     * @type {Integer (Int32)}
     */
    static RECOCONF_LOWCONFIDENCE => -1

    /**
     * @type {Integer (UInt32)}
     */
    static RECOCONF_MEDIUMCONFIDENCE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RECOCONF_HIGHCONFIDENCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RECOCONF_NOTSET => 128

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_NULL => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_SCRATCHOUT => 61441

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_TRIANGLE => 61442

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_SQUARE => 61443

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_STAR => 61444

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_CHECK => 61445

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_INFINITY => 61446

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_CROSS => 61447

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_PARAGRAPH => 61448

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_SECTION => 61449

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_BULLET => 61450

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_BULLET_CROSS => 61451

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_SQUIGGLE => 61452

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_SWAP => 61453

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_OPENUP => 61454

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_CLOSEUP => 61455

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_CURLICUE => 61456

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOUBLE_CURLICUE => 61457

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_RECTANGLE => 61458

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_CIRCLE => 61472

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOUBLE_CIRCLE => 61473

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_CIRCLE_TAP => 61474

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_CIRCLE_CIRCLE => 61475

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_CIRCLE_CROSS => 61477

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_CIRCLE_LINE_VERT => 61478

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_CIRCLE_LINE_HORZ => 61479

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_SEMICIRCLE_LEFT => 61480

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_SEMICIRCLE_RIGHT => 61481

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_CHEVRON_UP => 61488

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_CHEVRON_DOWN => 61489

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_CHEVRON_LEFT => 61490

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_CHEVRON_RIGHT => 61491

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_ARROW_UP => 61496

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_ARROW_DOWN => 61497

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_ARROW_LEFT => 61498

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_ARROW_RIGHT => 61499

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOUBLE_ARROW_UP => 61500

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOUBLE_ARROW_DOWN => 61501

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOUBLE_ARROW_LEFT => 61502

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOUBLE_ARROW_RIGHT => 61503

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_UP_ARROW_LEFT => 61504

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_UP_ARROW_RIGHT => 61505

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOWN_ARROW_LEFT => 61506

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOWN_ARROW_RIGHT => 61507

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LEFT_ARROW_UP => 61508

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LEFT_ARROW_DOWN => 61509

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_RIGHT_ARROW_UP => 61510

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_RIGHT_ARROW_DOWN => 61511

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_UP => 61528

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOWN => 61529

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LEFT => 61530

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_RIGHT => 61531

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DIAGONAL_LEFTUP => 61532

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DIAGONAL_RIGHTUP => 61533

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DIAGONAL_LEFTDOWN => 61534

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DIAGONAL_RIGHTDOWN => 61535

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_UP_DOWN => 61536

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOWN_UP => 61537

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LEFT_RIGHT => 61538

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_RIGHT_LEFT => 61539

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_UP_LEFT_LONG => 61540

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_UP_RIGHT_LONG => 61541

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOWN_LEFT_LONG => 61542

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOWN_RIGHT_LONG => 61543

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_UP_LEFT => 61544

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_UP_RIGHT => 61545

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOWN_LEFT => 61546

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOWN_RIGHT => 61547

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LEFT_UP => 61548

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LEFT_DOWN => 61549

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_RIGHT_UP => 61550

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_RIGHT_DOWN => 61551

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_A => 61568

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_B => 61569

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_C => 61570

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_D => 61571

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_E => 61572

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_F => 61573

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_G => 61574

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_H => 61575

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_I => 61576

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_J => 61577

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_K => 61578

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_L => 61579

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_M => 61580

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_N => 61581

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_O => 61582

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_P => 61583

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_Q => 61584

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_R => 61585

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_S => 61586

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_T => 61587

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_U => 61588

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_V => 61589

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_W => 61590

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_X => 61591

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_Y => 61592

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_LETTER_Z => 61593

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DIGIT_0 => 61594

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DIGIT_1 => 61595

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DIGIT_2 => 61596

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DIGIT_3 => 61597

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DIGIT_4 => 61598

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DIGIT_5 => 61599

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DIGIT_6 => 61600

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DIGIT_7 => 61601

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DIGIT_8 => 61602

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DIGIT_9 => 61603

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_EXCLAMATION => 61604

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_QUESTION => 61605

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_SHARP => 61606

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOLLAR => 61607

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_ASTERISK => 61608

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_PLUS => 61609

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOUBLE_UP => 61624

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOUBLE_DOWN => 61625

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOUBLE_LEFT => 61626

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOUBLE_RIGHT => 61627

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_TRIPLE_UP => 61628

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_TRIPLE_DOWN => 61629

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_TRIPLE_LEFT => 61630

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_TRIPLE_RIGHT => 61631

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_BRACKET_OVER => 61668

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_BRACKET_UNDER => 61669

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_BRACKET_LEFT => 61670

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_BRACKET_RIGHT => 61671

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_BRACE_OVER => 61672

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_BRACE_UNDER => 61673

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_BRACE_LEFT => 61674

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_BRACE_RIGHT => 61675

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_TAP => 61680

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_DOUBLE_TAP => 61681

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_TRIPLE_TAP => 61682

    /**
     * @type {Integer (UInt32)}
     */
    static GESTURE_QUAD_TAP => 61683

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_INK => 40

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_X => "{598a6a8f-52c0-4ba0-93af-af357411a561}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_Y => "{b53f9f75-04e0-4498-a7ee-c30dbb5a9011}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_Z => "{735adb30-0ebb-4788-a0e4-0f316490055d}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_PACKET_STATUS => "{6e0e07bf-afe7-4cf7-87d1-af6446208418}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_TIMER_TICK => "{436510c5-fed3-45d1-8b76-71d3ea7a829d}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_SERIAL_NUMBER => "{78a81b56-0935-4493-baae-00541a8a16c4}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_NORMAL_PRESSURE => "{7307502d-f9f4-4e18-b3f2-2ce1b1a3610c}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_TANGENT_PRESSURE => "{6da4488b-5244-41ec-905b-32d89ab80809}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_BUTTON_PRESSURE => "{8b7fefc4-96aa-4bfe-ac26-8a5f0be07bf5}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_X_TILT_ORIENTATION => "{a8d07b3a-8bf0-40b0-95a9-b80a6bb787bf}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_Y_TILT_ORIENTATION => "{0e932389-1d77-43af-ac00-5b950d6d4b2d}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_AZIMUTH_ORIENTATION => "{029123b4-8828-410b-b250-a0536595e5dc}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_ALTITUDE_ORIENTATION => "{82dec5c7-f6ba-4906-894f-66d68dfc456c}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_TWIST_ORIENTATION => "{0d324960-13b2-41e4-ace6-7ae9d43d2d3b}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_PITCH_ROTATION => "{7f7e57b7-be37-4be1-a356-7a84160e1893}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_ROLL_ROTATION => "{5d5d5e56-6ba9-4c5b-9fb0-851c91714e56}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_YAW_ROTATION => "{6a849980-7c3a-45b7-aa82-90a262950e89}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_WIDTH => "{baabe94d-2712-48f5-be9d-8f8b5ea0711a}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_HEIGHT => "{e61858d2-e447-4218-9d3f-18865c203df4}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_FINGERCONTACTCONFIDENCE => "{e706c804-57f0-4f00-8a0c-853d57789be9}"

    /**
     * @type {String}
     */
    static GUID_PACKETPROPERTY_GUID_DEVICE_CONTACT_ID => "{02585b91-049b-4750-9615-df8948ab3c9c}"

    /**
     * @type {Integer (Int32)}
     */
    static InkMinTransparencyValue => 0

    /**
     * @type {Integer (Int32)}
     */
    static InkMaxTransparencyValue => 255

    /**
     * @type {Integer (Int32)}
     */
    static InkCollectorClipInkToMargin => 0

    /**
     * @type {Integer (Int32)}
     */
    static InkCollectorDefaultMargin => -2147483648

    /**
     * @type {String}
     */
    static GUID_GESTURE_DATA => "{41e4ec0f-26aa-455a-9aa5-2cd36cf63fb9}"

    /**
     * @type {String}
     */
    static GUID_DYNAMIC_RENDERER_CACHED_DATA => "{bf531b92-25bf-4a95-89ad-0e476b34b4f5}"
;@endregion Constants

;@region Methods
    /**
     * Creates a recognizer.
     * @param {Pointer<Guid>} pCLSID CLSID of the recognizer. This value is created in the registry when you register the recognizer.
     * @param {Pointer<HRECOGNIZER>} phrec Handle for the recognizer.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-createrecognizer
     * @since windows5.1.2600
     */
    static CreateRecognizer(pCLSID, phrec) {
        result := DllCall("inkobjcore.dll\CreateRecognizer", "ptr", pCLSID, "ptr", phrec, "int")
        return result
    }

    /**
     * Destroys a recognizer.
     * @param {Pointer<HRECOGNIZER>} hrec Handle to the recognizer.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-destroyrecognizer
     * @since windows5.1.2600
     */
    static DestroyRecognizer(hrec) {
        result := DllCall("inkobjcore.dll\DestroyRecognizer", "ptr", hrec, "int")
        return result
    }

    /**
     * Retrieves the attributes of the recognizer.
     * @remarks
     * A gesture recognizer should set the RF_OBJECT bit of the <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-reco_attrs">RECO_ATTRS</a><b>::dwRecoCapabilityFlags</b> and should set every element in the <b>RECO_ATTRS</b><b>::awLanguageID</b> array to zero.
     * 
     * A gesture recognizer does not normally use a recognition guide. A gesture recognizer with no guide should clear the RF_LINED_INPUT and RF_BOXED_INPUT bits.
     * 
     * The <i>awcFriendlyName</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-reco_attrs">RECO_ATTRS</a> structure may be empty (that is, having the first element set to the null character) when you use this structure as a return value from the <b>GetRecoAttributes Function</b>. Because this is not an error, the return code for <i>awcFriendlyName</i> in <b>GetRecoAttributes Function</b> will be S_OK, and the other fields will contain data.
     * @param {Pointer<HRECOGNIZER>} hrec Handle to the recognizer.
     * @param {Pointer<RECO_ATTRS>} pRecoAttrs The attributes of the recognizer. The attributes define the languages and capabilities that the recognizer supports. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-reco_attrs">RECO_ATTRS</a> structure.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getrecoattributes
     * @since windows5.1.2600
     */
    static GetRecoAttributes(hrec, pRecoAttrs) {
        result := DllCall("inkobjcore.dll\GetRecoAttributes", "ptr", hrec, "ptr", pRecoAttrs, "int")
        return result
    }

    /**
     * Creates a recognizer context.
     * @param {Pointer<HRECOGNIZER>} hrec Handle to the recognizer.
     * @param {Pointer<HRECOCONTEXT>} phrc Pointer to the recognizer context.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is an invalid pointer.
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
     * There is insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-createcontext
     * @since windows5.1.2600
     */
    static CreateContext(hrec, phrc) {
        result := DllCall("inkobjcore.dll\CreateContext", "ptr", hrec, "ptr", phrc, "int")
        return result
    }

    /**
     * Destroys a recognizer context.
     * @param {Pointer<HRECOCONTEXT>} hrc Handle to the recognizer context.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-destroycontext
     * @since windows5.1.2600
     */
    static DestroyContext(hrc) {
        result := DllCall("inkobjcore.dll\DestroyContext", "ptr", hrc, "int")
        return result
    }

    /**
     * Retrieves a list of properties the recognizer can return for a result range.
     * @param {Pointer<HRECOGNIZER>} hrec Handle to the recognizer.
     * @param {Pointer<UInt32>} pPropertyCount On input, the number of GUIDs the <i>pPropertyGuid</i> buffer can hold. On output, the number of GUIDs the <i>pPropertyGuid</i> buffer contains.
     * @param {Pointer<Guid>} pPropertyGuid Array of properties the recognizer can return. The order of the array is arbitrary. For a list of predefined properties, see the recognition <a href="https://docs.microsoft.com/windows/desktop/tablet/property-guids">Property GUIDs</a>. To determine the required size of the buffer, set <i>pPropertyGuid</i> to <b>NULL</b>; use the number of GUIDs to allocate the buffer.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_E_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pPropertyGuid</i> buffer is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getresultpropertylist
     * @since windows5.1.2600
     */
    static GetResultPropertyList(hrec, pPropertyCount, pPropertyGuid) {
        result := DllCall("inkobjcore.dll\GetResultPropertyList", "ptr", hrec, "ptr", pPropertyCount, "ptr", pPropertyGuid, "int")
        return result
    }

    /**
     * Returns the ranges of Unicode points that the recognizer supports.
     * @remarks
     * This function is optional.
     * 
     * Some recognizers do not support this capability, but may still include the <b>GetUnicodeRanges Function</b> function. For such recognizers the <b>GetUnicodeRanges</b> function returns E_NOTIMPL.
     * 
     * To control the Unicode ranges used by a specific recognizer context, use the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-getenabledunicoderanges">GetEnabledUnicodeRanges</a> and <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-setenabledunicoderanges">SetEnabledUnicodeRanges</a> functions. These ranges are constrained to be a subset of the ranges returned by <b>GetUnicodeRanges</b>.
     * 
     * Microsoft gesture recognizers use Unicode characters from 0xF000 to 0xF0FF. Each single Unicode value in this range represents a single gesture. For a complete list of Unicode values for gestures, see <a href="https://docs.microsoft.com/windows/desktop/tablet/unicode-range-values-of-gestures">Unicode Range Values of Gestures</a>.
     * @param {Pointer<HRECOGNIZER>} hrec Handle to the recognizer.
     * @param {Pointer<UInt32>} pcRanges On input, the number of ranges the <i>pcr</i> buffer can hold. On output, the number of ranges the <i>pcr</i> buffer contains.
     * @param {Pointer<CHARACTER_RANGE>} pcr Array of <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-character_range">CHARACTER_RANGE</a> structures. Each structure contains a range of Unicode points that the recognizer supports. The order of the array is arbitrary. To determine the required size of the buffer, set <i>pcr</i> to <b>NULL</b>; use the number of ranges to allocate the <i>pcr</i> buffer.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_E_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pcr</i> buffer is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getunicoderanges
     * @since windows5.1.2600
     */
    static GetUnicodeRanges(hrec, pcRanges, pcr) {
        result := DllCall("inkobjcore.dll\GetUnicodeRanges", "ptr", hrec, "ptr", pcRanges, "ptr", pcr, "int")
        return result
    }

    /**
     * Adds an ink stroke to the RecognizerContext.
     * @remarks
     * The recognizer must return properties such as <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_baseline">Baseline</a> in ink space coordinates rather than tablet coordinates.
     * 
     * It is recommended that your recognizer place a limit on the number of strokes per context and/or the points allowed in a given stroke. Limit input to 1024 strokes per context and 32767 points per stroke.
     * 
     * Strokes with zero points are not allowed. You should return E_FAIL in such a case.
     * @param {Pointer<HRECOCONTEXT>} hrc The handle to the recognizer context.
     * @param {Pointer<PACKET_DESCRIPTION>} pPacketDesc Describes the contents of the packets. The description must match the contents of the packets in <i>pPacket</i>. If <b>NULL</b>, this function uses the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-getpreferredpacketdescription">GetPreferredPacketDescription</a> function.
     * @param {Integer} cbPacket Size, in bytes, of the <i>pPacket</i> buffer.
     * @param {Pointer<Byte>} pPacket Array of packets that contain tablet space coordinates.
     * @param {Pointer<XFORM>} pXForm Describes the transform that can be applied to ink to transform it from tablet space into ink space. A recognizer may choose to ignore this transform and implement their own ink rotation algorithms. These recognizers should still return properties calculated in the lattice data relative to this transform.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is an invalid pointer.
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
     * Unable to allocate memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_E_INVALID_PACKET_DESCRIPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The packet description does not contain the necessary information for the packet to be considered valid. For example, it does not include a GUID_X or GUID_Y property.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_E_OUT_OF_ORDER_CALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call to the method was made out of order.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-addstroke
     * @since windows5.1.2600
     */
    static AddStroke(hrc, pPacketDesc, cbPacket, pPacket, pXForm) {
        result := DllCall("inkobjcore.dll\AddStroke", "ptr", hrc, "ptr", pPacketDesc, "uint", cbPacket, "ptr", pPacket, "ptr", pXForm, "int")
        return result
    }

    /**
     * Retrieves the best result string.
     * @param {Pointer<HRECOCONTEXT>} hrc Handle to the recognizer context.
     * @param {Pointer<UInt32>} pcSize On input, the number of characters the <i>pwcBestResult</i> buffer can hold. On output, the number of characters the <i>pwcBestResult</i> buffer contains. If <i>pwcBestResult</i> is <b>NULL</b>, the function returns the required size of the buffer that you use to allocate the <i>pwcBestResult</i> buffer.
     * @param {Pointer<PWSTR>} pwcBestResult Recognition result. If the buffer is too small, the function truncates the string. The string is not <b>NULL</b>-terminated. To determine the required size of the buffer, set <i>pwcBestResult</i> to <b>NULL</b>; use <i>pcSize</i> to allocate the <i>pwcBestResult</i> buffer.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * For Latin and East Asian recognizers this result in combination with an empty string in <i>pwcBestResult</i> means that no recognition result exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_S_TRUNCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string is truncated to fit in the <i>pwcBestResult</i> buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
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
     * Unexpected parameter or property type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_E_NOT_RELEVANT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer context does not contain results. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getbestresultstring
     * @since windows5.1.2600
     */
    static GetBestResultString(hrc, pcSize, pwcBestResult) {
        pwcBestResult := pwcBestResult is String? StrPtr(pwcBestResult) : pwcBestResult

        result := DllCall("inkobjcore.dll\GetBestResultString", "ptr", hrc, "ptr", pcSize, "ptr", pwcBestResult, "int")
        return result
    }

    /**
     * Sets the recognition guide to use for boxed or lined input. You must call this function before you add strokes to the context.
     * @remarks
     * Guide boxes are numbered based on the <i>iIntex</i> value.
     * @param {Pointer<HRECOCONTEXT>} hrc Handle to the recognizer context.
     * @param {Pointer<RECO_GUIDE>} pGuide Guide to use for box or line input. Setting this parameter to <b>NULL</b> means that the context has no guide. This is the default and means the recognizer is in free input mode. For guide details, see the <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-reco_guide">RECO_GUIDE</a> structure.
     * @param {Integer} iIndex Index value to use for the first box or line in the context.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is invalid or one of the parameters is an invalid pointer.
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
     * Unable to allocate memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attempted to set a recognition mode (free, lined, boxed, and so on) that is not supported by the recognizer, or the RECO_GUIDE field values are illegal (negative heights or widths, for example).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_E_OUT_OF_ORDER_CALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attempted to set guide when there was already some ink in the reco context, or, in the case of recognizers of East Asian characters, <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-setcacmode">SetCACMode</a> was called previously.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-setguide
     * @since windows5.1.2600
     */
    static SetGuide(hrc, pGuide, iIndex) {
        result := DllCall("inkobjcore.dll\SetGuide", "ptr", hrc, "ptr", pGuide, "uint", iIndex, "int")
        return result
    }

    /**
     * Stops the recognizer from processing ink because a stroke has been added or deleted.
     * @remarks
     * The <b>AdviseInkChange</b> function signals that there will be additional calls to the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-addstroke">AddStroke</a> function. This enables any recognition already in progress to stop at any convenient point. Recognition completion is one such point, so <b>AdviseInkChange</b> can safely do nothing.
     * 
     * For example, if you have two threads, one thread may be using <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-addstroke">AddStroke</a> and <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-process">Process</a> with other functions to obtain results. The other thread may be collecting ink, echoing it, and queuing tasks for the first thread. The second thread calls <b>AdviseInkChange</b> to notify the recognizer a change is coming. This enables the first thread to return to the caller sooner than without the call to <b>AdviseInkChange</b>. The first thread can then call the recognizer again with more ink.
     * 
     * If you set the bNewStroke parameter to <b>FALSE</b> because a stroke was modified or deleted, you must also call the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-resetcontext">ResetContext</a> function, and then call the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-addstroke">AddStroke</a> function to add the strokes from the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object to the recognizer context. This is done automatically if you attach the recognizer context to the <b>InkDisp</b> object.
     * @param {Pointer<HRECOCONTEXT>} hrc The handle to the recognizer context.
     * @param {Integer} bNewStroke <b>TRUE</b> if adding a new stroke. Set to <b>FALSE</b> if strokes were erased, split, merged, extracted, or deleted from the Ink object.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success. This function also returns S_OK if the recognizer does not support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-adviseinkchange
     * @since windows5.1.2600
     */
    static AdviseInkChange(hrc, bNewStroke) {
        result := DllCall("inkobjcore.dll\AdviseInkChange", "ptr", hrc, "int", bNewStroke, "int")
        return result
    }

    /**
     * Indicates that no more ink will be added to the context.You cannot add strokes to the context after calling this function.
     * @remarks
     * The recognition results you receive after calling this function may be different from previous recognition results that were based on partial ink input.
     * 
     * The Ink Analysis API queries for the implementation of this method. If implemented, the InkAnalyzer will call it each time it performs an analysis operation. If not implemented, EndInkInput is never called. Therefore, you should only expose and implement this method if it is explicitly needed by your recognizer.
     * 
     * <div class="alert"><b>Note</b>  This function is not guaranteed to be called by all applications or operating system components, such as the Tablet PC Input Panel. Therefore, recognizers should not rely on it being called.</div>
     * <div> </div>
     * @param {Pointer<HRECOCONTEXT>} hrc The handle to the recognizer context.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer context handle is invalid or null.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-endinkinput
     * @since windows5.1.2600
     */
    static EndInkInput(hrc) {
        result := DllCall("inkobjcore.dll\EndInkInput", "ptr", hrc, "int")
        return result
    }

    /**
     * Performs ink recognition synchronously.
     * @param {Pointer<HRECOCONTEXT>} hrc The handle to the recognizer context.
     * @param {Pointer<Int32>} pbPartialProcessing Specify <b>TRUE</b> to process a subset of the ink. Partial processing reduces the time the recognizer spends performing recognition if more ink is expected.
     * 
     * Typically an application specifies <b>FALSE</b> to process all the ink. The function does not process all the ink if you have not called the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-endinkinput">EndInkInput</a> function.
     * 
     * The function sets the <i>pbPartialProcessing</i> parameter to <b>TRUE</b> if there is enough ink left to continue processing; otherwise, <b>FALSE</b>.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
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
     * The function did not process the ink because the ink has been fully processed, or the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-endinkinput">EndInkInput</a> function has not been called and the recognizer does not support incremental processing of ink.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_S_INTERRUPTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process was interrupted by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-adviseinkchange">AdviseInkChange</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-process
     */
    static Process(hrc, pbPartialProcessing) {
        result := DllCall("inkobjcore.dll\Process", "ptr", hrc, "ptr", pbPartialProcessing, "int")
        return result
    }

    /**
     * Specifies the factoid a recognizer uses to constrain its search for the result.You specify a factoid if an input field is of a known type, such as if the input field contains a date.
     * @remarks
     * For a list of factoids that can be passed in the <i>cwcFactoid</i> parameter, see <a href="https://docs.microsoft.com/windows/desktop/tablet/supported-factoids-from-version-1">Supported Factoids from Version 1</a>. The DEFAULT factoid listed in that topic is not a valid value to pass to <b>SetFactoid</b>; the Tablet PC Platform API's internally convert DEFAULT to <b>NULL</b> before calling the <b>SetFactoid</b> function.
     * 
     * It is recommended that you limit the length of the factoid string to no more than 32768 characters.
     * @param {Pointer<HRECOCONTEXT>} hrc Handle to the recognizer context.
     * @param {Integer} cwcFactoid Number of characters in <i>pwcFactoid</i>.
     * @param {Pointer<PWSTR>} pwcFactoid Identifies the factoid to use on the recognizer context. The string is not <b>NULL</b>-terminated.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_E_INVALID_PROPERTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified factoid is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_E_OUT_OF_ORDER_CALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You must call the SetFactoid function before calling the Process function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is invalid or one of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not support this function.
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
     * Unable to allocate memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context contains an invalid value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-setfactoid
     * @since windows5.1.2600
     */
    static SetFactoid(hrc, cwcFactoid, pwcFactoid) {
        pwcFactoid := pwcFactoid is String? StrPtr(pwcFactoid) : pwcFactoid

        result := DllCall("inkobjcore.dll\SetFactoid", "ptr", hrc, "uint", cwcFactoid, "ptr", pwcFactoid, "int")
        return result
    }

    /**
     * Specifies how the recognizer interprets the ink and determines the result string.Call this function before processing the ink for the first time. Therefore, call the SetFlags function before calling the Process function.
     * @remarks
     * Prior to Microsoft Windows XP Tablet PC Edition Development Kit 1.7, Tablet PC Input Panel performed smart spacing. Starting with Tablet PC SDK 1.7, Input Panel continues to produce results with preliminary spacing recommendations. Tablet PC Input Panel's spacing results may however be changed by the recognizer's recommendations (results). The recognizer is able to do this by using text contextual information (based on the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-settextcontext">SetTextContext</a> call made by Input Panel) and its internal language model rules.
     * 
     * Input Panel is able to determine whether the recognizer is capable of doing auto-spacing by calling this function with the RECOFLAG_AUTOSPACE flag set. If the recognizer does not support auto-spacing, E_INVALIDARG is returned.
     * 
     * <div class="alert"><b>Note</b>  Only line mode is supported in the <b>SetFlags</b> function. Boxed mode, free mode, and single-line mode are not supported.</div>
     * <div> </div>
     * @param {Pointer<HRECOCONTEXT>} hrc Handle to the recognizer context.
     * @param {Integer} dwFlags The following table lists the flags that you may set to specify how the recognizer interprets the ink and determines the result string. Use the <b>OR</b> operator (|) to combine flags as appropriate.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Bit flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECOFLAG_AUTOSPACE"></a><a id="recoflag_autospace"></a><dl>
     * <dt><b>RECOFLAG_AUTOSPACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recognizer uses smart spacing based on language model rules.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECOFLAG_COERCE"></a><a id="recoflag_coerce"></a><dl>
     * <dt><b>RECOFLAG_COERCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recognizer coerces the result based on the factoid you specify for the context. For example, if you specify a phone number factoid and the user enters the word "hello", the recognizer may return a random phone number or an empty string. If you do not specify this flag, the recognizer returns "hello" as the result.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECOFLAG_PREFIXOK"></a><a id="recoflag_prefixok"></a><dl>
     * <dt><b>RECOFLAG_PREFIXOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recognizer supports the recognition of any prefix part of the strings that are defined in the default or specified (factoid) language model.
     * 
     * For example, without this flag, the user writes "handw" and the recognizer returns suggestions (such as "hander" or "handed") that are words that exist in the recognizer lexicon. With the flag, the recognizer may return "handw" as one of the suggestions since it is a valid prefix of the word "handwriting" that exists in the recognizer lexicon.
     * 
     * The Tablet PC Input Panel sets this flag in most cases, except when the input scope is IS_DEFAULT (or no input scope) or when there is no user word list or regular expression.
     * 
     * Recognizers of East Asian characters should return E_INVALIDARG when a caller passes in this flag.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECOFLAG_LINEMODE"></a><a id="recoflag_linemode"></a><dl>
     * <dt><b>RECOFLAG_LINEMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not split lines but must still do character and word separation. This is the same as lined mode, except that there is no guide, and all ink is assumed to be in a single line. When this flag is set, a guide, if set, is ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECOFLAG_SINGLESEG"></a><a id="recoflag_singleseg"></a><dl>
     * <dt><b>RECOFLAG_SINGLESEG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disables multiple segmentation. By default, the recognizer returns multiple segmentations (alternates) for the ink.
     * 
     * For example, if you write "together" as separate strokes, the recognizer may segment the ink as "to get her", "to gather", or "together". Set this flag if you do not need multiple segmentations of the ink when you query for alternates. This improves performance and reduces memory usage.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECOFLAG_WORDMODE"></a><a id="recoflag_wordmode"></a><dl>
     * <dt><b>RECOFLAG_WORDMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recognizer treats the ink as a single word. For example, if the context contains "to get her", the recognizer returns "together".
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>HRESULT value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not support this function.
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
     * Unable to allocate memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is invalid or one of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-setflags
     * @since windows5.1.2600
     */
    static SetFlags(hrc, dwFlags) {
        result := DllCall("inkobjcore.dll\SetFlags", "ptr", hrc, "uint", dwFlags, "int")
        return result
    }

    /**
     * Retrieves a pointer to the lattice for the current results.
     * @param {Pointer<HRECOCONTEXT>} hrc The handle to the recognizer context.
     * @param {Pointer<RECO_LATTICE>} ppLattice The recognition results.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
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
     * Unable to allocate memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_E_NOT_RELEVANT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer context does not contain results.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getlatticeptr
     * @since windows5.1.2600
     */
    static GetLatticePtr(hrc, ppLattice) {
        result := DllCall("inkobjcore.dll\GetLatticePtr", "ptr", hrc, "ptr", ppLattice, "int")
        return result
    }

    /**
     * Provides the text strings that come before and after the text contained in the recognizer context.You call this function before processing the ink for the first time. Therefore, call the SetTextContext function before calling the Process function.
     * @remarks
     * The <b>SetTextContext</b> function provides context for a phrase or a word, increasing your recognizer's accuracy. For example, if the <i>pwcBefore</i><i>pwcBefore</i> string is "under the " and the <i>pwcAfter</i> string is "in the house", you can bias your recognizer using a word or words between the strings. Your recognizer should consider the space after "the" and before "in" when performing the recognition.
     * 
     * However, if the <i>pwcAfter</i> string is "Hel" and the <i>pwcBefore</i> string is "o", the lack of space between the strings indicates the recognizer should recognize one or more letters inside a word that begins with "Hel" and ends with "o".
     * 
     * It is recommended that you limit the length of the text context to no more than 1024 characters each for the left and right contexts.
     * @param {Pointer<HRECOCONTEXT>} hrc Handle to the recognizer context.
     * @param {Integer} cwcBefore Number of characters in <i>pwcBefore</i>.
     * @param {Pointer<PWSTR>} pwcBefore Text string that comes before the text contained in the recognizer context. The string is not <b>NULL</b> terminated.
     * @param {Integer} cwcAfter Number of characters in <i>pwcAfter</i>.
     * @param {Pointer<PWSTR>} pwcAfter Text string that comes after the text contained in the recognizer context. The string is not <b>NULL</b> -terminated.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is invalid or one of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not support this function.
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
     * Unable to allocate memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was specified.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-settextcontext
     * @since windows5.1.2600
     */
    static SetTextContext(hrc, cwcBefore, pwcBefore, cwcAfter, pwcAfter) {
        pwcBefore := pwcBefore is String? StrPtr(pwcBefore) : pwcBefore
        pwcAfter := pwcAfter is String? StrPtr(pwcAfter) : pwcAfter

        result := DllCall("inkobjcore.dll\SetTextContext", "ptr", hrc, "uint", cwcBefore, "ptr", pwcBefore, "uint", cwcAfter, "ptr", pwcAfter, "int")
        return result
    }

    /**
     * Enables one or more Unicode point ranges on the context.
     * @remarks
     * The <b>SetEnabledUnicodeRanges</b> function is optional.
     * 
     * Some recognizers do not support enabling and disabling specific code points, but may still include the <b>SetEnabledUnicodeRanges</b> function. For such recognizers, the <b>SetEnabledUnicodeRanges</b> function returns E_NOTIMPL.
     * 
     * Each recognizer supports one or more Unicode point ranges. To determine which Unicode point ranges the recognizer supports, call the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-getunicoderanges">GetUnicodeRanges</a> function. If you do not call this function, the recognizer uses a default set of Unicode point ranges. The default ranges are recognizer specific.
     * 
     * The Microsoft gesture recognizer uses Unicode characters from 0xF000 to 0xF0FF. Each single Unicode value in this range represents a single gesture. For a complete list of Unicode values for gestures, see <a href="https://docs.microsoft.com/windows/desktop/tablet/unicode-range-values-of-gestures">Unicode Range Values of Gestures</a>.
     * @param {Pointer<HRECOCONTEXT>} hrc The handle to the recognizer context.
     * @param {Integer} cRanges The number of ranges in the <i>pRanges</i> buffer.
     * @param {Pointer<CHARACTER_RANGE>} pcr An array of <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-character_range">CHARACTER_RANGE</a> structures. Each structure identifies a range of Unicode points that you want to enable in the recognizer. The order of the array is arbitrary.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_S_TRUNCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not support one of the specified Unicode point ranges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-setenabledunicoderanges
     * @since windows5.1.2600
     */
    static SetEnabledUnicodeRanges(hrc, cRanges, pcr) {
        result := DllCall("inkobjcore.dll\SetEnabledUnicodeRanges", "ptr", hrc, "uint", cRanges, "ptr", pcr, "int")
        return result
    }

    /**
     * Returns a value that indicates whether a word, date, time, number, or other text that is passed in is contained in the dictionary.The results of this test depend on the factoid setting.
     * @remarks
     * This function is optional.
     * 
     * The results of this test depend on the factoid setting. For example, if the factoid setting is set to default, then "hello","555-1234", and "10/19/2002" all return S_OK. However, if the factoid is set to TELEPHONE, only "555-1234" returns S_OK, the others return S_FALSE. For more information about factoids, see <a href="https://docs.microsoft.com/windows/desktop/tablet/supported-factoids-from-version-1">Supported Factoids from Version 1</a>.
     * 
     * Note that this function should take into consideration any information specified in <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-settextcontext">SetTextContext</a> when returning a value. For example, if the recognizer receives calls to SetTextContext ("http:", "") and receives a URL factoid, SetFactoid ((!IS_URL)) then IsStringSupported("www.microsoft.com") should return S_FALSE because it is missing the "//".
     * 
     * The COERCE flag has no effect on IsStringSupported.
     * @param {Pointer<HRECOCONTEXT>} hrc The handle to the recognizer context.
     * @param {Integer} wcString The count, in Unicode (wide) characters, of <i>pwcString</i>.
     * @param {Pointer<PWSTR>} pwcString The Unicode (wide) characters to test.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * This function also returns S_OK if the recognizer does not support this function.
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
     * Unable to allocate memory to complete the operation.
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
     * The string is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-isstringsupported
     * @since windows5.1.2600
     */
    static IsStringSupported(hrc, wcString, pwcString) {
        pwcString := pwcString is String? StrPtr(pwcString) : pwcString

        result := DllCall("inkobjcore.dll\IsStringSupported", "ptr", hrc, "uint", wcString, "ptr", pwcString, "int")
        return result
    }

    /**
     * Sets the word list for the current recognizer context to recognize.
     * @remarks
     * The word list passed in as the second parameter must already exist. You create a word list by using the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-makewordlist">MakeWordList</a> function. The <b>SetWordList</b> function does not alter the word list.
     * 
     * To clear the wordlist, pass <b>NULL</b> as the second parameter.
     * 
     * It is recommended that you limit the length of individual words in the wordlist to no more than 256 characters and limit memory allocation for wordlists to no more than 128 MB.
     * @param {Pointer<HRECOCONTEXT>} hrc Handle to the recognizer context.
     * @param {Pointer<HRECOWORDLIST>} hwl Handle to recognition word list to be used.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is invalid or one of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not support this function.
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
     * Unable to allocate memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was called after <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-process">Process</a> has been called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-setwordlist
     * @since windows5.1.2600
     */
    static SetWordList(hrc, hwl) {
        result := DllCall("inkobjcore.dll\SetWordList", "ptr", hrc, "ptr", hwl, "int")
        return result
    }

    /**
     * Gets the right separator for the recognizer context.
     * @param {Pointer<HRECOCONTEXT>} hrc The handle to the recognizer context.
     * @param {Pointer<UInt32>} pcSize A pointer to the size of the right separator.
     * @param {Pointer<PWSTR>} pwcRightSeparator A pointer to the right separator.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getrightseparator
     * @since windows5.1.2600
     */
    static GetRightSeparator(hrc, pcSize, pwcRightSeparator) {
        pwcRightSeparator := pwcRightSeparator is String? StrPtr(pwcRightSeparator) : pwcRightSeparator

        result := DllCall("inkobjcore.dll\GetRightSeparator", "ptr", hrc, "ptr", pcSize, "ptr", pwcRightSeparator, "int")
        return result
    }

    /**
     * Gets the left separator for the recognizer context.
     * @param {Pointer<HRECOCONTEXT>} hrc The handle to the recognizer context.
     * @param {Pointer<UInt32>} pcSize A pointer to the size of the left separator.
     * @param {Pointer<PWSTR>} pwcLeftSeparator A pointer to the left separator.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getleftseparator
     * @since windows5.1.2600
     */
    static GetLeftSeparator(hrc, pcSize, pwcLeftSeparator) {
        pwcLeftSeparator := pwcLeftSeparator is String? StrPtr(pwcLeftSeparator) : pwcLeftSeparator

        result := DllCall("inkobjcore.dll\GetLeftSeparator", "ptr", hrc, "ptr", pcSize, "ptr", pwcLeftSeparator, "int")
        return result
    }

    /**
     * Destroys the current word list.
     * @param {Pointer<HRECOWORDLIST>} hwl Handle to the word list.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to the word list is incorrect.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-destroywordlist
     * @since windows5.1.2600
     */
    static DestroyWordList(hwl) {
        result := DllCall("inkobjcore.dll\DestroyWordList", "ptr", hwl, "int")
        return result
    }

    /**
     * Adds one or more words to the word list.
     * @param {Pointer<HRECOWORDLIST>} hwl Handle to the word list.
     * @param {Pointer<PWSTR>} pwcWords Words to add to the word list. Separate words in this list with a \0 character and end the list with two \0 characters. Words that already exist in the list are not added.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned when the word list handle parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to the word list is incorrect.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-addwordstowordlist
     * @since windows5.1.2600
     */
    static AddWordsToWordList(hwl, pwcWords) {
        pwcWords := pwcWords is String? StrPtr(pwcWords) : pwcWords

        result := DllCall("inkobjcore.dll\AddWordsToWordList", "ptr", hwl, "ptr", pwcWords, "int")
        return result
    }

    /**
     * Creates a word list.
     * @param {Pointer<HRECOGNIZER>} hrec Handle to the recognizer.
     * @param {Pointer<PWSTR>} pBuffer Words to insert into the new word list. Separate words in this list with a \0 character and end the list with two \0 characters.
     * @param {Pointer<HRECOWORDLIST>} phwl Handle to the new word list.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to the word list is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
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
     * Unable to allocate memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_S_TRUNCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error is found in one of the words in the list. Possible errors include unsupported characters, spaces at the start or the end of the word or more than a single space between words. All words up to the incorrect word are added to the word list.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-makewordlist
     * @since windows5.1.2600
     */
    static MakeWordList(hrec, pBuffer, phwl) {
        pBuffer := pBuffer is String? StrPtr(pBuffer) : pBuffer

        result := DllCall("inkobjcore.dll\MakeWordList", "ptr", hrec, "ptr", pBuffer, "ptr", phwl, "int")
        return result
    }

    /**
     * Gets all recognizers.
     * @param {Pointer<Guid>} recognizerClsids Pointer to the CLSIDs of the recognizers. The CLSID value is created in the registry when you register the recognizer.
     * @param {Pointer<UInt32>} count Pointer to the number of recognizers.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getallrecognizers
     * @since windows5.1.2600
     */
    static GetAllRecognizers(recognizerClsids, count) {
        result := DllCall("inkobjcore.dll\GetAllRecognizers", "ptr", recognizerClsids, "ptr", count, "int")
        return result
    }

    /**
     * Loads the cached attributes of a recognizer.
     * @param {Pointer<Guid>} clsid The CLSID of the recognizer. This value is created in the registry when you register the recognizer.
     * @param {Pointer<RECO_ATTRS>} pRecoAttributes Pointer to the recognizer attributes.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-loadcachedattributes
     * @since windows5.1.2600
     */
    static LoadCachedAttributes(clsid, pRecoAttributes) {
        result := DllCall("inkobjcore.dll\LoadCachedAttributes", "ptr", clsid, "ptr", pRecoAttributes, "int")
        return result
    }

;@endregion Methods
}
