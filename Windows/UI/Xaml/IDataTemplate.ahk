#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DependencyObject.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines helper methods for phased rendering of a data template.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.idatatemplateextension
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IDataTemplate extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataTemplate
     * @type {Guid}
     */
    static IID => Guid("{9910aec7-8ab5-4118-9bc6-09f45a35073d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadContent"]

    /**
     * 
     * @returns {DependencyObject} 
     */
    LoadContent() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(result_)
    }
}
