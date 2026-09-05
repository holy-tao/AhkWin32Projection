#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the severity of an resource indexer message. For more info, and scenario-based walkthroughs of how to use these APIs, see Package resource indexing (PRI) APIs and custom build systems.
 * @see https://learn.microsoft.com/windows/win32/menurc/mrmresourceindexermessageseverity
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
class MrmResourceIndexerMessageSeverity extends Win32Enum {

    /**
     * Native name: MrmResourceIndexerMessageSeverityVerbose
     * @type {Integer (Int32)}
     */
    static Verbose => 0

    /**
     * Native name: MrmResourceIndexerMessageSeverityInfo
     * @type {Integer (Int32)}
     */
    static Info => 1

    /**
     * Native name: MrmResourceIndexerMessageSeverityWarning
     * @type {Integer (Int32)}
     */
    static Warning => 2

    /**
     * Native name: MrmResourceIndexerMessageSeverityError
     * @type {Integer (Int32)}
     */
    static Error => 3
}
