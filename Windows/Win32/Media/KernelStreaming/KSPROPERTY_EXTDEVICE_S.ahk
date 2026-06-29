#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVCAPS.ahk" { DEVCAPS }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_EXTDEVICE_S {
    #StructPack 8


    struct _u {
        Capabilities : DEVCAPS

        static __New() {
            DefineProp(this.Prototype, 'DevPort', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'PowerState', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'pawchString', { type: WCHAR[260], offset: 0 })
            DefineProp(this.Prototype, 'NodeUniqueID', { type: UInt32[2], offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Property : KSIDENTIFIER

    u : KSPROPERTY_EXTDEVICE_S._u

}
