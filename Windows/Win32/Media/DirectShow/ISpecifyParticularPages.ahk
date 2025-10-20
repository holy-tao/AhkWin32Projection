#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class ISpecifyParticularPages extends IUnknown{
    /**
     * The interface identifier for ISpecifyParticularPages
     * @type {Guid}
     */
    static IID => Guid("{4c437b91-6e9e-11d1-a704-006097c4e476}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} guidWhatPages 
     * @param {Pointer<CAUUID>} pPages 
     * @returns {HRESULT} 
     */
    GetPages(guidWhatPages, pPages) {
        result := ComCall(3, this, "ptr", guidWhatPages, "ptr", pPages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
