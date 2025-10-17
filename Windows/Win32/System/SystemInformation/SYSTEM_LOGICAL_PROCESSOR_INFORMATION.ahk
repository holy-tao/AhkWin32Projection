#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CACHE_DESCRIPTOR.ahk

/**
 * Describes the relationship between the specified processor set. This structure is used with the GetLogicalProcessorInformation function.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-system_logical_processor_information
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class SYSTEM_LOGICAL_PROCESSOR_INFORMATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The processor mask  identifying the processors described by this structure. A processor mask is a bit vector in which each set bit represents an active processor in the relationship. At least one bit will be set.
     * 
     * On a system with more than 64 processors, the processor mask identifies processors in a single <a href="https://docs.microsoft.com/windows/desktop/ProcThread/processor-groups">processor group</a>.
     * @type {Pointer}
     */
    ProcessorMask {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The relationship between the processors identified by the value of the <b>ProcessorMask</b> member. This member can be one of the following <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-logical_processor_relationship">LOGICAL_PROCESSOR_RELATIONSHIP</a> values.
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
     * <b>Windows Server 2003:  </b>This value is not supported until Windows Server 2003 with SP1 and Windows XP Professional x64 Edition.
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
     * The specified logical processors share a single processor core. The <b>ProcessorCore</b> member contains additional information.
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
     * The specified logical processors share a physical package. There is no additional information available.
     * 
     * <b>Windows Server 2003 and Windows XP Professional x64 Edition:  </b>This value is not supported until Windows Server 2003 with SP1 and Windows XP with SP3.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Future versions of Windows may support additional values for the <b>Relationship</b> member.
     * @type {Integer}
     */
    Relationship {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    class _ProcessorCore extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
    }

    class _NumaNode extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        NodeNumber {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    /**
     * @type {_ProcessorCore}
     */
    ProcessorCore{
        get {
            if(!this.HasProp("__ProcessorCore"))
                this.__ProcessorCore := %this.__Class%._ProcessorCore(16, this)
            return this.__ProcessorCore
        }
    }

    /**
     * @type {_NumaNode}
     */
    NumaNode{
        get {
            if(!this.HasProp("__NumaNode"))
                this.__NumaNode := %this.__Class%._NumaNode(16, this)
            return this.__NumaNode
        }
    }

    /**
     * @type {CACHE_DESCRIPTOR}
     */
    Cache{
        get {
            if(!this.HasProp("__Cache"))
                this.__Cache := CACHE_DESCRIPTOR(16, this)
            return this.__Cache
        }
    }

    /**
     * @type {Array<UInt64>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 16, 2, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
