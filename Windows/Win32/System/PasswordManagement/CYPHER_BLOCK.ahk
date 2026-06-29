#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The CYPHER_BLOCK is the basic unit of storage for the one-way function (OWF) password hashes.
 * @see https://learn.microsoft.com/windows/win32/api/mschapp/ns-mschapp-cypher_block
 * @namespace Windows.Win32.System.PasswordManagement
 */
export default struct CYPHER_BLOCK {
    #StructPack 2

    /**
     * An array of CHAR used to store the password hashes and cipher text passed by the MS-CHAP password management API.
     */
    data : CHAR[8]

}
