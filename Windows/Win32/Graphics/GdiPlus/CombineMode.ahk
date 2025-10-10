#Requires AutoHotkey v2.0.0 64-bit

/**
 * The CombineMode enumeration specifies how a new region is combined with an existing region.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-combinemode
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class CombineMode{

    /**
     * Specifies that the existing region is replaced by the new region.
     * @type {Integer (Int32)}
     */
    static CombineModeReplace => 0

    /**
     * Specifies that the existing region is replaced by the intersection of itself and the new region.
     * @type {Integer (Int32)}
     */
    static CombineModeIntersect => 1

    /**
     * Specifies that the existing region is replaced by the union of itself and the new region.
     * @type {Integer (Int32)}
     */
    static CombineModeUnion => 2

    /**
     * Specifies that the existing region is replaced by the result of performing an 
 * 				<b>XOR</b> on the two regions. A point is in the 
 * 				<b>XOR</b> of two regions if it is in one region or the other but not in both regions.
     * @type {Integer (Int32)}
     */
    static CombineModeXor => 3

    /**
     * Specifies that the existing region is replaced by the portion of itself that is outside of the new region.
     * @type {Integer (Int32)}
     */
    static CombineModeExclude => 4

    /**
     * Specifies that the existing region is replaced by the portion of the new region that is outside of the existing region.
     * @type {Integer (Int32)}
     */
    static CombineModeComplement => 5
}
