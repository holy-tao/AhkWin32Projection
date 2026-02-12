#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IFocusManagerStatics7 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFocusManagerStatics7
     * @type {Guid}
     */
    static IID => Guid("{95d6fa97-f0fc-5c32-b29d-07c04ec966b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFocusedElement"]

    /**
     * 
     * @param {XamlRoot} xamlRoot_ 
     * @returns {IInspectable} 
     */
    GetFocusedElement(xamlRoot_) {
        result := ComCall(6, this, "ptr", xamlRoot_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }
}
