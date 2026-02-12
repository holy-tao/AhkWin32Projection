#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ActionEntity.ahk
#Include .\ITableActionEntity.ahk
#Include ..\..\..\Guid.ahk

/**
 * A subtype of [ActionEntity](actionentity.md) that represents a two-dimensional table of string values.
 * @remarks
 * Create an instance of this class by calling [ActionEntityFactory.CreateTableEntity](actionentityfactory_createtableentity_1260648862.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.tableactionentity
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class TableActionEntity extends ActionEntity {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITableActionEntity

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITableActionEntity.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of rows in the table.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.tableactionentity.rowcount
     * @type {Integer} 
     */
    RowCount {
        get => this.get_RowCount()
    }

    /**
     * Gets the number of columns in the table.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.tableactionentity.columncount
     * @type {Integer} 
     */
    ColumnCount {
        get => this.get_ColumnCount()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets a one-dimensional array of string values representing a two-dimensional string table.
     * @remarks
     * Use the [RowCount](tableactionentity_rowcount.md) and [ColumnCount](tableactionentity_columncount.md) properties to calculate the two-dimensional coordinates of table entries from the array index.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} An array of string values.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.tableactionentity.gettextcontent
     */
    GetTextContent(result_) {
        if (!this.HasProp("__ITableActionEntity")) {
            if ((queryResult := this.QueryInterface(ITableActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITableActionEntity := ITableActionEntity(outPtr)
        }

        return this.__ITableActionEntity.GetTextContent(result_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RowCount() {
        if (!this.HasProp("__ITableActionEntity")) {
            if ((queryResult := this.QueryInterface(ITableActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITableActionEntity := ITableActionEntity(outPtr)
        }

        return this.__ITableActionEntity.get_RowCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColumnCount() {
        if (!this.HasProp("__ITableActionEntity")) {
            if ((queryResult := this.QueryInterface(ITableActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITableActionEntity := ITableActionEntity(outPtr)
        }

        return this.__ITableActionEntity.get_ColumnCount()
    }

;@endregion Instance Methods
}
