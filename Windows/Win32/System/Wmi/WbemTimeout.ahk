#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the time-out constants. This constant is used by SWbemEventSource.NextEvent.
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemtimeout
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WbemTimeout {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use for parameters that use a time-out value such as <i>iTimeoutMs</i> for <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-execnotificationquery">ISWbemServices.ExecNotificationQuery</a> and the call will not return unless an event is received.
     * @type {Integer (Int32)}
     */
    static wbemTimeoutInfinite => -1
}
