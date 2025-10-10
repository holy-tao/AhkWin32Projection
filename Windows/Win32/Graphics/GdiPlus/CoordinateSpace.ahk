#Requires AutoHotkey v2.0.0 64-bit

/**
 * The CoordinateSpace enumeration specifies coordinate spaces.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-coordinatespace
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class CoordinateSpace{

    /**
     * Specifies the world coordinate space.
     * @type {Integer (Int32)}
     */
    static CoordinateSpaceWorld => 0

    /**
     * Specifies the page coordinate space.
     * @type {Integer (Int32)}
     */
    static CoordinateSpacePage => 1

    /**
     * Specifies the device coordinate space.
     * @type {Integer (Int32)}
     */
    static CoordinateSpaceDevice => 2
}
