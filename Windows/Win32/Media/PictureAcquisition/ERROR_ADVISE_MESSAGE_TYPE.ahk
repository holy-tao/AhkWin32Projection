#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ERROR_ADVISE_MESSAGE_TYPE enumeration type indicates the type of error values that can be passed to the nMessageType parameter of IPhotoAcquireProgressCB::ErrorAdvise.
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/ne-photoacquire-error_advise_message_type
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class ERROR_ADVISE_MESSAGE_TYPE{

    /**
     * Specifies that the error that occurred requires a Skip, Retry, or Cancel response. The <i>pnErrorAdviseResult</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-erroradvise">IPhotoAcquireProgressDialogCB::ErrorAdvise</a> must be one of the following: <b>PHOTOACQUIRE_RESULT_SKIP</b>, <b>PHOTOACQUIRE_RESULT_SKIP_ALL</b>, <b>PHOTOACQUIRE_RESULT_RETRY</b>, or <b>PHOTOACQUIRE_RESULT_ABORT</b>.
     * @type {Integer (Int32)}
     */
    static PHOTOACQUIRE_ERROR_SKIPRETRYCANCEL => 0

    /**
     * Specifies that the error that occurred requires a Retry or Cancel response. The <i>pnErrorAdviseResult</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-erroradvise">IPhotoAcquireProgressDialogCB::ErrorAdvise</a> must be one of the following: <b>PHOTOACQUIRE_RESULT_RETRY</b> or <b>PHOTOACQUIRE_RESULT_ABORT</b>.
     * @type {Integer (Int32)}
     */
    static PHOTOACQUIRE_ERROR_RETRYCANCEL => 1

    /**
     * Specifies that the error that occurred requires a Yes or No response. The <i>pnErrorAdviseResult</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-erroradvise">IPhotoAcquireProgressDialogCB::ErrorAdvise</a> must be one of the following: <b>PHOTOACQUIRE_RESULT_YES</b> or <b>PHOTOACQUIRE_RESULT_NO</b>.
     * @type {Integer (Int32)}
     */
    static PHOTOACQUIRE_ERROR_YESNO => 2

    /**
     * Specifies that the error that occurred requires an OK response. The <i>pnErrorAdviseResult</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-erroradvise">IPhotoAcquireProgressDialogCB::ErrorAdvise</a> must be <b>PHOTOACQUIRE_RESULT_OK</b>.
     * @type {Integer (Int32)}
     */
    static PHOTOACQUIRE_ERROR_OK => 3
}
