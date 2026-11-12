#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Gets access to an OLE control on a Visual Basic container.
 * @see https://learn.microsoft.com/windows/win32/api/vbinterf/nn-vbinterf-igetoleobject
 * @namespace Windows.Win32.System.Ole
 */
class IGetOleObject extends IUnknown {

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
     * @returns {Pointer<Void>} Pointer to the control.
     * @see https://learn.microsoft.com/windows/win32/api/vbinterf/nf-vbinterf-igetoleobject-getoleobject
     */
    GetOleObject(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &ppvObj := 0, "HRESULT")
        return ppvObj
    }
}
