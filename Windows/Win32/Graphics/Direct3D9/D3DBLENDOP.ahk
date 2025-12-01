#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the supported blend operations. See Remarks for definitions of terms.
 * @remarks
 * Source, Destination, and Result are defined as:
 * 
 * 
 * 
 * | Term        | Type   | Description                                                            |
 * |-------------|--------|------------------------------------------------------------------------|
 * | Source      | Input  | Color of the source pixel before the operation.                        |
 * | Destination | Input  | Color of the pixel in the destination buffer before the operation.     |
 * | Result      | Output | Returned value that is the blended color resulting from the operation. |
 * 
 * 
 * 
 *  
 * 
 * This enumerated type defines values used by the following render states:
 * 
 * -   D3DRS\_BLENDOP
 * -   D3DRS\_BLENDOPALPHA
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dblendop
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DBLENDOP extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLENDOP_ADD => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLENDOP_SUBTRACT => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLENDOP_REVSUBTRACT => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLENDOP_MIN => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLENDOP_MAX => 5
}
