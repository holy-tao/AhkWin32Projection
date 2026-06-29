#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMDT_MONITOR_CAPABILITIES_ORIGIN.ahk" { D3DKMDT_MONITOR_CAPABILITIES_ORIGIN }
#Import ".\D3DKMDT_MONITOR_FREQUENCY_RANGE_CONSTRAINT.ahk" { D3DKMDT_MONITOR_FREQUENCY_RANGE_CONSTRAINT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_MONITOR_FREQUENCY_RANGE {
    #StructPack 8


    struct _Constraint {
        ActiveSize : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'MaxPixelRate', { type: IntPtr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Origin : D3DKMDT_MONITOR_CAPABILITIES_ORIGIN

    RangeLimits : IntPtr

    ConstraintType : D3DKMDT_MONITOR_FREQUENCY_RANGE_CONSTRAINT

    Constraint : D3DKMDT_MONITOR_FREQUENCY_RANGE._Constraint

}
