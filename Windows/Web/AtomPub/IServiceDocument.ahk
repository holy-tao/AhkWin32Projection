#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\Workspace.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.AtomPub
 * @version WindowsRuntime 1.4
 */
class IServiceDocument extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServiceDocument
     * @type {Guid}
     */
    static IID => Guid("{8b7ec771-2ab3-4dbe-8bcc-778f92b75e51}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Workspaces"]

    /**
     * @type {IVectorView<Workspace>} 
     */
    Workspaces {
        get => this.get_Workspaces()
    }

    /**
     * 
     * @returns {IVectorView<Workspace>} 
     */
    get_Workspaces() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Workspace, value)
    }
}
