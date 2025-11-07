#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information about the PERF_INSTANCE_HEADER block that contains the structure.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//perflib/ns-perflib-perf_instance_header
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_INSTANCE_HEADER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The total size of the <b>PERF_INSTANCE_HEADER</b> block, in bytes. This total size is the sum of the sizes of the <b>PERF_INSTANCE_HEADER</b> structures, the string that  contains the instance name, and the padding.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The instance identifier.
     * @type {Integer}
     */
    InstanceId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
