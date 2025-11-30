#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The BCRYPT_MULTI_OPERATION_TYPE enumeration specifies type of multi-operation that is passed to the BCryptProcessMultiOperations function.
 * @see https://docs.microsoft.com/windows/win32/api//bcrypt/ne-bcrypt-bcrypt_multi_operation_type
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_MULTI_OPERATION_TYPE extends Win32Enum{

    /**
     * A hash operation.
     * @type {Integer (Int32)}
     */
    static BCRYPT_OPERATION_TYPE_HASH => 1
}
