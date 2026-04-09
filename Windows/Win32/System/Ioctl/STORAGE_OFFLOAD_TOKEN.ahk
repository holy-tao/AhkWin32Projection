#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The token used to represent a portion of a file used in by offload read and write operations.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_offload_token
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_OFFLOAD_TOKEN extends Win32Struct {
    static sizeof => 512

    static packingSize => 1

    /**
     * A 32-bit unsigned integer which defines the type of <b>Token</b>.
     * @type {Array<Integer>}
     */
    TokenType {
        get {
            if(!this.HasProp("__TokenTypeProxyArray"))
                this.__TokenTypeProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__TokenTypeProxyArray
        }
    }

    /**
     * Reserved.
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 4, 2, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * The length of the token data in <b>Token</b>.
     * @type {Array<Integer>}
     */
    TokenIdLength {
        get {
            if(!this.HasProp("__TokenIdLengthProxyArray"))
                this.__TokenIdLengthProxyArray := Win32FixedArray(this.ptr + 6, 2, Primitive, "char")
            return this.__TokenIdLengthProxyArray
        }
    }

    class _StorageOffloadZeroDataToken extends Win32Struct {
        static sizeof => 504
        static packingSize => 1

        /**
         * @type {Array<Integer>}
         */
        Reserved2 {
            get {
                if(!this.HasProp("__Reserved2ProxyArray"))
                    this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 0, 504, Primitive, "char")
                return this.__Reserved2ProxyArray
            }
        }
    }

    /**
     * @type {_StorageOffloadZeroDataToken}
     */
    StorageOffloadZeroDataToken {
        get {
            if(!this.HasProp("__StorageOffloadZeroDataToken"))
                this.__StorageOffloadZeroDataToken := STORAGE_OFFLOAD_TOKEN._StorageOffloadZeroDataToken(8, this)
            return this.__StorageOffloadZeroDataToken
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Token {
        get {
            if(!this.HasProp("__TokenProxyArray"))
                this.__TokenProxyArray := Win32FixedArray(this.ptr + 8, 504, Primitive, "char")
            return this.__TokenProxyArray
        }
    }
}
