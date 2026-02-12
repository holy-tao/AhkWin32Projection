#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\Column.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Columns Collection Properties, Methods, and Events
 * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/columns-collection-properties-methods-and-events
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class Columns extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Columns
     * @type {Guid}
     */
    static IID => Guid("{383d4d97-fc44-478b-b139-6323dc48611c}")

    /**
     * The class identifier for Columns
     * @type {Guid}
     */
    static CLSID => Guid("{383d4d97-fc44-478b-b139-6323dc48611c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Item", "get_Count", "get__NewEnum"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Windows Image Acquisition (WIA) hardware devices are represented as hierarchical trees of Item objects. The root item in this tree represents the device itself, while child items represent images, folders, or scanning beds.
     * @remarks
     * The **Item** object has these types of members:
     * 
     * -   [Methods](#methods)
     * -   [Properties](#properties)
     * @param {Integer} Index 
     * @returns {Column} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-item
     */
    Item(Index) {
        result := ComCall(7, this, "int", Index, "ptr*", &Column_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Column(Column_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(8, this, "int*", &Count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Count
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(retval)
    }
}
