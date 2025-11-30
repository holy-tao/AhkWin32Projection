#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_SCRIPT_TOPOLOGY enumeration contains values that specify the topology of letterforms.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_panose_script_topology
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_SCRIPT_TOPOLOGY extends Win32Enum{

    /**
     * Any script topology.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_TOPOLOGY_ANY => 0

    /**
     * No fit for script topology.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_TOPOLOGY_NO_FIT => 1

    /**
     * Script topology is roman disconnected.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_TOPOLOGY_ROMAN_DISCONNECTED => 2

    /**
     * Script topology is roman trailing.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_TOPOLOGY_ROMAN_TRAILING => 3

    /**
     * Script topology is roman connected.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_TOPOLOGY_ROMAN_CONNECTED => 4

    /**
     * Script topology is cursive disconnected.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_TOPOLOGY_CURSIVE_DISCONNECTED => 5

    /**
     * Script topology is cursive trailing.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_TOPOLOGY_CURSIVE_TRAILING => 6

    /**
     * Script topology is cursive connected.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_TOPOLOGY_CURSIVE_CONNECTED => 7

    /**
     * Script topology is black-letter disconnected.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_TOPOLOGY_BLACKLETTER_DISCONNECTED => 8

    /**
     * Script topology is black-letter trailing.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_TOPOLOGY_BLACKLETTER_TRAILING => 9

    /**
     * Script topology is black-letter connected.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SCRIPT_TOPOLOGY_BLACKLETTER_CONNECTED => 10
}
