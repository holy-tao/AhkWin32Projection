#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\Document.ahk" { Document }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\_ExportListOptions.ahk" { _ExportListOptions }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\Columns.ahk" { Columns }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\_ListViewMode.ahk" { _ListViewMode }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\Nodes.ahk" { Nodes }
#Import ".\Frame.ahk" { Frame }
#Import ".\Node.ahk" { Node }
#Import ".\ContextMenu.ahk" { ContextMenu }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * The View object represents a result set obtained when processing a query using the OpenView method of the Database object.
 * @see https://learn.microsoft.com/windows/win32/Msi/view-object
 * @namespace Windows.Win32.System.Mmc
 */
export default struct View extends IDispatch {
    /**
     * The interface identifier for View
     * @type {Guid}
     */
    static IID := Guid("{6efc2da2-b38c-457e-9abb-ed2d189b8c38}")

    /**
     * The class identifier for View
     * @type {Guid}
     */
    static CLSID := Guid("{6efc2da2-b38c-457e-9abb-ed2d189b8c38}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for View interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ActiveScopeNode           : IntPtr
        put_ActiveScopeNode           : IntPtr
        get_Selection                 : IntPtr
        get_ListItems                 : IntPtr
        SnapinScopeObject             : IntPtr
        SnapinSelectionObject         : IntPtr
        Is                            : IntPtr
        get_Document                  : IntPtr
        SelectAll                     : IntPtr
        Select                        : IntPtr
        Deselect                      : IntPtr
        IsSelected                    : IntPtr
        DisplayScopeNodePropertySheet : IntPtr
        DisplaySelectionPropertySheet : IntPtr
        CopyScopeNode                 : IntPtr
        CopySelection                 : IntPtr
        DeleteScopeNode               : IntPtr
        DeleteSelection               : IntPtr
        RenameScopeNode               : IntPtr
        RenameSelectedItem            : IntPtr
        get_ScopeNodeContextMenu      : IntPtr
        get_SelectionContextMenu      : IntPtr
        RefreshScopeNode              : IntPtr
        RefreshSelection              : IntPtr
        ExecuteSelectionMenuItem      : IntPtr
        ExecuteScopeNodeMenuItem      : IntPtr
        ExecuteShellCommand           : IntPtr
        get_Frame                     : IntPtr
        Close                         : IntPtr
        get_ScopeTreeVisible          : IntPtr
        put_ScopeTreeVisible          : IntPtr
        Back                          : IntPtr
        Forward                       : IntPtr
        put_StatusBarText             : IntPtr
        get_Memento                   : IntPtr
        ViewMemento                   : IntPtr
        get_Columns                   : IntPtr
        get_CellContents              : IntPtr
        ExportList                    : IntPtr
        get_ListViewMode              : IntPtr
        put_ListViewMode              : IntPtr
        get_ControlObject             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := View.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {BSTR} 
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
     * @type {_ListViewMode} 
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
        result := ComCall(11, this, VARIANT, ScopeNode, "ptr*", &ScopeNodeObject := 0, "HRESULT")
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
     * 
     * @param {View} _View 
     * @returns {VARIANT_BOOL} 
     */
    Is(_View) {
        result := ComCall(13, this, "ptr", _View, VARIANT_BOOL.Ptr, &TheSame := 0, "HRESULT")
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
        result := ComCall(18, this, "ptr", _Node, BOOL.Ptr, &IsSelected := 0, "HRESULT")
        return IsSelected
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @returns {HRESULT} 
     */
    DisplayScopeNodePropertySheet(ScopeNode) {
        result := ComCall(19, this, VARIANT, ScopeNode, "HRESULT")
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
        result := ComCall(21, this, VARIANT, ScopeNode, "HRESULT")
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
        result := ComCall(23, this, VARIANT, ScopeNode, "HRESULT")
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

        result := ComCall(25, this, BSTR, NewName, VARIANT, ScopeNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} NewName 
     * @returns {HRESULT} 
     */
    RenameSelectedItem(NewName) {
        NewName := NewName is String ? BSTR.Alloc(NewName).Value : NewName

        result := ComCall(26, this, BSTR, NewName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @returns {ContextMenu} 
     */
    get_ScopeNodeContextMenu(ScopeNode) {
        result := ComCall(27, this, VARIANT, ScopeNode, "ptr*", &_ContextMenu := 0, "HRESULT")
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
        result := ComCall(29, this, VARIANT, ScopeNode, "HRESULT")
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

        result := ComCall(31, this, BSTR, MenuItemPath, "HRESULT")
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

        result := ComCall(32, this, BSTR, MenuItemPath, VARIANT, ScopeNode, "HRESULT")
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

        result := ComCall(33, this, BSTR, Command, BSTR, Directory, BSTR, Parameters, BSTR, WindowState, "HRESULT")
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
        result := ComCall(36, this, BOOL.Ptr, &Visible := 0, "HRESULT")
        return Visible
    }

    /**
     * 
     * @param {BOOL} Visible 
     * @returns {HRESULT} 
     */
    put_ScopeTreeVisible(Visible) {
        result := ComCall(37, this, BOOL, Visible, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
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

        result := ComCall(40, this, BSTR, StatusBarText, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Memento() {
        Memento := BSTR.Owned()
        result := ComCall(41, this, BSTR.Ptr, Memento, "HRESULT")
        return Memento
    }

    /**
     * 
     * @param {BSTR} Memento 
     * @returns {HRESULT} 
     */
    ViewMemento(Memento) {
        Memento := Memento is String ? BSTR.Alloc(Memento).Value : Memento

        result := ComCall(42, this, BSTR, Memento, "HRESULT")
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
        CellContents := BSTR.Owned()
        result := ComCall(44, this, "ptr", _Node, "int", _Column, BSTR.Ptr, CellContents, "HRESULT")
        return CellContents
    }

    /**
     * 
     * @param {BSTR} _File 
     * @param {_ExportListOptions} exportoptions 
     * @returns {HRESULT} 
     */
    ExportList(_File, exportoptions) {
        _File := _File is String ? BSTR.Alloc(_File).Value : _File

        result := ComCall(45, this, BSTR, _File, _ExportListOptions, exportoptions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {_ListViewMode} 
     */
    get_ListViewMode() {
        result := ComCall(46, this, "int*", &_Mode := 0, "HRESULT")
        return _Mode
    }

    /**
     * 
     * @param {_ListViewMode} _mode 
     * @returns {HRESULT} 
     */
    put_ListViewMode(_mode) {
        result := ComCall(47, this, _ListViewMode, _mode, "HRESULT")
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

    Query(iid) {
        if (View.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ActiveScopeNode := CallbackCreate(GetMethod(implObj, "get_ActiveScopeNode"), flags, 2)
        this.vtbl.put_ActiveScopeNode := CallbackCreate(GetMethod(implObj, "put_ActiveScopeNode"), flags, 2)
        this.vtbl.get_Selection := CallbackCreate(GetMethod(implObj, "get_Selection"), flags, 2)
        this.vtbl.get_ListItems := CallbackCreate(GetMethod(implObj, "get_ListItems"), flags, 2)
        this.vtbl.SnapinScopeObject := CallbackCreate(GetMethod(implObj, "SnapinScopeObject"), flags, 3)
        this.vtbl.SnapinSelectionObject := CallbackCreate(GetMethod(implObj, "SnapinSelectionObject"), flags, 2)
        this.vtbl.Is := CallbackCreate(GetMethod(implObj, "Is"), flags, 3)
        this.vtbl.get_Document := CallbackCreate(GetMethod(implObj, "get_Document"), flags, 2)
        this.vtbl.SelectAll := CallbackCreate(GetMethod(implObj, "SelectAll"), flags, 1)
        this.vtbl.Select := CallbackCreate(GetMethod(implObj, "Select"), flags, 2)
        this.vtbl.Deselect := CallbackCreate(GetMethod(implObj, "Deselect"), flags, 2)
        this.vtbl.IsSelected := CallbackCreate(GetMethod(implObj, "IsSelected"), flags, 3)
        this.vtbl.DisplayScopeNodePropertySheet := CallbackCreate(GetMethod(implObj, "DisplayScopeNodePropertySheet"), flags, 2)
        this.vtbl.DisplaySelectionPropertySheet := CallbackCreate(GetMethod(implObj, "DisplaySelectionPropertySheet"), flags, 1)
        this.vtbl.CopyScopeNode := CallbackCreate(GetMethod(implObj, "CopyScopeNode"), flags, 2)
        this.vtbl.CopySelection := CallbackCreate(GetMethod(implObj, "CopySelection"), flags, 1)
        this.vtbl.DeleteScopeNode := CallbackCreate(GetMethod(implObj, "DeleteScopeNode"), flags, 2)
        this.vtbl.DeleteSelection := CallbackCreate(GetMethod(implObj, "DeleteSelection"), flags, 1)
        this.vtbl.RenameScopeNode := CallbackCreate(GetMethod(implObj, "RenameScopeNode"), flags, 3)
        this.vtbl.RenameSelectedItem := CallbackCreate(GetMethod(implObj, "RenameSelectedItem"), flags, 2)
        this.vtbl.get_ScopeNodeContextMenu := CallbackCreate(GetMethod(implObj, "get_ScopeNodeContextMenu"), flags, 3)
        this.vtbl.get_SelectionContextMenu := CallbackCreate(GetMethod(implObj, "get_SelectionContextMenu"), flags, 2)
        this.vtbl.RefreshScopeNode := CallbackCreate(GetMethod(implObj, "RefreshScopeNode"), flags, 2)
        this.vtbl.RefreshSelection := CallbackCreate(GetMethod(implObj, "RefreshSelection"), flags, 1)
        this.vtbl.ExecuteSelectionMenuItem := CallbackCreate(GetMethod(implObj, "ExecuteSelectionMenuItem"), flags, 2)
        this.vtbl.ExecuteScopeNodeMenuItem := CallbackCreate(GetMethod(implObj, "ExecuteScopeNodeMenuItem"), flags, 3)
        this.vtbl.ExecuteShellCommand := CallbackCreate(GetMethod(implObj, "ExecuteShellCommand"), flags, 5)
        this.vtbl.get_Frame := CallbackCreate(GetMethod(implObj, "get_Frame"), flags, 2)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
        this.vtbl.get_ScopeTreeVisible := CallbackCreate(GetMethod(implObj, "get_ScopeTreeVisible"), flags, 2)
        this.vtbl.put_ScopeTreeVisible := CallbackCreate(GetMethod(implObj, "put_ScopeTreeVisible"), flags, 2)
        this.vtbl.Back := CallbackCreate(GetMethod(implObj, "Back"), flags, 1)
        this.vtbl.Forward := CallbackCreate(GetMethod(implObj, "Forward"), flags, 1)
        this.vtbl.put_StatusBarText := CallbackCreate(GetMethod(implObj, "put_StatusBarText"), flags, 2)
        this.vtbl.get_Memento := CallbackCreate(GetMethod(implObj, "get_Memento"), flags, 2)
        this.vtbl.ViewMemento := CallbackCreate(GetMethod(implObj, "ViewMemento"), flags, 2)
        this.vtbl.get_Columns := CallbackCreate(GetMethod(implObj, "get_Columns"), flags, 2)
        this.vtbl.get_CellContents := CallbackCreate(GetMethod(implObj, "get_CellContents"), flags, 4)
        this.vtbl.ExportList := CallbackCreate(GetMethod(implObj, "ExportList"), flags, 3)
        this.vtbl.get_ListViewMode := CallbackCreate(GetMethod(implObj, "get_ListViewMode"), flags, 2)
        this.vtbl.put_ListViewMode := CallbackCreate(GetMethod(implObj, "put_ListViewMode"), flags, 2)
        this.vtbl.get_ControlObject := CallbackCreate(GetMethod(implObj, "get_ControlObject"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ActiveScopeNode)
        CallbackFree(this.vtbl.put_ActiveScopeNode)
        CallbackFree(this.vtbl.get_Selection)
        CallbackFree(this.vtbl.get_ListItems)
        CallbackFree(this.vtbl.SnapinScopeObject)
        CallbackFree(this.vtbl.SnapinSelectionObject)
        CallbackFree(this.vtbl.Is)
        CallbackFree(this.vtbl.get_Document)
        CallbackFree(this.vtbl.SelectAll)
        CallbackFree(this.vtbl.Select)
        CallbackFree(this.vtbl.Deselect)
        CallbackFree(this.vtbl.IsSelected)
        CallbackFree(this.vtbl.DisplayScopeNodePropertySheet)
        CallbackFree(this.vtbl.DisplaySelectionPropertySheet)
        CallbackFree(this.vtbl.CopyScopeNode)
        CallbackFree(this.vtbl.CopySelection)
        CallbackFree(this.vtbl.DeleteScopeNode)
        CallbackFree(this.vtbl.DeleteSelection)
        CallbackFree(this.vtbl.RenameScopeNode)
        CallbackFree(this.vtbl.RenameSelectedItem)
        CallbackFree(this.vtbl.get_ScopeNodeContextMenu)
        CallbackFree(this.vtbl.get_SelectionContextMenu)
        CallbackFree(this.vtbl.RefreshScopeNode)
        CallbackFree(this.vtbl.RefreshSelection)
        CallbackFree(this.vtbl.ExecuteSelectionMenuItem)
        CallbackFree(this.vtbl.ExecuteScopeNodeMenuItem)
        CallbackFree(this.vtbl.ExecuteShellCommand)
        CallbackFree(this.vtbl.get_Frame)
        CallbackFree(this.vtbl.Close)
        CallbackFree(this.vtbl.get_ScopeTreeVisible)
        CallbackFree(this.vtbl.put_ScopeTreeVisible)
        CallbackFree(this.vtbl.Back)
        CallbackFree(this.vtbl.Forward)
        CallbackFree(this.vtbl.put_StatusBarText)
        CallbackFree(this.vtbl.get_Memento)
        CallbackFree(this.vtbl.ViewMemento)
        CallbackFree(this.vtbl.get_Columns)
        CallbackFree(this.vtbl.get_CellContents)
        CallbackFree(this.vtbl.ExportList)
        CallbackFree(this.vtbl.get_ListViewMode)
        CallbackFree(this.vtbl.put_ListViewMode)
        CallbackFree(this.vtbl.get_ControlObject)
    }
}
