#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags used to specify the kind of information requested from an object in the IProvideClassInfo2.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ne-ocidl-guidkind
 * @namespace Windows.Win32.System.Ole
 */
export default struct GUIDKIND {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The interface identifier (IID) of the object's outgoing dispinterface, labeled [source, default]. The outgoing interface in question must be derived from <b>IDispatch</b>.
     * @type {Integer (Int32)}
     */
    static GUIDKIND_DEFAULT_SOURCE_DISP_IID => 1
}
