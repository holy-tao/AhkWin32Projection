#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains actions for a virtual machine to perform.
 * @remarks
 * 
 * The values in this enumeration can be used in a 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/property-lists">property list</a> as input for the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-moveclustergroupex">MoveClusterGroupEx</a> function's 
 *     <i>lpInBuffer</i> parameter to specify actions to take on a virtual machine. The resource type 
 *     name to use in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa368382(v=vs.85)">CLUSPROP_PROPERTY_NAME</a> 
 *     structure is "Virtual Machine" or "Virtual Machine Configuration", and the 
 *     proper <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_property_format">CLUSTER_PROPERTY_FORMAT</a> enumeration value to 
 *     specify for the data format is <b>CLUSPROP_FORMAT_DWORD</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//resapi/ne-resapi-vm_resdll_context
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class VM_RESDLL_CONTEXT extends Win32Enum{

    /**
     * Turns off the virtual machine.
     * @type {Integer (Int32)}
     */
    static VmResdllContextTurnOff => 0

    /**
     * Saves the virtual machine.
     * @type {Integer (Int32)}
     */
    static VmResdllContextSave => 1

    /**
     * Shuts down the virtual machine.
     * @type {Integer (Int32)}
     */
    static VmResdllContextShutdown => 2

    /**
     * Forces a shutdown of the virtual machine.
     * @type {Integer (Int32)}
     */
    static VmResdllContextShutdownForce => 3

    /**
     * Performs a live migration of the virtual machine.
     * @type {Integer (Int32)}
     */
    static VmResdllContextLiveMigration => 4
}
