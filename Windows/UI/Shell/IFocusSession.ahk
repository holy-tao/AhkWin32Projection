#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class IFocusSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFocusSession
     * @type {Guid}
     */
    static IID => Guid("{069fbab8-0e84-5f2f-8614-9b6544326277}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "End"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Indicates whether a line has an arrowhead or other line end format at its last vertex.
     * @remarks
     * You can also set this value in the **Line** dialog box (on the **Home** tab, in the **Shape** group, click **Line**, point to **Arrows**, and then click **More Arrows**). The size of the arrowhead is set in the EndArrowSize cell.
     *   
     * You can specify a custom line end using the USE function in this cell. 
     *   
     * To get a reference to the EndArrow cell by name from another formula, or from a program using the **CellsU** property, use: 
     *   
     * ||Value |
     * |:-----|:-----|
     * |**Cell name:**  <br/> |EndArrow  <br/> |
     *    
     * To get a reference to the EndArrow cell by index from a program, use the **CellsSRC** property with the following arguments: 
     *   
     * ||Value |
     * |:-----|:-----|
     * |**Section index:**  <br/> |**visSectionObject** <br/> |
     * |**Row index:**  <br/> |**visRowLine** <br/> |
     * |**Cell index:**  <br/> |**visLineEndArrow** <br/> |
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/endarrow-cell-line-format-section
     */
    End() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
