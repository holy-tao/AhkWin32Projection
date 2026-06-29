#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The BCRYPT_MULTI_OPERATION_TYPE enumeration specifies type of multi-operation that is passed to the BCryptProcessMultiOperations function.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ne-bcrypt-bcrypt_multi_operation_type
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_MULTI_OPERATION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A hash operation.
     * @type {Integer (Int32)}
     */
    static BCRYPT_OPERATION_TYPE_HASH => 1
}
