#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains optional compliance state information that is returned by the System Health Validator (SHV).
 * @remarks
 * 
 * If a failure occurs in the system (for example, a component or communication failures), the SHV may return
 *    an <a href="https://docs.microsoft.com/windows/desktop/NAP/sohattributetype-enum">sohAttributeTypeFailureCategory</a> type type-length-value (TLV) object in its <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-soh">SoHResponse</a> instead
 *    of making a compliance decision. In turn, the NAP system maps the <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ne-naptypes-failurecategory">FailureCategory</a> type returned by the TLV object to compliant or non-compliant within the <b>FailureCategoryMapping</b> structure as follows:
 * 
 * <ul>
 * <li>mappingCompliance[0] = mapping for <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ne-naptypes-failurecategory">failureCategoryOther</a>
 * </li>
 * <li>mappingCompliance[1] = mapping for <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ne-naptypes-failurecategory">failureCategoryClientComponent</a>
 * </li>
 * <li>mappingCompliance[2] = mapping for <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ne-naptypes-failurecategory">failureCategoryClientCommunication</a>
 * </li>
 * <li>mappingCompliance[3] = mapping for <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ne-naptypes-failurecategory">failureCategoryServerComponent</a>
 * </li>
 * <li>mappingCompliance[4] = mapping for <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ne-naptypes-failurecategory">failureCategoryServerCommunication</a>
 * </li>
 * </ul>
 * By default, all categories map to non-compliant (FALSE).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//naptypes/ns-naptypes-failurecategorymapping
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 * @version v4.0.30319
 */
class FailureCategoryMapping extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * An array of        <b>BOOLs</b> that contain the compliance state of each <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ne-naptypes-failurecategory">FailureCategory</a>.  <b>TRUE</b> indicates the category is compliant and <b>FALSE</b> indicates non-compliance. 
     * 
     * <div class="alert"><b>Note</b>  The length of <b>mappingCompliance</b> is defined by <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-type-constants">failureCategoryCount</a>.</div>
     * <div> </div>
     * @type {Array<BOOL>}
     */
    mappingCompliance{
        get {
            if(!this.HasProp("__mappingComplianceProxyArray"))
                this.__mappingComplianceProxyArray := Win32FixedArray(this.ptr + 0, 5, Primitive, "int")
            return this.__mappingComplianceProxyArray
        }
    }
}
