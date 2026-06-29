#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RPCOLEMESSAGE (objidlbase.h) structure contains marshaling invocation arguments and return values between COM components.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/ns-objidlbase-rpcolemessage
 * @namespace Windows.Win32.System.Com
 */
export default struct RPCOLEMESSAGE {
    #StructPack 8

    /**
     * This member is reserved.
     */
    reserved1 : IntPtr

    /**
     * The data representation with which the data was marshaled.
     */
    dataRepresentation : UInt32

    /**
     * A buffer for marshaled data.
     */
    Buffer : IntPtr

    /**
     * The size of the buffer, in bytes.
     */
    cbBuffer : UInt32

    /**
     * The number of the method to be invoked.
     */
    iMethod : UInt32

    /**
     * This member is reserved.
     */
    reserved2 : IntPtr[5]

    /**
     * Status flags for the RPC connection.
     */
    rpcFlags : UInt32

}
