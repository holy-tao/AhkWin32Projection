#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import ".\MEDIUM_INFO.ahk" { MEDIUM_INFO }
#Import ".\KSP_NODE.ahk" { KSP_NODE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\TRANSPORT_STATE.ahk" { TRANSPORT_STATE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_EXTXPORT_NODE_S {
    #StructPack 8


    struct _u {

        struct _Timecode {
            frame : Int8

            second : Int8

            minute : Int8

            hour : Int8

        }

        struct _RawAVC {
            PayloadSize : UInt32

            Payload : Int8[512]

        }

        Capabilities : UInt32

        static __New() {
            DefineProp(this.Prototype, 'SignalMode', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'LoadMedium', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'MediumInfo', { type: MEDIUM_INFO, offset: 0 })
            DefineProp(this.Prototype, 'XPrtState', { type: TRANSPORT_STATE, offset: 0 })
            DefineProp(this.Prototype, 'Timecode', { type: KSPROPERTY_EXTXPORT_NODE_S._u._Timecode, offset: 0 })
            DefineProp(this.Prototype, 'dwTimecode', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'dwAbsTrackNumber', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'RawAVC', { type: KSPROPERTY_EXTXPORT_NODE_S._u._RawAVC, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    NodeProperty : KSP_NODE

    u : KSPROPERTY_EXTXPORT_NODE_S._u

}
