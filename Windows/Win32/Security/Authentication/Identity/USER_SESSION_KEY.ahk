#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\System\PasswordManagement\CYPHER_BLOCK.ahk" { CYPHER_BLOCK }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct USER_SESSION_KEY {
    #StructPack 2

    data : CYPHER_BLOCK[2]

}
