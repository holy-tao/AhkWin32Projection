#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PKINTERRUPT.ahk" { PKINTERRUPT }
#Import ".\IO_INTERRUPT_MESSAGE_INFO.ahk" { IO_INTERRUPT_MESSAGE_INFO }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_REPORT_INTERRUPT_ACTIVE_STATE_PARAMETERS {
    #StructPack 8


    struct _ConnectionContext {
        Generic : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'InterruptObject', { type: PKINTERRUPT, offset: 0 })
            DefineProp(this.Prototype, 'InterruptMessageTable', { type: IO_INTERRUPT_MESSAGE_INFO.Ptr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Version : UInt32

    ConnectionContext : IO_REPORT_INTERRUPT_ACTIVE_STATE_PARAMETERS._ConnectionContext

}
