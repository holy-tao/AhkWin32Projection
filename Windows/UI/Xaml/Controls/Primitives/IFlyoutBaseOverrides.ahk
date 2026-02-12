#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\Control.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IFlyoutBaseOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFlyoutBaseOverrides
     * @type {Guid}
     */
    static IID => Guid("{101dec86-6f4d-45a4-9d0e-3ece6f16977e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePresenter"]

    /**
     * 
     * @returns {Control} 
     */
    CreatePresenter() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Control(result_)
    }
}
