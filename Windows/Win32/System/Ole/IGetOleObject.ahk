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
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObj 
     * @returns {HRESULT} 
     */
    GetOleObject(riid, ppvObj) {
        result := ComCall(3, this, "ptr", riid, "ptr", ppvObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
