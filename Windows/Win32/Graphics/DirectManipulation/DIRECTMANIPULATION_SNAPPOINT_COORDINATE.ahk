#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the coordinate system for a collection of snap points.
 * @remarks
 * 
 * If <b>DIRECTMANIPULATION_COORDINATE_ORIGIN</b> and <b>DIRECTMANIPULATION_COORDINATE_MIRRORED</b> are both specified, the snap points are interpreted as specified from the bottom and right boundaries of the content (the size of the content - the size of the viewport). This is intended for RTL reading scenarios where content is normally specified and rendered from right-to-left or bottom-to-top.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/ne-directmanipulation-directmanipulation_snappoint_coordinate
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class DIRECTMANIPULATION_SNAPPOINT_COORDINATE{

    /**
     * Default. 
     * 
     * Snap points are specified relative to the top and left boundaries of the content unless <b>DIRECTMANIPULATION_COORDINATE_MIRRORED</b> is also specified, in which case they are relative to the bottom and right boundaries of the content. For zoom, the boundary is 1.0f.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_COORDINATE_BOUNDARY => 0

    /**
     * Snap points are specified relative to the origin of the viewport.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_COORDINATE_ORIGIN => 1

    /**
     * Snap points are interpreted as specified in the negative direction of the origin. The origin is shifted to the bottom and right of the viewport or content. Cannot be set for zoom.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_COORDINATE_MIRRORED => 16
}
