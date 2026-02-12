#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_IDENTITY.ahk

/**
 * Contains status information sent to the callback routine when an event notice is raised.
 * @remarks
 * Call the [**WinBioRegisterEventMonitor**](/windows/desktop/api/Winbio/nf-winbio-winbioregistereventmonitor) function to register a callback routine to receive event notifications from the Windows Biometric Framework. The callback is a custom function that you must define for your application.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/SecBioMet/winbio-event
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_EVENT extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    class _Parameters_e__Union extends Win32Struct {
        static sizeof => 100
        static packingSize => 8

        class _Unclaimed extends Win32Struct {
            static sizeof => 8
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            UnitId {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            RejectDetail {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
        }
    
        class _UnclaimedIdentify extends Win32Struct {
            static sizeof => 96
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            UnitId {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {WINBIO_IDENTITY}
             */
            Identity{
                get {
                    if(!this.HasProp("__Identity"))
                        this.__Identity := WINBIO_IDENTITY(8, this)
                    return this.__Identity
                }
            }
        
            /**
             * @type {Integer}
             */
            SubFactor {
                get => NumGet(this, 88, "char")
                set => NumPut("char", value, this, 88)
            }
        
            /**
             * @type {Integer}
             */
            RejectDetail {
                get => NumGet(this, 92, "uint")
                set => NumPut("uint", value, this, 92)
            }
        
        }
    
        class _Error extends Win32Struct {
            static sizeof => 4
            static packingSize => 4
    
            /**
             * @type {HRESULT}
             */
            ErrorCode {
                get => NumGet(this, 0, "int")
                set => NumPut("int", value, this, 0)
            }
        
        }
    
        /**
         * @type {_Unclaimed}
         */
        Unclaimed{
            get {
                if(!this.HasProp("__Unclaimed"))
                    this.__Unclaimed := %this.__Class%._Unclaimed(0, this)
                return this.__Unclaimed
            }
        }
    
        /**
         * @type {_UnclaimedIdentify}
         */
        UnclaimedIdentify{
            get {
                if(!this.HasProp("__UnclaimedIdentify"))
                    this.__UnclaimedIdentify := %this.__Class%._UnclaimedIdentify(0, this)
                return this.__UnclaimedIdentify
            }
        }
    
        /**
         * @type {_Error}
         */
        Error{
            get {
                if(!this.HasProp("__Error"))
                    this.__Error := %this.__Class%._Error(0, this)
                return this.__Error
            }
        }
    
    }

    /**
     * A value that specifies the type of service provider event notice raised. The only provider currently supported is the fingerprint sensor. This sensor supports the following flags.
     * 
     * 
     * <span id="WINBIO_EVENT_FP_UNCLAIMED"></span><span id="winbio_event_fp_unclaimed"></span>**WINBIO\_EVENT\_FP\_UNCLAIMED** (The sensor detected a finger swipe that was not requested by the application or by the window that currently has focus. The Windows Biometric Framework calls into your callback function to indicate that a finger swipe has occurred but does not try to identify the fingerprint.)
     * 
     * <span id="WINBIO_EVENT_FP_UNCLAIMED_IDENTIFY"></span><span id="winbio_event_fp_unclaimed_identify"></span>**WINBIO\_EVENT\_FP\_UNCLAIMED\_IDENTIFY** (The sensor detected a finger swipe that was not requested by the application or by the window that currently has focus. The Windows Biometric Framework attempts to identify the fingerprint and passes the result of that process to your callback function.)
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {_Parameters_e__Union}
     */
    Parameters{
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := %this.__Class%._Parameters_e__Union(8, this)
            return this.__Parameters
        }
    }
}
