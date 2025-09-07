#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MFINPUTTRUSTAUTHORITY_ACCESS_ACTION.ahk

/**
 * Contains parameters for the IMFInputTrustAuthority::BindAccess or IMFInputTrustAuthority::UpdateAccess method.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mfinputtrustauthority_access_params
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Size of the structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Version number. This value must be zero.
     * @type {Integer}
     */
    dwVer {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Offset of the signature from the start of the structure, in bytes.
     * @type {Integer}
     */
    cbSignatureOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Size of the signature, in bytes.
     * @type {Integer}
     */
    cbSignatureSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Offset of the extension blob from the start of the structure, in bytes.
     * @type {Integer}
     */
    cbExtensionOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Size of the extension blob, in bytes.
     * @type {Integer}
     */
    cbExtensionSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Number of elements in the <b>rgOutputActions</b> array.
     * @type {Integer}
     */
    cActions {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Array of <a href="https://docs.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mfinputtrustauthority_access_action">MFINPUTTRUSTAUTHORITY_ACCESS_ACTION</a> structures. The number of elements in the array is specified in the <b>cActions</b> member.
     * @type {Array<MFINPUTTRUSTAUTHORITY_ACCESS_ACTION>}
     */
    rgOutputActions{
        get {
            if(!this.HasProp("__rgOutputActionsProxyArray"))
                this.__rgOutputActionsProxyArray := Win32FixedArray(this.ptr + 32, 8, MFINPUTTRUSTAUTHORITY_ACCESS_ACTION, "")
            return this.__rgOutputActionsProxyArray
        }
    }
}
