#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class BINDSTATUS{

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_FINDINGRESOURCE => 1

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_CONNECTING => 2

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_REDIRECTING => 3

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_BEGINDOWNLOADDATA => 4

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_DOWNLOADINGDATA => 5

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_ENDDOWNLOADDATA => 6

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_BEGINDOWNLOADCOMPONENTS => 7

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_INSTALLINGCOMPONENTS => 8

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_ENDDOWNLOADCOMPONENTS => 9

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_USINGCACHEDCOPY => 10

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_SENDINGREQUEST => 11

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_CLASSIDAVAILABLE => 12

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_MIMETYPEAVAILABLE => 13

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_CACHEFILENAMEAVAILABLE => 14

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_BEGINSYNCOPERATION => 15

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_ENDSYNCOPERATION => 16

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_BEGINUPLOADDATA => 17

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_UPLOADINGDATA => 18

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_ENDUPLOADDATA => 19

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_PROTOCOLCLASSID => 20

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_ENCODING => 21

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_VERIFIEDMIMETYPEAVAILABLE => 22

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_CLASSINSTALLLOCATION => 23

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_DECODING => 24

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_LOADINGMIMEHANDLER => 25

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_CONTENTDISPOSITIONATTACH => 26

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_FILTERREPORTMIMETYPE => 27

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_CLSIDCANINSTANTIATE => 28

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_IUNKNOWNAVAILABLE => 29

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_DIRECTBIND => 30

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RAWMIMETYPE => 31

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_PROXYDETECTING => 32

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_ACCEPTRANGES => 33

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_COOKIE_SENT => 34

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_COMPACT_POLICY_RECEIVED => 35

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_COOKIE_SUPPRESSED => 36

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_COOKIE_STATE_UNKNOWN => 37

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_COOKIE_STATE_ACCEPT => 38

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_COOKIE_STATE_REJECT => 39

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_COOKIE_STATE_PROMPT => 40

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_COOKIE_STATE_LEASH => 41

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_COOKIE_STATE_DOWNGRADE => 42

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_POLICY_HREF => 43

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_P3P_HEADER => 44

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_SESSION_COOKIE_RECEIVED => 45

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_PERSISTENT_COOKIE_RECEIVED => 46

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_SESSION_COOKIES_ALLOWED => 47

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_CACHECONTROL => 48

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_CONTENTDISPOSITIONFILENAME => 49

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_MIMETEXTPLAINMISMATCH => 50

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_PUBLISHERAVAILABLE => 51

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_DISPLAYNAMEAVAILABLE => 52

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_SSLUX_NAVBLOCKED => 53

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_SERVER_MIMETYPEAVAILABLE => 54

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_SNIFFED_CLASSIDAVAILABLE => 55

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_64BIT_PROGRESS => 56

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_LAST => 56

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_0 => 57

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_1 => 58

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_2 => 59

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_3 => 60

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_4 => 61

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_5 => 62

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_6 => 63

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_7 => 64

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_8 => 65

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_9 => 66

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_A => 67

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_B => 68

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_C => 69

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_D => 70

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_E => 71

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_F => 72

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_10 => 73

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_11 => 74

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_12 => 75

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_13 => 76

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_RESERVED_14 => 77

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTATUS_LAST_PRIVATE => 77
}
