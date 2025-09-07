#Requires AutoHotkey v2.0.0 64-bit

/**
 * If the MI_CallbackMode is MI_CALLBACKMODE_INQUIRE, one of these values can be used in the callback.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ne-mi-mi_operationcallback_responsetype
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_OperationCallback_ResponseType{

    /**
     * No to this request only.
     * @type {Integer (Int32)}
     */
    static MI_OperationCallback_ResponseType_No => 0

    /**
     * Yes to this request only.
     * @type {Integer (Int32)}
     */
    static MI_OperationCallback_ResponseType_Yes => 1

    /**
     * No to this request and all future requests from this operation.
     * @type {Integer (Int32)}
     */
    static MI_OperationCallback_ResponseType_NoToAll => 2

    /**
     * Yes to this request and all future requests from this operation.
     * @type {Integer (Int32)}
     */
    static MI_OperationCallback_ResponseType_YesToAll => 3
}
