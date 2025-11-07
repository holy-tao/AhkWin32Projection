#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that specify the type of change in the Microsoft UI Automation tree structure.
 * @remarks
 * 
 * Because the implementation of structure-change events depends on the underlying UI framework, UI Automation defines no strict rule governing when a provider must switch from sending individual ChildAdded or ChildRemoved events to the bulk equivalent. However, the switch typically occurs when two to five child elements are added or removed at once. The bulk events help to prevent clients from being flooded by individual ChildAdded and ChildRemoved events.
 * 
 * Except for ChildAdded, structure-change events are always associated with the container element that holds the children. The ChildAdded event is associated with the element that was just added.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/ne-uiautomationcore-structurechangetype
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class StructureChangeType{

    /**
     * A child element was added to the UI Automation element tree.
     * @type {Integer (Int32)}
     */
    static StructureChangeType_ChildAdded => 0

    /**
     * A child element was removed from the UI Automation element tree.
     * @type {Integer (Int32)}
     */
    static StructureChangeType_ChildRemoved => 1

    /**
     * Child elements were invalidated in the UI Automation element tree. This might mean that one or more child elements were added or removed, or a combination of both. This value can also indicate that one subtree in the UI was substituted for another. For example, the entire contents of a dialog box changed at once, or the view of a list changed because an Explorer-type application navigated to another location. The exact meaning depends on the UI Automation provider implementation.
     * @type {Integer (Int32)}
     */
    static StructureChangeType_ChildrenInvalidated => 2

    /**
     * Child elements were added in bulk to the UI Automation element tree.
     * @type {Integer (Int32)}
     */
    static StructureChangeType_ChildrenBulkAdded => 3

    /**
     * Child elements were removed in bulk from the UI Automation element tree.
     * @type {Integer (Int32)}
     */
    static StructureChangeType_ChildrenBulkRemoved => 4

    /**
     * The order of child elements has changed in the UI Automation element tree. Child elements may or may not have been added or removed.
     * @type {Integer (Int32)}
     */
    static StructureChangeType_ChildrenReordered => 5
}
