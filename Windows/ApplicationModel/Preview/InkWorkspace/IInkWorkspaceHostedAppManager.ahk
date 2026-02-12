#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Preview.InkWorkspace
 * @version WindowsRuntime 1.4
 */
class IInkWorkspaceHostedAppManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkWorkspaceHostedAppManager
     * @type {Guid}
     */
    static IID => Guid("{fe0a7990-5e59-4bb7-8a63-7d218cd96300}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetThumbnailAsync"]

    /**
     * 
     * @param {SoftwareBitmap} bitmap_ 
     * @returns {IAsyncAction} 
     */
    SetThumbnailAsync(bitmap_) {
        result := ComCall(6, this, "ptr", bitmap_, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }
}
