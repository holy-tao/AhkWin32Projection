#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * The PHONEINITIALIZEEXPARAMS structure contains parameters used to establish the association between an application and TAPI; for example, the application's selected event notification mechanism. The phoneInitializeEx function uses this structure.
 * @remarks
 * See 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phoneinitializeexa">phoneInitializeEx</a> for further information on these options.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-phoneinitializeexparams
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONEINITIALIZEEXPARAMS extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    class _Handles_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 1

        /**
         * @type {HANDLE}
         */
        hEvent{
            get {
                if(!this.HasProp("__hEvent"))
                    this.__hEvent := HANDLE(0, this)
                return this.__hEvent
            }
        }
    
        /**
         * @type {HANDLE}
         */
        hCompletionPort{
            get {
                if(!this.HasProp("__hCompletionPort"))
                    this.__hCompletionPort := HANDLE(0, this)
                return this.__hCompletionPort
            }
        }
    
    }

    class _Handles_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 1

        /**
         * @type {HANDLE}
         */
        hEvent{
            get {
                if(!this.HasProp("__hEvent"))
                    this.__hEvent := HANDLE(0, this)
                return this.__hEvent
            }
        }
    
        /**
         * @type {HANDLE}
         */
        hCompletionPort{
            get {
                if(!this.HasProp("__hCompletionPort"))
                    this.__hCompletionPort := HANDLE(0, this)
                return this.__hCompletionPort
            }
        }
    
    }

    /**
     * Total size allocated to this data structure, in bytes.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size for this data structure that is needed to hold all the returned information, in bytes.
     * @type {Integer}
     */
    dwNeededSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     * @type {Integer}
     */
    dwUsedSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * One of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phoneinitializeexoption--constants">PHONEINITIALIZEEXOPTION_ Constants</a>. Specifies the event notification mechanism the application desires to use.
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * 
     * @type {_Handles_e__Union}
     */
    Handles{
        get {
            if(!this.HasProp("__Handles"))
                this.__Handles := %this.__Class%._Handles_e__Union(16, this)
            return this.__Handles
        }
    }

    /**
     * If <b>dwOptions</b> specifies PHONEINITIALIZEEXOPTION_USECOMPLETIONPORT, the application must specify in this field a value that is returned through the <i>lpCompletionKey</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> to identify the completion message as a telephony message.
     * @type {Integer}
     */
    dwCompletionKey {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
