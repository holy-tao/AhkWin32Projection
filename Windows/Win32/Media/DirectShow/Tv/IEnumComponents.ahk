#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumComponents.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IEnumComponents interface provides a standard COM enumeration object for the components (substreams) in a given program stream.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IEnumComponents)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ienumcomponents
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IEnumComponents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumComponents
     * @type {Guid}
     */
    static IID => Guid("{2a6e2939-2595-11d3-b64c-00c04f79498e}")

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
     * 
     * @param {Integer} celt 
     * @param {Pointer<IComponent>} rgelt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ienumcomponents-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ienumcomponents-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ienumcomponents-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumComponents} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ienumcomponents-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumComponents(ppEnum)
    }
}
