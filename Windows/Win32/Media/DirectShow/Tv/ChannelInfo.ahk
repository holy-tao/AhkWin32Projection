#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ChannelInfo {
    #StructPack 4


    struct _DVB {
        lONID : Int32

        lTSID : Int32

        lSID : Int32

    }

    struct _DC {
        lProgNumber : Int32

    }

    struct _ATSC {
        lProgNumber : Int32

    }

    lFrequency : Int32

    DVB : ChannelInfo._DVB

    static __New() {
        DefineProp(this.Prototype, 'DC', { type: ChannelInfo._DC, offset: 4 })
        DefineProp(this.Prototype, 'ATSC', { type: ChannelInfo._ATSC, offset: 4 })
        this.DeleteProp("__New")
    }
}
