#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DWRITE_PANOSE_TOOL_KIND enumeration contains values that specify the kind of tool that is used to create character forms.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_panose_tool_kind
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_TOOL_KIND{

    /**
     * Any kind of tool.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_TOOL_KIND_ANY => 0

    /**
     * No fit for the kind of tool.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_TOOL_KIND_NO_FIT => 1

    /**
     * Flat NIB tool.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_TOOL_KIND_FLAT_NIB => 2

    /**
     * Pressure point tool.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_TOOL_KIND_PRESSURE_POINT => 3

    /**
     * Engraved tool.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_TOOL_KIND_ENGRAVED => 4

    /**
     * Ball tool.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_TOOL_KIND_BALL => 5

    /**
     * Brush tool.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_TOOL_KIND_BRUSH => 6

    /**
     * Rough tool.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_TOOL_KIND_ROUGH => 7

    /**
     * Felt-pen-brush-tip tool.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_TOOL_KIND_FELT_PEN_BRUSH_TIP => 8

    /**
     * Wild-brush tool.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_TOOL_KIND_WILD_BRUSH => 9
}
