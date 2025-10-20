#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Implement this interface to receive notifications of the current write operation.
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-ddiscformat2dataevents
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class DDiscFormat2DataEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DDiscFormat2DataEvents
     * @type {Guid}
     */
    static IID => Guid("{2735413c-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The class identifier for DDiscFormat2DataEvents
     * @type {Guid}
     */
    static CLSID => Guid("{2735413c-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Update"]

    /**
     * 
     * @param {IDispatch} object 
     * @param {IDispatch} progress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-ddiscformat2dataevents-update
     */
    Update(object, progress) {
        result := ComCall(7, this, "ptr", object, "ptr", progress, "HRESULT")
        return result
    }
}
