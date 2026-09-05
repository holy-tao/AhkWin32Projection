#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the type of remote configuration possible for a component.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ne-naptypes-remoteconfigurationtype
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
class RemoteConfigurationType extends Win32Enum {

    /**
     * The component allows  remote configuration directly on the machine.
     * Native name: remoteConfigTypeMachine
     * @type {Integer (Int32)}
     */
    static ConfigTypeMachine => 1

    /**
     * The component allows remote configuration via a binary large object (BLOB) loaded in memory.
     * Native name: remoteConfigTypeConfigBlob
     * @type {Integer (Int32)}
     */
    static ConfigTypeConfigBlob => 2
}
