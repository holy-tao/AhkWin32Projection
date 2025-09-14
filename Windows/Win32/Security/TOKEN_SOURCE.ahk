#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\Foundation\LUID.ahk

/**
 * Identifies the source of an access token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_source
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_SOURCE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies an 8-byte character string used to identify the source of an access token. This is used to distinguish between such sources as Session Manager, LAN Manager, and RPC Server. A string, rather than a constant, is used to identify the source so users and developers can make extensions to the system, such as by adding other networks, that act as the source of access tokens.
     * @type {Array<SByte>}
     */
    SourceName{
        get {
            if(!this.HasProp("__SourceNameProxyArray"))
                this.__SourceNameProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
            return this.__SourceNameProxyArray
        }
    }

    /**
     * Specifies a locally unique identifier (<a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">LUID</a>) provided by the source component named by the <b>SourceName</b> member. This value aids the source component in relating context blocks, such as session-control structures, to the token. This value is typically, but not necessarily, an LUID.
     * @type {LUID}
     */
    SourceIdentifier{
        get {
            if(!this.HasProp("__SourceIdentifier"))
                this.__SourceIdentifier := LUID(this.ptr + 8)
            return this.__SourceIdentifier
        }
    }
}
