#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Values that indicate if a Windows feature is enabled or disabled.
 * @remarks
 * This attribute is used for Microsoft internal prerelease build tracking and is only included here for completeness.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.featurestage
 * @namespace Windows.Foundation.Metadata
 * @version WindowsRuntime 1.4
 */
class FeatureStage extends Win32Enum{

    /**
     * The feature is always disabled.
     * @type {Integer (Int32)}
     */
    static AlwaysDisabled => 0

    /**
     * The feature is diabled by default.
     * @type {Integer (Int32)}
     */
    static DisabledByDefault => 1

    /**
     * The feature is enabled by default.
     * @type {Integer (Int32)}
     */
    static EnabledByDefault => 2

    /**
     * The feature is always enabled.
     * @type {Integer (Int32)}
     */
    static AlwaysEnabled => 3
}
