#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BitmapTypedValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class IBitmapTypedValueFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapTypedValueFactory
     * @type {Guid}
     */
    static IID => Guid("{92dbb599-ce13-46bb-9545-cb3a3f63eb8b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {IInspectable} value 
     * @param {Integer} type 
     * @returns {BitmapTypedValue} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(value, type) {
        result := ComCall(6, this, "ptr", value, "int", type, "ptr*", &bitmapTypedValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BitmapTypedValue(bitmapTypedValue_)
    }
}
