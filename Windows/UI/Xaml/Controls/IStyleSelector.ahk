#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Style.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IStyleSelector extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStyleSelector
     * @type {Guid}
     */
    static IID => Guid("{d1113f67-d8c1-4ae4-98f0-d8504502f08b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SelectStyle"]

    /**
     * 
     * @param {IInspectable} item 
     * @param {DependencyObject} container 
     * @returns {Style} 
     */
    SelectStyle(item, container) {
        result := ComCall(6, this, "ptr", item, "ptr", container, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Style(result_)
    }
}
