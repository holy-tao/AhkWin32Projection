#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PO_FX_PERF_STATE_UNIT.ahk" { PO_FX_PERF_STATE_UNIT }
#Import ".\PO_FX_PERF_STATE_TYPE.ahk" { PO_FX_PERF_STATE_TYPE }
#Import ".\PO_FX_PERF_STATE.ahk" { PO_FX_PERF_STATE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PO_FX_COMPONENT_PERF_SET {
    #StructPack 8


    struct _Discrete {
        Count : UInt32

        States : PO_FX_PERF_STATE.Ptr

    }

    struct _Range {
        Minimum : Int64

        Maximum : Int64

    }

    Name : IntPtr

    Flags : Int64

    Unit : PO_FX_PERF_STATE_UNIT

    Type : PO_FX_PERF_STATE_TYPE

    Discrete : PO_FX_COMPONENT_PERF_SET._Discrete

    static __New() {
        DefineProp(this.Prototype, 'Range', { type: PO_FX_COMPONENT_PERF_SET._Range, offset: 24 })
        this.DeleteProp("__New")
    }
}
