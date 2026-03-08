#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumContextProps.ahk
#Include .\IUnknown.ahk

/**
 * The IEnumContextProps (objidlbase.h) interface provides a mechanism for enumerating the context properties associated with a COM+ object context.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-ienumcontextprops
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IEnumContextProps extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumContextProps
     * @type {Guid}
     */
    static IID => Guid("{000001c1-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone", "Count"]

    /**
     * The IEnumContextProps::Next (objidlbase.h) method retrieves the specified number of items in the enumeration sequence.
     * @param {Integer} celt The number of items to be retrieved. If there are fewer than the requested number of items left in the sequence, this method retrieves the remaining elements.
     * @param {Pointer<ContextProperty>} pContextProperties An array of enumerated items.
     * 
     * The enumerator is responsible for allocating any memory, and the caller is responsible for freeing it. If <i>celt</i> is greater than 1, the caller must also pass a non-NULL pointer passed to <i>pceltFetched</i> to know how many pointers to release.
     * @param {Pointer<Integer>} pceltFetched The number of items that were retrieved. This parameter is always less than or equal to the number of items requested.
     * @returns {HRESULT} If the method retrieves the number of items requested, the return value is S_OK. Otherwise, it is S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumcontextprops-next
     */
    Next(celt, pContextProperties, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", pContextProperties, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * The IEnumContextProps::Skip (objidlbase.h) method skips over the specified number of items in the enumeration sequence.
     * @param {Integer} celt The number of items to be skipped.
     * @returns {HRESULT} If the method skips the number of items requested, the return value is S_OK. Otherwise, it is S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumcontextprops-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The IEnumContextProps::Reset (objidlbase.h) method resets the enumeration sequence to the beginning.
     * @remarks
     * There is no guarantee that the same set of objects will be enumerated after the reset operation has completed. A static collection is reset to the beginning, but it can be too expensive for some collections, such as files in a directory, to guarantee this condition.
     * @returns {HRESULT} The return value is S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumcontextprops-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The IEnumContextProps::Clone (objidlbase.h) method creates a new enumerator that contains the same enumeration state as the current one.
     * @returns {IEnumContextProps} A pointer to the cloned enumerator object.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumcontextprops-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnumContextProps := 0, "HRESULT")
        return IEnumContextProps(ppEnumContextProps)
    }

    /**
     * The IEnumContextProps::Count (objidlbase.h) method retrieves the number of context properties in the context.
     * @returns {Integer} The count of items in the sequence.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumcontextprops-count
     */
    Count() {
        result := ComCall(7, this, "uint*", &pcelt := 0, "HRESULT")
        return pcelt
    }
}
