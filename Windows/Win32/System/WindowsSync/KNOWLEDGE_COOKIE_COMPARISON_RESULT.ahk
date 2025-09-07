#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the possible results when a knowledge cookie is compared with a knowledge object by using ISyncKnowledge2::CompareToKnowledgeCookie.
 * @remarks
 * A knowledge cookie is a lightweight, read-only representation of knowledge that can be used for fast comparisons when performance is especially important.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/ne-winsync-knowledge_cookie_comparison_result
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class KNOWLEDGE_COOKIE_COMPARISON_RESULT{

    /**
     * The knowledge cookie is equal to the specified knowledge.
     * @type {Integer (Int32)}
     */
    static KCCR_COOKIE_KNOWLEDGE_EQUAL => 0

    /**
     * The knowledge cookie is contained by the specified knowledge.
     * @type {Integer (Int32)}
     */
    static KCCR_COOKIE_KNOWLEDGE_CONTAINED => 1

    /**
     * The knowledge cookie contains the specified knowledge.
     * @type {Integer (Int32)}
     */
    static KCCR_COOKIE_KNOWLEDGE_CONTAINS => 2

    /**
     * The knowledge cookie cannot be compared to the specified knowledge.
     * @type {Integer (Int32)}
     */
    static KCCR_COOKIE_KNOWLEDGE_NOT_COMPARABLE => 3
}
