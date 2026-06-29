#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of an inclusion or exclusion list.
 * @remarks
 * To retrieve the inclusion and exclusion rules that are currently stored in an <a href="https://docs.microsoft.com/windows/desktop/DevNotes/fhconfigmgr">FhConfigMgr</a> object, call the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-getincludeexcluderules">IFhConfigMgr::GetIncludeExcludeRules</a> method.
 * 
 * To add or remove an exclusion rule, call the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-addremoveexcluderule">IFhConfigMgr::AddRemoveExcludeRule</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/fhcfg/ne-fhcfg-fh_protected_item_category
 * @namespace Windows.Win32.Storage.FileHistory
 */
export default struct FH_PROTECTED_ITEM_CATEGORY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The inclusion or exclusion list is a list of folders.
     * @type {Integer (Int32)}
     */
    static FH_FOLDER => 0

    /**
     * The inclusion or exclusion list is a list of libraries.
     * @type {Integer (Int32)}
     */
    static FH_LIBRARY => 1

    /**
     * The maximum enumeration value for this enumeration. This value and all values greater than it are reserved for system use.
     * @type {Integer (Int32)}
     */
    static MAX_PROTECTED_ITEM_CATEGORY => 2
}
