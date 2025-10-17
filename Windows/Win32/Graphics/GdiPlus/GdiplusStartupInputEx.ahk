#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GdiplusStartupInput.ahk

/**
 * The **GdiplusStartupInputEx** structure holds a block of arguments that are required by the [GdiplusStartup](../gdiplusinit/nf-gdiplusinit-gdiplusstartup.md) function.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusinit/ns-gdiplusinit-gdiplusstartupinputex
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class GdiplusStartupInputEx extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {GdiplusStartupInput}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := GdiplusStartupInput(0, this)
            return this.__Base
        }
    }

    /**
     * Type: **INT**
     * 
     * See [**GdiplusStartupParams**](./ne-gdiplusinit-gdiplusstartupparams.md). The default value is **GdiplusStartupDefault** (0).
     * @type {Integer}
     */
    StartupParameters {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
