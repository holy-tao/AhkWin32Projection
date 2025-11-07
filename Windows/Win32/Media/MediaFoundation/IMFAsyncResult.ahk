#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides information about the result of an asynchronous operation.
 * @remarks
 * 
  * Use this interface to complete an asynchronous operation. You get a pointer to this interface when your callback object's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method is called. To complete the operation, pass the <b>IMFAsyncResult</b> pointer to the <b>End...</b> method that corresponds to the <b>Begin...</b> method that starts the operation. For example, if the asynchronous method is named <b>BeginRead</b>, call the <b>EndRead</b> method. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/calling-asynchronous-methods">Calling Asynchronous Methods</a>.
  * 
  * If you are implementing an asynchronous method, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateasyncresult">MFCreateAsyncResult</a> to create an instance of this object. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/writing-an-asynchronous-method">Writing an Asynchronous Method</a>.
  * 
  * Any custom implementation of this interface must inherit the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ns-mfapi-mfasyncresult">MFASYNCRESULT</a> structure.
  * 
  * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
  * 
  * <ul>
  * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
  * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfasyncresult
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFAsyncResult extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFAsyncResult
     * @type {Guid}
     */
    static IID => Guid("{ac6b7889-0740-4d51-8619-905994a55cc6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetState", "GetStatus", "SetStatus", "GetObject", "GetStateNoAddRef"]

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfasyncresult-getstate
     */
    GetState() {
        result := ComCall(3, this, "ptr*", &ppunkState := 0, "HRESULT")
        return IUnknown(ppunkState)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfasyncresult-getstatus
     */
    GetStatus() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfasyncresult-setstatus
     */
    SetStatus(hrStatus) {
        result := ComCall(5, this, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject() {
        result := ComCall(6, this, "ptr*", &ppObject := 0, "HRESULT")
        return IUnknown(ppObject)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfasyncresult-getstatenoaddref
     */
    GetStateNoAddRef() {
        result := ComCall(7, this, "ptr")
        return result
    }
}
