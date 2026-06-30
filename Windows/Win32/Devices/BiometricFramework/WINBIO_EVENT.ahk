#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WINBIO_IDENTITY.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * Specify the types of service provider event notifications to monitor.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-event-constants
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
class WINBIO_EVENT extends Win32Struct {
    static sizeof => 92

    static packingSize => 4

    class _Parameters extends Win32Struct {
        static sizeof => 88
        static packingSize => 4

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
            static sizeof => 88
            static packingSize => 4

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
            Identity {
                get {
                    if(!this.HasProp("__Identity"))
                        this.__Identity := WINBIO_IDENTITY(4, this)
                    return this.__Identity
                }
            }

            /**
             * @type {Integer}
             */
            SubFactor {
                get => NumGet(this, 80, "char")
                set => NumPut("char", value, this, 80)
            }

            /**
             * @type {Integer}
             */
            RejectDetail {
                get => NumGet(this, 84, "uint")
                set => NumPut("uint", value, this, 84)
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
        Unclaimed {
            get {
                if(!this.HasProp("__Unclaimed"))
                    this.__Unclaimed := WINBIO_EVENT._Parameters._Unclaimed(0, this)
                return this.__Unclaimed
            }
        }

        /**
         * @type {_UnclaimedIdentify}
         */
        UnclaimedIdentify {
            get {
                if(!this.HasProp("__UnclaimedIdentify"))
                    this.__UnclaimedIdentify := WINBIO_EVENT._Parameters._UnclaimedIdentify(0, this)
                return this.__UnclaimedIdentify
            }
        }

        /**
         * @type {_Error}
         */
        Error {
            get {
                if(!this.HasProp("__Error"))
                    this.__Error := WINBIO_EVENT._Parameters._Error(0, this)
                return this.__Error
            }
        }
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {_Parameters}
     */
    Parameters {
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := WINBIO_EVENT._Parameters(4, this)
            return this.__Parameters
        }
    }
}
