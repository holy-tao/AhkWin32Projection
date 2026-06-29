#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GNSS_LKGFIX_PARAM.ahk" { GNSS_LKGFIX_PARAM }
#Import ".\GNSS_DISTANCETRACKING_PARAM.ahk" { GNSS_DISTANCETRACKING_PARAM }
#Import ".\GNSS_FIXSESSIONTYPE.ahk" { GNSS_FIXSESSIONTYPE }
#Import ".\GNSS_CONTINUOUSTRACKING_PARAM.ahk" { GNSS_CONTINUOUSTRACKING_PARAM }
#Import ".\GNSS_SINGLESHOT_PARAM.ahk" { GNSS_SINGLESHOT_PARAM }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_FIXSESSION_PARAM {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    FixSessionID : UInt32

    SessionType : GNSS_FIXSESSIONTYPE

    HorizontalAccuracy : UInt32

    HorizontalConfidence : UInt32

    Reserved : UInt32[9]

    FixLevelOfDetails : UInt32

    SingleShotParam : GNSS_SINGLESHOT_PARAM

    Unused : Int8[256]

    static __New() {
        DefineProp(this.Prototype, 'DistanceParam', { type: GNSS_DISTANCETRACKING_PARAM, offset: 64 })
        DefineProp(this.Prototype, 'ContinuousParam', { type: GNSS_CONTINUOUSTRACKING_PARAM, offset: 64 })
        DefineProp(this.Prototype, 'LkgFixParam', { type: GNSS_LKGFIX_PARAM, offset: 64 })
        DefineProp(this.Prototype, 'UnusedParam', { type: Int8[268], offset: 64 })
        this.DeleteProp("__New")
    }
}
