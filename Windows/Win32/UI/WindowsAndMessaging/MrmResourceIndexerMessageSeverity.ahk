#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify the severity of an resource indexer message. For more info, and scenario-based walkthroughs of how to use these APIs, see Package resource indexing (PRI) APIs and custom build systems.
 * @see https://learn.microsoft.com/windows/win32/menurc/mrmresourceindexermessageseverity
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MrmResourceIndexerMessageSeverity{

    /**
     * @type {Integer (Int32)}
     */
    static MrmResourceIndexerMessageSeverityVerbose => 0

    /**
     * @type {Integer (Int32)}
     */
    static MrmResourceIndexerMessageSeverityInfo => 1

    /**
     * @type {Integer (Int32)}
     */
    static MrmResourceIndexerMessageSeverityWarning => 2

    /**
     * @type {Integer (Int32)}
     */
    static MrmResourceIndexerMessageSeverityError => 3
}
