#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * The PHONEINITIALIZEEXPARAMS structure contains parameters used to establish the association between an application and TAPI; for example, the application's selected event notification mechanism. The phoneInitializeEx function uses this structure.
 * @remarks
 * See 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phoneinitializeexa">phoneInitializeEx</a> for further information on these options.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-phoneinitializeexparams
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct PHONEINITIALIZEEXPARAMS {
    #StructPack 4


    struct _Handles {
        hEvent : HANDLE

        static __New() {
            DefineProp(this.Prototype, 'hCompletionPort', { type: HANDLE, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Total size allocated to this data structure, in bytes.
     */
    dwTotalSize : UInt32

    /**
     * Size for this data structure that is needed to hold all the returned information, in bytes.
     */
    dwNeededSize : UInt32

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     */
    dwUsedSize : UInt32

    /**
     * One of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phoneinitializeexoption--constants">PHONEINITIALIZEEXOPTION_ Constants</a>. Specifies the event notification mechanism the application desires to use.
     */
    dwOptions : UInt32

    Handles : PHONEINITIALIZEEXPARAMS._Handles

    /**
     * If <b>dwOptions</b> specifies PHONEINITIALIZEEXOPTION_USECOMPLETIONPORT, the application must specify in this field a value that is returned through the <i>lpCompletionKey</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> to identify the completion message as a telephony message.
     */
    dwCompletionKey : UInt32

}
