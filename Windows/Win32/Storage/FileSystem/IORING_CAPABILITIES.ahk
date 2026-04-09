#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IORING_VERSION.ahk
#Include .\IORING_FEATURE_FLAGS.ahk

/**
 * Represents the IORING API capabilities.
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_capabilities
 * @namespace Windows.Win32.Storage.FileSystem
 */
class IORING_CAPABILITIES extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * A value from the [IORING_VERSION](../ntioring_x/ne-ntioring_x-ioring_version.md) enumeration specifying the maximum supported IORING API version.
     * @type {IORING_VERSION}
     */
    MaxVersion {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The maximum submission queue size.
     * @type {Integer}
     */
    MaxSubmissionQueueSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The maximum completion queue size.
     * @type {Integer}
     */
    MaxCompletionQueueSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A value from the [IORING_FEATURE_FLAGS](../ntioring_x/) enumeration specifying feature flags for the IORING API implementation.
     * @type {IORING_FEATURE_FLAGS}
     */
    FeatureFlags {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
