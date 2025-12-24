#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\WHEA_NOTIFICATION_FLAGS.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WHEA_NOTIFICATION_DESCRIPTOR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    class _u_e__Union extends Win32Struct {
        static sizeof => 24
        static packingSize => 4

        class _Polled extends Win32Struct {
            static sizeof => 4
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            PollInterval {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
        }
    
        class _Interrupt extends Win32Struct {
            static sizeof => 24
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            PollInterval {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Vector {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            SwitchToPollingThreshold {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            SwitchToPollingWindow {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            ErrorThreshold {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            ErrorThresholdWindow {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
        }
    
        class _LocalInterrupt extends Win32Struct {
            static sizeof => 24
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            PollInterval {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Vector {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            SwitchToPollingThreshold {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            SwitchToPollingWindow {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            ErrorThreshold {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            ErrorThresholdWindow {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
        }
    
        class _Sci extends Win32Struct {
            static sizeof => 24
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            PollInterval {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Vector {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            SwitchToPollingThreshold {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            SwitchToPollingWindow {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            ErrorThreshold {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            ErrorThresholdWindow {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
        }
    
        class _Nmi extends Win32Struct {
            static sizeof => 24
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            PollInterval {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Vector {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            SwitchToPollingThreshold {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            SwitchToPollingWindow {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            ErrorThreshold {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            ErrorThresholdWindow {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
        }
    
        class _Sea extends Win32Struct {
            static sizeof => 24
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            PollInterval {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Vector {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            SwitchToPollingThreshold {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            SwitchToPollingWindow {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            ErrorThreshold {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            ErrorThresholdWindow {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
        }
    
        class _Sei extends Win32Struct {
            static sizeof => 24
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            PollInterval {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Vector {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            SwitchToPollingThreshold {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            SwitchToPollingWindow {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            ErrorThreshold {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            ErrorThresholdWindow {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
        }
    
        class _Gsiv extends Win32Struct {
            static sizeof => 24
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            PollInterval {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Vector {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            SwitchToPollingThreshold {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            SwitchToPollingWindow {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            ErrorThreshold {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            ErrorThresholdWindow {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
        }
    
        /**
         * @type {_Polled}
         */
        Polled{
            get {
                if(!this.HasProp("__Polled"))
                    this.__Polled := %this.__Class%._Polled(0, this)
                return this.__Polled
            }
        }
    
        /**
         * @type {_Interrupt}
         */
        Interrupt{
            get {
                if(!this.HasProp("__Interrupt"))
                    this.__Interrupt := %this.__Class%._Interrupt(0, this)
                return this.__Interrupt
            }
        }
    
        /**
         * @type {_LocalInterrupt}
         */
        LocalInterrupt{
            get {
                if(!this.HasProp("__LocalInterrupt"))
                    this.__LocalInterrupt := %this.__Class%._LocalInterrupt(0, this)
                return this.__LocalInterrupt
            }
        }
    
        /**
         * @type {_Sci}
         */
        Sci{
            get {
                if(!this.HasProp("__Sci"))
                    this.__Sci := %this.__Class%._Sci(0, this)
                return this.__Sci
            }
        }
    
        /**
         * @type {_Nmi}
         */
        Nmi{
            get {
                if(!this.HasProp("__Nmi"))
                    this.__Nmi := %this.__Class%._Nmi(0, this)
                return this.__Nmi
            }
        }
    
        /**
         * @type {_Sea}
         */
        Sea{
            get {
                if(!this.HasProp("__Sea"))
                    this.__Sea := %this.__Class%._Sea(0, this)
                return this.__Sea
            }
        }
    
        /**
         * @type {_Sei}
         */
        Sei{
            get {
                if(!this.HasProp("__Sei"))
                    this.__Sei := %this.__Class%._Sei(0, this)
                return this.__Sei
            }
        }
    
        /**
         * @type {_Gsiv}
         */
        Gsiv{
            get {
                if(!this.HasProp("__Gsiv"))
                    this.__Gsiv := %this.__Class%._Gsiv(0, this)
                return this.__Gsiv
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {WHEA_NOTIFICATION_FLAGS}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := WHEA_NOTIFICATION_FLAGS(2, this)
            return this.__Flags
        }
    }

    /**
     * @type {_u_e__Union}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._u_e__Union(8, this)
            return this.__u
        }
    }
}
