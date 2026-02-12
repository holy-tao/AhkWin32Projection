#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GroupStyle.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IGroupStyleSelector extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGroupStyleSelector
     * @type {Guid}
     */
    static IID => Guid("{6dda119e-9a74-478f-a339-5bb52de6c51e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SelectGroupStyle"]

    /**
     * 
     * @param {IInspectable} group 
     * @param {Integer} level 
     * @returns {GroupStyle} 
     */
    SelectGroupStyle(group, level) {
        result := ComCall(6, this, "ptr", group, "uint", level, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GroupStyle(result_)
    }
}
