#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_BSS_ENTRY_PHY_SPECIFIC_INFO {
    #StructPack 4


    struct _FHSS {
        uHopPattern : UInt32

        uHopSet : UInt32

        uDwellTime : UInt32

    }

    uChCenterFrequency : UInt32

    static __New() {
        DefineProp(this.Prototype, 'FHSS', { type: DOT11_BSS_ENTRY_PHY_SPECIFIC_INFO._FHSS, offset: 0 })
        this.DeleteProp("__New")
    }
}
