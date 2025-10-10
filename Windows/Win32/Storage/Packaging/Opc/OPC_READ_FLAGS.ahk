#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the read settings for caching package components and validating them against ECMA-376 OpenXML, 1st Edition, Part 2:\_Open Packaging Conventions (OPC) conformance requirements.
 * @remarks
 * 
  * If both the <b>OPC_CACHE_ON_ACCESS</b> and <b>OPC_VALIDATE_ON_LOAD</b> read flags are set, all package components are decompressed and cached when a package is loaded.
  * 
  * The Packaging APIs do not use the <i>OPC</i> core properties feature; therefore, the core properties requirements listed in Table H-9 of the <i>OPC</i> are not validated by the Packaging APIs. For more information about <i>OPC</i> conformance requirements, see 1st edition, Part 2: Open Packaging Conventions in <a href="https://www.ecma-international.org/publications/standards/Ecma-376.htm">ECMA-376 OpenXML</a>  (http://www.ecma-international.org/publications/standards/Ecma-376.htm).
  * 
  * <div class="alert"><b>Important</b>  Parts may be repeatedly read from the stream at any time, regardless of which read flags are set. For example, when a package is saved, previously accessed relationships in a Relationships part in the original package may be accessed again to preserve markup compatibility.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/ne-msopc-opc_read_flags
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class OPC_READ_FLAGS{

    /**
     * Validate a package component against <i>OPC</i> conformance requirements when the  component is accessed. For more information about <i>OPC</i> conformance validation, see Remarks.
 * 
 * When validation is performed on access, <i>OPC</i> validation errors can be returned by any method.
     * @type {Integer (Int32)}
     */
    static OPC_READ_DEFAULT => 0

    /**
     * Validate all package components against <i>OPC</i> conformance requirements when a package is loaded. For more information about <i>OPC</i> conformance validation, see Remarks.
 * 
 * If this setting is enabled, performance costs for loading and validating package components are paid when the package is first loaded.
     * @type {Integer (Int32)}
     */
    static OPC_VALIDATE_ON_LOAD => 1

    /**
     * Cache decompressed package component data as a temp file when accessing the component for the first time. When a  package component is accessed repeatedly, this caching reduces overhead because the component data is decompressed one time for the first read instead of once for every read operation.
     * @type {Integer (Int32)}
     */
    static OPC_CACHE_ON_ACCESS => 2
}
