#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_ESCAPE_PFN_CONTROL_COMMAND.ahk" { D3DKMT_ESCAPE_PFN_CONTROL_COMMAND }
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3DKMT_VIDSCHESCAPETYPE.ahk" { D3DKMT_VIDSCHESCAPETYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_VIDSCH_ESCAPE {
    #StructPack 8


    struct _TdrControl2 {
        TdrControl : UInt32

        NodeOrdinal : UInt32

    }

    struct _TdrLimit {
        Count : UInt32

        Time : UInt32

    }

    Type : D3DKMT_VIDSCHESCAPETYPE

    PreemptionControl : BOOL

    VirtualRefreshRateControl : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'EnableContextDelay', { type: BOOL, offset: 4 })
        DefineProp(this.Prototype, 'TdrControl2', { type: D3DKMT_VIDSCH_ESCAPE._TdrControl2, offset: 4 })
        DefineProp(this.Prototype, 'SuspendScheduler', { type: BOOL, offset: 4 })
        DefineProp(this.Prototype, 'TdrControl', { type: UInt32, offset: 4 })
        DefineProp(this.Prototype, 'SuspendTime', { type: UInt32, offset: 4 })
        DefineProp(this.Prototype, 'TdrLimit', { type: D3DKMT_VIDSCH_ESCAPE._TdrLimit, offset: 4 })
        DefineProp(this.Prototype, 'PfnControl', { type: D3DKMT_ESCAPE_PFN_CONTROL_COMMAND, offset: 4 })
        this.DeleteProp("__New")
    }
}
