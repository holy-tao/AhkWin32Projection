#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMFontResource.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of IXpsOMFontResource interface pointers.
 * @remarks
 * 
 * For more information about the collection methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresourcecollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMFontResourceCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMFontResourceCollection
     * @type {Guid}
     */
    static IID => Guid("{70b4a6bb-88d4-4fa8-aaf9-6d9c596fdbad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "SetAt", "InsertAt", "Append", "RemoveAt", "GetByPartName"]

    /**
     * Gets the number of IXpsOMFontResource interface pointers in the collection.
     * @returns {Integer} The number of <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresource">IXpsOMFontResource</a> interface pointers in the collection.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresourcecollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Gets an IXpsOMFontResource interface pointer from a specified location in the collection.
     * @param {Integer} index The zero-based index of the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresource">IXpsOMFontResource</a> interface pointer to be obtained.
     * @returns {IXpsOMFontResource} The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresource">IXpsOMFontResource</a> interface pointer at the location specified by <i>index</i>.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresourcecollection-getat
     */
    GetAt(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &value := 0, "HRESULT")
        return IXpsOMFontResource(value)
    }

    /**
     * Replaces an IXpsOMFontResource interface pointer at a specified location in the collection.
     * @param {Integer} index The zero-based index in the collection where an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresource">IXpsOMFontResource</a> interface pointer is to be replaced.
     * @param {IXpsOMFontResource} value The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresource">IXpsOMFontResource</a> interface pointer that will replace current contents at the location specified by <i>index</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresourcecollection-setat
     */
    SetAt(index, value) {
        result := ComCall(5, this, "uint", index, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Inserts an IXpsOMFontResource interface pointer at a specified location in the collection.
     * @param {Integer} index The zero-based index in the collection where the interface pointer that is passed in <i>value</i>  is to be inserted.
     * @param {IXpsOMFontResource} value The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresource">IXpsOMFontResource</a> interface pointer that is to be inserted at the location specified by <i>index</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresourcecollection-insertat
     */
    InsertAt(index, value) {
        result := ComCall(6, this, "uint", index, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Appends an IXpsOMFontResource interface to the end of the collection.
     * @param {IXpsOMFontResource} value A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresource">IXpsOMFontResource</a> interface that is to be appended to the collection.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresourcecollection-append
     */
    Append(value) {
        result := ComCall(7, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Removes and releases an IXpsOMFontResource interface pointer from a specified location in the collection.
     * @param {Integer} index The zero-based index in the collection from which  an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresource">IXpsOMFontResource</a> interface pointer is to be removed and released.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresourcecollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(8, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * Gets an IXpsOMFontResource interface pointer from the collection by matching the interface's part name.
     * @param {IOpcPartUri} partName The part name of the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresource">IXpsOMFontResource</a> interface to be found in the collection.
     * @returns {IXpsOMFontResource} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresource">IXpsOMFontResource</a> interface that has the matching part name. If a matching interface is not found in the collection, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresourcecollection-getbypartname
     */
    GetByPartName(partName) {
        result := ComCall(9, this, "ptr", partName, "ptr*", &part := 0, "HRESULT")
        return IXpsOMFontResource(part)
    }
}
