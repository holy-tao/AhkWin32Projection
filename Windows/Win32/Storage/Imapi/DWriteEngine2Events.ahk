#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Implement this interface to receive notifications of the current write operation. (DWriteEngine2Events)
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-dwriteengine2events
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
     * Implement this method to receive progress notification of the current write operation. (DWriteEngine2Events.Update)
     * @remarks
     * Notifications are sent in response to calling the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-iwriteengine2-writesection">IWriteEngine2::WriteSection</a> method.
     * 
     * Notification is sent:
     * 
     * <ul>
     * <li>Once before the operation begins</li>
     * <li>Every 0.5 seconds during the write operation</li>
     * <li>Once after the operation completes</li>
     * </ul>
     * To stop the write process, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-iwriteengine2-cancelwrite">IWriteEngine2::CancelWrite</a> method.
     * @param {IDispatch} _object 
     * @param {IDispatch} progress An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-iwriteengine2eventargs">IWriteEngine2EventArgs</a> interface that you use to determine the progress of the write operation. 
     * 
     * This parameter is a <b>MsftWriteEngine2</b> object in script.
     * @returns {HRESULT} Return values are ignored.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-dwriteengine2events-update
     */
    Update(_object, progress) {
        result := ComCall(7, this, "ptr", _object, "ptr", progress, "HRESULT")
        return result
    }
}
