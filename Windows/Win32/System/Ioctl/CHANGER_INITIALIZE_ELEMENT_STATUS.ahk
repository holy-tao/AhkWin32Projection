#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CHANGER_ELEMENT.ahk
#Include .\CHANGER_ELEMENT_LIST.ahk

/**
 * Represents the status of all media changer elements or the specified elements of a particular type.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_initialize_element_status
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CHANGER_INITIALIZE_ELEMENT_STATUS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element_list">CHANGER_ELEMENT_LIST</a> structure that lists the elements and range on which to initialize. 
     * 
     * 
     * 
     * 
     * If CHANGER_INIT_ELEM_STAT_WITH_RANGE is set in the <b>Features0</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-get_changer_parameters">GET_CHANGER_PARAMETERS</a>, the changer supports initializing a range of elements. In this case, the <b>ElementType</b> member can be one of the following: ChangerTransport, ChangerSlot, ChangerDrive, or ChangerIEPort. Otherwise, the element type must be AllElements and the <b>NumberOfElements</b> member is ignored.
     * @type {CHANGER_ELEMENT_LIST}
     */
    ElementList{
        get {
            if(!this.HasProp("__ElementList"))
                this.__ElementList := CHANGER_ELEMENT_LIST(0, this)
            return this.__ElementList
        }
    }

    /**
     * If this member is <b>TRUE</b>, a bar-code scan should be used. Otherwise, it should not. If the changer has nonvolatile RAM, using a bar-code scan is an optimization. 
     * 
     * 
     * 
     * 
     * This member is applicable only if CHANGER_BAR_CODE_SCANNER_INSTALLED is set in the <b>Features0</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-get_changer_parameters">GET_CHANGER_PARAMETERS</a>.
     * @type {BOOLEAN}
     */
    BarCodeScan {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }
}
