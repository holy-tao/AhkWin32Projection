#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PHYSICAL_COUNTER_RESOURCE_DESCRIPTOR_TYPE.ahk" { PHYSICAL_COUNTER_RESOURCE_DESCRIPTOR_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PHYSICAL_COUNTER_RESOURCE_DESCRIPTOR {
    #StructPack 8


    struct _u {

        struct _Range {
            Begin : UInt32

            End : UInt32

        }

        CounterIndex : UInt32

        static __New() {
            DefineProp(this.Prototype, 'Range', { type: PHYSICAL_COUNTER_RESOURCE_DESCRIPTOR._u._Range, offset: 0 })
            DefineProp(this.Prototype, 'OverflowHandler', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'EventBufferConfiguration', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'IdentificationTag', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Type : PHYSICAL_COUNTER_RESOURCE_DESCRIPTOR_TYPE

    Flags : UInt32

    u : PHYSICAL_COUNTER_RESOURCE_DESCRIPTOR._u

}
