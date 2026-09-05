#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_CAMERACONTROL_EXTENDED_PROPERTY extends Win32Enum {

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_PHOTOMODE
     * @type {Integer (Int32)}
     */
    static PHOTOMODE => 0

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_PHOTOFRAMERATE
     * @type {Integer (Int32)}
     */
    static PHOTOFRAMERATE => 1

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_PHOTOMAXFRAMERATE
     * @type {Integer (Int32)}
     */
    static PHOTOMAXFRAMERATE => 2

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_PHOTOTRIGGERTIME
     * @type {Integer (Int32)}
     */
    static PHOTOTRIGGERTIME => 3

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_WARMSTART
     * @type {Integer (Int32)}
     */
    static WARMSTART => 4

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_MAXVIDFPS_PHOTORES
     * @type {Integer (Int32)}
     */
    static MAXVIDFPS_PHOTORES => 5

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_PHOTOTHUMBNAIL
     * @type {Integer (Int32)}
     */
    static PHOTOTHUMBNAIL => 6

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_SCENEMODE
     * @type {Integer (Int32)}
     */
    static SCENEMODE => 7

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_TORCHMODE
     * @type {Integer (Int32)}
     */
    static TORCHMODE => 8

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_FLASHMODE
     * @type {Integer (Int32)}
     */
    static FLASHMODE => 9

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_OPTIMIZATIONHINT
     * @type {Integer (Int32)}
     */
    static OPTIMIZATIONHINT => 10

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_WHITEBALANCEMODE
     * @type {Integer (Int32)}
     */
    static WHITEBALANCEMODE => 11

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_EXPOSUREMODE
     * @type {Integer (Int32)}
     */
    static EXPOSUREMODE => 12

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_FOCUSMODE
     * @type {Integer (Int32)}
     */
    static FOCUSMODE => 13

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_ISO
     * @type {Integer (Int32)}
     */
    static ISO => 14

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_FIELDOFVIEW
     * @type {Integer (Int32)}
     */
    static FIELDOFVIEW => 15

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_EVCOMPENSATION
     * @type {Integer (Int32)}
     */
    static EVCOMPENSATION => 16

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_CAMERAANGLEOFFSET
     * @type {Integer (Int32)}
     */
    static CAMERAANGLEOFFSET => 17

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_METADATA
     * @type {Integer (Int32)}
     */
    static METADATA => 18

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_FOCUSPRIORITY
     * @type {Integer (Int32)}
     */
    static FOCUSPRIORITY => 19

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_FOCUSSTATE
     * @type {Integer (Int32)}
     */
    static FOCUSSTATE => 20

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_ROI_CONFIGCAPS
     * @type {Integer (Int32)}
     */
    static ROI_CONFIGCAPS => 21

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_ROI_ISPCONTROL
     * @type {Integer (Int32)}
     */
    static ROI_ISPCONTROL => 22

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_PHOTOCONFIRMATION
     * @type {Integer (Int32)}
     */
    static PHOTOCONFIRMATION => 23

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_ZOOM
     * @type {Integer (Int32)}
     */
    static ZOOM => 24

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_MCC
     * @type {Integer (Int32)}
     */
    static MCC => 25

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_ISO_ADVANCED
     * @type {Integer (Int32)}
     */
    static ISO_ADVANCED => 26

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_VIDEOSTABILIZATION
     * @type {Integer (Int32)}
     */
    static VIDEOSTABILIZATION => 27

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_VFR
     * @type {Integer (Int32)}
     */
    static VFR => 28

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_FACEDETECTION
     * @type {Integer (Int32)}
     */
    static FACEDETECTION => 29

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_VIDEOHDR
     * @type {Integer (Int32)}
     */
    static VIDEOHDR => 30

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_HISTOGRAM
     * @type {Integer (Int32)}
     */
    static HISTOGRAM => 31

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_OIS
     * @type {Integer (Int32)}
     */
    static OIS => 32

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_ADVANCEDPHOTO
     * @type {Integer (Int32)}
     */
    static ADVANCEDPHOTO => 33

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_PROFILE
     * @type {Integer (Int32)}
     */
    static PROFILE => 34

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_FACEAUTH_MODE
     * @type {Integer (Int32)}
     */
    static FACEAUTH_MODE => 35

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_SECURE_MODE
     * @type {Integer (Int32)}
     */
    static SECURE_MODE => 36

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_VIDEOTEMPORALDENOISING
     * @type {Integer (Int32)}
     */
    static VIDEOTEMPORALDENOISING => 37

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_IRTORCHMODE
     * @type {Integer (Int32)}
     */
    static IRTORCHMODE => 38

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_RELATIVEPANELOPTIMIZATION
     * @type {Integer (Int32)}
     */
    static RELATIVEPANELOPTIMIZATION => 39

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_EYEGAZECORRECTION
     * @type {Integer (Int32)}
     */
    static EYEGAZECORRECTION => 40

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_BACKGROUNDSEGMENTATION
     * @type {Integer (Int32)}
     */
    static BACKGROUNDSEGMENTATION => 41

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_DIGITALWINDOW_CONFIGCAPS
     * @type {Integer (Int32)}
     */
    static DIGITALWINDOW_CONFIGCAPS => 42

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_DIGITALWINDOW
     * @type {Integer (Int32)}
     */
    static DIGITALWINDOW => 43

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_FRAMERATE_THROTTLE
     * @type {Integer (Int32)}
     */
    static FRAMERATE_THROTTLE => 44

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_FIELDOFVIEW2_CONFIGCAPS
     * @type {Integer (Int32)}
     */
    static FIELDOFVIEW2_CONFIGCAPS => 45

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_FIELDOFVIEW2
     * @type {Integer (Int32)}
     */
    static FIELDOFVIEW2 => 46

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_END
     * @type {Integer (Int32)}
     */
    static END => 47

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXTENDED_END2
     * @type {Integer (Int32)}
     */
    static END2 => 47
}
