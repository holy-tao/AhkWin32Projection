#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_IDENTITY.ahk

/**
 * Specify the types of service provider event notifications to monitor.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-event-constants
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_EVENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    class _Unclaimed extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

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
        static sizeof => 8
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
                    this.__Identity := WINBIO_IDENTITY(this.ptr + 8)
                return this.__Identity
            }
        }
    
        /**
         * @type {Integer}
         */
        SubFactor {
            get => NumGet(this, 16, "char")
            set => NumPut("char", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        RejectDetail {
            get => NumGet(this, 20, "uint")
            set => NumPut("uint", value, this, 20)
        }
    
    }

    /**
     * @type {_Unclaimed}
     */
    Unclaimed{
        get {
            if(!this.HasProp("__Unclaimed"))
                this.__Unclaimed := %this.__Class%._Unclaimed(this.ptr + 8)
            return this.__Unclaimed
        }
    }

    /**
     * @type {_UnclaimedIdentify}
     */
    UnclaimedIdentify{
        get {
            if(!this.HasProp("__UnclaimedIdentify"))
                this.__UnclaimedIdentify := %this.__Class%._UnclaimedIdentify(this.ptr + 8)
            return this.__UnclaimedIdentify
        }
    }

    /**
     * @type {HRESULT}
     */
    Error {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
