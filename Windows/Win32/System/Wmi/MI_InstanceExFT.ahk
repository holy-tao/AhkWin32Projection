#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_InstanceFT.ahk" { MI_InstanceFT }

/**
 * Extends the MI_InstanceFT structure.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_instanceexft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_InstanceExFT {
    #StructPack 8

    /**
     * Parent <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instanceft">MI_InstanceFT</a> function table.
     */
    parent : MI_InstanceFT

    /**
     * Parses the structure and returns the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instanceft">MI_InstanceFT</a> function table. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_normalize">MI_Instance_Normalize</a>.
     */
    Normalize : IntPtr

}
