#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSM_BDA_SCAN_FILTER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Method{
        get {
            if(!this.HasProp("__Method"))
                this.__Method := KSIDENTIFIER(this.ptr + 0)
            return this.__Method
        }
    }

    /**
     * @type {Integer}
     */
    ulScanModulationTypeSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    AnalogVideoStandards {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    argbScanModulationTypes{
        get {
            if(!this.HasProp("__argbScanModulationTypesProxyArray"))
                this.__argbScanModulationTypesProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__argbScanModulationTypesProxyArray
        }
    }
}
