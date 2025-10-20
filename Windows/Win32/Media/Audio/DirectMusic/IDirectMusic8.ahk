#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDirectMusic.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusic8 extends IDirectMusic{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectMusic8
     * @type {Guid}
     */
    static IID => Guid("{2d3629f7-813d-4939-8508-f05c6b75fd97}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetExternalMasterClock"]

    /**
     * 
     * @param {IReferenceClock} pClock 
     * @returns {HRESULT} 
     */
    SetExternalMasterClock(pClock) {
        result := ComCall(12, this, "ptr", pClock, "HRESULT")
        return result
    }
}
