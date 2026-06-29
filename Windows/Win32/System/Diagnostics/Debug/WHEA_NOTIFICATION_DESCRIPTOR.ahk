#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_NOTIFICATION_FLAGS.ahk" { WHEA_NOTIFICATION_FLAGS }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WHEA_NOTIFICATION_DESCRIPTOR {
    #StructPack 4


    struct _u {

        struct _Polled {
            PollInterval : UInt32

        }

        struct _Interrupt {
            PollInterval : UInt32

            Vector : UInt32

            SwitchToPollingThreshold : UInt32

            SwitchToPollingWindow : UInt32

            ErrorThreshold : UInt32

            ErrorThresholdWindow : UInt32

        }

        struct _LocalInterrupt {
            PollInterval : UInt32

            Vector : UInt32

            SwitchToPollingThreshold : UInt32

            SwitchToPollingWindow : UInt32

            ErrorThreshold : UInt32

            ErrorThresholdWindow : UInt32

        }

        struct _Sci {
            PollInterval : UInt32

            Vector : UInt32

            SwitchToPollingThreshold : UInt32

            SwitchToPollingWindow : UInt32

            ErrorThreshold : UInt32

            ErrorThresholdWindow : UInt32

        }

        struct _Nmi {
            PollInterval : UInt32

            Vector : UInt32

            SwitchToPollingThreshold : UInt32

            SwitchToPollingWindow : UInt32

            ErrorThreshold : UInt32

            ErrorThresholdWindow : UInt32

        }

        struct _Sea {
            PollInterval : UInt32

            Vector : UInt32

            SwitchToPollingThreshold : UInt32

            SwitchToPollingWindow : UInt32

            ErrorThreshold : UInt32

            ErrorThresholdWindow : UInt32

        }

        struct _Sei {
            PollInterval : UInt32

            Vector : UInt32

            SwitchToPollingThreshold : UInt32

            SwitchToPollingWindow : UInt32

            ErrorThreshold : UInt32

            ErrorThresholdWindow : UInt32

        }

        struct _Gsiv {
            PollInterval : UInt32

            Vector : UInt32

            SwitchToPollingThreshold : UInt32

            SwitchToPollingWindow : UInt32

            ErrorThreshold : UInt32

            ErrorThresholdWindow : UInt32

        }

        Polled : WHEA_NOTIFICATION_DESCRIPTOR._u._Polled

        static __New() {
            DefineProp(this.Prototype, 'Interrupt', { type: WHEA_NOTIFICATION_DESCRIPTOR._u._Interrupt, offset: 0 })
            DefineProp(this.Prototype, 'LocalInterrupt', { type: WHEA_NOTIFICATION_DESCRIPTOR._u._LocalInterrupt, offset: 0 })
            DefineProp(this.Prototype, 'Sci', { type: WHEA_NOTIFICATION_DESCRIPTOR._u._Sci, offset: 0 })
            DefineProp(this.Prototype, 'Nmi', { type: WHEA_NOTIFICATION_DESCRIPTOR._u._Nmi, offset: 0 })
            DefineProp(this.Prototype, 'Sea', { type: WHEA_NOTIFICATION_DESCRIPTOR._u._Sea, offset: 0 })
            DefineProp(this.Prototype, 'Sei', { type: WHEA_NOTIFICATION_DESCRIPTOR._u._Sei, offset: 0 })
            DefineProp(this.Prototype, 'Gsiv', { type: WHEA_NOTIFICATION_DESCRIPTOR._u._Gsiv, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Type : Int8

    Length : Int8

    Flags : WHEA_NOTIFICATION_FLAGS

    u : WHEA_NOTIFICATION_DESCRIPTOR._u

}
