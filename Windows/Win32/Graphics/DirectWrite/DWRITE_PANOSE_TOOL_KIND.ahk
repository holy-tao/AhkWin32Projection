#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_TOOL_KIND enumeration contains values that specify the kind of tool that is used to create character forms.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_tool_kind
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_TOOL_KIND extends Win32Enum {

    /**
     * Any kind of tool.
     * Native name: DWRITE_PANOSE_TOOL_KIND_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit for the kind of tool.
     * Native name: DWRITE_PANOSE_TOOL_KIND_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * Flat NIB tool.
     * Native name: DWRITE_PANOSE_TOOL_KIND_FLAT_NIB
     * @type {Integer (Int32)}
     */
    static FLAT_NIB => 2

    /**
     * Pressure point tool.
     * Native name: DWRITE_PANOSE_TOOL_KIND_PRESSURE_POINT
     * @type {Integer (Int32)}
     */
    static PRESSURE_POINT => 3

    /**
     * Engraved tool.
     * Native name: DWRITE_PANOSE_TOOL_KIND_ENGRAVED
     * @type {Integer (Int32)}
     */
    static ENGRAVED => 4

    /**
     * Ball tool.
     * Native name: DWRITE_PANOSE_TOOL_KIND_BALL
     * @type {Integer (Int32)}
     */
    static BALL => 5

    /**
     * Brush tool.
     * Native name: DWRITE_PANOSE_TOOL_KIND_BRUSH
     * @type {Integer (Int32)}
     */
    static BRUSH => 6

    /**
     * Rough tool.
     * Native name: DWRITE_PANOSE_TOOL_KIND_ROUGH
     * @type {Integer (Int32)}
     */
    static ROUGH => 7

    /**
     * Felt-pen-brush-tip tool.
     * Native name: DWRITE_PANOSE_TOOL_KIND_FELT_PEN_BRUSH_TIP
     * @type {Integer (Int32)}
     */
    static FELT_PEN_BRUSH_TIP => 8

    /**
     * Wild-brush tool.
     * Native name: DWRITE_PANOSE_TOOL_KIND_WILD_BRUSH
     * @type {Integer (Int32)}
     */
    static WILD_BRUSH => 9
}
