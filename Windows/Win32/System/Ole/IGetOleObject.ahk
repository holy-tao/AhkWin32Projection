#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Gets access to an OLE control on a Visual Basic container.
 * @see https://docs.microsoft.com/windows/win32/api//vbinterf/nn-vbinterf-igetoleobject
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IGetOleObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetOleObject
     * @type {Guid}
     */
    static IID => Guid("{8a701da0-4feb-101b-a82e-08002b2b2337}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOleObject"]

    /**
     * Gets a pointer to an OLE control on a Visual Basic container.
     * @param {Pointer<Guid>} riid Specifies the interface to retrieve. Pass <b>IID_IOleObject</b> to obtain a pointer to 
     *       the control.
     * @param {Pointer<Pointer<Void>>} ppvObj Pointer to the control.
     * @returns {HRESULT} This method supports the standard return values <b>E_INVALIDARG</b>, 
     *       <b>E_OUTOFMEMORY</b>, and <b>E_UNEXPECTED</b>, as well as the 
     *       following:
     * @see https://docs.microsoft.com/windows/win32/api//vbinterf/nf-vbinterf-igetoleobject-getoleobject
     */
    GetOleObject(riid, ppvObj) {
        ppvObjMarshal := ppvObj is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", riid, ppvObjMarshal, ppvObj, "HRESULT")
        return result
    }
}
