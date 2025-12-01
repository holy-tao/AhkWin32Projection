#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MXDC_ESCAPE_HEADER_T.ahk
#Include .\MXDC_XPS_S0PAGE_RESOURCE_T.ahk

/**
 * The MXDC\_S0PAGE\_RESOURCE\_ESCAPE\_T structure is an MXDC\_ESCAPE\_HEADER\_T structure concatenated with an MXDC\_XPS\_S0PAGE\_RESOURCE\_T structure.
 * @remarks
 * This structure is passed in the *lpszInData* parameter of the [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape) function when that function is called with the [**MXDC\_ESCAPE**](mxdc-escape.md) escape, and the **opCode** member of the [**MXDC\_ESCAPE\_HEADER\_T**](mxdcescapeheader.md) structure is **MXDCOP\_SET\_S0PAGE\_RESOURCE**. The result is a page resource to send to the MXDC.
 * 
 * Allocate memory for the escape as shown below, set the fields as needed, and then call [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape).
 * 
 * 
 * ```C++
 * // Compute size of buffer required adding the
 * //  size of the escape structure to the size
 * //  of the resource data buffer.
 * SIZE_T iTotalDataSize = sizeof(MXDC_S0PAGE_RESOURCE_ESCAPE_T) + 
 *                         iS0PageResourceDataSize - 1;
 * 
 * // Allocate the memory buffer.
 * P_MXDC_S0PAGE_RESOURCE_ESCAPE_T pS0PageResourceEscapeData = 
 *                         (P_MXDC_S0PAGE_RESOURCE_ESCAPE_T)HeapAlloc(
 *                             GetProcessHeap(),
 *                             0,
 *                             iTotalDataSize);
 * ```
 * 
 * 
 * 
 * The call to [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape) must be between a call to [**StartPage**](/windows/desktop/api/Wingdi/nf-wingdi-startpage) and a call to [**EndPage**](/windows/desktop/api/Wingdi/nf-wingdi-endpage); however, there can be more than one of these calls between the calls to **StartPage** and **EndPage**.
 * 
 * Streaming consumption is more efficient if you call [**ExtEscape**](/windows/desktop/api/Wingdi/nf-wingdi-extescape) with the **MXDCOP\_SET\_S0PAGE\_RESOURCE** **opCode** for each resource on the page before you call **ExtEscape** with the **MXDCOP\_SET\_S0PAGE**  **opCode**.
 * @see https://learn.microsoft.com/windows/win32/printdocs/mxdcs0pageresourceescape
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MXDC_S0PAGE_RESOURCE_ESCAPE_T extends Win32Struct
{
    static sizeof => 296

    static packingSize => 8

    /**
     * An [**MXDC\_ESCAPE\_HEADER\_T**](mxdcescapeheader.md) structure with its **opCode** member set to MXDCOP\_SET\_S0PAGE\_RESOURCE.
     * @type {MXDC_ESCAPE_HEADER_T}
     */
    mxdcEscape{
        get {
            if(!this.HasProp("__mxdcEscape"))
                this.__mxdcEscape := MXDC_ESCAPE_HEADER_T(0, this)
            return this.__mxdcEscape
        }
    }

    /**
     * An [**MXDC\_XPS\_S0PAGE\_RESOURCE\_T**](mxdcxpss0pageresource.md) structure representing a resource, such as a font or image file, on an XPS document page.
     * @type {MXDC_XPS_S0PAGE_RESOURCE_T}
     */
    xpsS0PageResourcePassthrough{
        get {
            if(!this.HasProp("__xpsS0PageResourcePassthrough"))
                this.__xpsS0PageResourcePassthrough := MXDC_XPS_S0PAGE_RESOURCE_T(16, this)
            return this.__xpsS0PageResourcePassthrough
        }
    }
}
