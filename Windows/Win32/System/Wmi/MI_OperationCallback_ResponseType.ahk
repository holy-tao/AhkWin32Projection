#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * If the MI_CallbackMode is MI_CALLBACKMODE_INQUIRE, one of these values can be used in the callback.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ne-mi-mi_operationcallback_responsetype
 * @namespace Windows.Win32.System.Wmi
 */
class MI_OperationCallback_ResponseType extends Win32Enum {

    /**
     * No to this request only.
     * Native name: MI_OperationCallback_ResponseType_No
     * @type {Integer (Int32)}
     */
    static No => 0

    /**
     * Yes to this request only.
     * Native name: MI_OperationCallback_ResponseType_Yes
     * @type {Integer (Int32)}
     */
    static Yes => 1

    /**
     * No to this request and all future requests from this operation.
     * Native name: MI_OperationCallback_ResponseType_NoToAll
     * @type {Integer (Int32)}
     */
    static NoToAll => 2

    /**
     * Yes to this request and all future requests from this operation.
     * Native name: MI_OperationCallback_ResponseType_YesToAll
     * @type {Integer (Int32)}
     */
    static YesToAll => 3
}
