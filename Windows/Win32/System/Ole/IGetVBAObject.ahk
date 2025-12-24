#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Gets access to the IVBFormat interface.
 * @see https://docs.microsoft.com/windows/win32/api//vbinterf/nn-vbinterf-igetvbaobject
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IGetVBAObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetVBAObject
     * @type {Guid}
     */
    static IID => Guid("{91733a60-3f4c-101b-a3f6-00aa0034e4e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObject"]

    /**
     * Gets a pointer to an interface on the VBA object.
     * @param {Pointer<Guid>} riid Specifies the interface to retrieve. Pass <b>IID_IVBFormat</b> to retrieve a pointer to 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/vbinterf/nn-vbinterf-ivbformat">IVBFormat</a> interface.
     * @param {Pointer<Pointer<Void>>} ppvObj Pointer to the interface.
     * @param {Integer} dwReserved Reserved.
     * @returns {HRESULT} This method supports the standard return values <b>E_INVALIDARG</b>, 
     *       <b>E_OUTOFMEMORY</b>, and <b>E_UNEXPECTED</b>, as well as the 
     *       following:
     * @see https://docs.microsoft.com/windows/win32/api//vbinterf/nf-vbinterf-igetvbaobject-getobject
     */
    GetObject(riid, ppvObj, dwReserved) {
        ppvObjMarshal := ppvObj is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", riid, ppvObjMarshal, ppvObj, "uint", dwReserved, "HRESULT")
        return result
    }
}
