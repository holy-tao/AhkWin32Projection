#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates whether an object is activated as a windowless object. It is used in IOleInPlaceSiteEx::OnInPlaceActivateEx.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/ne-ocidl-activateflags
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ACTIVATEFLAGS{

    /**
     * Indicates that the object is activated in place as a windowless object. In the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleinplacesiteex">IOleInPlaceSiteEx::OnInPlaceActivateEx</a> method, the container uses this value returned in the <i>dwFlags</i> parameter instead of calling the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleinplaceobjectwindowless">IOleInPlaceObjectWindowless::GetWindow</a>  method to determine if the object is windowless or not.
     * @type {Integer (Int32)}
     */
    static ACTIVATE_WINDOWLESS => 1
}
