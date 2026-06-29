#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the attributes of a specified verb for an object.
 * @remarks
 * Values are used in the enumerator (which supports the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ienumoleverb">IEnumOLEVERB</a> interface) that is created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-enumverbs">IOleObject::EnumVerbs</a>.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-oleverbattrib
 * @namespace Windows.Win32.System.Ole
 */
export default struct OLEVERBATTRIB {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Executing this verb will not cause the object to become dirty and is therefore in need of saving to persistent storage.
     * @type {Integer (Int32)}
     */
    static OLEVERBATTRIB_NEVERDIRTIES => 1

    /**
     * Indicates a verb that should appear in the container's menu of verbs for this object. OLEIVERB_HIDE, OLEIVERB_SHOW, and OLEIVERB_OPEN never have this value set.
     * @type {Integer (Int32)}
     */
    static OLEVERBATTRIB_ONCONTAINERMENU => 2
}
