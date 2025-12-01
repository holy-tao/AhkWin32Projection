#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the IORING API capabilities.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_capabilities
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_CAPABILITIES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * A value from the [IORING_VERSION](../ntioring_x/ne-ntioring_x-ioring_version.md) enumeration specifying the maximum supported IORING API version.
     * @type {Integer}
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
     * @type {Integer}
     */
    FeatureFlags {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
