#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ERROR_ADVISE_RESULT enumeration type indicates the type of error values that can be assigned to the pnErrorAdviseResult parameter of IPhotoAcquireProgressCB::ErrorAdvise.
 * @remarks
 * 
 * The type of response allowed is of type <a href="https://docs.microsoft.com/windows/win32/api/photoacquire/ne-photoacquire-error_advise_message_type">ERROR_ADVISE_MESSAGE_TYPE</a>, and indicated by the <i>nMessageType</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-erroradvise">IPhotoAcquireProgressCB::ErrorAdvise</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/ne-photoacquire-error_advise_result
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class ERROR_ADVISE_RESULT{

    /**
     * Specifies a Yes response to an error dialog. Valid only if the <i>nMessageType</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-erroradvise">IPhotoAcquireProgressCB::ErrorAdvise</a> is PHOTOACQUIRE_ERROR_YESNO.
     * @type {Integer (Int32)}
     */
    static PHOTOACQUIRE_RESULT_YES => 0

    /**
     * Specifies a No response to an error dialog. Valid only if the <i>nMessageType</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-erroradvise">IPhotoAcquireProgressCB::ErrorAdvise</a> is PHOTOACQUIRE_ERROR_YESNO.
     * @type {Integer (Int32)}
     */
    static PHOTOACQUIRE_RESULT_NO => 1

    /**
     * Specifies an OK response to an error dialog. Valid only if the <i>nMessageType</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-erroradvise">IPhotoAcquireProgressCB::ErrorAdvise</a> is PHOTOACQUIRE_ERROR_OK.
     * @type {Integer (Int32)}
     */
    static PHOTOACQUIRE_RESULT_OK => 2

    /**
     * Specifies a Skip response to an error dialog. Valid only if the <i>nMessageType</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-erroradvise">IPhotoAcquireProgressCB::ErrorAdvise</a> is PHOTOACQUIRE_ERROR_SKIPRETRYCANCEL.
     * @type {Integer (Int32)}
     */
    static PHOTOACQUIRE_RESULT_SKIP => 3

    /**
     * Specifies a Skip All response to an error dialog. Valid only if the <i>nMessageType</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-erroradvise">IPhotoAcquireProgressCB::ErrorAdvise</a> is PHOTOACQUIRE_ERROR_SKIPRETRYCANCEL.
     * @type {Integer (Int32)}
     */
    static PHOTOACQUIRE_RESULT_SKIP_ALL => 4

    /**
     * Specifies a Retry response to an error dialog. Valid only if the <i>nMessageType</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-erroradvise">IPhotoAcquireProgressCB::ErrorAdvise</a> is PHOTOACQUIRE_ERROR_SKIPRETRYCANCEL or PHOTOACQUIRE_ERROR_RETRYCANCEL.
     * @type {Integer (Int32)}
     */
    static PHOTOACQUIRE_RESULT_RETRY => 5

    /**
     * Specifies a Cancel response to an error dialog. Valid only if the <i>nMessageType</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-erroradvise">IPhotoAcquireProgressCB::ErrorAdvise</a> is PHOTOACQUIRE_ERROR_SKIPRETRYCANCEL or PHOTOACQUIRE_ERROR_RETRYCANCEL.
     * @type {Integer (Int32)}
     */
    static PHOTOACQUIRE_RESULT_ABORT => 6
}
