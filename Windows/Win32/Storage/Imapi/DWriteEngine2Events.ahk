#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Implement this interface to receive notifications of the current write operation.
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-dwriteengine2events
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class DWriteEngine2Events extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DWriteEngine2Events
     * @type {Guid}
     */
    static IID => Guid("{27354137-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The class identifier for DWriteEngine2Events
     * @type {Guid}
     */
    static CLSID => Guid("{27354137-7f64-5b0f-8f00-5d77afbe261e}")

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
     * Implement this method to receive progress notification of the current write operation.
     * @param {IDispatch} object The <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-iwriteengine2">IWriteEngine2</a> interface that initiated the write operation. 
     * 
     * This parameter is a <b>MsftWriteEngine2</b> object in script.
     * @param {IDispatch} progress An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-iwriteengine2eventargs">IWriteEngine2EventArgs</a> interface that you use to determine the progress of the write operation. 
     * 
     * This parameter is a <b>MsftWriteEngine2</b> object in script.
     * @returns {HRESULT} Return values are ignored.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-dwriteengine2events-update
     */
    Update(object, progress) {
        result := ComCall(7, this, "ptr", object, "ptr", progress, "HRESULT")
        return result
    }
}
