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
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-getowner
     */
    GetOwner() {
        result := ComCall(3, this, "ptr*", &owner := 0, "HRESULT")
        return IUnknown(owner)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-getcount
     */
    GetCount() {
        result := ComCall(4, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<PWSTR>} key 
     * @returns {IXpsOMShareable} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-getat
     */
    GetAt(index, key) {
        keyMarshal := key is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", index, keyMarshal, key, "ptr*", &entry := 0, "HRESULT")
        return IXpsOMShareable(entry)
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {IXpsOMShareable} beforeEntry 
     * @returns {IXpsOMShareable} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-getbykey
     */
    GetByKey(key, beforeEntry) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(6, this, "ptr", key, "ptr", beforeEntry, "ptr*", &entry := 0, "HRESULT")
        return IXpsOMShareable(entry)
    }

    /**
     * 
     * @param {IXpsOMShareable} entry 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-getindex
     */
    GetIndex(entry) {
        result := ComCall(7, this, "ptr", entry, "uint*", &index := 0, "HRESULT")
        return index
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {IXpsOMShareable} entry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-append
     */
    Append(key, entry) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(8, this, "ptr", key, "ptr", entry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {PWSTR} key 
     * @param {IXpsOMShareable} entry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-insertat
     */
    InsertAt(index, key, entry) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(9, this, "uint", index, "ptr", key, "ptr", entry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-removeat
     */
    RemoveAt(index) {
        result := ComCall(10, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {PWSTR} key 
     * @param {IXpsOMShareable} entry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-setat
     */
    SetAt(index, key, entry) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(11, this, "uint", index, "ptr", key, "ptr", entry, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsOMDictionary} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-clone
     */
    Clone() {
        result := ComCall(12, this, "ptr*", &dictionary := 0, "HRESULT")
        return IXpsOMDictionary(dictionary)
    }
}
