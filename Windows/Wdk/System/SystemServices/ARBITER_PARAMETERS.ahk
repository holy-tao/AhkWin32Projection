#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class ARBITER_PARAMETERS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    class _Parameters_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<ARBITER_TEST_ALLOCATION_PARAMETERS>}
         */
        TestAllocation {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<ARBITER_RETEST_ALLOCATION_PARAMETERS>}
         */
        RetestAllocation {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<ARBITER_BOOT_ALLOCATION_PARAMETERS>}
         */
        BootAllocation {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<ARBITER_QUERY_ALLOCATED_RESOURCES_PARAMETERS>}
         */
        QueryAllocatedResources {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<ARBITER_QUERY_CONFLICT_PARAMETERS>}
         */
        QueryConflict {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<ARBITER_QUERY_ARBITRATE_PARAMETERS>}
         */
        QueryArbitrate {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<ARBITER_ADD_RESERVED_PARAMETERS>}
         */
        AddReserved {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    /**
     * @type {_Parameters_e__Union}
     */
    Parameters{
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := %this.__Class%._Parameters_e__Union(0, this)
            return this.__Parameters
        }
    }
}
