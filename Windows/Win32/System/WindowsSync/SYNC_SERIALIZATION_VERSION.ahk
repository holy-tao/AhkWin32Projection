#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the version of Microsoft Sync Framework that a particular component is compatible with.
 * @remarks
 * 
 * A component that is designed to work with a particular version of Sync Framework can indicate the version for which it is designed. This way, when Sync Framework changes in later versions, a component designed for an earlier version will continue to function as expected.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/ne-winsync-sync_serialization_version
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class SYNC_SERIALIZATION_VERSION extends Win32Enum{

    /**
     * Indicates a component is compatible with Sync Framework 1.0.
     * @type {Integer (Int32)}
     */
    static SYNC_SERIALIZATION_VERSION_V1 => 1

    /**
     * Indicates a component is compatible with Sync Framework 2.0.
     * @type {Integer (Int32)}
     */
    static SYNC_SERIALIZATION_VERSION_V2 => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SYNC_SERIALIZATION_VERSION_V3 => 5
}
