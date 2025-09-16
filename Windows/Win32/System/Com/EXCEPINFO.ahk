#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an exception that occurred during IDispatch::Invoke.
 * @remarks
 * Use the <b>pfnDeferredFillIn</b> field to enable an object to defer filling in the <b>bstrDescription</b>, <b>bstrHelpFile</b>, and <b>dwHelpContext</b> fields until they are needed. This field might be used, for example, if loading the string for the error is a time-consuming operation. To use deferred fill-in, the object puts a function pointer in this slot and does not fill any of the other fields except <b>wCode</b>, which is required.
  * 
  * To get additional information, the caller passes the <b>EXCEPINFO</b> structure back to the <b>pexcepinfo</b> callback function, which fills in the additional information. When the ActiveX object and the ActiveX client are in different processes, the ActiveX object calls <b>pfnDeferredFillIn</b> before returning to the controller.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-excepinfo
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class EXCEPINFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The error code. Error codes should be greater than 1000. Either this field or the scode field must be filled in; the other must be set to 0.
     * @type {Integer}
     */
    wCode {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Reserved. Should be 0.
     * @type {Integer}
     */
    wReserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The name of the exception source. Typically, this is an application name. This field should be filled in by the implementer of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>.
     * @type {Pointer<BSTR>}
     */
    bstrSource {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The exception description to display. If no description is available, use null.
     * @type {Pointer<BSTR>}
     */
    bstrDescription {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The fully qualified help file path. If no Help is available, use null.
     * @type {Pointer<BSTR>}
     */
    bstrHelpFile {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The help context ID.
     * @type {Integer}
     */
    dwHelpContext {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Reserved. Must be null.
     * @type {Pointer<Void>}
     */
    pvReserved {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Provides deferred fill-in. If deferred fill-in is not desired, this field should be set to null.
     * @type {Pointer<LPEXCEPFINO_DEFERRED_FILLIN>}
     */
    pfnDeferredFillIn {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A return value that describes the error. Either this field or wCode (but not both) must be filled in; the other must be set to 0. (16-bit Windows versions only.)
     * @type {Integer}
     */
    scode {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
