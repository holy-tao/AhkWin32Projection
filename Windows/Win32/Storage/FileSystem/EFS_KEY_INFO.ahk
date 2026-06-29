#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\Cryptography\ALG_ID.ahk" { ALG_ID }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct EFS_KEY_INFO {
    #StructPack 4

    dwVersion : UInt32

    Entropy : UInt32

    Algorithm : ALG_ID

    KeyLength : UInt32

}
