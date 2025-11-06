#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Ole\CAUUID.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class ISpecifyParticularPages extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPages"]

    /**
     * 
     * @param {Pointer<Guid>} guidWhatPages 
     * @returns {CAUUID} 
     */
    GetPages(guidWhatPages) {
        pPages := CAUUID()
        result := ComCall(3, this, "ptr", guidWhatPages, "ptr", pPages, "HRESULT")
        return pPages
    }
}
