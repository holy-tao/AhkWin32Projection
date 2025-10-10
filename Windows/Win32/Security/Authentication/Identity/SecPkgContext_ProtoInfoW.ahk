#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SecPkgContext_ProtoInfo structure holds information about the protocol in use.
 * @remarks
 * 
  * > [!NOTE]
  * > The sspi.h header defines SecPkgContext_ProtoInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ns-sspi-secpkgcontext_protoinfow
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 * @charset Unicode
 */
class SecPkgContext_ProtoInfoW extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to a string containing the name of the protocol.
     * @type {Pointer<UInt16>}
     */
    sProtocolName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Major version number.
     * @type {Integer}
     */
    majorVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Minor version number.
     * @type {Integer}
     */
    minorVersion {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
