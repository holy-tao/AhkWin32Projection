#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\Node.ahk
#Include .\Nodes.ahk
#Include ..\Com\IDispatch.ahk
#Include .\Document.ahk
#Include .\ContextMenu.ahk
#Include .\Frame.ahk
#Include .\Columns.ahk

/**
 * The View object represents a result set obtained when processing a query using the OpenView method of the Database object.
 * @see https://learn.microsoft.com/windows/win32/Msi/view-object
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class View extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for View
     * @type {Guid}
     */
    static IID => Guid("{6efc2da2-b38c-457e-9abb-ed2d189b8c38}")

    /**
     * The class identifier for View
     * @type {Guid}
     */
    static CLSID => Guid("{6efc2da2-b38c-457e-9abb-ed2d189b8c38}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ActiveScopeNode", "put_ActiveScopeNode", "get_Selection", "get_ListItems", "SnapinScopeObject", "SnapinSelectionObject", "Is", "get_Document", "SelectAll", "Select", "Deselect", "IsSelected", "DisplayScopeNodePropertySheet", "DisplaySelectionPropertySheet", "CopyScopeNode", "CopySelection", "DeleteScopeNode", "DeleteSelection", "RenameScopeNode", "RenameSelectedItem", "get_ScopeNodeContextMenu", "get_SelectionContextMenu", "RefreshScopeNode", "RefreshSelection", "ExecuteSelectionMenuItem", "ExecuteScopeNodeMenuItem", "ExecuteShellCommand", "get_Frame", "Close", "get_ScopeTreeVisible", "put_ScopeTreeVisible", "Back", "Forward", "put_StatusBarText", "get_Memento", "ViewMemento", "get_Columns", "get_CellContents", "ExportList", "get_ListViewMode", "put_ListViewMode", "get_ControlObject"]

    /**
     * @type {Node} 
     */
    ActiveScopeNode {
        get => this.get_ActiveScopeNode()
        set => this.put_ActiveScopeNode(value)
    }

    /**
     * @type {Nodes} 
     */
    Selection {
        get => this.get_Selection()
    }

    /**
     * @type {Nodes} 
     */
    ListItems {
        get => this.get_ListItems()
    }

    /**
     * @type {Document} 
     */
    Document {
        get => this.get_Document()
    }

    /**
     * @type {ContextMenu} 
     */
    SelectionContextMenu {
        get => this.get_SelectionContextMenu()
    }

    /**
     * @type {Frame} 
     */
    Frame {
        get => this.get_Frame()
    }

    /**
     * @type {BOOL} 
     */
    ScopeTreeVisible {
        get => this.get_ScopeTreeVisible()
        set => this.put_ScopeTreeVisible(value)
    }

    /**
     * @type {HRESULT} 
     */
    StatusBarText {
        set => this.put_StatusBarText(value)
    }

    /**
     * @type {BSTR} 
     */
    Memento {
        get => this.get_Memento()
    }

    /**
     * @type {Columns} 
     */
    Columns {
        get => this.get_Columns()
    }

    /**
     * @type {Integer} 
     */
    ListViewMode {
        get => this.get_ListViewMode()
        set => this.put_ListViewMode(value)
    }

    /**
     * @type {IDispatch} 
     */
    ControlObject {
        get => this.get_ControlObject()
    }

    /**
     * 
     * @returns {Node} 
     */
    get_ActiveScopeNode() {
        result := ComCall(7, this, "ptr*", &_Node := 0, "HRESULT")
        return Node(_Node)
    }

    /**
     * 
     * @param {Node} _Node 
     * @returns {HRESULT} 
     */
    put_ActiveScopeNode(_Node) {
        result := ComCall(8, this, "ptr", _Node, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Nodes} 
     */
    get_Selection() {
        result := ComCall(9, this, "ptr*", &_Nodes := 0, "HRESULT")
        return Nodes(_Nodes)
    }

    /**
     * 
     * @returns {Nodes} 
     */
    get_ListItems() {
        result := ComCall(10, this, "ptr*", &_Nodes := 0, "HRESULT")
        return Nodes(_Nodes)
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @returns {IDispatch} 
     */
    SnapinScopeObject(ScopeNode) {
        result := ComCall(11, this, "ptr", ScopeNode, "ptr*", &ScopeNodeObject := 0, "HRESULT")
        return IDispatch(ScopeNodeObject)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    SnapinSelectionObject() {
        result := ComCall(12, this, "ptr*", &SelectionObject := 0, "HRESULT")
        return IDispatch(SelectionObject)
    }

    /**
     * The Is\_Protected attribute indicates whether the content is protected using digital rights management (DRM).
     * @remarks
     * This attribute is stored in both the library and the digital media file.
     * 
     * **DigitallySecure** is an alias for this attribute.
     * 
     * The Windows Media Format SDK constant for this attribute is g\_wszWMProtected.
     * 
     * To determine whether you can change the value of this attribute, use the [Media.isReadOnlyItem](media-isreadonlyitem.md) method.
     * @param {View} _View 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/WMP/is-protected-attribute
     */
    Is(_View) {
        result := ComCall(13, this, "ptr", _View, "short*", &TheSame := 0, "HRESULT")
        return TheSame
    }

    /**
     * 
     * @returns {Document} 
     */
    get_Document() {
        result := ComCall(14, this, "ptr*", &_Document := 0, "HRESULT")
        return Document(_Document)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SelectAll() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * An XPath query that identifies the events to include in the query result set.
     * @param {Node} _Node 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WES/queryschema-select-querytype-element
     */
    Select(_Node) {
        result := ComCall(16, this, "ptr", _Node, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Node} _Node 
     * @returns {HRESULT} 
     */
    Deselect(_Node) {
        result := ComCall(17, this, "ptr", _Node, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Node} _Node 
     * @returns {BOOL} 
     */
    IsSelected(_Node) {
        result := ComCall(18, this, "ptr", _Node, "int*", &IsSelected := 0, "HRESULT")
        return IsSelected
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @returns {HRESULT} 
     */
    DisplayScopeNodePropertySheet(ScopeNode) {
        result := ComCall(19, this, "ptr", ScopeNode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisplaySelectionPropertySheet() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @returns {HRESULT} 
     */
    CopyScopeNode(ScopeNode) {
        result := ComCall(21, this, "ptr", ScopeNode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CopySelection() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @returns {HRESULT} 
     */
    DeleteScopeNode(ScopeNode) {
        result := ComCall(23, this, "ptr", ScopeNode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteSelection() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} NewName 
     * @param {VARIANT} ScopeNode 
     * @returns {HRESULT} 
     */
    RenameScopeNode(NewName, ScopeNode) {
        NewName := NewName is String ? BSTR.Alloc(NewName).Value : NewName

        result := ComCall(25, this, "ptr", NewName, "ptr", ScopeNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} NewName 
     * @returns {HRESULT} 
     */
    RenameSelectedItem(NewName) {
        NewName := NewName is String ? BSTR.Alloc(NewName).Value : NewName

        result := ComCall(26, this, "ptr", NewName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @returns {ContextMenu} 
     */
    get_ScopeNodeContextMenu(ScopeNode) {
        result := ComCall(27, this, "ptr", ScopeNode, "ptr*", &_ContextMenu := 0, "HRESULT")
        return ContextMenu(_ContextMenu)
    }

    /**
     * 
     * @returns {ContextMenu} 
     */
    get_SelectionContextMenu() {
        result := ComCall(28, this, "ptr*", &_ContextMenu := 0, "HRESULT")
        return ContextMenu(_ContextMenu)
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @returns {HRESULT} 
     */
    RefreshScopeNode(ScopeNode) {
        result := ComCall(29, this, "ptr", ScopeNode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RefreshSelection() {
        result := ComCall(30, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} MenuItemPath 
     * @returns {HRESULT} 
     */
    ExecuteSelectionMenuItem(MenuItemPath) {
        MenuItemPath := MenuItemPath is String ? BSTR.Alloc(MenuItemPath).Value : MenuItemPath

        result := ComCall(31, this, "ptr", MenuItemPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} MenuItemPath 
     * @param {VARIANT} ScopeNode 
     * @returns {HRESULT} 
     */
    ExecuteScopeNodeMenuItem(MenuItemPath, ScopeNode) {
        MenuItemPath := MenuItemPath is String ? BSTR.Alloc(MenuItemPath).Value : MenuItemPath

        result := ComCall(32, this, "ptr", MenuItemPath, "ptr", ScopeNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Command 
     * @param {BSTR} Directory 
     * @param {BSTR} Parameters 
     * @param {BSTR} WindowState 
     * @returns {HRESULT} 
     */
    ExecuteShellCommand(Command, Directory, Parameters, WindowState) {
        Command := Command is String ? BSTR.Alloc(Command).Value : Command
        Directory := Directory is String ? BSTR.Alloc(Directory).Value : Directory
        Parameters := Parameters is String ? BSTR.Alloc(Parameters).Value : Parameters
        WindowState := WindowState is String ? BSTR.Alloc(WindowState).Value : WindowState

        result := ComCall(33, this, "ptr", Command, "ptr", Directory, "ptr", Parameters, "ptr", WindowState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Frame} 
     */
    get_Frame() {
        result := ComCall(34, this, "ptr*", &_Frame := 0, "HRESULT")
        return Frame(_Frame)
    }

    /**
     * The Close method of the View object terminates query execution and releases database resources.
     * @remarks
     * This method must be called before the [**Execute**](view-execute.md) method is called again on the [**View**](view-object.md) object unless all rows of the result set have been obtained with the [**Fetch**](view-fetch.md) method. It is called internally when the view is destroyed.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/Msi/view-close
     */
    Close() {
        result := ComCall(35, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_ScopeTreeVisible() {
        result := ComCall(36, this, "int*", &Visible := 0, "HRESULT")
        return Visible
    }

    /**
     * 
     * @param {BOOL} Visible 
     * @returns {HRESULT} 
     */
    put_ScopeTreeVisible(Visible) {
        result := ComCall(37, this, "int", Visible, "HRESULT")
        return result
    }

    /**
     * The BackColor property sets or retrieves the color of the bars that appear around the edges of the video rectangle when the aspect ratio of the native video is not the same as that of the object's display area.
     * @remarks
     * This property is read/write with a default value of off-black (0x100010).
     * @returns {HRESULT} Returns an integer value representing the RGB values of the back color.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/backcolor-property
     */
    Back() {
        result := ComCall(38, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Forward() {
        result := ComCall(39, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} StatusBarText 
     * @returns {HRESULT} 
     */
    put_StatusBarText(StatusBarText) {
        StatusBarText := StatusBarText is String ? BSTR.Alloc(StatusBarText).Value : StatusBarText

        result := ComCall(40, this, "ptr", StatusBarText, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Memento() {
        Memento := BSTR()
        result := ComCall(41, this, "ptr", Memento, "HRESULT")
        return Memento
    }

    /**
     * 
     * @param {BSTR} Memento 
     * @returns {HRESULT} 
     */
    ViewMemento(Memento) {
        Memento := Memento is String ? BSTR.Alloc(Memento).Value : Memento

        result := ComCall(42, this, "ptr", Memento, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Columns} 
     */
    get_Columns() {
        result := ComCall(43, this, "ptr*", &_Columns := 0, "HRESULT")
        return Columns(_Columns)
    }

    /**
     * 
     * @param {Node} _Node 
     * @param {Integer} _Column 
     * @returns {BSTR} 
     */
    get_CellContents(_Node, _Column) {
        CellContents := BSTR()
        result := ComCall(44, this, "ptr", _Node, "int", _Column, "ptr", CellContents, "HRESULT")
        return CellContents
    }

    /**
     * 
     * @param {BSTR} _File 
     * @param {Integer} exportoptions 
     * @returns {HRESULT} 
     */
    ExportList(_File, exportoptions) {
        _File := _File is String ? BSTR.Alloc(_File).Value : _File

        result := ComCall(45, this, "ptr", _File, "int", exportoptions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ListViewMode() {
        result := ComCall(46, this, "int*", &_Mode := 0, "HRESULT")
        return _Mode
    }

    /**
     * 
     * @param {Integer} _mode 
     * @returns {HRESULT} 
     */
    put_ListViewMode(_mode) {
        result := ComCall(47, this, "int", _mode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_ControlObject() {
        result := ComCall(48, this, "ptr*", &Control := 0, "HRESULT")
        return IDispatch(Control)
    }
}
