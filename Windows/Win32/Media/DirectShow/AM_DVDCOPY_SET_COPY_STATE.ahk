#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the copy protection state of the filter.
 * @remarks
 * 
 * Both the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ikspropertyset-get">IKsPropertySet::Get</a> and <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ikspropertyset-set">IKsPropertySet::Set</a> methods are supported on this property. The Get method is called first to determine if authentication is required. If a filter provides multiple pins that use the same authenticator, such as a hardware DVD decoder, the decoder might respond with <b>AM_DVDCOPYSTATE_AUTHENTICATION_NOT_REQUIRED</b> on some pins to indicate that the key exchange algorithm only needs to be applied once. The filter should respond with <b>AM_DVDCOPYSTATE_AUTHENTICATION_REQUIRED</b> to get the copy protection state property on the first pin where this property is issued.
 * 
 * The Set method is used to indicate which phase of copy protection negotiation the filter is entering. Specify these by setting the required flag in the <a href="https://docs.microsoft.com/windows/desktop/api/dvdmedia/ne-dvdmedia-am_dvdcopystate">AM_DVDCOPYSTATE</a> enumerated type.
 * 
 * The AM_PROPERTY_DVDCOPY_SET_COPY_STATE property uses this structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dvdmedia/ns-dvdmedia-am_dvdcopy_set_copy_state
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_DVDCOPY_SET_COPY_STATE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Copy protection state of the filter. Member of the <a href="https://docs.microsoft.com/windows/desktop/api/dvdmedia/ne-dvdmedia-am_dvdcopystate">AM_DVDCOPYSTATE</a> enumerated data type.
     * @type {Integer}
     */
    DVDCopyState {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
