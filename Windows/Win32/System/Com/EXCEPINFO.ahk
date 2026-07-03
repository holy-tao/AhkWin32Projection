#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }

/**
 * Describes an exception that occurred during IDispatch::Invoke.
 * @remarks
 * Use the <b>pfnDeferredFillIn</b> field to enable an object to defer filling in the <b>bstrDescription</b>, <b>bstrHelpFile</b>, and <b>dwHelpContext</b> fields until they are needed. This field might be used, for example, if loading the string for the error is a time-consuming operation. To use deferred fill-in, the object puts a function pointer in this slot and does not fill any of the other fields except <b>wCode</b>, which is required.
 * 
 * To get additional information, the caller passes the <b>EXCEPINFO</b> structure back to the <b>pexcepinfo</b> callback function, which fills in the additional information. When the ActiveX object and the ActiveX client are in different processes, the ActiveX object calls <b>pfnDeferredFillIn</b> before returning to the controller.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-excepinfo
 * @namespace Windows.Win32.System.Com
 */
export default struct EXCEPINFO {
    #StructPack 8

    /**
     * The error code. Error codes should be greater than 1000. Either this field or the scode field must be filled in; the other must be set to 0.
     */
    wCode : UInt16

    /**
     * Reserved. Should be 0.
     */
    wReserved : UInt16

    /**
     * The name of the exception source. Typically, this is an application name. This field should be filled in by the implementer of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>.
     */
    bstrSource : BSTR

    /**
     * The exception description to display. If no description is available, use null.
     */
    bstrDescription : BSTR

    /**
     * The fully qualified help file path. If no Help is available, use null.
     */
    bstrHelpFile : BSTR

    /**
     * The help context ID.
     */
    dwHelpContext : UInt32

    /**
     * Reserved. Must be null.
     */
    pvReserved : IntPtr

    /**
     * Provides deferred fill-in. If deferred fill-in is not desired, this field should be set to null.
     */
    pfnDeferredFillIn : IntPtr

    /**
     * A return value that describes the error. Either this field or wCode (but not both) must be filled in; the other must be set to 0. (16-bit Windows versions only.)
     */
    scode : Int32

}
