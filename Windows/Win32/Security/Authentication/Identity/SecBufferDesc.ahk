#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecBuffer.ahk" { SecBuffer }

/**
 * The SecBufferDesc structure describes an array of SecBuffer structures to pass from a transport application to a security package.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secbufferdesc
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecBufferDesc {
    #StructPack 8

    /**
     * Specifies the version number of this structure. This member must be SECBUFFER_VERSION.
     */
    ulVersion : UInt32

    /**
     * Indicates the number of <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structures in the <b>pBuffers</b> array.
     */
    cBuffers : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structures.
     */
    pBuffers : SecBuffer.Ptr

}
