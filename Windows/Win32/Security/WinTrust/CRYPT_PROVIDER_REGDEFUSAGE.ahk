#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Used by the WintrustAddDefaultForUsage function to register callback information about a provider's default usage.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-crypt_provider_regdefusage
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class CRYPT_PROVIDER_REGDEFUSAGE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * GUID that specifies the provider's default action.
     * @type {Pointer<Guid>}
     */
    pgActionID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the name of the provider DLL.
     * @type {PWSTR}
     */
    pwszDllName{
        get {
            if(!this.HasProp("__pwszDllName"))
                this.__pwszDllName := PWSTR(this.ptr + 16)
            return this.__pwszDllName
        }
    }

    /**
     * Pointer to the name of the function that loads the callback data to be returned when the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-wintrustgetdefaultforusage">WintrustGetDefaultForUsage</a> function is called with the <i>dwAction</i> parameter set to <b>DWACTION_ALLOCANDFILL</b>. This information also exists in the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-wintrust_data">WINTRUST_DATA</a> structure.
     * @type {PSTR}
     */
    pwszLoadCallbackDataFunctionName{
        get {
            if(!this.HasProp("__pwszLoadCallbackDataFunctionName"))
                this.__pwszLoadCallbackDataFunctionName := PSTR(this.ptr + 24)
            return this.__pwszLoadCallbackDataFunctionName
        }
    }

    /**
     * Pointer to the name of the function that frees allocated memory when the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-wintrustgetdefaultforusage">WintrustGetDefaultForUsage</a> function is called with the <i>dwAction</i> parameter set to <b>DWACTION_FREE</b>. This information also exists in the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-wintrust_data">WINTRUST_DATA</a> structure.
     * @type {PSTR}
     */
    pwszFreeCallbackDataFunctionName{
        get {
            if(!this.HasProp("__pwszFreeCallbackDataFunctionName"))
                this.__pwszFreeCallbackDataFunctionName := PSTR(this.ptr + 32)
            return this.__pwszFreeCallbackDataFunctionName
        }
    }
}
