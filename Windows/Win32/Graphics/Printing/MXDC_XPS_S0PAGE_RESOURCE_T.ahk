#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MXDC\_XPS\_S0PAGE\_RESOURCE\_T structure holds information about a resource, such as an image or font, that is associated with an XPS document page, and is to be passed to the Microsoft XPS Document Converter (MXDC) output file.
 * @remarks
 * This structure is appended to a [**MXDC\_ESCAPE\_HEADER\_T**](mxdcescapeheader.md) structure (that has its **opCode** set to **MXDCOP\_SET\_S0PAGERESOURCE**) to make an [**MXDC\_S0PAGE\_RESOURCE\_ESCAPE\_T**](mxdcs0pageresourceescape.md) structure. The resulting **MXDC\_S0PAGE\_RESOURCE\_ESCAPE\_T** structure is then passed in the *lpszInData* parameter of the [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape) function that it is called with the [**MXDC\_ESCAPE**](mxdc-escape.md) escape. The effect is to send the resource to the MXDC for conversion and to be written to the output file.
  * 
  * The call to [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape) must be between a call to [**StartPage**](/windows/desktop/api/Wingdi/nf-wingdi-startpage) and a call to [**EndPage**](/windows/desktop/api/Wingdi/nf-wingdi-endpage); however there can be more than one such calls between the calls to **StartPage** and **EndPage**.
  * 
  * Streaming consumption is more efficient if you call [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape) with the **MXDCOP\_SET\_S0PAGE\_RESOURCE** **opCode** for each resource on the page before you call **ExtEscape** with the **MXDCOP\_SET\_S0PAGE** **opCode**.
 * @see https://learn.microsoft.com/windows/win32/printdocs/mxdcxpss0pageresource
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MXDC_XPS_S0PAGE_RESOURCE_T extends Win32Struct
{
    static sizeof => 273

    static packingSize => 1

    /**
     * The total size of this structure and the resource to which it points.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value of type [**MXDC\_S0\_PAGE\_ENUMS**](mxdcs0pageenums.md) indicating the type of resource, such as TIFF image or TrueType font.
     * @type {Integer}
     */
    dwResourceType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The URI of the resource. This cannot be more than 260 bytes.
     * @type {Array<Byte>}
     */
    szUri{
        get {
            if(!this.HasProp("__szUriProxyArray"))
                this.__szUriProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__szUriProxyArray
        }
    }

    /**
     * The size of the resource in bytes.
     * @type {Integer}
     */
    dwDataSize {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }

    /**
     * The data of the resource in an array of bytes with size 1 + the size of the resource.
     * @type {Array<Byte>}
     */
    bData{
        get {
            if(!this.HasProp("__bDataProxyArray"))
                this.__bDataProxyArray := Win32FixedArray(this.ptr + 272, 1, Primitive, "char")
            return this.__bDataProxyArray
        }
    }
}
