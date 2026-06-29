#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RPC_VERSION.ahk" { RPC_VERSION }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_SYNTAX_IDENTIFIER {
    #StructPack 4

    SyntaxGUID : Guid

    SyntaxVersion : RPC_VERSION

}
