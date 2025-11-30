#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class SYSTEM_METRICS_INDEX extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SM_ARRANGE => 56

    /**
     * @type {Integer (Int32)}
     */
    static SM_CLEANBOOT => 67

    /**
     * @type {Integer (Int32)}
     */
    static SM_CMONITORS => 80

    /**
     * @type {Integer (Int32)}
     */
    static SM_CMOUSEBUTTONS => 43

    /**
     * @type {Integer (Int32)}
     */
    static SM_CONVERTIBLESLATEMODE => 8195

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXBORDER => 5

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXCURSOR => 13

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXDLGFRAME => 7

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXDOUBLECLK => 36

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXDRAG => 68

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXEDGE => 45

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXFIXEDFRAME => 7

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXFOCUSBORDER => 83

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXFRAME => 32

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXFULLSCREEN => 16

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXHSCROLL => 21

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXHTHUMB => 10

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXICON => 11

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXICONSPACING => 38

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXMAXIMIZED => 61

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXMAXTRACK => 59

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXMENUCHECK => 71

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXMENUSIZE => 54

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXMIN => 28

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXMINIMIZED => 57

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXMINSPACING => 47

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXMINTRACK => 34

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXPADDEDBORDER => 92

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXSCREEN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXSIZE => 30

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXSIZEFRAME => 32

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXSMICON => 49

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXSMSIZE => 52

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXVIRTUALSCREEN => 78

    /**
     * @type {Integer (Int32)}
     */
    static SM_CXVSCROLL => 2

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYBORDER => 6

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYCAPTION => 4

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYCURSOR => 14

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYDLGFRAME => 8

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYDOUBLECLK => 37

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYDRAG => 69

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYEDGE => 46

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYFIXEDFRAME => 8

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYFOCUSBORDER => 84

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYFRAME => 33

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYFULLSCREEN => 17

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYHSCROLL => 3

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYICON => 12

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYICONSPACING => 39

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYKANJIWINDOW => 18

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYMAXIMIZED => 62

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYMAXTRACK => 60

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYMENU => 15

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYMENUCHECK => 72

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYMENUSIZE => 55

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYMIN => 29

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYMINIMIZED => 58

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYMINSPACING => 48

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYMINTRACK => 35

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYSCREEN => 1

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYSIZE => 31

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYSIZEFRAME => 33

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYSMCAPTION => 51

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYSMICON => 50

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYSMSIZE => 53

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYVIRTUALSCREEN => 79

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYVSCROLL => 20

    /**
     * @type {Integer (Int32)}
     */
    static SM_CYVTHUMB => 9

    /**
     * @type {Integer (Int32)}
     */
    static SM_DBCSENABLED => 42

    /**
     * @type {Integer (Int32)}
     */
    static SM_DEBUG => 22

    /**
     * @type {Integer (Int32)}
     */
    static SM_DIGITIZER => 94

    /**
     * @type {Integer (Int32)}
     */
    static SM_IMMENABLED => 82

    /**
     * @type {Integer (Int32)}
     */
    static SM_MAXIMUMTOUCHES => 95

    /**
     * @type {Integer (Int32)}
     */
    static SM_MEDIACENTER => 87

    /**
     * @type {Integer (Int32)}
     */
    static SM_MENUDROPALIGNMENT => 40

    /**
     * @type {Integer (Int32)}
     */
    static SM_MIDEASTENABLED => 74

    /**
     * @type {Integer (Int32)}
     */
    static SM_MOUSEPRESENT => 19

    /**
     * @type {Integer (Int32)}
     */
    static SM_MOUSEHORIZONTALWHEELPRESENT => 91

    /**
     * @type {Integer (Int32)}
     */
    static SM_MOUSEWHEELPRESENT => 75

    /**
     * @type {Integer (Int32)}
     */
    static SM_NETWORK => 63

    /**
     * @type {Integer (Int32)}
     */
    static SM_PENWINDOWS => 41

    /**
     * @type {Integer (Int32)}
     */
    static SM_REMOTECONTROL => 8193

    /**
     * @type {Integer (Int32)}
     */
    static SM_REMOTESESSION => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SM_SAMEDISPLAYFORMAT => 81

    /**
     * @type {Integer (Int32)}
     */
    static SM_SECURE => 44

    /**
     * @type {Integer (Int32)}
     */
    static SM_SERVERR2 => 89

    /**
     * @type {Integer (Int32)}
     */
    static SM_SHOWSOUNDS => 70

    /**
     * @type {Integer (Int32)}
     */
    static SM_SHUTTINGDOWN => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SM_SLOWMACHINE => 73

    /**
     * @type {Integer (Int32)}
     */
    static SM_STARTER => 88

    /**
     * @type {Integer (Int32)}
     */
    static SM_SWAPBUTTON => 23

    /**
     * @type {Integer (Int32)}
     */
    static SM_SYSTEMDOCKED => 8196

    /**
     * @type {Integer (Int32)}
     */
    static SM_TABLETPC => 86

    /**
     * @type {Integer (Int32)}
     */
    static SM_XVIRTUALSCREEN => 76

    /**
     * @type {Integer (Int32)}
     */
    static SM_YVIRTUALSCREEN => 77
}
