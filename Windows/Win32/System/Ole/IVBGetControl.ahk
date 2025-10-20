#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides access to all the controls on a Visual Basic container.
 * @see https://docs.microsoft.com/windows/win32/api//vbinterf/nn-vbinterf-ivbgetcontrol
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IVBGetControl extends IUnknown{
    /**
     * The interface identifier for IVBGetControl
     * @type {Guid}
     */
    static IID => Guid("{40a050a0-3c31-101b-a82e-08002b2b2337}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwOleContF 
     * @param {Integer} dwWhich 
     * @param {Pointer<IEnumUnknown>} ppenumUnk 
     * @returns {HRESULT} 
     */
    EnumControls(dwOleContF, dwWhich, ppenumUnk) {
        result := ComCall(3, this, "uint", dwOleContF, "uint", dwWhich, "ptr", ppenumUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
