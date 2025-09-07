#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MFSampleAllocatorUsage enumeration specifies the allocator usage of components that implement the IMFSampleAllocatorControl interface.
 * @remarks
 * Components should pass a value from the enumeration back from an implementation of [IMFSampleAllocatorControl::GetAllocatorUsage](nf-mfidl-imfsampleallocatorcontrol-getallocatorusage.md) to let the system know if they will use the system-provided allocator.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfsampleallocatorusage
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFSampleAllocatorUsage{

    /**
     * The output stream will use the camera pipeline's sample allocator to allocate new media samples. If the output stream is producing samples in CPU memory, it is recommended that it use this mode to ensure consistent performance when used in a cross-container scenario.
     * @type {Integer (Int32)}
     */
    static MFSampleAllocatorUsage_UsesProvidedAllocator => 0

    /**
     * The output stream will be use a custom allocator for its output samples.  It will not use the sample allocator provided by the camera pipeline.
     * @type {Integer (Int32)}
     */
    static MFSampleAllocatorUsage_UsesCustomAllocator => 1

    /**
     * The output stream will not allocate new samples for its output samples.  It will not be provided a sample allocator by the camera pipeline.
     * @type {Integer (Int32)}
     */
    static MFSampleAllocatorUsage_DoesNotAllocate => 2
}
