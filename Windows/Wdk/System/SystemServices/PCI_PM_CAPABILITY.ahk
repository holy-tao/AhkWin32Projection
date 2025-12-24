#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_PM_CAPABILITY extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    class _PMC_e__Union extends Win32Struct {
        static sizeof => 14
        static packingSize => 8

        /**
         * @type {Pointer<PCI_PMC>}
         */
        Capabilities {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        AsUSHORT {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
    }

    class _PMCSR_e__Union extends Win32Struct {
        static sizeof => 14
        static packingSize => 8

        /**
         * @type {Pointer<PCI_PMCSR>}
         */
        ControlStatus {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        AsUSHORT {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
    }

    class _PMCSR_BSE_e__Union extends Win32Struct {
        static sizeof => 15
        static packingSize => 8

        /**
         * @type {Pointer<PCI_PMCSR_BSE>}
         */
        BridgeSupport {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        AsUCHAR {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
    }

    /**
     * @type {Pointer<PCI_CAPABILITIES_HEADER>}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {_PMC_e__Union}
     */
    PMC{
        get {
            if(!this.HasProp("__PMC"))
                this.__PMC := %this.__Class%._PMC_e__Union(8, this)
            return this.__PMC
        }
    }

    /**
     * @type {_PMCSR_e__Union}
     */
    PMCSR{
        get {
            if(!this.HasProp("__PMCSR"))
                this.__PMCSR := %this.__Class%._PMCSR_e__Union(24, this)
            return this.__PMCSR
        }
    }

    /**
     * @type {_PMCSR_BSE_e__Union}
     */
    PMCSR_BSE{
        get {
            if(!this.HasProp("__PMCSR_BSE"))
                this.__PMCSR_BSE := %this.__Class%._PMCSR_BSE_e__Union(40, this)
            return this.__PMCSR_BSE
        }
    }

    /**
     * @type {Integer}
     */
    Data {
        get => NumGet(this, 55, "char")
        set => NumPut("char", value, this, 55)
    }
}
