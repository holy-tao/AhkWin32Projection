#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class DISPID_TUNER extends Win32Enum {

    /**
     * Native name: DISPID_TUNER_TS_UNIQUENAME
     * @type {Integer (Int32)}
     */
    static TS_UNIQUENAME => 1

    /**
     * Native name: DISPID_TUNER_TS_FRIENDLYNAME
     * @type {Integer (Int32)}
     */
    static TS_FRIENDLYNAME => 2

    /**
     * Native name: DISPID_TUNER_TS_CLSID
     * @type {Integer (Int32)}
     */
    static TS_CLSID => 3

    /**
     * Native name: DISPID_TUNER_TS_NETWORKTYPE
     * @type {Integer (Int32)}
     */
    static TS_NETWORKTYPE => 4

    /**
     * Native name: DISPID_TUNER_TS__NETWORKTYPE
     * @type {Integer (Int32)}
     */
    static TS__NETWORKTYPE => 5

    /**
     * Native name: DISPID_TUNER_TS_CREATETUNEREQUEST
     * @type {Integer (Int32)}
     */
    static TS_CREATETUNEREQUEST => 6

    /**
     * Native name: DISPID_TUNER_TS_ENUMCATEGORYGUIDS
     * @type {Integer (Int32)}
     */
    static TS_ENUMCATEGORYGUIDS => 7

    /**
     * Native name: DISPID_TUNER_TS_ENUMDEVICEMONIKERS
     * @type {Integer (Int32)}
     */
    static TS_ENUMDEVICEMONIKERS => 8

    /**
     * Native name: DISPID_TUNER_TS_DEFAULTPREFERREDCOMPONENTTYPES
     * @type {Integer (Int32)}
     */
    static TS_DEFAULTPREFERREDCOMPONENTTYPES => 9

    /**
     * Native name: DISPID_TUNER_TS_FREQMAP
     * @type {Integer (Int32)}
     */
    static TS_FREQMAP => 10

    /**
     * Native name: DISPID_TUNER_TS_DEFLOCATOR
     * @type {Integer (Int32)}
     */
    static TS_DEFLOCATOR => 11

    /**
     * Native name: DISPID_TUNER_TS_CLONE
     * @type {Integer (Int32)}
     */
    static TS_CLONE => 12

    /**
     * Native name: DISPID_TUNER_TR_TUNINGSPACE
     * @type {Integer (Int32)}
     */
    static TR_TUNINGSPACE => 1

    /**
     * Native name: DISPID_TUNER_TR_COMPONENTS
     * @type {Integer (Int32)}
     */
    static TR_COMPONENTS => 2

    /**
     * Native name: DISPID_TUNER_TR_CLONE
     * @type {Integer (Int32)}
     */
    static TR_CLONE => 3

    /**
     * Native name: DISPID_TUNER_TR_LOCATOR
     * @type {Integer (Int32)}
     */
    static TR_LOCATOR => 4

    /**
     * Native name: DISPID_TUNER_CT_CATEGORY
     * @type {Integer (Int32)}
     */
    static CT_CATEGORY => 1

    /**
     * Native name: DISPID_TUNER_CT_MEDIAMAJORTYPE
     * @type {Integer (Int32)}
     */
    static CT_MEDIAMAJORTYPE => 2

    /**
     * Native name: DISPID_TUNER_CT__MEDIAMAJORTYPE
     * @type {Integer (Int32)}
     */
    static CT__MEDIAMAJORTYPE => 3

    /**
     * Native name: DISPID_TUNER_CT_MEDIASUBTYPE
     * @type {Integer (Int32)}
     */
    static CT_MEDIASUBTYPE => 4

    /**
     * Native name: DISPID_TUNER_CT__MEDIASUBTYPE
     * @type {Integer (Int32)}
     */
    static CT__MEDIASUBTYPE => 5

    /**
     * Native name: DISPID_TUNER_CT_MEDIAFORMATTYPE
     * @type {Integer (Int32)}
     */
    static CT_MEDIAFORMATTYPE => 6

    /**
     * Native name: DISPID_TUNER_CT__MEDIAFORMATTYPE
     * @type {Integer (Int32)}
     */
    static CT__MEDIAFORMATTYPE => 7

    /**
     * Native name: DISPID_TUNER_CT_MEDIATYPE
     * @type {Integer (Int32)}
     */
    static CT_MEDIATYPE => 8

    /**
     * Native name: DISPID_TUNER_CT_CLONE
     * @type {Integer (Int32)}
     */
    static CT_CLONE => 9

    /**
     * Native name: DISPID_TUNER_LCT_LANGID
     * @type {Integer (Int32)}
     */
    static LCT_LANGID => 100

    /**
     * Native name: DISPID_TUNER_MP2CT_TYPE
     * @type {Integer (Int32)}
     */
    static MP2CT_TYPE => 200

    /**
     * Native name: DISPID_TUNER_ATSCCT_FLAGS
     * @type {Integer (Int32)}
     */
    static ATSCCT_FLAGS => 300

    /**
     * Native name: DISPID_TUNER_L_CARRFREQ
     * @type {Integer (Int32)}
     */
    static L_CARRFREQ => 1

    /**
     * Native name: DISPID_TUNER_L_INNERFECMETHOD
     * @type {Integer (Int32)}
     */
    static L_INNERFECMETHOD => 2

    /**
     * Native name: DISPID_TUNER_L_INNERFECRATE
     * @type {Integer (Int32)}
     */
    static L_INNERFECRATE => 3

    /**
     * Native name: DISPID_TUNER_L_OUTERFECMETHOD
     * @type {Integer (Int32)}
     */
    static L_OUTERFECMETHOD => 4

    /**
     * Native name: DISPID_TUNER_L_OUTERFECRATE
     * @type {Integer (Int32)}
     */
    static L_OUTERFECRATE => 5

    /**
     * Native name: DISPID_TUNER_L_MOD
     * @type {Integer (Int32)}
     */
    static L_MOD => 6

    /**
     * Native name: DISPID_TUNER_L_SYMRATE
     * @type {Integer (Int32)}
     */
    static L_SYMRATE => 7

    /**
     * Native name: DISPID_TUNER_L_CLONE
     * @type {Integer (Int32)}
     */
    static L_CLONE => 8

    /**
     * Native name: DISPID_TUNER_L_ATSC_PHYS_CHANNEL
     * @type {Integer (Int32)}
     */
    static L_ATSC_PHYS_CHANNEL => 201

    /**
     * Native name: DISPID_TUNER_L_ATSC_TSID
     * @type {Integer (Int32)}
     */
    static L_ATSC_TSID => 202

    /**
     * Native name: DISPID_TUNER_L_ATSC_MP2_PROGNO
     * @type {Integer (Int32)}
     */
    static L_ATSC_MP2_PROGNO => 203

    /**
     * Native name: DISPID_TUNER_L_DVBT_BANDWIDTH
     * @type {Integer (Int32)}
     */
    static L_DVBT_BANDWIDTH => 301

    /**
     * Native name: DISPID_TUNER_L_DVBT_LPINNERFECMETHOD
     * @type {Integer (Int32)}
     */
    static L_DVBT_LPINNERFECMETHOD => 302

    /**
     * Native name: DISPID_TUNER_L_DVBT_LPINNERFECRATE
     * @type {Integer (Int32)}
     */
    static L_DVBT_LPINNERFECRATE => 303

    /**
     * Native name: DISPID_TUNER_L_DVBT_GUARDINTERVAL
     * @type {Integer (Int32)}
     */
    static L_DVBT_GUARDINTERVAL => 304

    /**
     * Native name: DISPID_TUNER_L_DVBT_HALPHA
     * @type {Integer (Int32)}
     */
    static L_DVBT_HALPHA => 305

    /**
     * Native name: DISPID_TUNER_L_DVBT_TRANSMISSIONMODE
     * @type {Integer (Int32)}
     */
    static L_DVBT_TRANSMISSIONMODE => 306

    /**
     * Native name: DISPID_TUNER_L_DVBT_INUSE
     * @type {Integer (Int32)}
     */
    static L_DVBT_INUSE => 307

    /**
     * Native name: DISPID_TUNER_L_DVBT2_PHYSICALLAYERPIPEID
     * @type {Integer (Int32)}
     */
    static L_DVBT2_PHYSICALLAYERPIPEID => 351

    /**
     * Native name: DISPID_TUNER_L_DVBS_POLARISATION
     * @type {Integer (Int32)}
     */
    static L_DVBS_POLARISATION => 401

    /**
     * Native name: DISPID_TUNER_L_DVBS_WEST
     * @type {Integer (Int32)}
     */
    static L_DVBS_WEST => 402

    /**
     * Native name: DISPID_TUNER_L_DVBS_ORBITAL
     * @type {Integer (Int32)}
     */
    static L_DVBS_ORBITAL => 403

    /**
     * Native name: DISPID_TUNER_L_DVBS_AZIMUTH
     * @type {Integer (Int32)}
     */
    static L_DVBS_AZIMUTH => 404

    /**
     * Native name: DISPID_TUNER_L_DVBS_ELEVATION
     * @type {Integer (Int32)}
     */
    static L_DVBS_ELEVATION => 405

    /**
     * Native name: DISPID_TUNER_L_DVBS2_DISEQ_LNB_SOURCE
     * @type {Integer (Int32)}
     */
    static L_DVBS2_DISEQ_LNB_SOURCE => 406

    /**
     * Native name: DISPID_TUNER_TS_DVBS2_LOW_OSC_FREQ_OVERRIDE
     * @type {Integer (Int32)}
     */
    static TS_DVBS2_LOW_OSC_FREQ_OVERRIDE => 407

    /**
     * Native name: DISPID_TUNER_TS_DVBS2_HI_OSC_FREQ_OVERRIDE
     * @type {Integer (Int32)}
     */
    static TS_DVBS2_HI_OSC_FREQ_OVERRIDE => 408

    /**
     * Native name: DISPID_TUNER_TS_DVBS2_LNB_SWITCH_FREQ_OVERRIDE
     * @type {Integer (Int32)}
     */
    static TS_DVBS2_LNB_SWITCH_FREQ_OVERRIDE => 409

    /**
     * Native name: DISPID_TUNER_TS_DVBS2_SPECTRAL_INVERSION_OVERRIDE
     * @type {Integer (Int32)}
     */
    static TS_DVBS2_SPECTRAL_INVERSION_OVERRIDE => 410

    /**
     * Native name: DISPID_TUNER_L_DVBS2_ROLLOFF
     * @type {Integer (Int32)}
     */
    static L_DVBS2_ROLLOFF => 411

    /**
     * Native name: DISPID_TUNER_L_DVBS2_PILOT
     * @type {Integer (Int32)}
     */
    static L_DVBS2_PILOT => 412

    /**
     * Native name: DISPID_TUNER_L_ANALOG_STANDARD
     * @type {Integer (Int32)}
     */
    static L_ANALOG_STANDARD => 601

    /**
     * Native name: DISPID_TUNER_L_DTV_O_MAJOR_CHANNEL
     * @type {Integer (Int32)}
     */
    static L_DTV_O_MAJOR_CHANNEL => 701

    /**
     * Native name: DISPID_TUNER_C_TYPE
     * @type {Integer (Int32)}
     */
    static C_TYPE => 1

    /**
     * Native name: DISPID_TUNER_C_STATUS
     * @type {Integer (Int32)}
     */
    static C_STATUS => 2

    /**
     * Native name: DISPID_TUNER_C_LANGID
     * @type {Integer (Int32)}
     */
    static C_LANGID => 3

    /**
     * Native name: DISPID_TUNER_C_DESCRIPTION
     * @type {Integer (Int32)}
     */
    static C_DESCRIPTION => 4

    /**
     * Native name: DISPID_TUNER_C_CLONE
     * @type {Integer (Int32)}
     */
    static C_CLONE => 5

    /**
     * Native name: DISPID_TUNER_C_MP2_PID
     * @type {Integer (Int32)}
     */
    static C_MP2_PID => 101

    /**
     * Native name: DISPID_TUNER_C_MP2_PCRPID
     * @type {Integer (Int32)}
     */
    static C_MP2_PCRPID => 102

    /**
     * Native name: DISPID_TUNER_C_MP2_PROGNO
     * @type {Integer (Int32)}
     */
    static C_MP2_PROGNO => 103

    /**
     * Native name: DISPID_TUNER_C_ANALOG_AUDIO
     * @type {Integer (Int32)}
     */
    static C_ANALOG_AUDIO => 201

    /**
     * Native name: DISPID_TUNER_TS_DVB_SYSTEMTYPE
     * @type {Integer (Int32)}
     */
    static TS_DVB_SYSTEMTYPE => 101

    /**
     * Native name: DISPID_TUNER_TS_DVB2_NETWORK_ID
     * @type {Integer (Int32)}
     */
    static TS_DVB2_NETWORK_ID => 102

    /**
     * Native name: DISPID_TUNER_TS_DVBS_LOW_OSC_FREQ
     * @type {Integer (Int32)}
     */
    static TS_DVBS_LOW_OSC_FREQ => 1001

    /**
     * Native name: DISPID_TUNER_TS_DVBS_HI_OSC_FREQ
     * @type {Integer (Int32)}
     */
    static TS_DVBS_HI_OSC_FREQ => 1002

    /**
     * Native name: DISPID_TUNER_TS_DVBS_LNB_SWITCH_FREQ
     * @type {Integer (Int32)}
     */
    static TS_DVBS_LNB_SWITCH_FREQ => 1003

    /**
     * Native name: DISPID_TUNER_TS_DVBS_INPUT_RANGE
     * @type {Integer (Int32)}
     */
    static TS_DVBS_INPUT_RANGE => 1004

    /**
     * Native name: DISPID_TUNER_TS_DVBS_SPECTRAL_INVERSION
     * @type {Integer (Int32)}
     */
    static TS_DVBS_SPECTRAL_INVERSION => 1005

    /**
     * Native name: DISPID_TUNER_TS_AR_MINFREQUENCY
     * @type {Integer (Int32)}
     */
    static TS_AR_MINFREQUENCY => 101

    /**
     * Native name: DISPID_TUNER_TS_AR_MAXFREQUENCY
     * @type {Integer (Int32)}
     */
    static TS_AR_MAXFREQUENCY => 102

    /**
     * Native name: DISPID_TUNER_TS_AR_STEP
     * @type {Integer (Int32)}
     */
    static TS_AR_STEP => 103

    /**
     * Native name: DISPID_TUNER_TS_AR_COUNTRYCODE
     * @type {Integer (Int32)}
     */
    static TS_AR_COUNTRYCODE => 104

    /**
     * Native name: DISPID_TUNER_TS_AUX_COUNTRYCODE
     * @type {Integer (Int32)}
     */
    static TS_AUX_COUNTRYCODE => 101

    /**
     * Native name: DISPID_TUNER_TS_ATV_MINCHANNEL
     * @type {Integer (Int32)}
     */
    static TS_ATV_MINCHANNEL => 101

    /**
     * Native name: DISPID_TUNER_TS_ATV_MAXCHANNEL
     * @type {Integer (Int32)}
     */
    static TS_ATV_MAXCHANNEL => 102

    /**
     * Native name: DISPID_TUNER_TS_ATV_INPUTTYPE
     * @type {Integer (Int32)}
     */
    static TS_ATV_INPUTTYPE => 103

    /**
     * Native name: DISPID_TUNER_TS_ATV_COUNTRYCODE
     * @type {Integer (Int32)}
     */
    static TS_ATV_COUNTRYCODE => 104

    /**
     * Native name: DISPID_TUNER_TS_ATSC_MINMINORCHANNEL
     * @type {Integer (Int32)}
     */
    static TS_ATSC_MINMINORCHANNEL => 201

    /**
     * Native name: DISPID_TUNER_TS_ATSC_MAXMINORCHANNEL
     * @type {Integer (Int32)}
     */
    static TS_ATSC_MAXMINORCHANNEL => 202

    /**
     * Native name: DISPID_TUNER_TS_ATSC_MINPHYSCHANNEL
     * @type {Integer (Int32)}
     */
    static TS_ATSC_MINPHYSCHANNEL => 203

    /**
     * Native name: DISPID_TUNER_TS_ATSC_MAXPHYSCHANNEL
     * @type {Integer (Int32)}
     */
    static TS_ATSC_MAXPHYSCHANNEL => 204

    /**
     * Native name: DISPID_TUNER_TS_DC_MINMAJORCHANNEL
     * @type {Integer (Int32)}
     */
    static TS_DC_MINMAJORCHANNEL => 301

    /**
     * Native name: DISPID_TUNER_TS_DC_MAXMAJORCHANNEL
     * @type {Integer (Int32)}
     */
    static TS_DC_MAXMAJORCHANNEL => 302

    /**
     * Native name: DISPID_TUNER_TS_DC_MINSOURCEID
     * @type {Integer (Int32)}
     */
    static TS_DC_MINSOURCEID => 303

    /**
     * Native name: DISPID_TUNER_TS_DC_MAXSOURCEID
     * @type {Integer (Int32)}
     */
    static TS_DC_MAXSOURCEID => 304

    /**
     * Native name: DISPID_CHTUNER_ATVAC_CHANNEL
     * @type {Integer (Int32)}
     */
    static CHTUNER_ATVAC_CHANNEL => 101

    /**
     * Native name: DISPID_CHTUNER_ATVDC_SYSTEM
     * @type {Integer (Int32)}
     */
    static CHTUNER_ATVDC_SYSTEM => 101

    /**
     * Native name: DISPID_CHTUNER_ATVDC_CONTENT
     * @type {Integer (Int32)}
     */
    static CHTUNER_ATVDC_CONTENT => 102

    /**
     * Native name: DISPID_CHTUNER_CIDTR_CHANNELID
     * @type {Integer (Int32)}
     */
    static CHTUNER_CIDTR_CHANNELID => 101

    /**
     * Native name: DISPID_CHTUNER_CTR_CHANNEL
     * @type {Integer (Int32)}
     */
    static CHTUNER_CTR_CHANNEL => 101

    /**
     * Native name: DISPID_CHTUNER_ACTR_MINOR_CHANNEL
     * @type {Integer (Int32)}
     */
    static CHTUNER_ACTR_MINOR_CHANNEL => 201

    /**
     * Native name: DISPID_CHTUNER_DCTR_MAJOR_CHANNEL
     * @type {Integer (Int32)}
     */
    static CHTUNER_DCTR_MAJOR_CHANNEL => 301

    /**
     * Native name: DISPID_CHTUNER_DCTR_SRCID
     * @type {Integer (Int32)}
     */
    static CHTUNER_DCTR_SRCID => 302

    /**
     * Native name: DISPID_DVBTUNER_DVBC_ATTRIBUTESVALID
     * @type {Integer (Int32)}
     */
    static DVBTUNER_DVBC_ATTRIBUTESVALID => 101

    /**
     * Native name: DISPID_DVBTUNER_DVBC_PID
     * @type {Integer (Int32)}
     */
    static DVBTUNER_DVBC_PID => 102

    /**
     * Native name: DISPID_DVBTUNER_DVBC_TAG
     * @type {Integer (Int32)}
     */
    static DVBTUNER_DVBC_TAG => 103

    /**
     * Native name: DISPID_DVBTUNER_DVBC_COMPONENTTYPE
     * @type {Integer (Int32)}
     */
    static DVBTUNER_DVBC_COMPONENTTYPE => 104

    /**
     * Native name: DISPID_DVBTUNER_ONID
     * @type {Integer (Int32)}
     */
    static DVBTUNER_ONID => 101

    /**
     * Native name: DISPID_DVBTUNER_TSID
     * @type {Integer (Int32)}
     */
    static DVBTUNER_TSID => 102

    /**
     * Native name: DISPID_DVBTUNER_SID
     * @type {Integer (Int32)}
     */
    static DVBTUNER_SID => 103

    /**
     * Native name: DISPID_MP2TUNER_TSID
     * @type {Integer (Int32)}
     */
    static MP2TUNER_TSID => 101

    /**
     * Native name: DISPID_MP2TUNER_PROGNO
     * @type {Integer (Int32)}
     */
    static MP2TUNER_PROGNO => 102

    /**
     * Native name: DISPID_MP2TUNERFACTORY_CREATETUNEREQUEST
     * @type {Integer (Int32)}
     */
    static MP2TUNERFACTORY_CREATETUNEREQUEST => 1
}
