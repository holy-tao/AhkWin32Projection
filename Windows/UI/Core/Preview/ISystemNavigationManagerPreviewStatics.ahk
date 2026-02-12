#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SystemNavigationManagerPreview.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core.Preview
 * @version WindowsRuntime 1.4
 */
class ISystemNavigationManagerPreviewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemNavigationManagerPreviewStatics
     * @type {Guid}
     */
    static IID => Guid("{0e971360-df74-4bce-84cb-bd1181ac0a71}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForCurrentView"]

    /**
     * 
     * @returns {SystemNavigationManagerPreview} 
     */
    GetForCurrentView() {
        result := ComCall(6, this, "ptr*", &loader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemNavigationManagerPreview(loader)
    }
}
