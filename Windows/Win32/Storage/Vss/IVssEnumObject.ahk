#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Contains methods to iterate over and perform other operations on a list of enumerated objects.
 * @see https://docs.microsoft.com/windows/win32/api//vss/nn-vss-ivssenumobject
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssEnumObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssEnumObject
     * @type {Guid}
     */
    static IID => Guid("{ae1c7110-2f60-11d3-8a39-00c04f72d8e3}")

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
     * @param {Pointer<VSS_OBJECT_PROP>} rgelt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vss/nf-vss-ivssenumobject-next
     */
    Next(celt, rgelt, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", rgelt, "uint*", pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vss/nf-vss-ivssenumobject-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vss/nf-vss-ivssenumobject-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVssEnumObject>} ppenum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vss/nf-vss-ivssenumobject-clone
     */
    Clone(ppenum) {
        result := ComCall(6, this, "ptr*", ppenum, "HRESULT")
        return result
    }
}
