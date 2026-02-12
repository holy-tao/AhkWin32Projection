#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Syndication\ISyndicationText.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ResourceCollection.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods that provide information about a connection in RemoteApp and Desktop Connection.
 * @see https://learn.microsoft.com/windows/win32/api//content/workspaceruntime/nn-workspaceruntime-iworkspace
 * @namespace Windows.Web.AtomPub
 * @version WindowsRuntime 1.4
 */
class IWorkspace extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWorkspace
     * @type {Guid}
     */
    static IID => Guid("{b41da63b-a4b8-4036-89c5-83c31266ba49}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Title", "get_Collections"]

    /**
     * @type {ISyndicationText} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * @type {IVectorView<ResourceCollection>} 
     */
    Collections {
        get => this.get_Collections()
    }

    /**
     * 
     * @returns {ISyndicationText} 
     */
    get_Title() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISyndicationText(value)
    }

    /**
     * 
     * @returns {IVectorView<ResourceCollection>} 
     */
    get_Collections() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ResourceCollection, value)
    }
}
