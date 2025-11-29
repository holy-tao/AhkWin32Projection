#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_DEVICE_SELF_TEST_RESULT_DATA.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_device_self_test_log
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DEVICE_SELF_TEST_LOG extends Win32Struct
{
    static sizeof => 168

    static packingSize => 8

    class _CurrentOperation extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - Status
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Status {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }
    
    }

    class _CurrentCompletion extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - CompletePercent
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        CompletePercent {
            get => (this._bitfield >> 0) & 0x7F
            set => this._bitfield := ((value & 0x7F) << 0) | (this._bitfield & ~(0x7F << 0))
        }
    
    }

    /**
     * @type {_CurrentOperation}
     */
    CurrentOperation{
        get {
            if(!this.HasProp("__CurrentOperation"))
                this.__CurrentOperation := %this.__Class%._CurrentOperation(0, this)
            return this.__CurrentOperation
        }
    }

    /**
     * @type {_CurrentCompletion}
     */
    CurrentCompletion{
        get {
            if(!this.HasProp("__CurrentCompletion"))
                this.__CurrentCompletion := %this.__Class%._CurrentCompletion(1, this)
            return this.__CurrentCompletion
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 2, 2, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<NVME_DEVICE_SELF_TEST_RESULT_DATA>}
     */
    ResultData{
        get {
            if(!this.HasProp("__ResultDataProxyArray"))
                this.__ResultDataProxyArray := Win32FixedArray(this.ptr + 8, 20, NVME_DEVICE_SELF_TEST_RESULT_DATA, "")
            return this.__ResultDataProxyArray
        }
    }
}
