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
 * View Object Properties, Methods, and Events
 * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/view-object-properties-methods-and-events
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
        result := ComCall(7, this, "ptr*", &Node_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Node(Node_)
    }

    /**
     * 
     * @param {Node} Node_ 
     * @returns {HRESULT} 
     */
    put_ActiveScopeNode(Node_) {
        result := ComCall(8, this, "ptr", Node_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Nodes} 
     */
    get_Selection() {
        result := ComCall(9, this, "ptr*", &Nodes_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Nodes(Nodes_)
    }

    /**
     * 
     * @returns {Nodes} 
     */
    get_ListItems() {
        result := ComCall(10, this, "ptr*", &Nodes_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Nodes(Nodes_)
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @returns {IDispatch} 
     */
    SnapinScopeObject(ScopeNode) {
        result := ComCall(11, this, "ptr", ScopeNode, "ptr*", &ScopeNodeObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(ScopeNodeObject)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    SnapinSelectionObject() {
        result := ComCall(12, this, "ptr*", &SelectionObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(SelectionObject)
    }

    /**
     * The Is\_Protected attribute is a file-level attribute specifying whether the content in the file was protected using digital rights management (DRM).
     * @remarks
     * This is a coded attribute. Retrieving this property provides the same information as calling [**WMIsContentProtected**](/previous-versions/windows/desktop/api/Wmsdkidl/nf-wmsdkidl-wmiscontentprotected).
     * 
     * This attribute cannot be duplicated at the file level. If this attribute is used for an individual stream, it will be treated as custom metadata and will not convey its normal meaning to the objects of the Windows Media Format SDK.
     * @param {View} View_ 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/is-protected
     */
    Is(View_) {
        result := ComCall(13, this, "ptr", View_, "short*", &TheSame := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TheSame
    }

    /**
     * 
     * @returns {Document} 
     */
    get_Document() {
        result := ComCall(14, this, "ptr*", &Document_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Document(Document_)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SelectAll() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * An XPath query that identifies the events to include in the query result set.
     * @param {Node} Node_ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WES/queryschema-select-querytype-element
     */
    Select(Node_) {
        result := ComCall(16, this, "ptr", Node_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Node} Node_ 
     * @returns {HRESULT} 
     */
    Deselect(Node_) {
        result := ComCall(17, this, "ptr", Node_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Node} Node_ 
     * @returns {BOOL} 
     */
    IsSelected(Node_) {
        result := ComCall(18, this, "ptr", Node_, "int*", &IsSelected := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IsSelected
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @returns {HRESULT} 
     */
    DisplayScopeNodePropertySheet(ScopeNode) {
        result := ComCall(19, this, "ptr", ScopeNode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisplaySelectionPropertySheet() {
        result := ComCall(20, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @returns {HRESULT} 
     */
    CopyScopeNode(ScopeNode) {
        result := ComCall(21, this, "ptr", ScopeNode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CopySelection() {
        result := ComCall(22, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @returns {HRESULT} 
     */
    DeleteScopeNode(ScopeNode) {
        result := ComCall(23, this, "ptr", ScopeNode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteSelection() {
        result := ComCall(24, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} NewName 
     * @param {VARIANT} ScopeNode 
     * @returns {HRESULT} 
     */
    RenameScopeNode(NewName, ScopeNode) {
        if(NewName is String) {
            pin := BSTR.Alloc(NewName)
            NewName := pin.Value
        }

        result := ComCall(25, this, "ptr", NewName, "ptr", ScopeNode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} NewName 
     * @returns {HRESULT} 
     */
    RenameSelectedItem(NewName) {
        if(NewName is String) {
            pin := BSTR.Alloc(NewName)
            NewName := pin.Value
        }

        result := ComCall(26, this, "ptr", NewName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @returns {ContextMenu} 
     */
    get_ScopeNodeContextMenu(ScopeNode) {
        result := ComCall(27, this, "ptr", ScopeNode, "ptr*", &ContextMenu_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContextMenu(ContextMenu_)
    }

    /**
     * 
     * @returns {ContextMenu} 
     */
    get_SelectionContextMenu() {
        result := ComCall(28, this, "ptr*", &ContextMenu_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContextMenu(ContextMenu_)
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @returns {HRESULT} 
     */
    RefreshScopeNode(ScopeNode) {
        result := ComCall(29, this, "ptr", ScopeNode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RefreshSelection() {
        result := ComCall(30, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} MenuItemPath 
     * @returns {HRESULT} 
     */
    ExecuteSelectionMenuItem(MenuItemPath) {
        if(MenuItemPath is String) {
            pin := BSTR.Alloc(MenuItemPath)
            MenuItemPath := pin.Value
        }

        result := ComCall(31, this, "ptr", MenuItemPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} MenuItemPath 
     * @param {VARIANT} ScopeNode 
     * @returns {HRESULT} 
     */
    ExecuteScopeNodeMenuItem(MenuItemPath, ScopeNode) {
        if(MenuItemPath is String) {
            pin := BSTR.Alloc(MenuItemPath)
            MenuItemPath := pin.Value
        }

        result := ComCall(32, this, "ptr", MenuItemPath, "ptr", ScopeNode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(Command is String) {
            pin := BSTR.Alloc(Command)
            Command := pin.Value
        }
        if(Directory is String) {
            pin := BSTR.Alloc(Directory)
            Directory := pin.Value
        }
        if(Parameters is String) {
            pin := BSTR.Alloc(Parameters)
            Parameters := pin.Value
        }
        if(WindowState is String) {
            pin := BSTR.Alloc(WindowState)
            WindowState := pin.Value
        }

        result := ComCall(33, this, "ptr", Command, "ptr", Directory, "ptr", Parameters, "ptr", WindowState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Frame} 
     */
    get_Frame() {
        result := ComCall(34, this, "ptr*", &Frame_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Frame(Frame_)
    }

    /**
     * The Close method of the View object terminates query execution and releases database resources.
     * @remarks
     * This method must be called before the [**Execute**](view-execute.md) method is called again on the [**View**](view-object.md) object unless all rows of the result set have been obtained with the [**Fetch**](view-fetch.md) method. It is called internally when the view is destroyed.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Msi/view-close
     */
    Close() {
        result := ComCall(35, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_ScopeTreeVisible() {
        result := ComCall(36, this, "int*", &Visible := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Visible
    }

    /**
     * 
     * @param {BOOL} Visible 
     * @returns {HRESULT} 
     */
    put_ScopeTreeVisible(Visible) {
        result := ComCall(37, this, "int", Visible, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a new instance of the [BackClickEventArgs](backclickeventargs.md) class.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.backclickeventargs.#ctor
     */
    Back() {
        result := ComCall(38, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Forward() {
        result := ComCall(39, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} StatusBarText 
     * @returns {HRESULT} 
     */
    put_StatusBarText(StatusBarText) {
        if(StatusBarText is String) {
            pin := BSTR.Alloc(StatusBarText)
            StatusBarText := pin.Value
        }

        result := ComCall(40, this, "ptr", StatusBarText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Memento() {
        Memento := BSTR()
        result := ComCall(41, this, "ptr", Memento, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Memento
    }

    /**
     * 
     * @param {BSTR} Memento 
     * @returns {HRESULT} 
     */
    ViewMemento(Memento) {
        if(Memento is String) {
            pin := BSTR.Alloc(Memento)
            Memento := pin.Value
        }

        result := ComCall(42, this, "ptr", Memento, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Columns} 
     */
    get_Columns() {
        result := ComCall(43, this, "ptr*", &Columns_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Columns(Columns_)
    }

    /**
     * 
     * @param {Node} Node_ 
     * @param {Integer} Column_ 
     * @returns {BSTR} 
     */
    get_CellContents(Node_, Column_) {
        CellContents := BSTR()
        result := ComCall(44, this, "ptr", Node_, "int", Column_, "ptr", CellContents, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CellContents
    }

    /**
     * 
     * @param {BSTR} File_ 
     * @param {Integer} exportoptions 
     * @returns {HRESULT} 
     */
    ExportList(File_, exportoptions) {
        if(File_ is String) {
            pin := BSTR.Alloc(File_)
            File_ := pin.Value
        }

        result := ComCall(45, this, "ptr", File_, "int", exportoptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ListViewMode() {
        result := ComCall(46, this, "int*", &Mode_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Mode_
    }

    /**
     * 
     * @param {Integer} mode_ 
     * @returns {HRESULT} 
     */
    put_ListViewMode(mode_) {
        result := ComCall(47, this, "int", mode_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_ControlObject() {
        result := ComCall(48, this, "ptr*", &Control := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(Control)
    }
}
