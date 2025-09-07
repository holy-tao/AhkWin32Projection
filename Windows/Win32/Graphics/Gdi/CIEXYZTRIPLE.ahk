#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CIEXYZ.ahk

/**
 * The CIEXYZTRIPLE structure contains the x,y, and z coordinates of the three colors that correspond to the red, green, and blue endpoints for a specified logical color space.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-ciexyztriple
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class CIEXYZTRIPLE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The xyz coordinates of red endpoint.
     * @type {CIEXYZ}
     */
    ciexyzRed{
        get {
            if(!this.HasProp("__ciexyzRed"))
                this.__ciexyzRed := CIEXYZ(this.ptr + 0)
            return this.__ciexyzRed
        }
    }

    /**
     * The xyz coordinates of green endpoint.
     * @type {CIEXYZ}
     */
    ciexyzGreen{
        get {
            if(!this.HasProp("__ciexyzGreen"))
                this.__ciexyzGreen := CIEXYZ(this.ptr + 16)
            return this.__ciexyzGreen
        }
    }

    /**
     * The xyz coordinates of blue endpoint.
     * @type {CIEXYZ}
     */
    ciexyzBlue{
        get {
            if(!this.HasProp("__ciexyzBlue"))
                this.__ciexyzBlue := CIEXYZ(this.ptr + 32)
            return this.__ciexyzBlue
        }
    }
}
