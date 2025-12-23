#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\TRACE_PROVIDER_INFO.ahk

/**
 * Defines the array of providers that have registered a MOF or manifest on the computer.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-provider_enumeration_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class PROVIDER_ENUMERATION_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of elements in the <b>TraceProviderInfoArray</b> array.
     * @type {Integer}
     */
    NumberOfProviders {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-trace_provider_info">TRACE_PROVIDER_INFO</a> structures that contain information about each provider such as its name and unique identifier.
     * @type {Array<TRACE_PROVIDER_INFO>}
     */
    TraceProviderInfoArray{
        get {
            if(!this.HasProp("__TraceProviderInfoArrayProxyArray"))
                this.__TraceProviderInfoArrayProxyArray := Win32FixedArray(this.ptr + 8, 1, TRACE_PROVIDER_INFO, "")
            return this.__TraceProviderInfoArrayProxyArray
        }
    }
}
