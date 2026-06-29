#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_CACHE_TYPE.ahk" { WHV_CACHE_TYPE }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_ACCESS_GPA_CONTROLS {
    #StructPack 8

    AsUINT64 : Int64

    static __New() {
        DefineProp(this.Prototype, 'CacheType', { type: WHV_CACHE_TYPE, offset: 0 })
        DefineProp(this.Prototype, 'Reserved', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
