#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAsyncResult.ahk

/**
 * Contains data that is needed to implement the IMFAsyncResult interface.
 * @remarks
 * 
 * Any custom implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface must inherit this structure. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/custom-asynchronous-result-objects">Custom Asynchronous Result Objects</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ns-mfapi-mfasyncresult
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFASYNCRESULT extends IMFAsyncResult{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
