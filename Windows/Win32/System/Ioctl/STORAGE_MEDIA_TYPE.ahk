#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies various types of storage media.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ne-winioctl-storage_media_type
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_MEDIA_TYPE{

    /**
     * One of the following tape types: DAT, DDS1, DDS2, and so on.
     * @type {Integer (Int32)}
     */
    static DDS_4mm => 32

    /**
     * MiniQIC tape.
     * @type {Integer (Int32)}
     */
    static MiniQic => 33

    /**
     * Travan tape (TR-1, TR-2, TR-3, and so on).
     * @type {Integer (Int32)}
     */
    static Travan => 34

    /**
     * QIC tape.
     * @type {Integer (Int32)}
     */
    static QIC => 35

    /**
     * An 8mm Exabyte metal particle tape.
     * @type {Integer (Int32)}
     */
    static MP_8mm => 36

    /**
     * An 8mm Exabyte advanced metal evaporative tape.
     * @type {Integer (Int32)}
     */
    static AME_8mm => 37

    /**
     * An 8mm Sony AIT1 tape.
     * @type {Integer (Int32)}
     */
    static AIT1_8mm => 38

    /**
     * DLT compact tape (IIIxt or IV).
     * @type {Integer (Int32)}
     */
    static DLT => 39

    /**
     * Philips NCTP tape.
     * @type {Integer (Int32)}
     */
    static NCTP => 40

    /**
     * IBM 3480 tape.
     * @type {Integer (Int32)}
     */
    static IBM_3480 => 41

    /**
     * IBM 3490E tape.
     * @type {Integer (Int32)}
     */
    static IBM_3490E => 42

    /**
     * IBM Magstar 3590 tape.
     * @type {Integer (Int32)}
     */
    static IBM_Magstar_3590 => 43

    /**
     * IBM Magstar MP tape.
     * @type {Integer (Int32)}
     */
    static IBM_Magstar_MP => 44

    /**
     * STK data D3 tape.
     * @type {Integer (Int32)}
     */
    static STK_DATA_D3 => 45

    /**
     * Sony DTF tape.
     * @type {Integer (Int32)}
     */
    static SONY_DTF => 46

    /**
     * A 6mm digital videotape.
     * @type {Integer (Int32)}
     */
    static DV_6mm => 47

    /**
     * Exabyte DMI tape (or compatible).
     * @type {Integer (Int32)}
     */
    static DMI => 48

    /**
     * Sony D2S or D2L tape.
     * @type {Integer (Int32)}
     */
    static SONY_D2 => 49

    /**
     * Cleaner (all drive types that support cleaners).
     * @type {Integer (Int32)}
     */
    static CLEANER_CARTRIDGE => 50

    /**
     * CD.
     * @type {Integer (Int32)}
     */
    static CD_ROM => 51

    /**
     * CD (write once).
     * @type {Integer (Int32)}
     */
    static CD_R => 52

    /**
     * CD (rewriteable).
     * @type {Integer (Int32)}
     */
    static CD_RW => 53

    /**
     * DVD.
     * @type {Integer (Int32)}
     */
    static DVD_ROM => 54

    /**
     * DVD (write once).
     * @type {Integer (Int32)}
     */
    static DVD_R => 55

    /**
     * DVD (rewriteable).
     * @type {Integer (Int32)}
     */
    static DVD_RW => 56

    /**
     * Magneto-optical 3.5" (rewriteable).
     * @type {Integer (Int32)}
     */
    static MO_3_RW => 57

    /**
     * Magneto-optical 5.25" (write once).
     * @type {Integer (Int32)}
     */
    static MO_5_WO => 58

    /**
     * Magneto-optical 5.25" (rewriteable; not LIMDOW).
     * @type {Integer (Int32)}
     */
    static MO_5_RW => 59

    /**
     * Magneto-optical 5.25" (rewriteable; LIMDOW).
     * @type {Integer (Int32)}
     */
    static MO_5_LIMDOW => 60

    /**
     * Phase change 5.25" (write once)
     * @type {Integer (Int32)}
     */
    static PC_5_WO => 61

    /**
     * Phase change 5.25" (rewriteable)
     * @type {Integer (Int32)}
     */
    static PC_5_RW => 62

    /**
     * Phase change dual (rewriteable)
     * @type {Integer (Int32)}
     */
    static PD_5_RW => 63

    /**
     * Ablative 5.25" (write once).
     * @type {Integer (Int32)}
     */
    static ABL_5_WO => 64

    /**
     * Pinnacle Apex 4.6GB (rewriteable)
     * @type {Integer (Int32)}
     */
    static PINNACLE_APEX_5_RW => 65

    /**
     * Sony 12" (write once).
     * @type {Integer (Int32)}
     */
    static SONY_12_WO => 66

    /**
     * Philips/LMS 12" (write once).
     * @type {Integer (Int32)}
     */
    static PHILIPS_12_WO => 67

    /**
     * Hitachi 12" (write once)
     * @type {Integer (Int32)}
     */
    static HITACHI_12_WO => 68

    /**
     * Cygnet/ATG 12" (write once)
     * @type {Integer (Int32)}
     */
    static CYGNET_12_WO => 69

    /**
     * Kodak 14" (write once)
     * @type {Integer (Int32)}
     */
    static KODAK_14_WO => 70

    /**
     * MO near field recording (Terastor)
     * @type {Integer (Int32)}
     */
    static MO_NFR_525 => 71

    /**
     * Nikon 12" (rewriteable).
     * @type {Integer (Int32)}
     */
    static NIKON_12_RW => 72

    /**
     * Iomega Zip.
     * @type {Integer (Int32)}
     */
    static IOMEGA_ZIP => 73

    /**
     * Iomega Jaz.
     * @type {Integer (Int32)}
     */
    static IOMEGA_JAZ => 74

    /**
     * Syquest EZ135.
     * @type {Integer (Int32)}
     */
    static SYQUEST_EZ135 => 75

    /**
     * Syquest EzFlyer.
     * @type {Integer (Int32)}
     */
    static SYQUEST_EZFLYER => 76

    /**
     * Syquest SyJet.
     * @type {Integer (Int32)}
     */
    static SYQUEST_SYJET => 77

    /**
     * Avatar 2.5" floppy.
     * @type {Integer (Int32)}
     */
    static AVATAR_F2 => 78

    /**
     * An 8mm Hitachi tape.
     * @type {Integer (Int32)}
     */
    static MP2_8mm => 79

    /**
     * Ampex DST small tape.
     * @type {Integer (Int32)}
     */
    static DST_S => 80

    /**
     * Ampex DST medium tape.
     * @type {Integer (Int32)}
     */
    static DST_M => 81

    /**
     * Ampex DST large tape.
     * @type {Integer (Int32)}
     */
    static DST_L => 82

    /**
     * Ecrix 8mm tape.
     * @type {Integer (Int32)}
     */
    static VXATape_1 => 83

    /**
     * Ecrix 8mm tape.
     * @type {Integer (Int32)}
     */
    static VXATape_2 => 84

    /**
     * @type {Integer (Int32)}
     */
    static STK_9840 => 85

    /**
     * LTO Ultrium (IBM, HP, Seagate).
     * @type {Integer (Int32)}
     */
    static LTO_Ultrium => 86

    /**
     * LTO Accelis (IBM, HP, Seagate).
     * @type {Integer (Int32)}
     */
    static LTO_Accelis => 87

    /**
     * DVD-RAM.
     * @type {Integer (Int32)}
     */
    static DVD_RAM => 88

    /**
     * AIT tape (AIT2 or higher).
     * @type {Integer (Int32)}
     */
    static AIT_8mm => 89

    /**
     * OnStream ADR1.
     * @type {Integer (Int32)}
     */
    static ADR_1 => 90

    /**
     * OnStream ADR2.
     * @type {Integer (Int32)}
     */
    static ADR_2 => 91

    /**
     * STK 9940.
     * @type {Integer (Int32)}
     */
    static STK_9940 => 92

    /**
     * SAIT tape.
     * 
     * **Windows Server 2003:**  This is not supported before Windows Server 2003 with SP1.
     * @type {Integer (Int32)}
     */
    static SAIT => 93

    /**
     * Exabyte VXA tape.
     * 
     * **Windows Server 2008:**  This is not supported before Windows Server 2008.
     * @type {Integer (Int32)}
     */
    static VXATape => 94
}
