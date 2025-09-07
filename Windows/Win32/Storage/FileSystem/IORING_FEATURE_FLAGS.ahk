#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents feature support for the an I/O ring API version.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ntioring_x/ne-ntioring_x-ioring_feature_flags
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_FEATURE_FLAGS{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static IORING_FEATURE_FLAGS_NONE => 0

    /**
     * I/O ring support is emulated in User Mode. When this flag is set there is no underlying kernel support for I/O ring. However, a user mode emulation layer is available to provide application compatibility, without the benefit of kernel support.  This provides application compatibility at the expense of performance, allowing apps to make a choice at run-time. As of the current release, Microsoft does not provide an emulated I/O ring implementation. This value is provided to support potential emulated future emulated implementations.
     * @type {Integer (Int32)}
     */
    static IORING_FEATURE_UM_EMULATION => 1

    /**
     * Registration of a completion queue event is supported. For more information, see [SetIoRingCompletionEvent](../ioringapi/nf-ioringapi-setioringcompletionevent.md).
     * @type {Integer (Int32)}
     */
    static IORING_FEATURE_SET_COMPLETION_EVENT => 2
}
