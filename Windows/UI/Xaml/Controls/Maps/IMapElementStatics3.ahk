#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapElementStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapElementStatics3
     * @type {Guid}
     */
    static IID => Guid("{e11ee92f-9742-49aa-aad8-2e466bff3796}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MapStyleSheetEntryProperty", "get_MapStyleSheetEntryStateProperty", "get_TagProperty"]

    /**
     * @type {DependencyProperty} 
     */
    MapStyleSheetEntryProperty {
        get => this.get_MapStyleSheetEntryProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MapStyleSheetEntryStateProperty {
        get => this.get_MapStyleSheetEntryStateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TagProperty {
        get => this.get_TagProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MapStyleSheetEntryProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MapStyleSheetEntryStateProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TagProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
