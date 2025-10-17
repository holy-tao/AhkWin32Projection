#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_IDENTITY.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_EVENT extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    class _Unclaimed extends Win32Struct {
        static sizeof => 100
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
        static sizeof => 100
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
        static sizeof => 100
        static packingSize => 8

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
                this.__Unclaimed := %this.__Class%._Unclaimed(8, this)
            return this.__Unclaimed
        }
    }

    /**
     * @type {_UnclaimedIdentify}
     */
    UnclaimedIdentify{
        get {
            if(!this.HasProp("__UnclaimedIdentify"))
                this.__UnclaimedIdentify := %this.__Class%._UnclaimedIdentify(8, this)
            return this.__UnclaimedIdentify
        }
    }

    /**
     * @type {_Error}
     */
    Error{
        get {
            if(!this.HasProp("__Error"))
                this.__Error := %this.__Class%._Error(8, this)
            return this.__Error
        }
    }
}
