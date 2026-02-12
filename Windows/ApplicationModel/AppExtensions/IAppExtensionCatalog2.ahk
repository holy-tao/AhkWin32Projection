#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\AppExtension.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.AppExtensions
 * @version WindowsRuntime 1.4
 */
class IAppExtensionCatalog2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppExtensionCatalog2
     * @type {Guid}
     */
    static IID => Guid("{50056eba-58b6-4147-b5a5-8feca6dfb49d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindAll"]

    /**
     * 
     * @returns {IVectorView<AppExtension>} 
     */
    FindAll() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(AppExtension, result_)
    }
}
