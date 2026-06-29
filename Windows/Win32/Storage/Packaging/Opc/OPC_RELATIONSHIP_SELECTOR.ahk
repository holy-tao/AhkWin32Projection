#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes how to interpret the selectionCriterion parameter of the IOpcRelationshipSelector::GetSelectionCriterion method.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_relationship_selector
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct OPC_RELATIONSHIP_SELECTOR {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The <i>selectionCriterion</i> parameter is a relationship identifier.
     * @type {Integer (Int32)}
     */
    static OPC_RELATIONSHIP_SELECT_BY_ID => 0

    /**
     * The <i>selectionCriterion</i> parameter is a relationship type.
     * @type {Integer (Int32)}
     */
    static OPC_RELATIONSHIP_SELECT_BY_TYPE => 1
}
