#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables retrieving an agile reference to an object.
 * @remarks
 * 
  * Call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-rogetagilereference">RoGetAgileReference</a> function to create an agile reference to an object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iagilereference
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IAgileReference extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAgileReference
     * @type {Guid}
     */
    static IID => Guid("{c03f6a43-65a4-9818-987e-e0b810d2a6f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Resolve"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObjectReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WinRT/iagilereference-resolve
     */
    Resolve(riid, ppvObjectReference) {
        ppvObjectReferenceMarshal := ppvObjectReference is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", riid, ppvObjectReferenceMarshal, ppvObjectReference, "HRESULT")
        return result
    }
}
