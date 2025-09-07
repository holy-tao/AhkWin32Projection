#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes whether a reference represented by the IOpcSignatureRelationshipReference interface refers to all or a subset of relationships represented as relationship objects in a relationship set object.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_relationships_signing_option
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class OPC_RELATIONSHIPS_SIGNING_OPTION{

    /**
     * The reference refers to a subset of relationships represented as relationship objects and identified using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselectorset">IOpcRelationshipSelectorSet</a> interface.
     * @type {Integer (Int32)}
     */
    static OPC_RELATIONSHIP_SIGN_USING_SELECTORS => 0

    /**
     * The reference refers to all of the relationships represented as relationship objects in the relationship set object.
     * @type {Integer (Int32)}
     */
    static OPC_RELATIONSHIP_SIGN_PART => 1
}
