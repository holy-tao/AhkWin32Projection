#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDR64_BIND_GENERIC.ahk" { NDR64_BIND_GENERIC }
#Import ".\NDR64_BIND_CONTEXT.ahk" { NDR64_BIND_CONTEXT }
#Import ".\NDR64_BIND_PRIMITIVE.ahk" { NDR64_BIND_PRIMITIVE }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_BINDINGS {
    #StructPack 2

    Primitive : NDR64_BIND_PRIMITIVE

    static __New() {
        DefineProp(this.Prototype, 'Generic', { type: NDR64_BIND_GENERIC, offset: 0 })
        DefineProp(this.Prototype, 'Context', { type: NDR64_BIND_CONTEXT, offset: 0 })
        this.DeleteProp("__New")
    }
}
