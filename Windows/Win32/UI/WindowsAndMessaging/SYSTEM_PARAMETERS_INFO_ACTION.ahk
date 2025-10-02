#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class SYSTEM_PARAMETERS_INFO_ACTION{

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETBEEP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETBEEP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMOUSE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMOUSE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETBORDER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETBORDER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETKEYBOARDSPEED => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETKEYBOARDSPEED => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_LANGDRIVER => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_ICONHORIZONTALSPACING => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETSCREENSAVETIMEOUT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETSCREENSAVETIMEOUT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETSCREENSAVEACTIVE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETSCREENSAVEACTIVE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETGRIDGRANULARITY => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETGRIDGRANULARITY => 19

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETDESKWALLPAPER => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETDESKPATTERN => 21

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETKEYBOARDDELAY => 22

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETKEYBOARDDELAY => 23

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_ICONVERTICALSPACING => 24

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETICONTITLEWRAP => 25

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETICONTITLEWRAP => 26

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMENUDROPALIGNMENT => 27

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMENUDROPALIGNMENT => 28

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETDOUBLECLKWIDTH => 29

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETDOUBLECLKHEIGHT => 30

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETICONTITLELOGFONT => 31

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETDOUBLECLICKTIME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMOUSEBUTTONSWAP => 33

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETICONTITLELOGFONT => 34

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETFASTTASKSWITCH => 35

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETFASTTASKSWITCH => 36

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETDRAGFULLWINDOWS => 37

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETDRAGFULLWINDOWS => 38

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETNONCLIENTMETRICS => 41

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETNONCLIENTMETRICS => 42

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMINIMIZEDMETRICS => 43

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMINIMIZEDMETRICS => 44

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETICONMETRICS => 45

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETICONMETRICS => 46

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETWORKAREA => 47

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETWORKAREA => 48

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETPENWINDOWS => 49

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETHIGHCONTRAST => 66

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETHIGHCONTRAST => 67

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETKEYBOARDPREF => 68

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETKEYBOARDPREF => 69

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETSCREENREADER => 70

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETSCREENREADER => 71

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETANIMATION => 72

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETANIMATION => 73

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETFONTSMOOTHING => 74

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETFONTSMOOTHING => 75

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETDRAGWIDTH => 76

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETDRAGHEIGHT => 77

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETHANDHELD => 78

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETLOWPOWERTIMEOUT => 79

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETPOWEROFFTIMEOUT => 80

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETLOWPOWERTIMEOUT => 81

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETPOWEROFFTIMEOUT => 82

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETLOWPOWERACTIVE => 83

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETPOWEROFFACTIVE => 84

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETLOWPOWERACTIVE => 85

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETPOWEROFFACTIVE => 86

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETCURSORS => 87

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETICONS => 88

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETDEFAULTINPUTLANG => 89

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETDEFAULTINPUTLANG => 90

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETLANGTOGGLE => 91

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETWINDOWSEXTENSION => 92

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMOUSETRAILS => 93

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMOUSETRAILS => 94

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETSCREENSAVERRUNNING => 97

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SCREENSAVERRUNNING => 97

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETFILTERKEYS => 50

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETFILTERKEYS => 51

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETTOGGLEKEYS => 52

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETTOGGLEKEYS => 53

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMOUSEKEYS => 54

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMOUSEKEYS => 55

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETSHOWSOUNDS => 56

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETSHOWSOUNDS => 57

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETSTICKYKEYS => 58

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETSTICKYKEYS => 59

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETACCESSTIMEOUT => 60

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETACCESSTIMEOUT => 61

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETSERIALKEYS => 62

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETSERIALKEYS => 63

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETSOUNDSENTRY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETSOUNDSENTRY => 65

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETSNAPTODEFBUTTON => 95

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETSNAPTODEFBUTTON => 96

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMOUSEHOVERWIDTH => 98

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMOUSEHOVERWIDTH => 99

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMOUSEHOVERHEIGHT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMOUSEHOVERHEIGHT => 101

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMOUSEHOVERTIME => 102

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMOUSEHOVERTIME => 103

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETWHEELSCROLLLINES => 104

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETWHEELSCROLLLINES => 105

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMENUSHOWDELAY => 106

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMENUSHOWDELAY => 107

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETWHEELSCROLLCHARS => 108

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETWHEELSCROLLCHARS => 109

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETSHOWIMEUI => 110

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETSHOWIMEUI => 111

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMOUSESPEED => 112

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMOUSESPEED => 113

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETSCREENSAVERRUNNING => 114

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETDESKWALLPAPER => 115

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETAUDIODESCRIPTION => 116

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETAUDIODESCRIPTION => 117

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETSCREENSAVESECURE => 118

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETSCREENSAVESECURE => 119

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETHUNGAPPTIMEOUT => 120

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETHUNGAPPTIMEOUT => 121

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETWAITTOKILLTIMEOUT => 122

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETWAITTOKILLTIMEOUT => 123

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETWAITTOKILLSERVICETIMEOUT => 124

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETWAITTOKILLSERVICETIMEOUT => 125

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMOUSEDOCKTHRESHOLD => 126

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMOUSEDOCKTHRESHOLD => 127

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETPENDOCKTHRESHOLD => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETPENDOCKTHRESHOLD => 129

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETWINARRANGING => 130

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETWINARRANGING => 131

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMOUSEDRAGOUTTHRESHOLD => 132

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMOUSEDRAGOUTTHRESHOLD => 133

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETPENDRAGOUTTHRESHOLD => 134

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETPENDRAGOUTTHRESHOLD => 135

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMOUSESIDEMOVETHRESHOLD => 136

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMOUSESIDEMOVETHRESHOLD => 137

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETPENSIDEMOVETHRESHOLD => 138

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETPENSIDEMOVETHRESHOLD => 139

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETDRAGFROMMAXIMIZE => 140

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETDRAGFROMMAXIMIZE => 141

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETSNAPSIZING => 142

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETSNAPSIZING => 143

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETDOCKMOVING => 144

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETDOCKMOVING => 145

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETTOUCHPREDICTIONPARAMETERS => 156

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETTOUCHPREDICTIONPARAMETERS => 157

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETLOGICALDPIOVERRIDE => 158

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETLOGICALDPIOVERRIDE => 159

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMENURECT => 162

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMENURECT => 163

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETTOUCHPADPARAMETERS => 174

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETTOUCHPADPARAMETERS => 175

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETACTIVEWINDOWTRACKING => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETACTIVEWINDOWTRACKING => 4097

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMENUANIMATION => 4098

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMENUANIMATION => 4099

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETCOMBOBOXANIMATION => 4100

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETCOMBOBOXANIMATION => 4101

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETLISTBOXSMOOTHSCROLLING => 4102

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETLISTBOXSMOOTHSCROLLING => 4103

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETGRADIENTCAPTIONS => 4104

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETGRADIENTCAPTIONS => 4105

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETKEYBOARDCUES => 4106

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETKEYBOARDCUES => 4107

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMENUUNDERLINES => 4106

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMENUUNDERLINES => 4107

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETACTIVEWNDTRKZORDER => 4108

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETACTIVEWNDTRKZORDER => 4109

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETHOTTRACKING => 4110

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETHOTTRACKING => 4111

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMENUFADE => 4114

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMENUFADE => 4115

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETSELECTIONFADE => 4116

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETSELECTIONFADE => 4117

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETTOOLTIPANIMATION => 4118

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETTOOLTIPANIMATION => 4119

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETTOOLTIPFADE => 4120

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETTOOLTIPFADE => 4121

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETCURSORSHADOW => 4122

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETCURSORSHADOW => 4123

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMOUSESONAR => 4124

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMOUSESONAR => 4125

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMOUSECLICKLOCK => 4126

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMOUSECLICKLOCK => 4127

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMOUSEVANISH => 4128

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMOUSEVANISH => 4129

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETFLATMENU => 4130

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETFLATMENU => 4131

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETDROPSHADOW => 4132

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETDROPSHADOW => 4133

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETBLOCKSENDINPUTRESETS => 4134

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETBLOCKSENDINPUTRESETS => 4135

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETUIEFFECTS => 4158

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETUIEFFECTS => 4159

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETDISABLEOVERLAPPEDCONTENT => 4160

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETDISABLEOVERLAPPEDCONTENT => 4161

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETCLIENTAREAANIMATION => 4162

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETCLIENTAREAANIMATION => 4163

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETCLEARTYPE => 4168

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETCLEARTYPE => 4169

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETSPEECHRECOGNITION => 4170

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETSPEECHRECOGNITION => 4171

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETCARETBROWSING => 4172

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETCARETBROWSING => 4173

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETTHREADLOCALINPUTSETTINGS => 4174

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETTHREADLOCALINPUTSETTINGS => 4175

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETSYSTEMLANGUAGEBAR => 4176

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETSYSTEMLANGUAGEBAR => 4177

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETFOREGROUNDLOCKTIMEOUT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETFOREGROUNDLOCKTIMEOUT => 8193

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETACTIVEWNDTRKTIMEOUT => 8194

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETACTIVEWNDTRKTIMEOUT => 8195

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETFOREGROUNDFLASHCOUNT => 8196

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETFOREGROUNDFLASHCOUNT => 8197

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETCARETWIDTH => 8198

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETCARETWIDTH => 8199

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMOUSECLICKLOCKTIME => 8200

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMOUSECLICKLOCKTIME => 8201

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETFONTSMOOTHINGTYPE => 8202

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETFONTSMOOTHINGTYPE => 8203

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETFONTSMOOTHINGCONTRAST => 8204

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETFONTSMOOTHINGCONTRAST => 8205

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETFOCUSBORDERWIDTH => 8206

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETFOCUSBORDERWIDTH => 8207

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETFOCUSBORDERHEIGHT => 8208

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETFOCUSBORDERHEIGHT => 8209

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETFONTSMOOTHINGORIENTATION => 8210

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETFONTSMOOTHINGORIENTATION => 8211

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMINIMUMHITRADIUS => 8212

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMINIMUMHITRADIUS => 8213

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMESSAGEDURATION => 8214

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMESSAGEDURATION => 8215

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETCONTACTVISUALIZATION => 8216

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETCONTACTVISUALIZATION => 8217

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETGESTUREVISUALIZATION => 8218

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETGESTUREVISUALIZATION => 8219

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETMOUSEWHEELROUTING => 8220

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETMOUSEWHEELROUTING => 8221

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETPENVISUALIZATION => 8222

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETPENVISUALIZATION => 8223

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETPENARBITRATIONTYPE => 8224

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETPENARBITRATIONTYPE => 8225

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETCARETTIMEOUT => 8226

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETCARETTIMEOUT => 8227

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_GETHANDEDNESS => 8228

    /**
     * @type {Integer (UInt32)}
     */
    static SPI_SETHANDEDNESS => 8229
}
