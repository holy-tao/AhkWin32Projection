#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of name strings.
 * @remarks
 * For more information about the collection methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nn-xpsobjectmodel-ixpsomnamecollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMNameCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMNameCollection
     * @type {Guid}
     */
    static IID => Guid("{4bddf8ec-c915-421b-a166-d173d25653d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt"]

    /**
     * Gets the number of name strings in the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @returns {Integer} The number of name strings in the collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomnamecollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return count
    }

    /**
     * Gets the name string that is stored at a specified location in the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * 
     * This method allocates the memory used by the string that is returned in <i>name</i>.  If <i>name</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @param {Integer} index The zero-based index of the collection that contains the name string to be obtained.
     * @returns {PWSTR} The name string at the location specified by <i>index</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomnamecollection-getat
     */
    GetAt(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &name := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return name
    }
}
