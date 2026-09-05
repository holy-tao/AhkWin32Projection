#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_SCRIPT_TOPOLOGY enumeration contains values that specify the topology of letterforms.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_script_topology
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_SCRIPT_TOPOLOGY extends Win32Enum {

    /**
     * Any script topology.
     * Native name: DWRITE_PANOSE_SCRIPT_TOPOLOGY_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit for script topology.
     * Native name: DWRITE_PANOSE_SCRIPT_TOPOLOGY_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * Script topology is roman disconnected.
     * Native name: DWRITE_PANOSE_SCRIPT_TOPOLOGY_ROMAN_DISCONNECTED
     * @type {Integer (Int32)}
     */
    static ROMAN_DISCONNECTED => 2

    /**
     * Script topology is roman trailing.
     * Native name: DWRITE_PANOSE_SCRIPT_TOPOLOGY_ROMAN_TRAILING
     * @type {Integer (Int32)}
     */
    static ROMAN_TRAILING => 3

    /**
     * Script topology is roman connected.
     * Native name: DWRITE_PANOSE_SCRIPT_TOPOLOGY_ROMAN_CONNECTED
     * @type {Integer (Int32)}
     */
    static ROMAN_CONNECTED => 4

    /**
     * Script topology is cursive disconnected.
     * Native name: DWRITE_PANOSE_SCRIPT_TOPOLOGY_CURSIVE_DISCONNECTED
     * @type {Integer (Int32)}
     */
    static CURSIVE_DISCONNECTED => 5

    /**
     * Script topology is cursive trailing.
     * Native name: DWRITE_PANOSE_SCRIPT_TOPOLOGY_CURSIVE_TRAILING
     * @type {Integer (Int32)}
     */
    static CURSIVE_TRAILING => 6

    /**
     * Script topology is cursive connected.
     * Native name: DWRITE_PANOSE_SCRIPT_TOPOLOGY_CURSIVE_CONNECTED
     * @type {Integer (Int32)}
     */
    static CURSIVE_CONNECTED => 7

    /**
     * Script topology is black-letter disconnected.
     * Native name: DWRITE_PANOSE_SCRIPT_TOPOLOGY_BLACKLETTER_DISCONNECTED
     * @type {Integer (Int32)}
     */
    static BLACKLETTER_DISCONNECTED => 8

    /**
     * Script topology is black-letter trailing.
     * Native name: DWRITE_PANOSE_SCRIPT_TOPOLOGY_BLACKLETTER_TRAILING
     * @type {Integer (Int32)}
     */
    static BLACKLETTER_TRAILING => 9

    /**
     * Script topology is black-letter connected.
     * Native name: DWRITE_PANOSE_SCRIPT_TOPOLOGY_BLACKLETTER_CONNECTED
     * @type {Integer (Int32)}
     */
    static BLACKLETTER_CONNECTED => 10
}
