#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enable clients to access items in a collection of objects that support IUnknown.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Clients do not need to implement this interface.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * Use this interface to access generic objects in an array.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//objectarray/nn-objectarray-iobjectarray
 * @namespace Windows.Win32.UI.Shell.Common
 * @version v4.0.30319
 */
class IObjectArray extends IUnknown{
    /**
     * The interface identifier for IObjectArray
     * @type {Guid}
     */
    static IID => Guid("{92ca9dcd-5622-4bba-a805-5e9f541bd8c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pcObjects 
     * @returns {HRESULT} 
     */
    GetCount(pcObjects) {
        result := ComCall(3, this, "uint*", pcObjects, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetAt(uiIndex, riid, ppv) {
        result := ComCall(4, this, "uint", uiIndex, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
