#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies the signature algorithms supported by an Schannel connection.
 * @see https://docs.microsoft.com/windows/win32/api//schannel/ns-schannel-secpkgcontext_supportedsignatures
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_SupportedSignatures extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of elements in the <i>pSignatureAndHashAlgorithms</i> array.
     * @type {Integer}
     */
    cSignatureAndHashAlgorithms {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * An array of values that specify supported algorithms. These values are in the following format.
     * @type {Pointer<UInt16>}
     */
    pSignatureAndHashAlgorithms {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
