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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt"]

    /**
     * Provides a count of the objects in the collection.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The number of objects in the collection.
     * @see https://docs.microsoft.com/windows/win32/api//objectarray/nf-objectarray-iobjectarray-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pcObjects := 0, "HRESULT")
        return pcObjects
    }

    /**
     * Provides a pointer to a specified object's interface. The object and interface are specified by index and interface ID.
     * @param {Integer} uiIndex Type: <b>UINT</b>
     * 
     * The index of the object
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the desired interface ID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives the interface pointer requested in <i>riid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//objectarray/nf-objectarray-iobjectarray-getat
     */
    GetAt(uiIndex, riid) {
        result := ComCall(4, this, "uint", uiIndex, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
