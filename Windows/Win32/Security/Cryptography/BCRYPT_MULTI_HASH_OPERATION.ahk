#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_HASH_OPERATION_TYPE.ahk" { BCRYPT_HASH_OPERATION_TYPE }

/**
 * A BCRYPT_MULTI_HASH_OPERATION structure defines a single operation in a multi-hash operation.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_multi_hash_operation
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_MULTI_HASH_OPERATION {
    #StructPack 8

    /**
     * An index into the multi-object state array of the hash state on which this computation operates. The first element of the array corresponds to an <i>iHash</i> value of zero (0). Valid values are less than the value of the <i>nHashes</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptcreatemultihash">BCryptCreateMultiHash</a> function.
     */
    iHash : UInt32

    /**
     * A hash operation type, either <b>BCRYPT_HASH_OPERATION_HASH_DATA</b> or <b>BCRYPT_HASH_OPERATION_FINISH_HASH</b>.
     * 
     * If the value is <b>BCRYPT_HASH_OPERATION_HASH_DATA</b>, the operation performed is  equivalent to calling the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcrypthashdata">BCryptHashData</a> function on the hash object array element with <i>pbBuffer</i>/<i>cbBuffer</i> pointing to the buffer to be hashed.
     * 
     * If the value is <b>BCRYPT_HASH_OPERATION_FINISH_HASH</b>, the operation performed is  equivalent to calling the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptfinishhash">BCryptFinishHash</a> function on the hash object array element with <i>pbBuffer</i>/<i>cbBuffer</i> pointing to the output buffer that receives the result.
     */
    hashOperation : BCRYPT_HASH_OPERATION_TYPE

    /**
     * The buffer on which the operation works.
     */
    pbBuffer : IntPtr

    /**
     * The buffer on which the operation works.
     */
    cbBuffer : UInt32

}
