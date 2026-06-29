#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_PM_CAPABILITY extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    class _PMC extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer}
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

    class _PMCSR extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer}
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

    class _PMCSR_BSE extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer}
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
     * @type {Pointer}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {_PMC}
     */
    PMC {
        get {
            if(!this.HasProp("__PMC"))
                this.__PMC := PCI_PM_CAPABILITY._PMC(8, this)
            return this.__PMC
        }
    }

    /**
     * @type {_PMCSR}
     */
    PMCSR {
        get {
            if(!this.HasProp("__PMCSR"))
                this.__PMCSR := PCI_PM_CAPABILITY._PMCSR(16, this)
            return this.__PMCSR
        }
    }

    /**
     * @type {_PMCSR_BSE}
     */
    PMCSR_BSE {
        get {
            if(!this.HasProp("__PMCSR_BSE"))
                this.__PMCSR_BSE := PCI_PM_CAPABILITY._PMCSR_BSE(24, this)
            return this.__PMCSR_BSE
        }
    }

    /**
     * @type {Integer}
     */
    Data {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }
}
