#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods used for progress notification for encoders and decoders.
 * @remarks
 * This interface is not supported by the Windows provided codecs.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicbitmapcodecprogressnotification
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapCodecProgressNotification extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICBitmapCodecProgressNotification
     * @type {Guid}
     */
    static IID => Guid("{64c1024e-c3cf-4462-8078-88c2b11c46d9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterProgressNotification"]

    /**
     * Registers a progress notification callback function.
     * @remarks
     * Applications can only register a single callback. Subsequent registration calls will replace the previously registered callback. To unregister a callback, pass in <b>NULL</b> or register a new callback function.
     * 
     * Progress is reported in an increasing order between 0.0 and 1.0. 
     *             If <i>dwProgressFlags</i> includes <b>WICProgressNotificationBegin</b>, the callback is guaranteed to be called with progress 0.0.
     *             If <i>dwProgressFlags</i> includes <b>WICProgressNotificationEnd</b>, the callback is guaranteed to be called with progress 1.0.
     *          
     * 
     * <b>WICProgressNotificationFrequent</b> increases the frequency in which the callback is called.
     *             If an operation is expected to take more than 30 seconds, <b>WICProgressNotificationFrequent</b> should be added to <i>dwProgressFlags</i>.
     * @param {Pointer<PFNProgressNotification>} _pfnProgressNotification 
     * @param {Pointer<Void>} pvData Type: <b>LPVOID</b>
     * 
     * A pointer to component data for the callback method.
     * @param {Integer} dwProgressFlags Type: <b>DWORD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicprogressoperation">WICProgressOperation</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicprogressnotification">WICProgressNotification</a> flags to use for progress notification.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecprogressnotification-registerprogressnotification
     */
    RegisterProgressNotification(_pfnProgressNotification, pvData, dwProgressFlags) {
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", _pfnProgressNotification, pvDataMarshal, pvData, "uint", dwProgressFlags, "HRESULT")
        return result
    }
}
