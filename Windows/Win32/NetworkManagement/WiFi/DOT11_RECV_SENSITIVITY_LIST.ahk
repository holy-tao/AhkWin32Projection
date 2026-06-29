#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_PHY_TYPE.ahk" { DOT11_PHY_TYPE }
#Import ".\DOT11_RECV_SENSITIVITY.ahk" { DOT11_RECV_SENSITIVITY }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_RECV_SENSITIVITY_LIST {
    #StructPack 4

    dot11PhyType : DOT11_PHY_TYPE

    uNumOfEntries : UInt32

    uTotalNumOfEntries : UInt32

    dot11RecvSensitivity : DOT11_RECV_SENSITIVITY[1]

    static __New() {
        DefineProp(this.Prototype, 'uPhyId', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
