#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The token used to represent a portion of a file used in by offload read and write operations.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_offload_token
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_OFFLOAD_TOKEN {
    #StructPack 1


    struct _StorageOffloadZeroDataToken {
        Reserved2 : Int8[504]

    }

    /**
     * A 32-bit unsigned integer which defines the type of <b>Token</b>.
     */
    TokenType : Int8[4]

    /**
     * Reserved.
     */
    Reserved : Int8[2]

    /**
     * The length of the token data in <b>Token</b>.
     */
    TokenIdLength : Int8[2]

    StorageOffloadZeroDataToken : STORAGE_OFFLOAD_TOKEN._StorageOffloadZeroDataToken

    static __New() {
        DefineProp(this.Prototype, 'Token', { type: Int8[504], offset: 8 })
        this.DeleteProp("__New")
    }
}
