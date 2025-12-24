#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IXpsOMShareable.ahk
#Include .\IXpsOMDictionary.ahk

/**
 * The dictionary is used by an XPS package to share resources.
 * @remarks
 * 
 * The interface pointers stored in a dictionary will usually point to interfaces, such as <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsombrush">IXpsOMBrush</a>                 and <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisual">IXpsOMVisual</a>, that are derived from the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomshareable">IXpsOMShareable</a> interface. To determine the interface type, call the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomshareable-gettype">IXpsOMShareable::GetType</a> method.
 * 
 * A dictionary cannot contain duplicate interface pointers.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomdictionary
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMDictionary extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMDictionary
     * @type {Guid}
     */
    static IID => Guid("{897c86b8-8eaf-4ae3-bdde-56419fcf4236}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOwner", "GetCount", "GetAt", "GetByKey", "GetIndex", "Append", "InsertAt", "RemoveAt", "SetAt", "Clone"]

    /**
     * Gets a pointer to the interface that contains the dictionary.
     * @returns {IUnknown} The <b>IUnknown</b> interface of the interface that contains the dictionary.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-getowner
     */
    GetOwner() {
        result := ComCall(3, this, "ptr*", &owner := 0, "HRESULT")
        return IUnknown(owner)
    }

    /**
     * Gets the number of entries in the dictionary.
     * @returns {Integer} The number of entries in the  dictionary.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-getcount
     */
    GetCount() {
        result := ComCall(4, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Gets the IXpsOMShareable interface pointer and the key name string of the entry at a specified index in the dictionary.
     * @param {Integer} index The zero-based index of the dictionary entry that is to be obtained.
     * @param {Pointer<PWSTR>} key The key string that is found at the location specified by <i>index</i>.
     * @returns {IXpsOMShareable} The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomshareable">IXpsOMShareable</a> interface pointer that is found at the location specified by <i>index</i>.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-getat
     */
    GetAt(index, key) {
        keyMarshal := key is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", index, keyMarshal, key, "ptr*", &entry := 0, "HRESULT")
        return IXpsOMShareable(entry)
    }

    /**
     * Gets the IXpsOMShareable interface pointer of the entry that contains the specified key.
     * @param {PWSTR} key The entry's key to be found in the dictionary.
     * @param {IXpsOMShareable} beforeEntry The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomshareable">IXpsOMShareable</a> interface pointer to the last entry in the dictionary which is to be searched for <i>key</i>. If <i>beforeEntry</i> is <b>NULL</b> or is an interface pointer to an entry that is not in the dictionary, the entire dictionary will be searched.
     * @returns {IXpsOMShareable} The interface pointer to the dictionary entry whose key matches <i>key</i>.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-getbykey
     */
    GetByKey(key, beforeEntry) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(6, this, "ptr", key, "ptr", beforeEntry, "ptr*", &entry := 0, "HRESULT")
        return IXpsOMShareable(entry)
    }

    /**
     * Gets the index of an IXpsOMShareable interface from the dictionary.
     * @param {IXpsOMShareable} entry The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomshareable">IXpsOMShareable</a> interface pointer to be found in the dictionary.
     * @returns {Integer} The zero-based index of <i>entry</i> in the dictionary.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-getindex
     */
    GetIndex(entry) {
        result := ComCall(7, this, "ptr", entry, "uint*", &index := 0, "HRESULT")
        return index
    }

    /**
     * Appends an IXpsOMShareable interface along with its key to the end of the dictionary.
     * @param {PWSTR} key The key to be used for this entry.
     * 
     * The string referenced by <i>key</i> must be unique in the dictionary.
     * @param {IXpsOMShareable} entry A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomshareable">IXpsOMShareable</a> interface that is to be appended  to the dictionary.
     * 
     * A dictionary cannot contain duplicate interface pointers. This parameter must contain an interface pointer that is not already in the dictionary.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>entry</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-append
     */
    Append(key, entry) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(8, this, "ptr", key, "ptr", entry, "HRESULT")
        return result
    }

    /**
     * Inserts an IXpsOMShareable interface at a specified location in the dictionary and sets the key to identify the interface.
     * @param {Integer} index The zero-based index in the dictionary where the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomshareable">IXpsOMShareable</a> interface is to be inserted.
     * @param {PWSTR} key The key to be used to identify the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomshareable">IXpsOMShareable</a> interface in the dictionary.
     * 
     * The string referenced by <i>key</i> must be unique in the dictionary.
     * @param {IXpsOMShareable} entry The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomshareable">IXpsOMShareable</a> interface pointer to be inserted at the location specified by <i>index</i>.
     * 
     * A dictionary cannot contain duplicate interface pointers. This parameter must contain an interface pointer that is not already in the dictionary.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>entry</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-insertat
     */
    InsertAt(index, key, entry) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(9, this, "uint", index, "ptr", key, "ptr", entry, "HRESULT")
        return result
    }

    /**
     * Removes and releases the entry from a specified location in the dictionary.
     * @param {Integer} index The zero-based index in the dictionary from which  an entry is to be removed and released.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-removeat
     */
    RemoveAt(index) {
        result := ComCall(10, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * Replaces the entry at a specified location in the dictionary.
     * @param {Integer} index The zero-based index in the dictionary in which an  entry is to be replaced.
     * @param {PWSTR} key The key to be used for the new entry.
     * 
     * The string referenced by <i>key</i> must be unique in the dictionary.
     * @param {IXpsOMShareable} entry The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomshareable">IXpsOMShareable</a> interface pointer that will replace current contents at the location specified by <i>index</i>.
     * 
     * A dictionary cannot contain duplicate interface pointers. This parameter must contain an interface pointer that is not already in the dictionary.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>entry</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-setat
     */
    SetAt(index, key, entry) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(11, this, "uint", index, "ptr", key, "ptr", entry, "HRESULT")
        return result
    }

    /**
     * Makes a deep copy of the interface.
     * @returns {IXpsOMDictionary} A pointer to the copy of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-clone
     */
    Clone() {
        result := ComCall(12, this, "ptr*", &dictionary := 0, "HRESULT")
        return IXpsOMDictionary(dictionary)
    }
}
