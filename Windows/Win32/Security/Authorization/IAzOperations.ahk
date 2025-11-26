#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents a collection of IAzOperation objects.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazoperations
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzOperations extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzOperations
     * @type {Guid}
     */
    static IID => Guid("{90ef9c07-9706-49d9-af80-0438a5f3ec35}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Item", "get_Count", "get__NewEnum"]

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
     * Retrieves the IAzOperation object at the specified index into the IAzOperations collection.
     * @param {Integer} Index 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazoperations-get_item
     */
    get_Item(Index) {
        pvarObtPtr := VARIANT()
        result := ComCall(7, this, "int", Index, "ptr", pvarObtPtr, "HRESULT")
        return pvarObtPtr
    }

    /**
     * Retrieves the number of IAzOperation objects in the collection.
     * @remarks
     * 
     * The <b>Count</b> property can be used to specify the last <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazoperation">IAzOperation</a> object in a collection when retrieving a specific <b>IAzOperation</b> object using the  <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazoperations-get_item">IAzOperations.Item</a> property.
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazoperations-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * The _NewEnum property of IAzOperations retrieves an IEnumVARIANT interface on an object that can be used to enumerate the collection. This property is hidden within Visual Basic and Visual Basic Scripting Edition (VBScript).
     * @remarks
     * 
     * This property is provided for use by the <c>For Each</code> keyword in Visual Basic and the <code>foreach</c> keyword in Visual C#.
     * 
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazoperations-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnumPtr := 0, "HRESULT")
        return IUnknown(ppEnumPtr)
    }
}
