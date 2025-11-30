#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags used to specify the kind of information requested from an object in the IProvideClassInfo2.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/ne-ocidl-guidkind
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class GUIDKIND extends Win32Enum{

    /**
     * The interface identifier (IID) of the object's outgoing dispinterface, labeled [source, default]. The outgoing interface in question must be derived from <b>IDispatch</b>.
     * @type {Integer (Int32)}
     */
    static GUIDKIND_DEFAULT_SOURCE_DISP_IID => 1
}
