#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\LUID.ahk" { LUID }
#Import "..\Foundation\CHAR.ahk" { CHAR }

/**
 * Identifies the source of an access token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_source
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_SOURCE {
    #StructPack 4

    /**
     * Specifies an 8-byte character string used to identify the source of an access token. This is used to distinguish between such sources as Session Manager, LAN Manager, and RPC Server. A string, rather than a constant, is used to identify the source so users and developers can make extensions to the system, such as by adding other networks, that act as the source of access tokens.
     */
    SourceName : CHAR[8]

    /**
     * Specifies a locally unique identifier (<a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">LUID</a>) provided by the source component named by the <b>SourceName</b> member. This value aids the source component in relating context blocks, such as session-control structures, to the token. This value is typically, but not necessarily, an LUID.
     */
    SourceIdentifier : LUID

}
