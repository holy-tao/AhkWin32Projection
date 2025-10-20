#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
     * 
     * @param {Pointer<IUnknown>} owner 
     * @returns {HRESULT} 
     */
    GetOwner(owner) {
        result := ComCall(3, this, "ptr", owner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    GetCount(count) {
        result := ComCall(4, this, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<PWSTR>} key 
     * @param {Pointer<IXpsOMShareable>} entry 
     * @returns {HRESULT} 
     */
    GetAt(index, key, entry) {
        result := ComCall(5, this, "uint", index, "ptr", key, "ptr", entry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {Pointer<IXpsOMShareable>} beforeEntry 
     * @param {Pointer<IXpsOMShareable>} entry 
     * @returns {HRESULT} 
     */
    GetByKey(key, beforeEntry, entry) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(6, this, "ptr", key, "ptr", beforeEntry, "ptr", entry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMShareable>} entry 
     * @param {Pointer<UInt32>} index 
     * @returns {HRESULT} 
     */
    GetIndex(entry, index) {
        result := ComCall(7, this, "ptr", entry, "uint*", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {Pointer<IXpsOMShareable>} entry 
     * @returns {HRESULT} 
     */
    Append(key, entry) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(8, this, "ptr", key, "ptr", entry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {PWSTR} key 
     * @param {Pointer<IXpsOMShareable>} entry 
     * @returns {HRESULT} 
     */
    InsertAt(index, key, entry) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(9, this, "uint", index, "ptr", key, "ptr", entry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    RemoveAt(index) {
        result := ComCall(10, this, "uint", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {PWSTR} key 
     * @param {Pointer<IXpsOMShareable>} entry 
     * @returns {HRESULT} 
     */
    SetAt(index, key, entry) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(11, this, "uint", index, "ptr", key, "ptr", entry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMDictionary>} dictionary 
     * @returns {HRESULT} 
     */
    Clone(dictionary) {
        result := ComCall(12, this, "ptr", dictionary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
