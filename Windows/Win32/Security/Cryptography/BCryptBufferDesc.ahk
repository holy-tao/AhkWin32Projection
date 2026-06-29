#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCryptBuffer.ahk" { BCryptBuffer }

/**
 * Describes how the BCryptBufferDesc structure contains a set of generic Cryptography API: Next Generation (CNG) buffers.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcryptbufferdesc
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptBufferDesc {
    #StructPack 8

    /**
     * The version of the structure. This must be the following value.
     * 
     * | Value | Meaning |
     * | ----- | ------- |
     * | BCRYPTBUFFER_VERSION | The default version number. |
     */
    ulVersion : UInt32

    /**
     * The number of elements in the *pBuffers* array.
     */
    cBuffers : UInt32

    /**
     * The address of an array of **BCryptBuffer** structures that contain the buffers. *cBuffers* contains the number of elements in this array.
     */
    pBuffers : BCryptBuffer.Ptr

}
