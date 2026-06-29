#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides context information about the event.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-etw_buffer_context
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct ETW_BUFFER_CONTEXT {
    #StructPack 2

    ProcessorNumber : Int8

    Alignment : Int8

    /**
     * Identifier of the session that logged the event.
     */
    LoggerId : UInt16

    static __New() {
        DefineProp(this.Prototype, 'ProcessorIndex', { type: UInt16, offset: 0 })
        this.DeleteProp("__New")
    }
}
