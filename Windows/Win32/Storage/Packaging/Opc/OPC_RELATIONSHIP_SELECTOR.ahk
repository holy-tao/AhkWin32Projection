#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Describes how to interpret the selectionCriterion parameter of the IOpcRelationshipSelector::GetSelectionCriterion method.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_relationship_selector
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class OPC_RELATIONSHIP_SELECTOR extends Win32Enum{

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
