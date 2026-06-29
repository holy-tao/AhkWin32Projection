#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DMO_ENUM_FLAGS enumeration defines flags that specify search criteria when enumerating Microsoft DirectX Media Objects (DMOs).
 * @remarks
 * A software key enables the developer of a DMO to control who uses the DMO. If a DMO has a software key, applications must unlock the DMO to use it. The method for unlocking the DMO depends on the implementation. Consult the documentation for the particular DMO.
 * @see https://learn.microsoft.com/windows/win32/api/dmoreg/ne-dmoreg-dmo_enum_flags
 * @namespace Windows.Win32.Media.DxMediaObjects
 */
export default struct DMO_ENUM_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The enumeration should include DMOs whose use is restricted by a software key. If this flag is absent, keyed DMOs are omitted from the enumeration.
     * @type {Integer (Int32)}
     */
    static DMO_ENUMF_INCLUDE_KEYED => 1
}
