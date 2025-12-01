#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The REGFILTERPINS structure contains pin information for registering a filter.
 * @remarks
 * This structure is used in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifiltermapper2">IFilterMapper2</a> interface for filter registration. If you use this structure, set the <b>dwVersion</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regfilter2">REGFILTER2</a> structure to 1. If you need to register a medium or pin category for the pin, use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regfilterpins2">REGFILTERPINS2</a> structure instead. In that case, set the <b>REGFILTER2</b> structure's <b>dwVersion</b> member to 2.
 * 
 * The equivalent <b>AMOVIESETUP_PIN</b> type is used in class factory templates (<a href="https://docs.microsoft.com/windows/desktop/DirectShow/cfactorytemplate">CFactoryTemplate</a>).
 * 
 * The <b>strName</b>, <b>clsConnectsToFilter</b>, and <b>strConnectsToPin</b> members are obsolete. Their values are not added to the registry.
 * 
 * For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/how-to-register-directshow-filters">How to Register DirectShow Filters</a>.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-regfilterpins
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class REGFILTERPINS extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Name of the pin. (Obsolete.)
     * @type {PWSTR}
     */
    strName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * If <b>TRUE</b>, the filter renders the input from this pin. (Applies only to input pins. For output pins, the value is always <b>FALSE</b>.)
     * @type {BOOL}
     */
    bRendered {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * If <b>TRUE</b>, this pin is an output pin. Otherwise, the pin is an input pin.
     * @type {BOOL}
     */
    bOutput {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * If <b>TRUE</b>, the filter can have zero instances of this pin.
     * @type {BOOL}
     */
    bZero {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * If <b>TRUE</b>, the filter can create more than one instance of this type of pin.
     * @type {BOOL}
     */
    bMany {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Class identifier (CLSID) of the filter to which this pin connects. (Obsolete.)
     * @type {Pointer<Guid>}
     */
    clsConnectsToFilter {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Name of the pin to which this pin connects. (Obsolete.)
     * @type {PWSTR}
     */
    strConnectsToPin {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Number of media types supported by this pin.
     * @type {Integer}
     */
    nMediaTypes {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-regpintypes">REGPINTYPES</a> structures, of size <b>nMediaTypes</b>.
     * @type {Pointer<REGPINTYPES>}
     */
    lpMediaType {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
