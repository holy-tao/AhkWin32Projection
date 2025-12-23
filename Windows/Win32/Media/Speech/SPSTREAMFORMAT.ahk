#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPSTREAMFORMAT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_Default => -1

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_NoAssignedFormat => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_Text => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_NonStandardFormat => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_ExtendedAudioFormat => 3

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_8kHz8BitMono => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_8kHz8BitStereo => 5

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_8kHz16BitMono => 6

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_8kHz16BitStereo => 7

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_11kHz8BitMono => 8

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_11kHz8BitStereo => 9

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_11kHz16BitMono => 10

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_11kHz16BitStereo => 11

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_12kHz8BitMono => 12

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_12kHz8BitStereo => 13

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_12kHz16BitMono => 14

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_12kHz16BitStereo => 15

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_16kHz8BitMono => 16

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_16kHz8BitStereo => 17

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_16kHz16BitMono => 18

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_16kHz16BitStereo => 19

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_22kHz8BitMono => 20

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_22kHz8BitStereo => 21

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_22kHz16BitMono => 22

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_22kHz16BitStereo => 23

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_24kHz8BitMono => 24

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_24kHz8BitStereo => 25

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_24kHz16BitMono => 26

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_24kHz16BitStereo => 27

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_32kHz8BitMono => 28

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_32kHz8BitStereo => 29

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_32kHz16BitMono => 30

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_32kHz16BitStereo => 31

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_44kHz8BitMono => 32

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_44kHz8BitStereo => 33

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_44kHz16BitMono => 34

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_44kHz16BitStereo => 35

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_48kHz8BitMono => 36

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_48kHz8BitStereo => 37

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_48kHz16BitMono => 38

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_48kHz16BitStereo => 39

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_TrueSpeech_8kHz1BitMono => 40

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_CCITT_ALaw_8kHzMono => 41

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_CCITT_ALaw_8kHzStereo => 42

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_CCITT_ALaw_11kHzMono => 43

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_CCITT_ALaw_11kHzStereo => 44

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_CCITT_ALaw_22kHzMono => 45

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_CCITT_ALaw_22kHzStereo => 46

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_CCITT_ALaw_44kHzMono => 47

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_CCITT_ALaw_44kHzStereo => 48

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_CCITT_uLaw_8kHzMono => 49

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_CCITT_uLaw_8kHzStereo => 50

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_CCITT_uLaw_11kHzMono => 51

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_CCITT_uLaw_11kHzStereo => 52

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_CCITT_uLaw_22kHzMono => 53

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_CCITT_uLaw_22kHzStereo => 54

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_CCITT_uLaw_44kHzMono => 55

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_CCITT_uLaw_44kHzStereo => 56

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_ADPCM_8kHzMono => 57

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_ADPCM_8kHzStereo => 58

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_ADPCM_11kHzMono => 59

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_ADPCM_11kHzStereo => 60

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_ADPCM_22kHzMono => 61

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_ADPCM_22kHzStereo => 62

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_ADPCM_44kHzMono => 63

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_ADPCM_44kHzStereo => 64

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_GSM610_8kHzMono => 65

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_GSM610_11kHzMono => 66

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_GSM610_22kHzMono => 67

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_GSM610_44kHzMono => 68

    /**
     * @type {Integer (Int32)}
     */
    static SPSF_NUM_FORMATS => 69
}
