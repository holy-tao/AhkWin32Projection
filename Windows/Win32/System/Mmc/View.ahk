#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class View extends IDispatch{
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
     * 
     * @param {Pointer<Node>} Node 
     * @returns {HRESULT} 
     */
    get_ActiveScopeNode(Node) {
        result := ComCall(7, this, "ptr", Node, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Node>} Node 
     * @returns {HRESULT} 
     */
    put_ActiveScopeNode(Node) {
        result := ComCall(8, this, "ptr", Node, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Nodes>} Nodes 
     * @returns {HRESULT} 
     */
    get_Selection(Nodes) {
        result := ComCall(9, this, "ptr", Nodes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Nodes>} Nodes 
     * @returns {HRESULT} 
     */
    get_ListItems(Nodes) {
        result := ComCall(10, this, "ptr", Nodes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @param {Pointer<IDispatch>} ScopeNodeObject 
     * @returns {HRESULT} 
     */
    SnapinScopeObject(ScopeNode, ScopeNodeObject) {
        result := ComCall(11, this, "ptr", ScopeNode, "ptr", ScopeNodeObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} SelectionObject 
     * @returns {HRESULT} 
     */
    SnapinSelectionObject(SelectionObject) {
        result := ComCall(12, this, "ptr", SelectionObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<View>} View 
     * @param {Pointer<VARIANT_BOOL>} TheSame 
     * @returns {HRESULT} 
     */
    Is(View, TheSame) {
        result := ComCall(13, this, "ptr", View, "ptr", TheSame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Document>} Document 
     * @returns {HRESULT} 
     */
    get_Document(Document) {
        result := ComCall(14, this, "ptr", Document, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SelectAll() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Node>} Node 
     * @returns {HRESULT} 
     */
    Select(Node) {
        result := ComCall(16, this, "ptr", Node, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Node>} Node 
     * @returns {HRESULT} 
     */
    Deselect(Node) {
        result := ComCall(17, this, "ptr", Node, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Node>} Node 
     * @param {Pointer<BOOL>} IsSelected 
     * @returns {HRESULT} 
     */
    IsSelected(Node, IsSelected) {
        result := ComCall(18, this, "ptr", Node, "ptr", IsSelected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @returns {HRESULT} 
     */
    DisplayScopeNodePropertySheet(ScopeNode) {
        result := ComCall(19, this, "ptr", ScopeNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisplaySelectionPropertySheet() {
        result := ComCall(20, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @returns {HRESULT} 
     */
    CopyScopeNode(ScopeNode) {
        result := ComCall(21, this, "ptr", ScopeNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CopySelection() {
        result := ComCall(22, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @returns {HRESULT} 
     */
    DeleteScopeNode(ScopeNode) {
        result := ComCall(23, this, "ptr", ScopeNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteSelection() {
        result := ComCall(24, this, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(25, this, "ptr", NewName, "ptr", ScopeNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} NewName 
     * @returns {HRESULT} 
     */
    RenameSelectedItem(NewName) {
        NewName := NewName is String ? BSTR.Alloc(NewName).Value : NewName

        result := ComCall(26, this, "ptr", NewName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @param {Pointer<ContextMenu>} ContextMenu 
     * @returns {HRESULT} 
     */
    get_ScopeNodeContextMenu(ScopeNode, ContextMenu) {
        result := ComCall(27, this, "ptr", ScopeNode, "ptr", ContextMenu, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ContextMenu>} ContextMenu 
     * @returns {HRESULT} 
     */
    get_SelectionContextMenu(ContextMenu) {
        result := ComCall(28, this, "ptr", ContextMenu, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} ScopeNode 
     * @returns {HRESULT} 
     */
    RefreshScopeNode(ScopeNode) {
        result := ComCall(29, this, "ptr", ScopeNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RefreshSelection() {
        result := ComCall(30, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} MenuItemPath 
     * @returns {HRESULT} 
     */
    ExecuteSelectionMenuItem(MenuItemPath) {
        MenuItemPath := MenuItemPath is String ? BSTR.Alloc(MenuItemPath).Value : MenuItemPath

        result := ComCall(31, this, "ptr", MenuItemPath, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(32, this, "ptr", MenuItemPath, "ptr", ScopeNode, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(33, this, "ptr", Command, "ptr", Directory, "ptr", Parameters, "ptr", WindowState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Frame>} Frame 
     * @returns {HRESULT} 
     */
    get_Frame(Frame) {
        result := ComCall(34, this, "ptr", Frame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(35, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} Visible 
     * @returns {HRESULT} 
     */
    get_ScopeTreeVisible(Visible) {
        result := ComCall(36, this, "ptr", Visible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Visible 
     * @returns {HRESULT} 
     */
    put_ScopeTreeVisible(Visible) {
        result := ComCall(37, this, "int", Visible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Back() {
        result := ComCall(38, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Forward() {
        result := ComCall(39, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} StatusBarText 
     * @returns {HRESULT} 
     */
    put_StatusBarText(StatusBarText) {
        StatusBarText := StatusBarText is String ? BSTR.Alloc(StatusBarText).Value : StatusBarText

        result := ComCall(40, this, "ptr", StatusBarText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Memento 
     * @returns {HRESULT} 
     */
    get_Memento(Memento) {
        result := ComCall(41, this, "ptr", Memento, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Memento 
     * @returns {HRESULT} 
     */
    ViewMemento(Memento) {
        Memento := Memento is String ? BSTR.Alloc(Memento).Value : Memento

        result := ComCall(42, this, "ptr", Memento, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Columns>} Columns 
     * @returns {HRESULT} 
     */
    get_Columns(Columns) {
        result := ComCall(43, this, "ptr", Columns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Node>} Node 
     * @param {Integer} Column 
     * @param {Pointer<BSTR>} CellContents 
     * @returns {HRESULT} 
     */
    get_CellContents(Node, Column, CellContents) {
        result := ComCall(44, this, "ptr", Node, "int", Column, "ptr", CellContents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} File 
     * @param {Integer} exportoptions 
     * @returns {HRESULT} 
     */
    ExportList(File, exportoptions) {
        File := File is String ? BSTR.Alloc(File).Value : File

        result := ComCall(45, this, "ptr", File, "int", exportoptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Mode 
     * @returns {HRESULT} 
     */
    get_ListViewMode(Mode) {
        result := ComCall(46, this, "int*", Mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    put_ListViewMode(mode) {
        result := ComCall(47, this, "int", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} Control 
     * @returns {HRESULT} 
     */
    get_ControlObject(Control) {
        result := ComCall(48, this, "ptr", Control, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
