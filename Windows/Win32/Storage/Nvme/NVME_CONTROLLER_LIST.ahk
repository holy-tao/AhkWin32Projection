#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains an ordered list of controller identifiers.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_controller_list
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CONTROLLER_LIST {
    #StructPack 2

    /**
     * Specifies the number of controller entries in the list.
     * 
     * There may be up to 2047 identifiers in the list. A value of 0 indicates that there are no controllers in the list.
     */
    NumberOfIdentifiers : UInt16

    /**
     * Contains a list of unique controller identifiers.
     * 
     * If the first value in the list is `0h`, the list is empty and there are no controllers in the list.
     */
    ControllerID : UInt16[2047]

}
