#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ELEMENT_TYPE.ahk" { ELEMENT_TYPE }
#Import ".\CHANGER_ELEMENT.ahk" { CHANGER_ELEMENT }
#Import ".\CHANGER_ELEMENT_LIST.ahk" { CHANGER_ELEMENT_LIST }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Represents the status of all media changer elements or the specified elements of a particular type.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_initialize_element_status
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CHANGER_INITIALIZE_ELEMENT_STATUS {
    #StructPack 4

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element_list">CHANGER_ELEMENT_LIST</a> structure that lists the elements and range on which to initialize. 
     * 
     * 
     * 
     * 
     * If CHANGER_INIT_ELEM_STAT_WITH_RANGE is set in the <b>Features0</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-get_changer_parameters">GET_CHANGER_PARAMETERS</a>, the changer supports initializing a range of elements. In this case, the <b>ElementType</b> member can be one of the following: ChangerTransport, ChangerSlot, ChangerDrive, or ChangerIEPort. Otherwise, the element type must be AllElements and the <b>NumberOfElements</b> member is ignored.
     */
    ElementList : CHANGER_ELEMENT_LIST

    /**
     * If this member is <b>TRUE</b>, a bar-code scan should be used. Otherwise, it should not. If the changer has nonvolatile RAM, using a bar-code scan is an optimization. 
     * 
     * 
     * 
     * 
     * This member is applicable only if CHANGER_BAR_CODE_SCANNER_INSTALLED is set in the <b>Features0</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-get_changer_parameters">GET_CHANGER_PARAMETERS</a>.
     */
    BarCodeScan : BOOLEAN

}
