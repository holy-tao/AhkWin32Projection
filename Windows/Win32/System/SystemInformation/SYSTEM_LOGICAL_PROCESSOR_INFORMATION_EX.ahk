#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GROUP_AFFINITY.ahk
#Include .\PROCESSOR_RELATIONSHIP.ahk
#Include .\NUMA_NODE_RELATIONSHIP.ahk
#Include .\CACHE_RELATIONSHIP.ahk
#Include .\PROCESSOR_GROUP_INFO.ahk
#Include .\GROUP_RELATIONSHIP.ahk

/**
 * Contains information about the relationships of logical processors and related hardware. The GetLogicalProcessorInformationEx function uses this structure.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-system_logical_processor_information_ex
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The type of relationship between the logical processors. This parameter can be one of the following <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-logical_processor_relationship">LOGICAL_PROCESSOR_RELATIONSHIP</a> values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RelationCache"></a><a id="relationcache"></a><a id="RELATIONCACHE"></a><dl>
     * <dt><b>RelationCache</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified logical processors  share a cache. The <b>Cache</b> member contains additional information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RelationGroup"></a><a id="relationgroup"></a><a id="RELATIONGROUP"></a><dl>
     * <dt><b>RelationGroup</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified logical processors share a processor group. The <b>Group</b> member contains additional information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RelationNumaNode"></a><a id="relationnumanode"></a><a id="RELATIONNUMANODE"></a><dl>
     * <dt><b>RelationNumaNode</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified logical processors  are part of the same NUMA node. The <b>NumaNode</b> member  contains additional information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RelationProcessorCore"></a><a id="relationprocessorcore"></a><a id="RELATIONPROCESSORCORE"></a><dl>
     * <dt><b>RelationProcessorCore</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified logical processors share a single processor core. The <b>Processor</b> member contains additional information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RelationProcessorPackage"></a><a id="relationprocessorpackage"></a><a id="RELATIONPROCESSORPACKAGE"></a><dl>
     * <dt><b>RelationProcessorPackage</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified logical processors share a physical package. The <b>Processor</b> member contains additional information.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Relationship {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The size of the structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {PROCESSOR_RELATIONSHIP}
     */
    Processor{
        get {
            if(!this.HasProp("__Processor"))
                this.__Processor := PROCESSOR_RELATIONSHIP(this.ptr + 8)
            return this.__Processor
        }
    }

    /**
     * @type {NUMA_NODE_RELATIONSHIP}
     */
    NumaNode{
        get {
            if(!this.HasProp("__NumaNode"))
                this.__NumaNode := NUMA_NODE_RELATIONSHIP(this.ptr + 8)
            return this.__NumaNode
        }
    }

    /**
     * @type {CACHE_RELATIONSHIP}
     */
    Cache{
        get {
            if(!this.HasProp("__Cache"))
                this.__Cache := CACHE_RELATIONSHIP(this.ptr + 8)
            return this.__Cache
        }
    }

    /**
     * @type {GROUP_RELATIONSHIP}
     */
    Group{
        get {
            if(!this.HasProp("__Group"))
                this.__Group := GROUP_RELATIONSHIP(this.ptr + 8)
            return this.__Group
        }
    }
}
