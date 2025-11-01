#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that allows enumeration of a collection of handlers associated with particular file name extensions.
 * @remarks
 * 
  * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shassocenumhandlers">SHAssocEnumHandlers</a> is the usual method of creating an IEnumAssocHandlers pointer.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ienumassochandlers
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IEnumAssocHandlers extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumAssocHandlers
     * @type {Guid}
     */
    static IID => Guid("{973810ae-9599-4b88-9e4d-6ee98c9552da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<IAssocHandler>} rgelt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumassochandlers-next
     */
    Next(celt, rgelt, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr*", rgelt, "uint*", pceltFetched, "HRESULT")
        return result
    }
}
