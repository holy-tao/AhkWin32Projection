#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITuneRequestInfo.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ITuneRequestInfoEx extends ITuneRequestInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITuneRequestInfoEx
     * @type {Guid}
     */
    static IID => Guid("{ee957c52-b0d0-4e78-8dd1-b87a08bfd893}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateComponentListEx"]

    /**
     * 
     * @param {ITuneRequest} CurrentRequest 
     * @param {Pointer<IUnknown>} ppCurPMT 
     * @returns {HRESULT} 
     */
    CreateComponentListEx(CurrentRequest, ppCurPMT) {
        result := ComCall(10, this, "ptr", CurrentRequest, "ptr*", ppCurPMT, "HRESULT")
        return result
    }
}
