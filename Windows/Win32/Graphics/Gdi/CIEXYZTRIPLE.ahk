#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CIEXYZ.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class CIEXYZTRIPLE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {CIEXYZ}
     */
    ciexyzRed{
        get {
            if(!this.HasProp("__ciexyzRed"))
                this.__ciexyzRed := CIEXYZ(0, this)
            return this.__ciexyzRed
        }
    }

    /**
     * @type {CIEXYZ}
     */
    ciexyzGreen{
        get {
            if(!this.HasProp("__ciexyzGreen"))
                this.__ciexyzGreen := CIEXYZ(16, this)
            return this.__ciexyzGreen
        }
    }

    /**
     * @type {CIEXYZ}
     */
    ciexyzBlue{
        get {
            if(!this.HasProp("__ciexyzBlue"))
                this.__ciexyzBlue := CIEXYZ(32, this)
            return this.__ciexyzBlue
        }
    }
}
