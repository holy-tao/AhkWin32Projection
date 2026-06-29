#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides information about the PERF_INSTANCE_HEADER block that contains the structure.
 * @remarks
 * Each active instance of a counter set is identified by the combination of  
 * 
 * its instance name and instance identifier. Two active instances of a  
 * 
 * counter set should not have the same combination of instance name and instance  
 * 
 * identifier. Clients, however, should tolerate instances with duplicate combinations of instance name and instance  
 * 
 * identifier. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfenumeratecountersetinstances">PerfEnumerateCounterSetInstances</a> function gets a sequence of  
 * 
 * <b>PERF_INSTANCE_HEADER</b> blocks.  
 * 
 *   
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycounterdata">PerfQueryCounterData</a> function gets a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_data_header">PERF_DATA_HEADER</a> block that may  
 * 
 * contain <b>PERF_INSTANCE_HEADER</b> blocks within the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_multi_instances">PERF_MULTI_INSTANCES</a> block.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_instance_header
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERF_INSTANCE_HEADER {
    #StructPack 4

    /**
     * The total size of the <b>PERF_INSTANCE_HEADER</b> block, in bytes. This total size is the sum of the sizes of the <b>PERF_INSTANCE_HEADER</b> structures, the string that  contains the instance name, and the padding.
     */
    Size : UInt32

    /**
     * The instance identifier.
     */
    InstanceId : UInt32

}
