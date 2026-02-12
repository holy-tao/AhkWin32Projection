#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\RowDefinitionCollection.ahk
#Include .\ColumnDefinitionCollection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to individual child controls of containers that implement IGridProvider.
 * @remarks
 * Implemented on a UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementinggriditem">GridItem</a> <i>control pattern</i>.
 *    			
 * 
 * Controls that implement <b>IGridItemProvider</b> can typically be traversed 
 *             (that is, a UI Automation client can move to adjacent controls) by using the keyboard.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nn-uiautomationcore-igriditemprovider
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IGrid extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGrid
     * @type {Guid}
     */
    static IID => Guid("{fd104460-2e15-4ba3-8b8f-fa693a4161e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RowDefinitions", "get_ColumnDefinitions"]

    /**
     * @type {RowDefinitionCollection} 
     */
    RowDefinitions {
        get => this.get_RowDefinitions()
    }

    /**
     * @type {ColumnDefinitionCollection} 
     */
    ColumnDefinitions {
        get => this.get_ColumnDefinitions()
    }

    /**
     * 
     * @returns {RowDefinitionCollection} 
     */
    get_RowDefinitions() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RowDefinitionCollection(value)
    }

    /**
     * 
     * @returns {ColumnDefinitionCollection} 
     */
    get_ColumnDefinitions() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ColumnDefinitionCollection(value)
    }
}
