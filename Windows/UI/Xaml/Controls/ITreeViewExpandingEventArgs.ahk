#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\TreeViewNode.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITreeViewExpandingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITreeViewExpandingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{c5e1fa63-4154-49d2-a21f-c34176605e3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Node"]

    /**
     * @type {TreeViewNode} 
     */
    Node {
        get => this.get_Node()
    }

    /**
     * 
     * @returns {TreeViewNode} 
     */
    get_Node() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TreeViewNode(value)
    }
}
