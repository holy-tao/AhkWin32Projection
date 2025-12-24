#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumComponentTypes.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IEnumComponentTypes interface is implemented on a standard COM collection of ComponentType objects associated with a given broadcast stream, and returned through a call to IComponentTypes::EnumComponentTypes.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IEnumComponentTypes)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ienumcomponenttypes
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IEnumComponentTypes extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumComponentTypes
     * @type {Guid}
     */
    static IID => Guid("{8a674b4a-1f63-11d3-b64c-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * The Next method retrieves the next n elements in the collection.
     * @param {Integer} celt The number of elements to retrieve.
     * @param {Pointer<IComponentType>} rgelt Address of an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttype">IComponentType</a> interface pointers that will receive the returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd693036(v=vs.85)">ComponentType</a> objects.
     * @param {Pointer<Integer>} pceltFetched Receives the number of elements actually retrieved.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ienumcomponenttypes-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * The Skip method skips the element at the specified index.
     * @param {Integer} celt Index of the element to skip.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ienumcomponenttypes-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The Reset method moves the iterator to the beginning of the collection.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ienumcomponenttypes-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a new copy of the collection and all its sub-objects.
     * @returns {IEnumComponentTypes} Address of an <b>IEnumComponentTypes</b> interface pointer that will be set to the returned collection object.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ienumcomponenttypes-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumComponentTypes(ppEnum)
    }
}
