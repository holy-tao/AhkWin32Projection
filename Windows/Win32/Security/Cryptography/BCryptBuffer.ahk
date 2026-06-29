#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes how the BCryptBuffer structure represents a generic Cryptography API: Next Generation (CNG) buffer.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcryptbuffer
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptBuffer {
    #StructPack 8

    /**
     * The size, in bytes, of the buffer.
     */
    cbBuffer : UInt32

    BufferType : UInt32

    /**
     * A 32-bit value defined by the *BufferType* member.
     */
    pvBuffer : IntPtr

}
