#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ETH_FILTER.ahk" { ETH_FILTER }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct FILTERDBS {
    #StructPack 8

    EthDB : ETH_FILTER.Ptr

    TrDB : IntPtr

    YYYDB : IntPtr

    XXXDB : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'NullDB', { type: IntPtr, offset: 0 })
        this.DeleteProp("__New")
    }
}
