#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.EventNotificationService
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global NETWORK_ALIVE_LAN := 1

/**
 * @type {Integer (UInt32)}
 */
export global NETWORK_ALIVE_WAN := 2

/**
 * @type {Integer (UInt32)}
 */
export global NETWORK_ALIVE_AOL := 4

/**
 * @type {Integer (UInt32)}
 */
export global NETWORK_ALIVE_INTERNET := 8

/**
 * @type {Integer (UInt32)}
 */
export global CONNECTION_AOL := 4

/**
 * @type {Guid}
 */
export global SENSGUID_PUBLISHER := Guid("{5fee1bd6-5b9b-11d1-8dd2-00aa004abd5e}")

/**
 * @type {Guid}
 */
export global SENSGUID_SUBSCRIBER_LCE := Guid("{d3938ab0-5b9d-11d1-8dd2-00aa004abd5e}")

/**
 * @type {Guid}
 */
export global SENSGUID_SUBSCRIBER_WININET := Guid("{d3938ab5-5b9d-11d1-8dd2-00aa004abd5e}")

/**
 * @type {Guid}
 */
export global SENSGUID_EVENTCLASS_NETWORK := Guid("{d5978620-5b9f-11d1-8dd2-00aa004abd5e}")

/**
 * @type {Guid}
 */
export global SENSGUID_EVENTCLASS_LOGON := Guid("{d5978630-5b9f-11d1-8dd2-00aa004abd5e}")

/**
 * @type {Guid}
 */
export global SENSGUID_EVENTCLASS_ONNOW := Guid("{d5978640-5b9f-11d1-8dd2-00aa004abd5e}")

/**
 * @type {Guid}
 */
export global SENSGUID_EVENTCLASS_LOGON2 := Guid("{d5978650-5b9f-11d1-8dd2-00aa004abd5e}")
;@endregion Constants
