#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IORING_FEATURE_FLAGS.ahk" { IORING_FEATURE_FLAGS }
#Import ".\IORING_VERSION.ahk" { IORING_VERSION }

/**
 * Represents the IORING API capabilities.
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_capabilities
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct IORING_CAPABILITIES {
    #StructPack 4

    /**
     * A value from the [IORING_VERSION](../ntioring_x/ne-ntioring_x-ioring_version.md) enumeration specifying the maximum supported IORING API version.
     */
    MaxVersion : IORING_VERSION

    /**
     * The maximum submission queue size.
     */
    MaxSubmissionQueueSize : UInt32

    /**
     * The maximum completion queue size.
     */
    MaxCompletionQueueSize : UInt32

    /**
     * A value from the [IORING_FEATURE_FLAGS](../ntioring_x/) enumeration specifying feature flags for the IORING API implementation.
     */
    FeatureFlags : IORING_FEATURE_FLAGS

}
