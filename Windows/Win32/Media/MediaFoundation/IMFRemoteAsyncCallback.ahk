#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used by the Microsoft Media Foundation proxy/stub DLL to marshal certain asynchronous method calls across process boundaries.Applications do not use or implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfremoteasynccallback
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFRemoteAsyncCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFRemoteAsyncCallback
     * @type {Guid}
     */
    static IID => Guid("{a27003d0-2354-4f2a-8d6a-ab7cff15437e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * 
     * @param {HRESULT} hr 
     * @param {IUnknown} pRemoteResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfremoteasynccallback
     */
    Invoke(hr, pRemoteResult) {
        result := ComCall(3, this, "int", hr, "ptr", pRemoteResult, "HRESULT")
        return result
    }
}
