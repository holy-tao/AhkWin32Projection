#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the target mode of a relationship.
 * @remarks
 * 
 * If the relationship's  target mode is <b>OPC_URI_TARGET_MODE_INTERNAL</b> the URI of the target  part is relative to the URI of the source of the relationship.
 * 
 * To get the URI of the target of the relationship, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationship-gettargeturi">IOpcRelationship::GetTargetUri</a> method.
 * 
 * For more information about relationships, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/open-packaging-conventions-overview">Open Packaging Conventions Fundamentals</a> and the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/ne-msopc-opc_uri_target_mode
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class OPC_URI_TARGET_MODE{

    /**
     * The target of the relationship  is a part inside the package.
     * @type {Integer (Int32)}
     */
    static OPC_URI_TARGET_MODE_INTERNAL => 0

    /**
     * The target of the relationship is a resource outside of the package.
     * @type {Integer (Int32)}
     */
    static OPC_URI_TARGET_MODE_EXTERNAL => 1
}
