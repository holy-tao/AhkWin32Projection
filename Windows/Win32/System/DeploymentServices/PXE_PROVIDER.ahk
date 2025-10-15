#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Describes a provider.
 * @see https://docs.microsoft.com/windows/win32/api//wdspxe/ns-wdspxe-pxe_provider
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class PXE_PROVIDER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Size of the <b>PXE_PROVIDER</b> structure.
     * @type {Integer}
     */
    uSizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Address of a null-terminated string that specifies the display name of the provider. This name is displayed 
     *       to the user and must be unique among registered providers.
     * @type {PWSTR}
     */
    pwszName{
        get {
            if(!this.HasProp("__pwszName"))
                this.__pwszName := PWSTR(this.ptr + 8)
            return this.__pwszName
        }
    }

    /**
     * Address of a null-terminated string that specifies the full path to the provider DLL.
     * @type {PWSTR}
     */
    pwszFilePath{
        get {
            if(!this.HasProp("__pwszFilePath"))
                this.__pwszFilePath := PWSTR(this.ptr + 16)
            return this.__pwszFilePath
        }
    }

    /**
     * Indicates whether the provider is critical. If a critical provider fails, the WDS server will also 
     *       fail.
     * @type {BOOL}
     */
    bIsCritical{
        get {
            if(!this.HasProp("__bIsCritical"))
                this.__bIsCritical := BOOL(this.ptr + 24)
            return this.__bIsCritical
        }
    }

    /**
     * Index of a provider in the list of registered providers.
     * @type {Integer}
     */
    uIndex {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
