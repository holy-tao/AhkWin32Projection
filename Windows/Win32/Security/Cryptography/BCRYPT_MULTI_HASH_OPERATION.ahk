#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A BCRYPT_MULTI_HASH_OPERATION structure defines a single operation in a multi-hash operation.
 * @see https://docs.microsoft.com/windows/win32/api//bcrypt/ns-bcrypt-bcrypt_multi_hash_operation
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_MULTI_HASH_OPERATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * An index into the multi-object state array of the hash state on which this computation operates. The first element of the array corresponds to an <i>iHash</i> value of zero (0). Valid values are less than the value of the <i>nHashes</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptcreatemultihash">BCryptCreateMultiHash</a> function.
     * @type {Integer}
     */
    iHash {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A hash operation type, either <b>BCRYPT_HASH_OPERATION_HASH_DATA</b> or <b>BCRYPT_HASH_OPERATION_FINISH_HASH</b>.
     * 
     * If the value is <b>BCRYPT_HASH_OPERATION_HASH_DATA</b>, the operation performed is  equivalent to calling the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcrypthashdata">BCryptHashData</a> function on the hash object array element with <i>pbBuffer</i>/<i>cbBuffer</i> pointing to the buffer to be hashed.
     * 
     * If the value is <b>BCRYPT_HASH_OPERATION_FINISH_HASH</b>, the operation performed is  equivalent to calling the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptfinishhash">BCryptFinishHash</a> function on the hash object array element with <i>pbBuffer</i>/<i>cbBuffer</i> pointing to the output buffer that receives the result.
     * @type {Integer}
     */
    hashOperation {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The buffer on which the operation works.
     * @type {Pointer<Byte>}
     */
    pbBuffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The buffer on which the operation works.
     * @type {Integer}
     */
    cbBuffer {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
