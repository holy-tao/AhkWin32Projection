#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class BINDSTATUS extends Win32Enum {

    /**
     * Native name: BINDSTATUS_FINDINGRESOURCE
     * @type {Integer (Int32)}
     */
    static FINDINGRESOURCE => 1

    /**
     * Native name: BINDSTATUS_CONNECTING
     * @type {Integer (Int32)}
     */
    static CONNECTING => 2

    /**
     * Native name: BINDSTATUS_REDIRECTING
     * @type {Integer (Int32)}
     */
    static REDIRECTING => 3

    /**
     * Native name: BINDSTATUS_BEGINDOWNLOADDATA
     * @type {Integer (Int32)}
     */
    static BEGINDOWNLOADDATA => 4

    /**
     * Native name: BINDSTATUS_DOWNLOADINGDATA
     * @type {Integer (Int32)}
     */
    static DOWNLOADINGDATA => 5

    /**
     * Native name: BINDSTATUS_ENDDOWNLOADDATA
     * @type {Integer (Int32)}
     */
    static ENDDOWNLOADDATA => 6

    /**
     * Native name: BINDSTATUS_BEGINDOWNLOADCOMPONENTS
     * @type {Integer (Int32)}
     */
    static BEGINDOWNLOADCOMPONENTS => 7

    /**
     * Native name: BINDSTATUS_INSTALLINGCOMPONENTS
     * @type {Integer (Int32)}
     */
    static INSTALLINGCOMPONENTS => 8

    /**
     * Native name: BINDSTATUS_ENDDOWNLOADCOMPONENTS
     * @type {Integer (Int32)}
     */
    static ENDDOWNLOADCOMPONENTS => 9

    /**
     * Native name: BINDSTATUS_USINGCACHEDCOPY
     * @type {Integer (Int32)}
     */
    static USINGCACHEDCOPY => 10

    /**
     * Native name: BINDSTATUS_SENDINGREQUEST
     * @type {Integer (Int32)}
     */
    static SENDINGREQUEST => 11

    /**
     * Native name: BINDSTATUS_CLASSIDAVAILABLE
     * @type {Integer (Int32)}
     */
    static CLASSIDAVAILABLE => 12

    /**
     * Native name: BINDSTATUS_MIMETYPEAVAILABLE
     * @type {Integer (Int32)}
     */
    static MIMETYPEAVAILABLE => 13

    /**
     * Native name: BINDSTATUS_CACHEFILENAMEAVAILABLE
     * @type {Integer (Int32)}
     */
    static CACHEFILENAMEAVAILABLE => 14

    /**
     * Native name: BINDSTATUS_BEGINSYNCOPERATION
     * @type {Integer (Int32)}
     */
    static BEGINSYNCOPERATION => 15

    /**
     * Native name: BINDSTATUS_ENDSYNCOPERATION
     * @type {Integer (Int32)}
     */
    static ENDSYNCOPERATION => 16

    /**
     * Native name: BINDSTATUS_BEGINUPLOADDATA
     * @type {Integer (Int32)}
     */
    static BEGINUPLOADDATA => 17

    /**
     * Native name: BINDSTATUS_UPLOADINGDATA
     * @type {Integer (Int32)}
     */
    static UPLOADINGDATA => 18

    /**
     * Native name: BINDSTATUS_ENDUPLOADDATA
     * @type {Integer (Int32)}
     */
    static ENDUPLOADDATA => 19

    /**
     * Native name: BINDSTATUS_PROTOCOLCLASSID
     * @type {Integer (Int32)}
     */
    static PROTOCOLCLASSID => 20

    /**
     * Native name: BINDSTATUS_ENCODING
     * @type {Integer (Int32)}
     */
    static ENCODING => 21

    /**
     * Native name: BINDSTATUS_VERIFIEDMIMETYPEAVAILABLE
     * @type {Integer (Int32)}
     */
    static VERIFIEDMIMETYPEAVAILABLE => 22

    /**
     * Native name: BINDSTATUS_CLASSINSTALLLOCATION
     * @type {Integer (Int32)}
     */
    static CLASSINSTALLLOCATION => 23

    /**
     * Native name: BINDSTATUS_DECODING
     * @type {Integer (Int32)}
     */
    static DECODING => 24

    /**
     * Native name: BINDSTATUS_LOADINGMIMEHANDLER
     * @type {Integer (Int32)}
     */
    static LOADINGMIMEHANDLER => 25

    /**
     * Native name: BINDSTATUS_CONTENTDISPOSITIONATTACH
     * @type {Integer (Int32)}
     */
    static CONTENTDISPOSITIONATTACH => 26

    /**
     * Native name: BINDSTATUS_FILTERREPORTMIMETYPE
     * @type {Integer (Int32)}
     */
    static FILTERREPORTMIMETYPE => 27

    /**
     * Native name: BINDSTATUS_CLSIDCANINSTANTIATE
     * @type {Integer (Int32)}
     */
    static CLSIDCANINSTANTIATE => 28

    /**
     * Native name: BINDSTATUS_IUNKNOWNAVAILABLE
     * @type {Integer (Int32)}
     */
    static IUNKNOWNAVAILABLE => 29

    /**
     * Native name: BINDSTATUS_DIRECTBIND
     * @type {Integer (Int32)}
     */
    static DIRECTBIND => 30

    /**
     * Native name: BINDSTATUS_RAWMIMETYPE
     * @type {Integer (Int32)}
     */
    static RAWMIMETYPE => 31

    /**
     * Native name: BINDSTATUS_PROXYDETECTING
     * @type {Integer (Int32)}
     */
    static PROXYDETECTING => 32

    /**
     * Native name: BINDSTATUS_ACCEPTRANGES
     * @type {Integer (Int32)}
     */
    static ACCEPTRANGES => 33

    /**
     * Native name: BINDSTATUS_COOKIE_SENT
     * @type {Integer (Int32)}
     */
    static COOKIE_SENT => 34

    /**
     * Native name: BINDSTATUS_COMPACT_POLICY_RECEIVED
     * @type {Integer (Int32)}
     */
    static COMPACT_POLICY_RECEIVED => 35

    /**
     * Native name: BINDSTATUS_COOKIE_SUPPRESSED
     * @type {Integer (Int32)}
     */
    static COOKIE_SUPPRESSED => 36

    /**
     * Native name: BINDSTATUS_COOKIE_STATE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static COOKIE_STATE_UNKNOWN => 37

    /**
     * Native name: BINDSTATUS_COOKIE_STATE_ACCEPT
     * @type {Integer (Int32)}
     */
    static COOKIE_STATE_ACCEPT => 38

    /**
     * Native name: BINDSTATUS_COOKIE_STATE_REJECT
     * @type {Integer (Int32)}
     */
    static COOKIE_STATE_REJECT => 39

    /**
     * Native name: BINDSTATUS_COOKIE_STATE_PROMPT
     * @type {Integer (Int32)}
     */
    static COOKIE_STATE_PROMPT => 40

    /**
     * Native name: BINDSTATUS_COOKIE_STATE_LEASH
     * @type {Integer (Int32)}
     */
    static COOKIE_STATE_LEASH => 41

    /**
     * Native name: BINDSTATUS_COOKIE_STATE_DOWNGRADE
     * @type {Integer (Int32)}
     */
    static COOKIE_STATE_DOWNGRADE => 42

    /**
     * Native name: BINDSTATUS_POLICY_HREF
     * @type {Integer (Int32)}
     */
    static POLICY_HREF => 43

    /**
     * Native name: BINDSTATUS_P3P_HEADER
     * @type {Integer (Int32)}
     */
    static P3P_HEADER => 44

    /**
     * Native name: BINDSTATUS_SESSION_COOKIE_RECEIVED
     * @type {Integer (Int32)}
     */
    static SESSION_COOKIE_RECEIVED => 45

    /**
     * Native name: BINDSTATUS_PERSISTENT_COOKIE_RECEIVED
     * @type {Integer (Int32)}
     */
    static PERSISTENT_COOKIE_RECEIVED => 46

    /**
     * Native name: BINDSTATUS_SESSION_COOKIES_ALLOWED
     * @type {Integer (Int32)}
     */
    static SESSION_COOKIES_ALLOWED => 47

    /**
     * Native name: BINDSTATUS_CACHECONTROL
     * @type {Integer (Int32)}
     */
    static CACHECONTROL => 48

    /**
     * Native name: BINDSTATUS_CONTENTDISPOSITIONFILENAME
     * @type {Integer (Int32)}
     */
    static CONTENTDISPOSITIONFILENAME => 49

    /**
     * Native name: BINDSTATUS_MIMETEXTPLAINMISMATCH
     * @type {Integer (Int32)}
     */
    static MIMETEXTPLAINMISMATCH => 50

    /**
     * Native name: BINDSTATUS_PUBLISHERAVAILABLE
     * @type {Integer (Int32)}
     */
    static PUBLISHERAVAILABLE => 51

    /**
     * Native name: BINDSTATUS_DISPLAYNAMEAVAILABLE
     * @type {Integer (Int32)}
     */
    static DISPLAYNAMEAVAILABLE => 52

    /**
     * Native name: BINDSTATUS_SSLUX_NAVBLOCKED
     * @type {Integer (Int32)}
     */
    static SSLUX_NAVBLOCKED => 53

    /**
     * Native name: BINDSTATUS_SERVER_MIMETYPEAVAILABLE
     * @type {Integer (Int32)}
     */
    static SERVER_MIMETYPEAVAILABLE => 54

    /**
     * Native name: BINDSTATUS_SNIFFED_CLASSIDAVAILABLE
     * @type {Integer (Int32)}
     */
    static SNIFFED_CLASSIDAVAILABLE => 55

    /**
     * Native name: BINDSTATUS_64BIT_PROGRESS
     * @type {Integer (Int32)}
     */
    static 64BIT_PROGRESS => 56

    /**
     * Native name: BINDSTATUS_LAST
     * @type {Integer (Int32)}
     */
    static LAST => 56

    /**
     * Native name: BINDSTATUS_RESERVED_0
     * @type {Integer (Int32)}
     */
    static RESERVED_0 => 57

    /**
     * Native name: BINDSTATUS_RESERVED_1
     * @type {Integer (Int32)}
     */
    static RESERVED_1 => 58

    /**
     * Native name: BINDSTATUS_RESERVED_2
     * @type {Integer (Int32)}
     */
    static RESERVED_2 => 59

    /**
     * Native name: BINDSTATUS_RESERVED_3
     * @type {Integer (Int32)}
     */
    static RESERVED_3 => 60

    /**
     * Native name: BINDSTATUS_RESERVED_4
     * @type {Integer (Int32)}
     */
    static RESERVED_4 => 61

    /**
     * Native name: BINDSTATUS_RESERVED_5
     * @type {Integer (Int32)}
     */
    static RESERVED_5 => 62

    /**
     * Native name: BINDSTATUS_RESERVED_6
     * @type {Integer (Int32)}
     */
    static RESERVED_6 => 63

    /**
     * Native name: BINDSTATUS_RESERVED_7
     * @type {Integer (Int32)}
     */
    static RESERVED_7 => 64

    /**
     * Native name: BINDSTATUS_RESERVED_8
     * @type {Integer (Int32)}
     */
    static RESERVED_8 => 65

    /**
     * Native name: BINDSTATUS_RESERVED_9
     * @type {Integer (Int32)}
     */
    static RESERVED_9 => 66

    /**
     * Native name: BINDSTATUS_RESERVED_A
     * @type {Integer (Int32)}
     */
    static RESERVED_A => 67

    /**
     * Native name: BINDSTATUS_RESERVED_B
     * @type {Integer (Int32)}
     */
    static RESERVED_B => 68

    /**
     * Native name: BINDSTATUS_RESERVED_C
     * @type {Integer (Int32)}
     */
    static RESERVED_C => 69

    /**
     * Native name: BINDSTATUS_RESERVED_D
     * @type {Integer (Int32)}
     */
    static RESERVED_D => 70

    /**
     * Native name: BINDSTATUS_RESERVED_E
     * @type {Integer (Int32)}
     */
    static RESERVED_E => 71

    /**
     * Native name: BINDSTATUS_RESERVED_F
     * @type {Integer (Int32)}
     */
    static RESERVED_F => 72

    /**
     * Native name: BINDSTATUS_RESERVED_10
     * @type {Integer (Int32)}
     */
    static RESERVED_10 => 73

    /**
     * Native name: BINDSTATUS_RESERVED_11
     * @type {Integer (Int32)}
     */
    static RESERVED_11 => 74

    /**
     * Native name: BINDSTATUS_RESERVED_12
     * @type {Integer (Int32)}
     */
    static RESERVED_12 => 75

    /**
     * Native name: BINDSTATUS_RESERVED_13
     * @type {Integer (Int32)}
     */
    static RESERVED_13 => 76

    /**
     * Native name: BINDSTATUS_RESERVED_14
     * @type {Integer (Int32)}
     */
    static RESERVED_14 => 77

    /**
     * Native name: BINDSTATUS_LAST_PRIVATE
     * @type {Integer (Int32)}
     */
    static LAST_PRIVATE => 77
}
